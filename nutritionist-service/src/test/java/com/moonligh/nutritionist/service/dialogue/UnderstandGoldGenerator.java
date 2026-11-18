package com.moonligh.nutritionist.service.dialogue;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

/** 生成 1000 条理解金标（可 main 跑，也可测试调用）。 */
public final class UnderstandGoldGenerator {

    private static final ObjectMapper JSON = new ObjectMapper();

    private UnderstandGoldGenerator() {
    }

    public static void main(String[] args) throws Exception {
        Path out = Path.of(args.length > 0
                ? args[0]
                : "src/test/resources/understand-gold/v1/gold-1000.jsonl");
        Files.createDirectories(out.getParent());
        List<String> lines = generateLines(1000);
        Files.write(out, lines, StandardCharsets.UTF_8);
        System.out.println("wrote " + lines.size() + " -> " + out.toAbsolutePath());
    }

    public static List<String> generateLines(int count) throws IOException {
        List<Map<String, Object>> cases = new ArrayList<>();
        String[] foodsA = {"番茄", "鸡蛋", "豆腐", "青椒", "土豆", "白菜", "牛肉", "排骨"};
        String[] foodsB = {"西红柿", "鸡蛋", "豆腐", "黄瓜", "茄子", "菠菜", "虾仁", "里脊"};
        String[] dishes1 = {"水煮蛋", "番茄炒蛋", "麻婆豆腐", "青椒肉丝", "土豆丝", "紫菜蛋花汤"};
        String[] dishes2 = {"番茄炒蛋", "豆腐汤", "鱼香肉丝", "蒜蓉西兰花", "米饭"};
        String[] cuisines = {"川菜", "粤菜", "湘菜", "鲁菜", "家常"};
        String[] avoids = {"香菜", "芹菜", "蒜", "花椒", "辣椒", "葱"};
        String[] absolutes = {"虾", "海鲜", "花生", "芒果"};
        String[] kinds = {"汤", "主食", "菜"};

        int id = 0;
        // 问候 / 域外
        for (String g : List.of("你好", "您好", "嗨", "在吗", "hello")) {
            cases.add(simple(id++, "greeting", g, List.of(), List.of(), List.of("GREETING"), Map.of(), false));
        }
        for (String o : List.of("今天北京天气", "股市怎么样", "讲个笑话", "你是谁开发的")) {
            cases.add(simple(id++, "oos", o, List.of(), List.of(), List.of("OUT_OF_SCOPE"), Map.of(), false));
        }

        while (cases.size() < count) {
            int n = cases.size();
            int i = n % foodsA.length;
            int j = n % dishes1.length;
            int k = n % cuisines.length;
            String f1 = foodsA[i];
            String f2 = foodsB[(i + 1) % foodsB.length];
            String d1 = dishes1[j];
            String d2 = dishes2[j % dishes2.length];
            String cuisine = cuisines[k];
            String avoid = avoids[n % avoids.length];
            String abs = absolutes[n % absolutes.length];
            String kind = kinds[n % kinds.length];

            switch (n % 12) {
                case 0 -> cases.add(recommend(id++, f1, f2));
                case 1 -> cases.add(recommendCuisine(id++, f1, f2, cuisine));
                case 2 -> cases.add(replaceNamed(id++, d1, d2));
                case 3 -> cases.add(replaceIndex(id++, d1, d2, 2));
                case 4 -> cases.add(addKind(id++, d1, d2, kind));
                case 5 -> cases.add(replaceAndAdd(id++, d1, d2, kind));
                case 6 -> cases.add(avoidRecommend(id++, f1, f2, avoid));
                case 7 -> cases.add(absoluteRecommend(id++, f1, abs));
                case 8 -> cases.add(missing(id++, f1, d1));
                case 9 -> cases.add(substitute(id++, f1, f2, d1));
                case 10 -> cases.add(clearAmbiguous(id++, d1, d2));
                default -> cases.add(multiConstraint(id++, f1, f2, cuisine, avoid));
            }
        }
        List<String> lines = new ArrayList<>(count);
        for (int i = 0; i < count; i++) {
            lines.add(JSON.writeValueAsString(cases.get(i)));
        }
        return lines;
    }

    private static Map<String, Object> recommend(int id, String f1, String f2) {
        String utter = "家里有" + f1 + f2 + "，推荐一下";
        return caseOf(id, "recommend", utter, List.of(f1, f2), List.of(),
                List.of("RECOMMEND"),
                Map.of("0.rawFoods", List.of(f1, f2)),
                Map.of(),
                modelJson(List.of(Map.of("type", "RECOMMEND", "rawFoods", List.of(f1, f2), "confidence", 0.9)), Map.of()),
                false);
    }

