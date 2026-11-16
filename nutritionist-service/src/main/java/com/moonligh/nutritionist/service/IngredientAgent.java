package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.domain.recognition.ModelCompletion;

/**
 * 一轮推荐：先用工具查出能做的菜和克数，再让模型写说明。
 * 模型改不了克数。没有模型时，说明直接用工具结果拼出来。
 */
public final class IngredientAgent {

    /** 和说明循环一样，最多叫 4 次模型，避免停不下来。 */
    private static final int MAX_MODEL_CALLS = 4;

    private final ToolBox tools;
    private final ModelCompletion model;
    private final ObjectMapper json = new ObjectMapper();

    public IngredientAgent(ToolBox tools, ModelCompletion model) {
        this.tools = tools;
        this.model = model;
    }

    public Turn run(List<String> foods, Profile profile) {
        return run(foods, profile, "");
    }

    /**
     * text 只写进说明，不拿去判断能不能做。
     * 没有模型时，系统自己按固定顺序调用工具。
     * 有模型时，系统只先做标准化，后面的工具由模型选择。
     */
    public Turn run(List<String> foods, Profile profile, String text) {
        if (foods == null || foods.isEmpty()) {
            throw new IllegalArgumentException("先给出至少一种食材");
        }
        String userText = text == null ? "" : text.trim();
        List<String> calls = new ArrayList<>();
        // 第一步永远先标准化。后面的工具只认编号，不认「番茄」这种说法。
        DishRecommendService.Normalized normalized = tools.normalize(foods);
        calls.add("normalize_ingredients");
        if (model == null) {
            return withoutModel(normalized, profile, userText, calls);
        }
        return withModel(normalized, profile, userText, calls);
    }

    /** 没接模型时的固定顺序：检索，有年龄再求解，说明用工具原文。 */
    private Turn withoutModel(
            DishRecommendService.Normalized normalized, Profile profile, String userText, List<String> calls) {
        DishRecommendService.MatchReport found = tools.search(normalized.ids(), userText);
        calls.add("search_dishes");
        if (found.dishes().isEmpty()) {
            return stopped(normalized, found, null, calls);
        }
        DayMenuService.DayMenu day = null;
        String solveMessage = "";
        if (profile != null) {
            SolveOutcome solved = tools.solve(profile, normalized.ids());
            calls.add("solve_day");
            if (solved.solved()) {
                day = solved.day();
            } else {
                solveMessage = solved.message();
            }
        }
        String explanation = explanationFor(found, day, solveMessage);
        return new Turn(found.dishes(), mergeUnknown(normalized, found), found.fallback(), day, explanation, calls);
    }

    /** 模型每一轮只能请求一个白名单工具，或提交说明。工具的真实结果会放进下一轮。 */
    private Turn withModel(
            DishRecommendService.Normalized normalized, Profile profile, String userText, List<String> calls) {
        DishRecommendService.MatchReport found = null;
        DayMenuService.DayMenu day = null;
        String solveMessage = "";
        boolean solveAttempted = false;
        String note = "食材编号=" + normalized.ids() + "；对不上=" + normalized.unrecognized();
        if (!userText.isBlank()) {
            // 原话只缩小候选和写说明。能不能做仍只看食材编号。
            note = note + "；用户原话（不参与能不能做）=" + userText;
        }
        int formatErrors = 0;
        int contentErrors = 0;
        int callsToModel = 0;
        while (callsToModel < MAX_MODEL_CALLS && formatErrors <= 1 && contentErrors <= 1) {
            callsToModel++;
            String raw;
            try {
                raw = model.complete(prompt(lockedGrams(day), calls, note)).orElse("");
            } catch (RuntimeException error) {
                // 主模型和兜底模型都没有返回时，改用食材规则，或只给一句提示。
                return afterTimeout(normalized, profile, userText, found, day, solveMessage, calls);
            }
            if (raw.isBlank()) {
                return afterTimeout(normalized, profile, userText, found, day, solveMessage, calls);
            }
            Reply reply = parse(raw);
            if (reply.tool() != null) {
                if (!isAllowedTool(reply.tool())) {
                    contentErrors++;
                    note = "工具不在白名单，不能修改目标、方案、摄入或用药。";
                    continue;
                }
                if ("search_dishes".equals(reply.tool())) {
                    found = tools.search(normalized.ids(), userText);
                    calls.add("search_dishes");
                    // 没有能做的菜就停，不再让模型编一道。
                    if (found.dishes().isEmpty()) {
                        return stopped(normalized, found, day, calls);
                    }
                    note = reasons(found);
                    continue;
                }
                if ("solve_day".equals(reply.tool())) {
                    if (solveAttempted) {
                        note = solveMessage.isBlank() ? lockedText(day) : solveMessage;
                        continue;
                    }
                    solveAttempted = true;
                    calls.add("solve_day");
                    if (profile == null) {
                        solveMessage = "没有年龄资料，不算今天的克数";
                        note = solveMessage;
                        continue;
                    }
                    // 年龄和目标以用户资料为准。模型在工具参数里改数字也不会被采用。
                    SolveOutcome solved = tools.solve(profile, normalized.ids());
                    if (solved.solved()) {
                        day = solved.day();
                        note = lockedText(day);
                    } else {
                        solveMessage = solved.message();
                        note = solveMessage;
                    }
                    continue;
                }
                if ("read_recipe".equals(reply.tool())) {
                    if (reply.id() == null || reply.id().isBlank()) {
                        formatErrors++;
                        note = "read_recipe 需要菜号 id。";
                        continue;
                    }
                    calls.add("read_recipe");
                    note = tools.readRecipe(reply.id());
                    continue;
                }
                if ("read_meal_facts".equals(reply.tool())) {
                    calls.add("read_meal_facts");
                    note = day == null ? "本餐食材：[]" : "本餐食材：" + lockedText(day);
                    continue;
                }
                calls.add("read_long_term_memory");
                note = tools.memory();
                continue;
            }
            if (!reply.valid()) {
                formatErrors++;
                note = "请只返回 JSON，包含 explanation 和 items。";
                continue;
            }
            if (!sameGrams(lockedGrams(day), reply.items())) {
                contentErrors++;
                note = "食材和克数已由求解器锁定，不能改写。";
                continue;
            }
            return finish(normalized, found, day, reply.explanation(), calls);
        }
        return finish(normalized, found, day, explanationFor(found, day, solveMessage), calls);
    }

