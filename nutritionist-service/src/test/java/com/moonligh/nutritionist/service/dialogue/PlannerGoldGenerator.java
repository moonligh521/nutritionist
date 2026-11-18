package com.moonligh.nutritionist.service.dialogue;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

/** 生成 1000 条 P1 规划/指代/空引导金标。 */
public final class PlannerGoldGenerator {

    private static final ObjectMapper JSON = new ObjectMapper();

    private PlannerGoldGenerator() {
    }

    public static void main(String[] args) throws Exception {
        Path out = Path.of(args.length > 0
                ? args[0]
                : "src/test/resources/planner-gold/v1/gold-1000.jsonl");
        Files.createDirectories(out.getParent());
        List<String> lines = generateLines(1000);
        Files.write(out, lines, StandardCharsets.UTF_8);
        System.out.println("wrote " + lines.size() + " -> " + out.toAbsolutePath());
    }

    public static List<String> generateLines(int count) throws Exception {
        String[] dishes = {"番茄炒蛋", "青椒肉丝", "紫菜蛋花汤", "蒜蓉西兰花", "鱼香肉丝",
                "麻婆豆腐", "清蒸鲈鱼", "土豆炖牛腩", "酸辣土豆丝", "虾仁滑蛋"};
        String[] foods = {"番茄", "鸡蛋", "青椒", "肉丝", "豆腐", "鲈鱼", "土豆", "虾仁", "西兰花", "紫菜"};
        List<Map<String, Object>> cases = new ArrayList<>();
        int id = 0;
        while (cases.size() < count) {
            int n = cases.size();
            String d0 = dishes[n % dishes.length];
            String d1 = dishes[(n + 1) % dishes.length];
            String food = foods[n % foods.length];
            switch (n % 10) {
                case 0 -> cases.add(planGreetingFirst(id++));
                case 1 -> cases.add(planConfirmOnly(id++, food));
                case 2 -> cases.add(planReplaceDropsRecommend(id++, d0));
                case 3 -> cases.add(planMissingBeforeReplace(id++, food, d0));
                case 4 -> cases.add(planReplaceDedupe(id++, d0));
                case 5 -> cases.add(planBlocked(id++));
                case 6 -> cases.add(planConfirmingBlocks(id++));
                case 7 -> cases.add(slotOrdinal(id++, d0, d1));
                case 8 -> cases.add(slotDefaultFirst(id++, d0, d1));
                default -> cases.add(emptyGuide(id++, n));
            }
        }
        List<String> lines = new ArrayList<>(count);
        for (int i = 0; i < count; i++) {
            lines.add(JSON.writeValueAsString(cases.get(i)));
        }
        return lines;
    }

    private static Map<String, Object> planGreetingFirst(int id) {
        return row(id, "plan_greeting", Map.of(
                "op", "PLAN",
                "phase", "IDLE",
                "hasDishes", false,
                "utterance", "你好，推荐番茄炒蛋",
                "tasks", List.of("GREETING", "RECOMMEND", "OUT_OF_SCOPE"),
                "foodIds", List.of("1"),
                "needConfirm", false),
                Map.of("planTypes", List.of("GREETING", "OUT_OF_SCOPE", "RECOMMEND")),
                true);
    }

    private static Map<String, Object> planConfirmOnly(int id, String food) {
        return row(id, "plan_confirm_only", Map.of(
                "op", "PLAN",
                "phase", "IDLE",
                "hasDishes", false,
                "utterance", "推荐" + food,
                "tasks", List.of("RECOMMEND"),
                "foodIds", List.of(),
                "needConfirm", true,
                "confirmRaw", food),
                Map.of("planTypes", List.of("CONFIRM_FOODS"), "blocksRecommend", true),
                true);
    }

    private static Map<String, Object> planReplaceDropsRecommend(int id, String dish) {
        return row(id, "plan_replace_vs_recommend", Map.of(
                "op", "PLAN",
                "phase", "RECOMMENDED",
                "hasDishes", true,
                "utterance", dish + "换一个",
                "tasks", List.of("REPLACE_ONE:" + dish, "RECOMMEND"),
                "foodIds", List.of("1"),
                "needConfirm", false),
                Map.of("planTypes", List.of("REPLACE_ONE"), "mustNotContain", List.of("RECOMMEND")),
                true);
    }