    private static Map<String, Object> recommendCuisine(int id, String f1, String f2, String cuisine) {
        String utter = "想吃" + cuisine + "，家里有" + f1 + "和" + f2;
        return caseOf(id, "recommend", utter, List.of(f1, f2), List.of(),
                List.of("RECOMMEND"),
                Map.of("0.rawFoods", List.of(f1, f2)),
                Map.of("cuisine", cuisine),
                modelJson(
                        List.of(Map.of("type", "RECOMMEND", "rawFoods", List.of(f1, f2), "confidence", 0.9)),
                        Map.of("cuisine", cuisine)),
                false);
    }

    private static Map<String, Object> replaceNamed(int id, String d1, String d2) {
        String utter = d1 + "换一个";
        return caseOf(id, "replace", utter, List.of(), List.of(d1, d2),
                List.of("REPLACE_ONE"),
                Map.of("0.dishHint", d1),
                Map.of(),
                modelJson(List.of(Map.of("type", "REPLACE_ONE", "dishHint", d1, "confidence", 0.9)), Map.of()),
                true);
    }

    private static Map<String, Object> replaceIndex(int id, String d1, String d2, int index) {
        String utter = "换第" + index + "个";
        String expectName = index == 1 ? d1 : d2;
        return caseOf(id, "anaphora", utter, List.of(), List.of(d1, d2),
                List.of("REPLACE_ONE"),
                Map.of("0.dishHint", expectName),
                Map.of(),
                modelJson(List.of(Map.of("type", "REPLACE_ONE", "dishIndex", index, "confidence", 0.85)), Map.of()),
                true);
    }

    private static Map<String, Object> addKind(int id, String d1, String d2, String kind) {
        String utter = "再加个" + kind;
        return caseOf(id, "add_kind", utter, List.of(), List.of(d1, d2),
                List.of("ADD_KIND"),
                Map.of("0.kind", kind),
                Map.of(),
                modelJson(List.of(Map.of("type", "ADD_KIND", "kind", kind, "confidence", 0.9)), Map.of()),
                true);
    }

    private static Map<String, Object> replaceAndAdd(int id, String d1, String d2, String kind) {
        String utter = d1 + "换一个，再加个" + kind;
        return caseOf(id, "multi_intent", utter, List.of(), List.of(d1, d2),
                List.of("REPLACE_ONE", "ADD_KIND"),
                Map.of("0.dishHint", d1, "1.kind", kind),
                Map.of(),
                modelJson(List.of(
                        Map.of("type", "REPLACE_ONE", "dishHint", d1, "confidence", 0.9),
                        Map.of("type", "ADD_KIND", "kind", kind, "confidence", 0.9)), Map.of()),
                true);
    }

    private static Map<String, Object> avoidRecommend(int id, String f1, String f2, String avoid) {
        String utter = "不吃" + avoid + "，用" + f1 + f2 + "推荐";
        return caseOf(id, "constraint", utter, List.of(f1, f2), List.of(),
                List.of("RECOMMEND"),
                Map.of("0.rawFoods", List.of(f1, f2)),
                Map.of("avoidFoods", List.of(avoid)),
                modelJson(
                        List.of(Map.of("type", "RECOMMEND", "rawFoods", List.of(f1, f2), "confidence", 0.9)),
                        Map.of("avoidFoods", List.of(avoid))),
                true);
    }

    private static Map<String, Object> absoluteRecommend(int id, String f1, String abs) {
        String utter = "绝对不能吃" + abs + "，家里有" + f1 + "推荐一下";
        return caseOf(id, "constraint", utter, List.of(f1), List.of(),
                List.of("RECOMMEND"),
                Map.of("0.rawFoods", List.of(f1)),
                Map.of("absoluteAvoidFoods", List.of(abs)),
                modelJson(
                        List.of(Map.of("type", "RECOMMEND", "rawFoods", List.of(f1), "confidence", 0.9)),
                        Map.of("absoluteAvoidFoods", List.of(abs))),
                true);
    }

    private static Map<String, Object> missing(int id, String food, String d1) {
        String utter = "没有" + food + "了";
        return caseOf(id, "missing", utter, List.of(), List.of(d1),
                List.of("MISSING"),
                Map.of("0.missingFood", food),
                Map.of(),
                modelJson(List.of(Map.of("type", "MISSING", "missingFood", food, "confidence", 0.9)), Map.of()),
                false);
    }

