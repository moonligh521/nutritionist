package com.moonligh.nutritionist.service.dialogue;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

/** 生成 1000 条「查偏好 / 规则同步写 / 旁路异步写」金标。 */
public final class PreferenceGoldGenerator {

    private static final ObjectMapper JSON = new ObjectMapper();

    private PreferenceGoldGenerator() {
    }

    public static void main(String[] args) throws Exception {
        Path out = Path.of(args.length > 0
                ? args[0]
                : "src/test/resources/preference-gold/v1/gold-1000.jsonl");
        Files.createDirectories(out.getParent());
        List<String> lines = generateLines(1000);
        Files.write(out, lines, StandardCharsets.UTF_8);
        System.out.println("wrote " + lines.size() + " -> " + out.toAbsolutePath());
    }

    public static List<String> generateLines(int count) throws Exception {
        String[] foods = {
                "海带", "香菜", "芹菜", "洋葱", "花椒", "辣椒", "虾", "花生", "芒果", "蒜",
                "生姜", "韭菜", "豆腐", "牛肉", "羊肉", "茄子", "苦瓜", "蘑菇", "鸭肉", "皮蛋"
        };
        String[] cuisines = {"川菜", "粤菜", "湘菜", "鲁菜", "家常", "淮扬", "东北菜"};
        String[] tags = {"清淡", "少油", "低糖", "少盐", "少辣"};
        String[] syncTemplates = {
                "我不吃%s帮推荐",
                "我不吃%s帮我推荐",
                "我不喜欢%s帮推荐",
                "不要%s啊推荐番茄",
                "我不想吃%s了帮推荐",
                "不能吃%s，来点清淡的"
        };
        String[] asyncTemplates = {
                "我不喜欢%s",
                "我不喜欢%s。",
                "不想吃%s",
                "不要%s",
                "我不吃%s",
                "我不吃%s呢"
        };
        String[] absoluteTemplates = {
                "我绝对不能吃%s",
                "绝对不吃%s",
                "千万别放%s",
                "我对%s过敏",
                "别放%s"
        };
        List<Map<String, Object>> cases = new ArrayList<>();
        int id = 0;

        while (cases.size() < count) {
            int n = cases.size();
            String food = foods[n % foods.length];
            String cuisine = cuisines[n % cuisines.length];
            String tag = tags[n % tags.length];
            String owner = "p-" + (n % 80);
            switch (n % 10) {
                case 0 -> cases.add(lookup(id++, owner, food, cuisine, tag));
                case 1 -> cases.add(syncAvoid(id++, owner, food, syncTemplates[n % syncTemplates.length]));
                case 2 -> cases.add(syncAbsolute(id++, owner, food, absoluteTemplates[n % absoluteTemplates.length]));
                case 3 -> cases.add(asyncRules(id++, owner, food, asyncTemplates[n % asyncTemplates.length]));
                case 4 -> cases.add(asyncAbsolute(id++, owner, food, absoluteTemplates[(n / 10) % absoluteTemplates.length]));
                case 5 -> cases.add(asyncFailKeeps(id++, owner, food));
                case 6 -> cases.add(clientMergeModerate(id++, owner, food));
                case 7 -> cases.add(asyncSkipWhenProjected(id++, owner, food, syncTemplates[(n / 10) % syncTemplates.length]));
                case 8 -> cases.add(queryCurrentAvoid(id++, owner, food));
                default -> cases.add(loaderPatient(id++, owner, food, cuisine));
            }
        }
        List<String> lines = new ArrayList<>(count);
        for (int i = 0; i < count; i++) {
            lines.add(JSON.writeValueAsString(cases.get(i)));
        }
        return lines;
    }

    private static Map<String, Object> lookup(int id, String owner, String food, String cuisine, String tag) {
        return row(id, "lookup", Map.of(
                "op", "LOOKUP",
                "ownerId", owner,
                "seedAvoid", List.of(food),
                "seedTags", List.of(tag),
                "seedCuisines", List.of(cuisine)),
                Map.of(
                        "avoidFoods", List.of(food),
                        "preferTags", List.of(tag),
                        "preferCuisines", List.of(cuisine)),
                true);
    }

    private static Map<String, Object> syncAvoid(int id, String owner, String food, String template) {
        return row(id, "sync_rules", Map.of(
                "op", "SYNC_RULES",
                "ownerId", owner,
                "utterance", template.formatted(food)),
                Map.of("avoidFoods", List.of(food), "absoluteAvoidFoods", List.of()),
                true);
    }

    private static Map<String, Object> syncAbsolute(int id, String owner, String food, String template) {
        return row(id, "sync_absolute", Map.of(
                "op", "SYNC_RULES",
                "ownerId", owner,
                "utterance", template.formatted(food)),
                Map.of("absoluteAvoidFoods", List.of(food)),
                true);
    }

    private static Map<String, Object> asyncRules(int id, String owner, String food, String template) {
        return row(id, "async_rules", Map.of(
                "op", "ASYNC_WRITE",
                "ownerId", owner,
                "utterance", template.formatted(food),
                "model", "none"),
                Map.of("avoidFoods", List.of(food)),
                true);
    }

    private static Map<String, Object> asyncAbsolute(int id, String owner, String food, String template) {
        return row(id, "async_absolute", Map.of(
                "op", "ASYNC_WRITE",
                "ownerId", owner,
                "utterance", template.formatted(food),
                "model", "none"),
                Map.of("absoluteAvoidFoods", List.of(food)),
                true);
    }

    private static Map<String, Object> asyncFailKeeps(int id, String owner, String food) {
        return row(id, "async_fail", Map.of(
                "op", "ASYNC_FAIL",
                "ownerId", owner,
                "seedAvoid", List.of(food),
                "utterance", "随便说点偏好"),
                Map.of("avoidFoods", List.of(food), "mustNotThrow", true),
                true);
    }

    private static Map<String, Object> clientMergeModerate(int id, String owner, String food) {
        return row(id, "client_merge", Map.of(
                "op", "CLIENT_MERGE",
                "ownerId", owner,
                "seedAvoid", List.of(food)),
                Map.of("avoidFoods", List.of(food), "absoluteAvoidFoods", List.of()),
                true);
    }

    private static Map<String, Object> asyncSkipWhenProjected(int id, String owner, String food, String template) {
        return row(id, "async_skip", Map.of(
                "op", "ASYNC_SKIP_DUP",
                "ownerId", owner,
                "seedAvoid", List.of(food),
                "utterance", template.formatted(food)),
                Map.of("avoidFoods", List.of(food), "epochUnchanged", true),
                false);
    }

    private static Map<String, Object> queryCurrentAvoid(int id, String owner, String food) {
        return row(id, "query", Map.of(
                "op", "QUERY_CURRENT_AVOID",
                "ownerId", owner,
                "seedAvoid", List.of(food)),
                Map.of("answerContains", food),
                false);
    }

    private static Map<String, Object> loaderPatient(int id, String owner, String food, String cuisine) {
        return row(id, "loader", Map.of(
                "op", "LOADER",
                "ownerId", owner,
                "seedAvoid", List.of(food),
                "seedCuisines", List.of(cuisine)),
                Map.of("avoidFoods", List.of(food), "preferCuisines", List.of(cuisine)),
                true);
    }

    private static Map<String, Object> row(
            int id, String bucket, Map<String, Object> input, Map<String, Object> expect, boolean critical) {
        Map<String, Object> map = new LinkedHashMap<>();
        map.put("id", "P" + id);
        map.put("bucket", bucket);
        map.put("input", input);
        map.put("expect", expect);
        map.put("critical", critical);
        return map;
    }
}
