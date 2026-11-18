package com.moonligh.nutritionist.service.dialogue;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

/** 上线门禁金标：P2 warmup/改口/指标 + P3 降级策略。 */
public final class LaunchGoldGenerator {

    private static final ObjectMapper JSON = new ObjectMapper();

    private LaunchGoldGenerator() {
    }

    public static void main(String[] args) throws Exception {
        Path out = Path.of(args.length > 0
                ? args[0]
                : "src/test/resources/launch-gold/v1/gold-1000.jsonl");
        Files.createDirectories(out.getParent());
        List<String> lines = generateLines(1000);
        Files.write(out, lines, StandardCharsets.UTF_8);
        System.out.println("wrote " + lines.size() + " -> " + out.toAbsolutePath());
    }

    public static List<String> generateLines(int count) throws Exception {
        String[] foods = {"海带", "香菜", "芹菜", "洋葱", "花椒", "辣椒", "虾", "花生", "芒果", "蒜"};
        List<Map<String, Object>> cases = new ArrayList<>();
        int id = 0;
        while (cases.size() < count) {
            int n = cases.size();
            String food = foods[n % foods.length];
            String owner = "p-" + (n % 60);
            switch (n % 10) {
                case 0 -> cases.add(warmup(id++, owner, food));
                case 1 -> cases.add(retractNamed(id++, owner, food));
                case 2 -> cases.add(retractCanEat(id++, owner, food));
                case 3 -> cases.add(writeFailMetric(id++, owner, food));
                case 4 -> cases.add(epochVisible(id++, owner, food));
                case 5 -> cases.add(namedCuisineNoDegrade(id++));
                case 6 -> cases.add(tagsMayDegrade(id++));
                case 7 -> cases.add(degradeStep1(id++));
                case 8 -> cases.add(degradeStep2(id++));
                default -> cases.add(governanceRetract(id++, owner, food));
            }
        }
        List<String> lines = new ArrayList<>(count);
        for (int i = 0; i < count; i++) {
            lines.add(JSON.writeValueAsString(cases.get(i)));
        }
        return lines;
    }

    private static Map<String, Object> warmup(int id, String owner, String food) {
        return row(id, "warmup", Map.of(
                "op", "WARMUP",
                "sessionId", "s-" + id,
                "patientId", owner,
                "seedAvoid", List.of(food)),
                Map.of("avoidContains", food, "epochMin", 0),
                true);
    }

    private static Map<String, Object> retractNamed(int id, String owner, String food) {
        return row(id, "retract_named", Map.of(
                "op", "RETRACT_RULES",
                "ownerId", owner,
                "seedAvoid", List.of(food),
                "utterance", "可以吃" + food + "了"),
                Map.of("avoidGone", food),
                true);
    }

    private static Map<String, Object> retractCanEat(int id, String owner, String food) {
        return row(id, "retract_phrase", Map.of(
                "op", "RETRACT_EXTRACT",
                "utterance", "我不忌口了" + food),
                Map.of("hasRetractOrHint", true, "subject", food),
                false);
    }

    private static Map<String, Object> writeFailMetric(int id, String owner, String food) {
        return row(id, "write_fail", Map.of(
                "op", "WRITE_FAIL",
                "ownerId", owner,
                "seedAvoid", List.of(food)),
                Map.of("writeFailsMin", 1, "avoidContains", food),
                true);
    }

    private static Map<String, Object> epochVisible(int id, String owner, String food) {
        return row(id, "epoch", Map.of(
                "op", "EPOCH",
                "ownerId", owner,
                "seedAvoid", List.of(food)),
                Map.of("epochIncreased", true),
                true);
    }

    private static Map<String, Object> namedCuisineNoDegrade(int id) {
        return row(id, "no_degrade_cuisine", Map.of(
                "op", "DEGRADE_POLICY",
                "enabled", true,
                "cuisine", "XYZ菜",
                "reason", "SCALAR_EMPTY"),
                Map.of("allowDegrade", false),
                true);
    }

    private static Map<String, Object> tagsMayDegrade(int id) {
        return row(id, "degrade_tags", Map.of(
                "op", "DEGRADE_POLICY",
                "enabled", true,
                "cuisine", "",
                "tags", List.of("清淡"),
                "reason", "FILTER_FAIL_CLOSED"),
                Map.of("allowDegrade", true),
                true);
    }

    private static Map<String, Object> degradeStep1(int id) {
        return row(id, "degrade_step1", Map.of(
                "op", "DEGRADE_NEXT",
                "step", 0,
                "cuisine", "川菜",
                "tags", List.of("清淡", "少油"),
                "fuzzy", "今天想吃点好的"),
                Map.of("nextTagsEmpty", true, "nextCuisine", "川菜"),
                true);
    }

    private static Map<String, Object> degradeStep2(int id) {
        return row(id, "degrade_step2", Map.of(
                "op", "DEGRADE_NEXT",
                "step", 1,
                "cuisine", "川菜",
                "tags", List.of(),
                "fuzzy", ""),
                Map.of("nextCuisine", "", "keepConditions", true),
                true);
    }

    private static Map<String, Object> governanceRetract(int id, String owner, String food) {
        return row(id, "gov_retract", Map.of(
                "op", "GOV_RETRACT",
                "ownerId", owner,
                "sessionId", "s-gov-" + id,
                "seedAvoid", List.of(food),
                "subject", food),
                Map.of("avoidGone", food, "retractMetric", true),
                true);
    }

    private static Map<String, Object> row(
            int id, String bucket, Map<String, Object> input, Map<String, Object> expect, boolean critical) {
        Map<String, Object> map = new LinkedHashMap<>();
        map.put("id", "L" + id);
        map.put("bucket", bucket);
        map.put("input", input);
        map.put("expect", expect);
        map.put("critical", critical);
        return map;
    }
}
