package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

import org.junit.jupiter.api.Test;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.TaskType;
import com.moonligh.nutritionist.domain.dialogue.TurnIntent;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext.DishRef;
import com.moonligh.nutritionist.domain.recognition.ModelCompletion;

/**
 * 1000 条理解金标验证（oracle：modelJson 注入）。
 * 不达标立即 fail 并打印分桶错误，供停下分析。
 */
class UnderstandGoldValidationTest {

    private static final ObjectMapper JSON = new ObjectMapper();
    private static final double TASK_SET_MIN = 0.92;
    private static final double CRITICAL_MISS_MAX = 0.02;

    @Test
    void gold1000OraclePipelineMeetsThresholds() throws Exception {
        List<String> lines = UnderstandGoldGenerator.generateLines(1000);
        assertTrue(lines.size() == 1000, "gold size=" + lines.size());

        int total = 0;
        int taskSetHit = 0;
        int critical = 0;
        int criticalMiss = 0;
        int falseOos = 0;
        int clarifyHit = 0;
        int clarifyExpected = 0;
        List<String> failures = new ArrayList<>();
        Map<String, Integer> bucketFail = new LinkedHashMap<>();

        for (String line : lines) {
            JsonNode row = JSON.readTree(line);
            total++;
            String id = row.path("id").asText();
            String bucket = row.path("bucket").asText("na");
            boolean isCritical = row.path("critical").asBoolean(false);
            if (isCritical) {
                critical++;
            }

            UnderstandContext pack = packOf(row.path("pack"));
            String modelJson = JSON.writeValueAsString(row.path("modelJson"));
            AtomicReference<String> seen = new AtomicReference<>();
            ModelCompletion model = prompt -> {
                seen.set(prompt);
                return Optional.of(modelJson);
            };
            IntentUnderstander understander = new IntentUnderstander(model);
            TurnIntent intent = understander.interpret(pack);

            JsonNode expect = row.path("expect");
            boolean expectClarify = expect.path("clarify").asBoolean(false);
            List<String> expectTypes = readTypes(expect.path("taskTypes"));
            List<String> actualTypes = intent.tasks().stream().map(t -> t.type().name()).toList();

            boolean ok = true;
            String reason = "";
            if (expectClarify) {
                clarifyExpected++;
                if (intent.needsClarify()) {
                    clarifyHit++;
                } else {
                    ok = false;
                    reason = "expected clarify";
                }
            } else {
                if (intent.needsClarify() && expectTypes.isEmpty()) {
                    // unexpected
                    ok = false;
                    reason = "unexpected clarify";
                } else if (!expectTypes.equals(actualTypes)) {
                    ok = false;
                    reason = "taskTypes expect=" + expectTypes + " actual=" + actualTypes;
                    if (isCritical) {
                        criticalMiss++;
                    }
                    if (actualTypes.contains("OUT_OF_SCOPE") && !expectTypes.contains("OUT_OF_SCOPE")) {
                        falseOos++;
                    }
                } else if (!slotsMatch(expect.path("slots"), intent.tasks())) {
                    ok = false;
                    reason = "slots mismatch";
                    if (isCritical) {
                        criticalMiss++;
                    }
                } else if (!constraintsMatch(expect.path("constraints"), intent)) {
                    ok = false;
                    reason = "constraints mismatch";
                }
            }

            if (ok) {
                taskSetHit++;
            } else {
                failures.add(id + "/" + bucket + ": " + reason + " utter=" + pack.utterance());
                bucketFail.merge(bucket, 1, Integer::sum);
            }
        }

        double taskSet = total == 0 ? 0 : (double) taskSetHit / total;
        double criticalMissRate = critical == 0 ? 0 : (double) criticalMiss / critical;
        double falseOosRate = total == 0 ? 0 : (double) falseOos / total;

        System.out.println("======== Understand Gold 1000 (oracle) ========");
        System.out.println("total=" + total + " taskSet=" + pct(taskSet) + " criticalMiss=" + pct(criticalMissRate)
                + " falseOos=" + pct(falseOosRate) + " clarify=" + clarifyHit + "/" + clarifyExpected);
        System.out.println("bucketFails=" + bucketFail);
        if (!failures.isEmpty()) {
            System.out.println("sampleFailures:");
            failures.stream().limit(30).forEach(System.out::println);
        }

        if (taskSet < TASK_SET_MIN || criticalMissRate > CRITICAL_MISS_MAX) {
            fail("金标未达标：taskSet=" + pct(taskSet) + " (需≥92%) criticalMiss=" + pct(criticalMissRate)
                    + " (需≤2%)；已停下供分析。fails=" + failures.size());
        }
        assertTrue(taskSet >= TASK_SET_MIN);
    }