    private static Map<String, Object> substitute(int id, String from, String to, String d1) {
        String utter = "用" + to + "代替" + from;
        return caseOf(id, "missing", utter, List.of(), List.of(d1),
                List.of("SUBSTITUTE"),
                Map.of("0.fromFood", from, "0.toFood", to),
                Map.of(),
                modelJson(List.of(Map.of(
                        "type", "SUBSTITUTE", "fromFood", from, "toFood", to, "confidence", 0.9)), Map.of()),
                false);
    }

    private static Map<String, Object> clearAmbiguous(int id, String d1, String d2) {
        String utter = "换一个";
        Map<String, Object> model = new LinkedHashMap<>();
        model.put("tasks", List.of(Map.of("type", "REPLACE_ONE", "confidence", 0.7)));
        model.put("turnConstraints", Map.of());
        model.put("ambiguities", List.of());
        return caseOf(id, "clarify", utter, List.of(), List.of(d1, d2),
                List.of(),
                Map.of(),
                Map.of(),
                model,
                true,
                true);
    }

    private static Map<String, Object> multiConstraint(int id, String f1, String f2, String cuisine, String avoid) {
        String utter = "清淡点的" + cuisine + "，别放" + avoid + "，家里有" + f1 + "和" + f2;
        return caseOf(id, "multi_intent", utter, List.of(f1, f2), List.of(),
                List.of("RECOMMEND"),
                Map.of("0.rawFoods", List.of(f1, f2)),
                Map.of("cuisine", cuisine, "avoidFoods", List.of(avoid), "preferTags", List.of("清淡")),
                modelJson(
                        List.of(Map.of("type", "RECOMMEND", "rawFoods", List.of(f1, f2), "confidence", 0.88)),
                        Map.of("cuisine", cuisine, "avoidFoods", List.of(avoid), "preferTags", List.of("清淡"), "turnHints", List.of("清淡"))),
                true);
    }

    private static Map<String, Object> simple(
            int id, String bucket, String utter, List<String> foods, List<String> dishes,
            List<String> types, Map<String, Object> slots, boolean critical) {
        String type = types.getFirst();
        Map<String, Object> task = new LinkedHashMap<>();
        task.put("type", type);
        task.put("confidence", 0.95);
        if ("OUT_OF_SCOPE".equals(type)) {
            task.put("topic", "闲聊");
        }
        return caseOf(id, bucket, utter, foods, dishes, types, slots, Map.of(),
                modelJson(List.of(task), Map.of()), critical);
    }

    private static Map<String, Object> modelJson(List<Map<String, Object>> tasks, Map<String, Object> constraints) {
        Map<String, Object> root = new LinkedHashMap<>();
        root.put("tasks", tasks);
        root.put("turnConstraints", constraints);
        root.put("ambiguities", List.of());
        return root;
    }

    private static Map<String, Object> caseOf(
            int id,
            String bucket,
            String utter,
            List<String> foods,
            List<String> dishes,
            List<String> taskTypes,
            Map<String, Object> slots,
            Map<String, Object> constraints,
            Map<String, Object> modelJson,
            boolean critical) {
        return caseOf(id, bucket, utter, foods, dishes, taskTypes, slots, constraints, modelJson, critical, false);
    }

    private static Map<String, Object> caseOf(
            int id,
            String bucket,
            String utter,
            List<String> foods,
            List<String> dishes,
            List<String> taskTypes,
            Map<String, Object> slots,
            Map<String, Object> constraints,
            Map<String, Object> modelJson,
            boolean critical,
            boolean expectClarify) {
        Map<String, Object> pack = new LinkedHashMap<>();
        pack.put("utterance", utter);
        pack.put("requestFoods", foods);
        List<Map<String, Object>> dishRefs = new ArrayList<>();
        for (int i = 0; i < dishes.size(); i++) {
            dishRefs.add(Map.of("index", i + 1, "id", String.valueOf(i + 1), "name", dishes.get(i)));
        }
        pack.put("currentDishes", dishRefs);
        pack.put("phase", dishes.isEmpty() ? "IDLE" : "RECOMMENDED");

        Map<String, Object> expect = new LinkedHashMap<>();
        expect.put("taskTypes", taskTypes);
        expect.put("slots", slots);
        expect.put("constraints", constraints);
        expect.put("clarify", expectClarify);
        expect.put("mustNotTaskTypes", expectClarify ? List.of() : List.of("OUT_OF_SCOPE"));

        Map<String, Object> row = new LinkedHashMap<>();
        row.put("id", "G" + id);
        row.put("bucket", bucket);
        row.put("pack", pack);
        row.put("expect", expect);
        row.put("modelJson", modelJson);
        row.put("critical", critical);
        return row;
    }
}