    private static Map<String, Object> planMissingBeforeReplace(int id, String food, String dish) {
        return row(id, "plan_missing_before_replace", Map.of(
                "op", "PLAN",
                "phase", "RECOMMENDED",
                "hasDishes", true,
                "utterance", "没有" + food + "了，" + dish + "换一个",
                "tasks", List.of("REPLACE_ONE:" + dish, "MISSING:" + food),
                "foodIds", List.of("1"),
                "needConfirm", false),
                Map.of("planTypes", List.of("MISSING", "REPLACE_ONE")),
                true);
    }

    private static Map<String, Object> planReplaceDedupe(int id, String dish) {
        return row(id, "plan_replace_dedupe", Map.of(
                "op", "PLAN",
                "phase", "ADJUSTING",
                "hasDishes", true,
                "utterance", "换一个",
                "tasks", List.of("REPLACE_ONE:" + dish, "REPLACE_ONE:" + dish, "REPLACE_ONE:"),
                "foodIds", List.of(),
                "needConfirm", false),
                Map.of("mustNotContain", List.of("RECOMMEND"), "replaceCount", 2),
                true);
    }

    private static Map<String, Object> planBlocked(int id) {
        return row(id, "plan_blocked", Map.of(
                "op", "PLAN",
                "phase", "BLOCKED",
                "hasDishes", false,
                "utterance", "推荐番茄",
                "tasks", List.of("RECOMMEND", "REPLACE_ONE:番茄炒蛋"),
                "foodIds", List.of("1"),
                "needConfirm", false,
                "measurementBlocked", true),
                Map.of("mustNotContain", List.of("RECOMMEND", "REPLACE_ONE")),
                true);
    }

    private static Map<String, Object> planConfirmingBlocks(int id) {
        return row(id, "plan_confirming", Map.of(
                "op", "PLAN",
                "phase", "CONFIRMING",
                "hasDishes", false,
                "utterance", "继续推荐",
                "tasks", List.of("RECOMMEND", "GREETING"),
                "foodIds", List.of("1"),
                "needConfirm", false),
                Map.of("mustNotContain", List.of("RECOMMEND"), "planContains", List.of("GREETING")),
                true);
    }

    private static Map<String, Object> slotOrdinal(int id, String d0, String d1) {
        return row(id, "slot_ordinal", Map.of(
                "op", "SLOT",
                "dishes", List.of(d0, d1),
                "focused", "",
                "task", "REPLACE_ONE:",
                "dishIndex", 2),
                Map.of("dishHint", d1, "clarify", false),
                true);
    }

    private static Map<String, Object> slotDefaultFirst(int id, String d0, String d1) {
        return row(id, "slot_default_first", Map.of(
                "op", "SLOT",
                "dishes", List.of(d0, d1),
                "focused", "",
                "task", "REPLACE_ONE:",
                "dishIndex", 0),
                Map.of("dishHint", d0, "clarify", false),
                true);
    }

    private static Map<String, Object> emptyGuide(int id, int n) {
        String[] reasons = {
                "SCALAR_EMPTY", "FILTER_FAIL_CLOSED", "NO_FEASIBLE_MAINS",
                "ANN_EMPTY", "NO_PUBLISHED_INTERSECT", "EMBED_FAILED"
        };
        String reason = reasons[n % reasons.length];
        boolean cuisine = n % 2 == 0;
        boolean tags = n % 3 == 0;
        List<String> actions = new ArrayList<>();
        if ("SCALAR_EMPTY".equals(reason) || "FILTER_FAIL_CLOSED".equals(reason)) {
            if (cuisine) {
                actions.add("DROP_CUISINE");
            }
            if (tags) {
                actions.add("DROP_TAGS");
            }
            actions.add("ADD_FOODS");
        } else if ("NO_FEASIBLE_MAINS".equals(reason) || "NO_PUBLISHED_INTERSECT".equals(reason)) {
            actions.add("ADD_FOODS");
        } else {
            actions.add("ADD_FOODS");
            actions.add("KEEP_WAITING");
        }
        return row(id, "empty_guide", Map.of(
                "op", "EMPTY_GUIDE",
                "reason", reason,
                "hasCuisine", cuisine,
                "hasTags", tags),
                Map.of("actions", actions, "phase", "EMPTY_GUIDE", "textNonBlank", true),
                true);
    }

    private static Map<String, Object> row(
            int id, String bucket, Map<String, Object> input, Map<String, Object> expect, boolean critical) {
        Map<String, Object> map = new LinkedHashMap<>();
        map.put("id", "G" + id);
        map.put("bucket", bucket);
        map.put("input", input);
        map.put("expect", expect);
        map.put("critical", critical);
        return map;
    }
}
