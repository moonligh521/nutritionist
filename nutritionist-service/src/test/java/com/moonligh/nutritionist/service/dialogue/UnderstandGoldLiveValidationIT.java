package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.fail;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.TurnIntent;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext.DishRef;

/**
 * 真模型金标验证。启用：-Dunderstand.gold.live=true
 * 条数：-Dunderstand.gold.limit=1000（默认 1000）
 */
@SpringBootTest
@ActiveProfiles("test")
class UnderstandGoldLiveValidationIT {

    private static final ObjectMapper JSON = new ObjectMapper();
    private static final double TASK_SET_MIN = 0.92;
    private static final double CRITICAL_MISS_MAX = 0.02;

    @DynamicPropertySource
    static void props(DynamicPropertyRegistry registry) {
        registry.add("nutritionist.chunk-seeder.enabled", () -> "false");
        registry.add("management.otlp.metrics.export.enabled", () -> "false");
        registry.add("model.timeout-ms", () -> "12000");
        registry.add("model.timeout-retries", () -> "0");
    }

    @Autowired
    private IntentUnderstander understander;

    @Test
    void liveGoldMeetsThresholdsOrStopForAnalysis() throws Exception {
        assumeTrue("true".equalsIgnoreCase(System.getProperty("understand.gold.live", "")),
                "跳过；需要 -Dunderstand.gold.live=true");

        Path file = Path.of("src/test/resources/understand-gold/v1/gold-1000.jsonl");
        assumeTrue(Files.exists(file), "missing " + file);
        List<String> lines = Files.readAllLines(file, StandardCharsets.UTF_8);
        int limit = Integer.parseInt(System.getProperty("understand.gold.limit", "1000"));
        limit = Math.min(limit, lines.size());

        int total = 0;
        int hit = 0;
        int critical = 0;
        int criticalMiss = 0;
        int falseOos = 0;
        Map<String, Integer> bucketFail = new LinkedHashMap<>();
        List<String> failures = new ArrayList<>();

        for (int i = 0; i < limit; i++) {
            JsonNode row = JSON.readTree(lines.get(i));
            total++;
            boolean isCritical = row.path("critical").asBoolean(false);
            if (isCritical) {
                critical++;
            }
            UnderstandContext pack = packOf(row.path("pack"));
            TurnIntent intent = understander.interpret(pack);
            JsonNode expect = row.path("expect");
            boolean expectClarify = expect.path("clarify").asBoolean(false);
            List<String> expectTypes = readTypes(expect.path("taskTypes"));
            List<String> actualTypes = intent.tasks().stream().map(t -> t.type().name()).toList();

            boolean ok;
            String reason;
            if (expectClarify) {
                ok = intent.needsClarify();
                reason = ok ? "" : "expected clarify got " + actualTypes;
            } else if (!expectTypes.equals(actualTypes)) {
                ok = false;
                reason = "types expect=" + expectTypes + " actual=" + actualTypes;
                if (isCritical) {
                    criticalMiss++;
                }
                if (actualTypes.contains("OUT_OF_SCOPE") && !expectTypes.contains("OUT_OF_SCOPE")) {
                    falseOos++;
                }
            } else if (!slotsMatch(expect.path("slots"), intent.tasks())) {
                ok = false;
                reason = "slots";
                if (isCritical) {
                    criticalMiss++;
                }
            } else {
                ok = true;
                reason = "";
            }

            if (ok) {
                hit++;
            } else {
                String bucket = row.path("bucket").asText("na");
                bucketFail.merge(bucket, 1, Integer::sum);
                failures.add(row.path("id").asText() + "/" + bucket + " " + reason
                        + " | " + pack.utterance());
            }
            if (total % 50 == 0) {
                System.out.println("LIVE progress " + total + "/" + limit + " hit=" + hit);
            }
        }

        double taskSet = (double) hit / total;
        double criticalMissRate = critical == 0 ? 0 : (double) criticalMiss / critical;
        System.out.println("======== Understand Gold LIVE ========");
        System.out.println("total=" + total + " taskSet=" + String.format("%.2f%%", taskSet * 100)
                + " criticalMiss=" + String.format("%.2f%%", criticalMissRate * 100)
                + " falseOos=" + falseOos);
        System.out.println("bucketFails=" + bucketFail);
        failures.stream().limit(40).forEach(System.out::println);

        if (taskSet < TASK_SET_MIN || criticalMissRate > CRITICAL_MISS_MAX) {
            fail("LIVE 金标未达标：taskSet=" + String.format("%.2f%%", taskSet * 100)
                    + " criticalMiss=" + String.format("%.2f%%", criticalMissRate * 100)
                    + "；已停下分析。fails=" + failures.size());
        }
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
            String[] parts = entry.getKey().split("\\.", 2);
            int idx = Integer.parseInt(parts[0]);
            if (idx < 0 || idx >= tasks.size()) {
                return false;
            }
            DialogueTask task = tasks.get(idx);
            String field = parts[1];
            JsonNode val = entry.getValue();
            if ("rawFoods".equals(field)) {
                List<String> expect = new ArrayList<>();
                val.forEach(n -> expect.add(n.asText()));
                if (!task.rawFoods().equals(expect)) {
                    return false;
                }
            } else {
                String actual = switch (field) {
                    case "dishHint" -> task.dishHint();
                    case "kind" -> task.kind();
                    case "missingFood" -> task.missingFood();
                    case "fromFood" -> task.fromFood();
                    case "toFood" -> task.toFood();
                    default -> "";
                };
                if (!actual.equals(val.asText())) {
                    return false;
                }
            }
        }
        return true;
    }
}
