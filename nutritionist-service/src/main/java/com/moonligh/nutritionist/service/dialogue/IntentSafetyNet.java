package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.IntentAmbiguity;
import com.moonligh.nutritionist.domain.dialogue.TaskType;
import com.moonligh.nutritionist.domain.dialogue.TurnConstraints;
import com.moonligh.nutritionist.domain.dialogue.TurnIntent;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext.DishRef;

/**
 * 高置信词法护栏：仅当模型把选菜意图误判为 OUT_OF_SCOPE（或空）时纠偏。
 */
@Component
public class IntentSafetyNet {

    private static final Pattern REPLACE_INDEX = Pattern.compile("换第\\s*([一二三四五六七八九十0-9]+)\\s*个");
    private static final Pattern REPLACE_NAMED = Pattern.compile("([\\u4e00-\\u9fa5]{2,12})换一个");
    private static final Pattern ADD_KIND = Pattern.compile("再加个?(汤|主食|菜)");
    private static final Pattern MISSING = Pattern.compile("没有([\\u4e00-\\u9fa5]{1,8})了");
    private static final Pattern SUBSTITUTE = Pattern.compile("用([\\u4e00-\\u9fa5]{1,8})代替([\\u4e00-\\u9fa5]{1,8})");
    /** 无点名食材的荐菜口令 → RECOMMEND([])，由执行层走 EMPTY_GUIDE。 */
    private static final Pattern RECOMMEND_ASK = Pattern.compile("帮我推荐|推荐几道|推荐一下|来几道菜|给我推荐");

    private final SlotResolver slotResolver;

    public IntentSafetyNet(SlotResolver slotResolver) {
        this.slotResolver = slotResolver == null ? new SlotResolver() : slotResolver;
    }

    public IntentSafetyNet() {
        this(new SlotResolver());
    }

    public TurnIntent repair(TurnIntent intent, UnderstandContext ctx) {
        if (intent == null || ctx == null || !shouldRepair(intent)) {
            return intent;
        }
        String utter = ctx.utterance().trim();
        List<DialogueTask> tasks = new ArrayList<>();
        List<Integer> indexes = new ArrayList<>();
        List<IntentAmbiguity> ambiguities = new ArrayList<>();

        Matcher idx = REPLACE_INDEX.matcher(utter);
        Matcher named = REPLACE_NAMED.matcher(utter);
        Matcher add = ADD_KIND.matcher(utter);
        Matcher miss = MISSING.matcher(utter);
        Matcher sub = SUBSTITUTE.matcher(utter);

        if (idx.find()) {
            tasks.add(DialogueTask.replaceOne(""));
            indexes.add(parseIndex(idx.group(1)));
        } else if (named.find()) {
            tasks.add(DialogueTask.replaceOne(named.group(1)));
            indexes.add(0);
        } else if ("换一个".equals(utter)) {
            if (ctx.currentDishes().size() <= 1) {
                String hint = ctx.currentDishes().isEmpty() ? "" : ctx.currentDishes().getFirst().name();
                tasks.add(DialogueTask.replaceOne(hint));
                indexes.add(ctx.currentDishes().isEmpty() ? 0 : 1);
            } else {
                ambiguities.add(new IntentAmbiguity(
                        "DISH_REF",
                        ctx.currentDishes().stream().map(DishRef::name).toList(),
                        "要换哪一道？"));
            }
        }

        if (add.find()) {
            tasks.add(DialogueTask.addKind(add.group(1)));
            indexes.add(0);
        }
        if (miss.find()) {
            tasks.add(DialogueTask.missing(miss.group(1)));
            indexes.add(0);
        }
        if (sub.find()) {
            tasks.add(DialogueTask.substitute(sub.group(2), sub.group(1)));
            indexes.add(0);
        }
        if (tasks.isEmpty() && ambiguities.isEmpty() && RECOMMEND_ASK.matcher(utter).find()) {
            List<String> foods = ctx.requestFoods() == null ? List.of() : ctx.requestFoods();
            tasks.add(DialogueTask.recommend(foods));
            indexes.add(0);
        }

        if (tasks.isEmpty() && ambiguities.isEmpty()) {
            return intent;
        }
        TurnConstraints constraints = mergeAvoid(utter,
                intent.constraints() == null ? TurnConstraints.empty() : intent.constraints());
        TurnIntent repaired = new TurnIntent(tasks, constraints, intent.memoryQueries(), ambiguities, intent.degraded());
        return slotResolver.resolve(repaired, ctx, padIndexes(tasks.size(), indexes));
    }

    private static boolean shouldRepair(TurnIntent intent) {
        if (intent.needsClarify()) {
            return false;
        }
        if (intent.tasks().isEmpty()) {
            return true;
        }
        return intent.tasks().size() == 1 && intent.tasks().getFirst().type() == TaskType.OUT_OF_SCOPE;
    }

    private static List<Integer> padIndexes(int size, List<Integer> indexes) {
        List<Integer> out = new ArrayList<>(indexes);
        while (out.size() < size) {
            out.add(0);
        }
        return out;
    }

    private static int parseIndex(String raw) {
        return switch (raw) {
            case "一", "1" -> 1;
            case "二", "2" -> 2;
            case "三", "3" -> 3;
            default -> {
                try {
                    yield Integer.parseInt(raw);
                } catch (Exception e) {
                    yield 0;
                }
            }
        };
    }

    private static TurnConstraints mergeAvoid(String utter, TurnConstraints base) {
        List<String> avoid = new ArrayList<>(base.avoidFoods());
        List<String> absolute = new ArrayList<>(base.absoluteAvoidFoods());
        Matcher abs = Pattern.compile("绝对不能吃([\\u4e00-\\u9fa5]{1,8})").matcher(utter);
        if (abs.find()) {
            absolute.add(abs.group(1));
        }
        Matcher soft = Pattern.compile("(?:不吃|别放)([\\u4e00-\\u9fa5]{1,8})").matcher(utter);
        while (soft.find()) {
            avoid.add(soft.group(1));
        }
        return new TurnConstraints(
                avoid, absolute, base.cuisine(), base.kind(), base.preferTags(), base.turnHints());
    }
}
