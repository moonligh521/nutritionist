package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.IntentAmbiguity;
import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.MemoryQuery;
import com.moonligh.nutritionist.domain.dialogue.MemoryQueryType;
import com.moonligh.nutritionist.domain.dialogue.TaskType;
import com.moonligh.nutritionist.domain.dialogue.TurnConstraints;
import com.moonligh.nutritionist.domain.dialogue.TurnIntent;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext.DishRef;
import com.moonligh.nutritionist.domain.recognition.ModelCompletion;

/**
 * 第一轮同步语义理解：ContextPack → 1×LLM → Normalizer → SlotResolver。
 */
@Component
public class IntentUnderstander {

    private static final int PREF_CAP = 5;
    private static final Set<String> GREETINGS = Set.of("你好", "您好", "嗨", "hello", "hi", "在吗");

    private final ModelCompletion model;
    private final ObjectMapper json = new ObjectMapper();
    private final IntentNormalizer normalizer;
    private final SlotResolver slotResolver;
    private final IntentSafetyNet safetyNet;

    @Autowired
    public IntentUnderstander(
            ModelCompletion model, IntentNormalizer normalizer, SlotResolver slotResolver, IntentSafetyNet safetyNet) {
        this.model = model;
        this.normalizer = normalizer == null ? new IntentNormalizer() : normalizer;
        this.slotResolver = slotResolver == null ? new SlotResolver() : slotResolver;
        this.safetyNet = safetyNet == null ? new IntentSafetyNet(this.slotResolver) : safetyNet;
    }

    public IntentUnderstander(ModelCompletion model) {
        this(model, new IntentNormalizer(), new SlotResolver(), null);
    }

    public List<DialogueTask> understand(String text, List<String> foods) {
        return interpret(UnderstandContext.of(text, foods, LongTermMemory.empty())).tasks();
    }

    public TurnIntent interpret(String text, List<String> foods, LongTermMemory prefs) {
        return interpret(UnderstandContext.of(text, foods, prefs));
    }

    public TurnIntent interpret(
            String text, List<String> foods, LongTermMemory prefs, List<String> currentDishNames) {
        List<DishRef> dishes = new ArrayList<>();
        if (currentDishNames != null) {
            for (int i = 0; i < currentDishNames.size(); i++) {
                String name = currentDishNames.get(i);
                if (name != null && !name.isBlank()) {
                    dishes.add(new DishRef(i + 1, String.valueOf(i + 1), name.trim()));
                }
            }
        }
        String focused = dishes.size() == 1 ? dishes.getFirst().name() : "";
        String phase = dishes.isEmpty() ? "IDLE" : "RECOMMENDED";
        return interpret(new UnderstandContext(text, foods, dishes, focused, phase, prefs));
    }

    public TurnIntent interpret(UnderstandContext context) {
        UnderstandContext ctx = context == null
                ? UnderstandContext.of("", List.of(), LongTermMemory.empty())
                : context;
        String utter = ctx.utterance();
        List<String> foodList = ctx.requestFoods();
        if (model != null) {
            Optional<String> raw = model.complete(prompt(ctx));
            if (raw.isPresent() && !raw.get().isBlank()) {
                Parsed parsed = parseIntent(raw.get());
                if (!parsed.intent().tasks().isEmpty() || parsed.intent().needsClarify()) {
                    TurnIntent normalized = normalizer.normalize(parsed.intent(), ctx, parsed.confidences());
                    TurnIntent resolved = slotResolver.resolve(normalized, ctx, parsed.dishIndexes());
                    return safetyNet.repair(resolved, ctx);
                }
            }
            TurnIntent degraded = TurnIntent.ofTasks(thinFallback(utter, foodList)).withDegraded(true);
            return safetyNet.repair(degraded, ctx);
        }
        return safetyNet.repair(TurnIntent.ofTasks(thinFallback(utter, foodList)), ctx);
    }

    private static final java.util.regex.Pattern RECOMMEND_ASK =
            java.util.regex.Pattern.compile("帮我推荐|推荐几道|推荐一下|来几道菜|给我推荐");

    private static List<DialogueTask> thinFallback(String utter, List<String> foods) {
        if (foods != null && !foods.isEmpty()) {
            return List.of(DialogueTask.recommend(foods));
        }
        if (utter == null || utter.isBlank() || GREETINGS.contains(utter.toLowerCase())) {
            return List.of(DialogueTask.greeting());
        }
        if (RECOMMEND_ASK.matcher(utter).find()) {
            return List.of(DialogueTask.recommend(List.of()));
        }
        return List.of(DialogueTask.outOfScope(utter));
    }