    /**
     * 两个模型都超时之后走这里。
     * 还没检索过，就按食材规则检索和求解。
     * 规则也没有菜时，只提示不会另编一道。
     */
    private Turn afterTimeout(
            DishRecommendService.Normalized normalized,
            Profile profile,
            String userText,
            DishRecommendService.MatchReport found,
            DayMenuService.DayMenu day,
            String solveMessage,
            List<String> calls) {
        if (found == null && day == null && solveMessage.isBlank()) {
            Turn coded = withoutModel(normalized, profile, userText, calls);
            String explanation = coded.dishes().isEmpty()
                    ? "模型超时。没有主料齐全的已发布菜，不会另外编一道。"
                    : "模型超时，已按食材规则给出。" + coded.explanation();
            return new Turn(
                    coded.dishes(), coded.unrecognized(), coded.fallback(), coded.day(), explanation, coded.toolCalls());
        }
        String base = explanationFor(found, day, solveMessage);
        String explanation = base.isBlank() ? "模型超时，请稍后再试。" : "模型超时，已按食材规则给出。" + base;
        return finish(normalized, found, day, explanation, calls);
    }

    private static boolean isAllowedTool(String name) {
        return "search_dishes".equals(name)
                || "solve_day".equals(name)
                || "read_recipe".equals(name)
                || "read_meal_facts".equals(name)
                || "read_long_term_memory".equals(name);
    }

    private Turn stopped(
            DishRecommendService.Normalized normalized,
            DishRecommendService.MatchReport found,
            DayMenuService.DayMenu day,
            List<String> calls) {
        return new Turn(found.dishes(), mergeUnknown(normalized, found), found.fallback(), day, found.fallback(), calls);
    }

    private Turn finish(
            DishRecommendService.Normalized normalized,
            DishRecommendService.MatchReport found,
            DayMenuService.DayMenu day,
            String explanation,
            List<String> calls) {
        List<DishRecommendService.Suggestion> dishes = found == null ? List.of() : found.dishes();
        String fallback = found == null ? "" : found.fallback();
        List<String> unknown = found == null
                ? normalized.unrecognized()
                : mergeUnknown(normalized, found);
        return new Turn(dishes, unknown, fallback, day, explanation, calls);
    }

    private static String explanationFor(
            DishRecommendService.MatchReport found, DayMenuService.DayMenu day, String solveMessage) {
        if (solveMessage != null && !solveMessage.isBlank()) {
            return solveMessage;
        }
        if (day != null) {
            return lockedText(day);
        }
        return found == null ? "" : reasons(found);
    }

