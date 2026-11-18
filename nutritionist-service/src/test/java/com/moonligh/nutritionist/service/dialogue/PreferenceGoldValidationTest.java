package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.fail;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.junit.jupiter.api.Test;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.MemoryQuery;
import com.moonligh.nutritionist.domain.dialogue.MemoryQueryType;
import com.moonligh.nutritionist.domain.recognition.ModelCompletion;

/**
 * 1000 条偏好查询/旁路落库金标。不达标立即 fail 并打印分桶，供停下分析。
 */
class PreferenceGoldValidationTest {

    private static final ObjectMapper JSON = new ObjectMapper();
    private static final double PASS_MIN = 0.99;

    @Test
    void gold1000PreferencePathMeetsThresholds() throws Exception {
        List<String> lines = PreferenceGoldGenerator.generateLines(1000);
        int total = 0;
        int hit = 0;
        int critical = 0;
        int criticalMiss = 0;
        Map<String, Integer> bucketFail = new LinkedHashMap<>();
        List<String> failures = new ArrayList<>();

        for (String line : lines) {
            JsonNode row = JSON.readTree(line);
            total++;
            boolean isCritical = row.path("critical").asBoolean(false);
            if (isCritical) {
                critical++;
            }
            String id = row.path("id").asText();
            String bucket = row.path("bucket").asText("na");
            try {
                runOne(row.path("input"), row.path("expect"));
                hit++;
            } catch (AssertionError | RuntimeException error) {
                if (isCritical) {
                    criticalMiss++;
                }
                bucketFail.merge(bucket, 1, Integer::sum);
                failures.add(id + "/" + bucket + ": " + error.getMessage());
            }
        }

        double pass = total == 0 ? 0 : (double) hit / total;
        System.out.println("======== Preference Gold 1000 ========");
        System.out.println("total=" + total + " pass=" + String.format("%.2f%%", pass * 100)
                + " criticalMiss=" + criticalMiss + "/" + critical);
        System.out.println("bucketFails=" + bucketFail);
        failures.stream().limit(40).forEach(System.out::println);

        if (pass < PASS_MIN || criticalMiss > 0) {
            fail("偏好金标未达标：pass=" + String.format("%.2f%%", pass * 100)
                    + " criticalMiss=" + criticalMiss + "；已停下分析。fails=" + failures.size());
        }
    }

    private static void runOne(JsonNode input, JsonNode expect) {
        String op = input.path("op").asText();
        String owner = input.path("ownerId").asText();
        PreferenceStore store = new PreferenceStore();
        switch (op) {
            case "LOOKUP" -> {
                seed(store, owner, input);
                assertList(expect.path("avoidFoods"), store.snapshot(owner).avoidFoods());
                assertList(expect.path("preferTags"), store.snapshot(owner).preferTags());
                assertList(expect.path("preferCuisines"), store.snapshot(owner).preferCuisines());
            }
            case "SYNC_RULES" -> {
                String utter = input.path("utterance").asText();
                var extraction = new MemoryWriteValidator().validate(new MemoryExtractor(null).extractRulesOnly(utter));
                var write = store.commit(owner, extraction);
                if (!write.committed() && !extraction.events().isEmpty()) {
                    throw new AssertionError("sync commit failed");
                }
                assertList(expect.path("avoidFoods"), store.snapshot(owner).avoidFoods());
                assertList(expect.path("absoluteAvoidFoods"), store.snapshot(owner).absoluteAvoidFoods());
            }
            case "ASYNC_WRITE" -> {
                String utter = input.path("utterance").asText();
                AsyncMemoryWriter writer = new AsyncMemoryWriter(
                        new MemoryExtractor(null), store, new AllergySuspectStore());
                writer.writeQuietly(owner, utter);
                assertList(expect.path("avoidFoods"), store.snapshot(owner).avoidFoods());
                assertList(expect.path("absoluteAvoidFoods"), store.snapshot(owner).absoluteAvoidFoods());
            }
            case "ASYNC_FAIL" -> {
                seed(store, owner, input);
                ModelCompletion boom = prompt -> {
                    throw new RuntimeException("model down");
                };
                AsyncMemoryWriter writer = new AsyncMemoryWriter(
                        new MemoryExtractor(boom), store, new AllergySuspectStore());
                writer.writeQuietly(owner, input.path("utterance").asText());
                assertList(expect.path("avoidFoods"), store.snapshot(owner).avoidFoods());
            }
            case "CLIENT_MERGE" -> {
                List<String> avoids = readStrings(input.path("seedAvoid"));
                store.merge(owner, avoids, List.of(), List.of(), List.of());
                assertList(expect.path("avoidFoods"), store.snapshot(owner).avoidFoods());
                assertList(expect.path("absoluteAvoidFoods"), store.snapshot(owner).absoluteAvoidFoods());
            }
            case "ASYNC_SKIP_DUP" -> {
                seed(store, owner, input);
                long epochBefore = store.snapshot(owner).epoch();
                AsyncMemoryWriter writer = new AsyncMemoryWriter(
                        new MemoryExtractor(null), store, new AllergySuspectStore());
                writer.writeQuietly(owner, input.path("utterance").asText());
                assertList(expect.path("avoidFoods"), store.snapshot(owner).avoidFoods());
                if (expect.path("epochUnchanged").asBoolean(false)
                        && store.snapshot(owner).epoch() != epochBefore) {
                    throw new AssertionError("epoch changed on duplicate async write");
                }
            }
            case "QUERY_CURRENT_AVOID" -> {
                seed(store, owner, input);
                List<String> answer = store.answer(owner, new MemoryQuery(MemoryQueryType.CURRENT_AVOID, ""));
                String need = expect.path("answerContains").asText();
                if (!answer.contains(need)) {
                    throw new AssertionError("query miss " + need + " in " + answer);
                }
            }
            case "LOADER" -> {
                seed(store, owner, input);
                LongTermMemory loaded = new LongTermMemoryLoader(null, store).loadPatient(owner);
                assertList(expect.path("avoidFoods"), loaded.avoidFoods());
                assertList(expect.path("preferCuisines"), loaded.preferCuisines());
            }
            default -> throw new AssertionError("unknown op " + op);
        }
    }

    private static void seed(PreferenceStore store, String owner, JsonNode input) {
        store.merge(
                owner,
                readStrings(input.path("seedAvoid")),
                List.of(),
                readStrings(input.path("seedTags")),
                readStrings(input.path("seedCuisines")));
    }

    private static void assertList(JsonNode expected, List<String> actual) {
        if (expected == null || expected.isMissingNode() || expected.isNull()) {
            return;
        }
        List<String> want = readStrings(expected);
        if (!actual.equals(want)) {
            // absolute 场景可能只断言 absolute 列表；avoid 可能同含该主体
            if (want.isEmpty() && actual.isEmpty()) {
                return;
            }
            if (!want.isEmpty() && actual.containsAll(want) && actual.size() == want.size()) {
                return;
            }
            if (!want.isEmpty() && actual.equals(want)) {
                return;
            }
            throw new AssertionError("list expect=" + want + " actual=" + actual);
        }
    }

    private static List<String> readStrings(JsonNode node) {
        List<String> out = new ArrayList<>();
        if (node != null && node.isArray()) {
            node.forEach(n -> out.add(n.asText()));
        }
        return out;
    }
}