    private Parsed parseIntent(String raw) {
        try {
            JsonNode root = json.readTree(extractJson(raw));
            JsonNode array = root.has("tasks") ? root.get("tasks") : (root.isArray() ? root : null);
            if (array == null || !array.isArray()) {
                return new Parsed(TurnIntent.ofTasks(List.of()), List.of(), List.of());
            }
            List<DialogueTask> tasks = new ArrayList<>();
            List<Double> confidences = new ArrayList<>();
            List<Integer> dishIndexes = new ArrayList<>();
            for (JsonNode node : array) {
                DialogueTask task = one(node);
                if (task == null) {
                    continue;
                }
                tasks.add(task);
                confidences.add(node.has("confidence") ? node.get("confidence").asDouble(0.8) : 0.8);
                dishIndexes.add(node.has("dishIndex") && !node.get("dishIndex").isNull()
                        ? node.get("dishIndex").asInt(0)
                        : 0);
            }
            List<IntentAmbiguity> ambiguities = parseAmbiguities(root.get("ambiguities"));
            TurnIntent intent = new TurnIntent(
                    tasks,
                    parseConstraints(root.get("turnConstraints")),
                    parseQueries(root.get("memoryQueries")),
                    ambiguities,
                    false);
            return new Parsed(intent, confidences, dishIndexes);
        } catch (Exception error) {
            return new Parsed(TurnIntent.ofTasks(List.of()), List.of(), List.of());
        }
    }

    private static List<IntentAmbiguity> parseAmbiguities(JsonNode node) {
        if (node == null || !node.isArray()) {
            return List.of();
        }
        List<IntentAmbiguity> out = new ArrayList<>();
        for (JsonNode item : node) {
            if (item == null) {
                continue;
            }
            out.add(new IntentAmbiguity(
                    text(item, "code"),
                    strings(item, "options"),
                    text(item, "ask")));
        }
        return List.copyOf(out);
    }

    private static TurnConstraints parseConstraints(JsonNode node) {
        if (node == null || node.isNull()) {
            return TurnConstraints.empty();
        }
        return new TurnConstraints(
                strings(node, "avoidFoods"),
                strings(node, "absoluteAvoidFoods"),
                text(node, "cuisine"),
                text(node, "kind"),
                strings(node, "preferTags"),
                strings(node, "turnHints"));
    }

    private static List<MemoryQuery> parseQueries(JsonNode node) {
        if (node == null || !node.isArray()) {
            return List.of();
        }
        List<MemoryQuery> queries = new ArrayList<>();
        for (JsonNode item : node) {
            if (item == null || !item.hasNonNull("type")) {
                continue;
            }
            try {
                MemoryQueryType type = MemoryQueryType.valueOf(item.get("type").asText());
                queries.add(new MemoryQuery(type, text(item, "subject")));
            } catch (Exception ignored) {
                // skip
            }
        }
        return List.copyOf(queries);
    }

    private DialogueTask one(JsonNode node) {
        if (!node.hasNonNull("type")) {
            return null;
        }
        TaskType type;
        try {
            type = TaskType.valueOf(node.get("type").asText());
        } catch (Exception error) {
            return null;
        }
        return switch (type) {
            case GREETING -> DialogueTask.greeting();
            case OUT_OF_SCOPE -> DialogueTask.outOfScope(text(node, "topic"));
            case RECOMMEND -> DialogueTask.recommend(strings(node, "rawFoods", "foods"));
            case REPLACE_ONE -> DialogueTask.replaceOne(text(node, "dishHint"));
            case ADD_KIND -> DialogueTask.addKind(text(node, "kind"));
            case MISSING -> DialogueTask.missing(text(node, "missingFood", "food"));
            case SUBSTITUTE -> DialogueTask.substitute(text(node, "fromFood", "from"), text(node, "toFood", "to"));
            case CONFIRM_FOODS -> null;
        };
    }

    private static String text(JsonNode node, String... keys) {
        for (String key : keys) {
            if (node.hasNonNull(key)) {
                return node.get(key).asText();
            }
        }
        return "";
    }

    private static List<String> strings(JsonNode node, String... keys) {
        for (String key : keys) {
            if (node.has(key) && node.get(key).isArray()) {
                List<String> values = new ArrayList<>();
                node.get(key).forEach(item -> values.add(item.asText()));
                return values;
            }
        }
        return List.of();
    }