    private Reply parse(String raw) {
        try {
            JsonNode node = json.readTree(raw);
            if (node.hasNonNull("tool")) {
                String id = node.hasNonNull("id") ? node.get("id").asText() : "";
                return Reply.tool(node.get("tool").asText(), id);
            }
            if (!node.hasNonNull("explanation") || !node.has("items") || !node.get("items").isArray()) {
                return Reply.invalid();
            }
            List<LockedGram> items = new ArrayList<>();
            for (JsonNode item : node.get("items")) {
                if (!item.hasNonNull("foodItemId") || !item.hasNonNull("grams")) {
                    return Reply.invalid();
                }
                items.add(new LockedGram(item.get("foodItemId").asText(), new BigDecimal(item.get("grams").asText())));
            }
            return Reply.ok(node.get("explanation").asText(), items);
        } catch (Exception error) {
            return Reply.invalid();
        }
    }

    private static boolean sameGrams(List<LockedGram> locked, List<LockedGram> proposed) {
        if (locked.size() != proposed.size()) {
            return false;
        }
        for (int index = 0; index < locked.size(); index++) {
            LockedGram expected = locked.get(index);
            LockedGram actual = proposed.get(index);
            if (!expected.foodId().equals(actual.foodId()) || expected.grams().compareTo(actual.grams()) != 0) {
                return false;
            }
        }
        return true;
    }

    private static List<LockedGram> lockedGrams(DayMenuService.DayMenu day) {
        if (day == null) {
            return List.of();
        }
        List<LockedGram> items = new ArrayList<>();
        addLocked(items, day.breakfast());
        addLocked(items, day.lunch());
        addLocked(items, day.dinner());
        return items;
    }

    private static void addLocked(List<LockedGram> items, List<DayMenuService.DishView> dishes) {
        for (DayMenuService.DishView dish : dishes) {
            for (DayMenuService.IngredientView ingredient : dish.ingredients()) {
                items.add(new LockedGram(ingredient.foodId(), ingredient.grams()));
            }
        }
    }

    private static String reasons(DishRecommendService.MatchReport found) {
        StringBuilder text = new StringBuilder();
        for (DishRecommendService.Suggestion dish : found.dishes()) {
            text.append(dish.name()).append("：").append(dish.reason());
        }
        return text.toString();
    }

    private static String lockedText(DayMenuService.DayMenu day) {
        StringBuilder text = new StringBuilder("求解器锁定的食材和克数：");
        for (LockedGram item : lockedGrams(day)) {
            text.append(item.foodId()).append(' ').append(item.grams().stripTrailingZeros().toPlainString()).append("克；");
        }
        return text.toString();
    }

    private static List<String> mergeUnknown(DishRecommendService.Normalized normalized, DishRecommendService.MatchReport found) {
        List<String> unknown = new ArrayList<>(normalized.unrecognized());
        for (String word : found.unrecognized()) {
            if (!unknown.contains(word)) {
                unknown.add(word);
            }
        }
        return unknown;
    }

    private static String prompt(List<LockedGram> locked, List<String> calls, String note) {
        return """
                你只生成说明。食材和克数已经锁定，不能改。
                可以请求 search_dishes、solve_day、read_recipe、read_meal_facts、read_long_term_memory。
                不能调用 update_target、confirm_plan、record_intake、change_medication、relax_constraint。
                返回 {"explanation":"...","items":[{"foodItemId":"...","grams":"..."}]}
                或 {"tool":"read_recipe","id":"菜号"}。
                锁定=%s
                已调用=%s
                %s
                """.formatted(locked, calls, note);
    }

    /** 循环里的工具。测试时换成假的，不连数据库。 */
    public interface ToolBox {
        DishRecommendService.Normalized normalize(List<String> foods);

        DishRecommendService.MatchReport search(List<String> ids, String text);

        SolveOutcome solve(Profile profile, List<String> ids);

        /** 读取已发布做法。菜不存在时返回 {"found":false}。 */
        String readRecipe(String id);

        /** 长期记忆。没有患者时三项皆空，不参与能不能做。 */
        String memory();
    }

    public record Profile(int sex, int age, int activity, String mode) {
    }

    public record SolveOutcome(boolean solved, String message, DayMenuService.DayMenu day) {
    }

    public record Turn(
            List<DishRecommendService.Suggestion> dishes,
            List<String> unrecognized,
            String fallback,
            DayMenuService.DayMenu day,
            String explanation,
            List<String> toolCalls) {
    }

    private record LockedGram(String foodId, BigDecimal grams) {
    }

    private record Reply(String tool, String id, String explanation, List<LockedGram> items, boolean valid) {
        static Reply tool(String name, String id) {
            return new Reply(name, id, "", List.of(), true);
        }

        static Reply ok(String explanation, List<LockedGram> items) {
            return new Reply(null, "", explanation, items, true);
        }

        static Reply invalid() {
            return new Reply(null, "", "", List.of(), false);
        }
    }
}