    private static String pct(double v) {
        return String.format("%.2f%%", v * 100);
    }

    private static UnderstandContext packOf(JsonNode pack) {
        List<DishRef> dishes = new ArrayList<>();
        for (JsonNode d : pack.path("currentDishes")) {
            dishes.add(new DishRef(d.path("index").asInt(), d.path("id").asText(), d.path("name").asText()));
        }
        List<String> foods = new ArrayList<>();
        pack.path("requestFoods").forEach(n -> foods.add(n.asText()));
        return new UnderstandContext(
                pack.path("utterance").asText(),
                foods,
                dishes,
                dishes.size() == 1 ? dishes.getFirst().name() : "",
                pack.path("phase").asText("IDLE"),
                LongTermMemory.empty());
    }

    private static List<String> readTypes(JsonNode node) {
        List<String> out = new ArrayList<>();
        if (node != null && node.isArray()) {
            node.forEach(n -> out.add(n.asText()));
        }
        return out;
    }

    private static boolean slotsMatch(JsonNode slots, List<DialogueTask> tasks) {
        if (slots == null || !slots.isObject() || slots.isEmpty()) {
            return true;
        }
        var fields = slots.fields();
        while (fields.hasNext()) {
            var entry = fields.next();
            String key = entry.getKey();
            JsonNode val = entry.getValue();
            String[] parts = key.split("\\.", 2);
            int idx = Integer.parseInt(parts[0]);
            if (idx < 0 || idx >= tasks.size()) {
                return false;
            }
            DialogueTask task = tasks.get(idx);
            String field = parts[1];
            String actual = switch (field) {
                case "dishHint" -> task.dishHint();
                case "kind" -> task.kind();
                case "missingFood" -> task.missingFood();
                case "fromFood" -> task.fromFood();
                case "toFood" -> task.toFood();
                case "rawFoods" -> String.join(",", task.rawFoods());
                default -> "";
            };
            if ("rawFoods".equals(field)) {
                List<String> expect = new ArrayList<>();
                val.forEach(n -> expect.add(n.asText()));
                if (!task.rawFoods().equals(expect)) {
                    return false;
                }
            } else if (!actual.equals(val.asText())) {
                return false;
            }
        }
        return true;
    }

    private static boolean constraintsMatch(JsonNode constraints, TurnIntent intent) {
        if (constraints == null || !constraints.isObject() || constraints.isEmpty()) {
            return true;
        }
        if (constraints.has("cuisine") && !constraints.path("cuisine").asText().equals(intent.constraints().cuisine())) {
            return false;
        }
        if (constraints.has("avoidFoods")) {
            List<String> expect = new ArrayList<>();
            constraints.path("avoidFoods").forEach(n -> expect.add(n.asText()));
            if (!intent.constraints().avoidFoods().equals(expect)) {
                return false;
            }
        }
        if (constraints.has("absoluteAvoidFoods")) {
            List<String> expect = new ArrayList<>();
            constraints.path("absoluteAvoidFoods").forEach(n -> expect.add(n.asText()));
            if (!intent.constraints().absoluteAvoidFoods().equals(expect)) {
                return false;
            }
        }
        if (constraints.has("preferTags")) {
            List<String> expect = new ArrayList<>();
            constraints.path("preferTags").forEach(n -> expect.add(n.asText()));
            if (!intent.constraints().preferTags().equals(expect)) {
                return false;
            }
        }
        return true;
    }
}