    private static String extractJson(String raw) {
        int start = raw.indexOf('{');
        int end = raw.lastIndexOf('}');
        if (start >= 0 && end > start) {
            return raw.substring(start, end + 1);
        }
        start = raw.indexOf('[');
        end = raw.lastIndexOf(']');
        if (start >= 0 && end > start) {
            return raw.substring(start, end + 1);
        }
        return raw;
    }

    static String prompt(UnderstandContext ctx) {
        LongTermMemory snapshot = ctx.preference();
        String dishes = ctx.currentDishes().isEmpty()
                ? "无"
                : ctx.currentDishes().stream()
                        .map(d -> d.index() + ":" + d.name())
                        .collect(Collectors.joining("、"));
        return """
                你是营养食材推荐助手的理解器。只理解意图并输出 JSON，不要推荐具体新菜名，不要改克数，不要编病情。
                一句话拆成多条原子 tasks，按用户意图顺序，禁止合并「换+加汤」等。

                决策顺序（命中即用；OUT_OF_SCOPE 最后）：
                1) GREETING  2) REPLACE_ONE(dishHint 或 dishIndex 从1起)  3) ADD_KIND(kind)
                4) MISSING / SUBSTITUTE  5) RECOMMEND(rawFoods)  6) OUT_OF_SCOPE 仅天气闲聊非选菜
                硬规则：出现「换一个/换第N个/再加个汤或主食或菜/没有X了/用A代替B」时，绝不能 OUT_OF_SCOPE；phase=RECOMMENDED 时更是如此。

                turnConstraints：avoidFoods=普通不吃；absoluteAvoidFoods=仅绝对不能吃；cuisine/kind/preferTags/turnHints=本轮口头。
                历史偏好勿照抄进 constraints。拿不准指代时填 ambiguities，不要瞎填 dishHint。
                每条 task 可带 confidence(0~1)；默认 0.8。

                样例：
                - 菜=[1:水煮蛋,2:番茄炒蛋]「换第二个再加个汤」→ tasks REPLACE_ONE dishIndex=2 + ADD_KIND 汤
                - 「不吃香菜，番茄鸡蛋推荐」→ RECOMMEND + turnConstraints.avoidFoods=[香菜]
                - 「再加个汤」→ ADD_KIND 汤
                - 「今天北京天气」→ OUT_OF_SCOPE
                - 两道菜「换一个」无指明 → ambiguities DISH_REF

                只返回 JSON：{"tasks":[...],"turnConstraints":{},"ambiguities":[]}
                phase=%s；历史忌口=%s；绝对忌口=%s；菜系=%s；标签=%s；病情=%s；过敏=%s
                当前已荐菜=%s；焦点菜=%s；请求食材=%s
                用户原文：%s
                """.formatted(
                ctx.phase(),
                summarize(snapshot.avoidFoods()),
                summarize(snapshot.absoluteAvoidFoods()),
                summarize(snapshot.preferCuisines()),
                summarize(snapshot.preferTags()),
                summarize(snapshot.conditions()),
                summarize(snapshot.allergens()),
                dishes,
                ctx.lastFocusedDishName().isBlank() ? "无" : ctx.lastFocusedDishName(),
                ctx.requestFoods(),
                ctx.utterance());
    }

    /** 兼容旧测试。 */
    static String prompt(String text, List<String> foods, LongTermMemory prefs, List<String> currentDishNames) {
        List<DishRef> dishes = new ArrayList<>();
        if (currentDishNames != null) {
            for (int i = 0; i < currentDishNames.size(); i++) {
                String name = currentDishNames.get(i);
                if (name != null && !name.isBlank()) {
                    dishes.add(new DishRef(i + 1, String.valueOf(i + 1), name.trim()));
                }
            }
        }
        String focused = dishes.size() == 1 ? dishes.getFirst().name() : "";
        return prompt(new UnderstandContext(
                text, foods, dishes, focused, dishes.isEmpty() ? "IDLE" : "RECOMMENDED", prefs));
    }

    private static String summarize(List<String> values) {
        if (values == null || values.isEmpty()) {
            return "无";
        }
        return values.stream()
                .filter(v -> v != null && !v.isBlank())
                .limit(PREF_CAP)
                .collect(Collectors.joining("、"));
    }

    private record Parsed(TurnIntent intent, List<Double> confidences, List<Integer> dishIndexes) {
    }
}
