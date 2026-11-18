package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.fail;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.ObjectProvider;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.config.RecallDegradeProperties;
import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.domain.dialogue.MemoryOp;
import com.moonligh.nutritionist.domain.recommend.RecallContext;
import com.moonligh.nutritionist.domain.recommend.RecallEmptyReason;
import com.moonligh.nutritionist.domain.recognition.ModelCompletion;
import com.moonligh.nutritionist.service.RecallDegradeLadder;

/** 上线门禁 1000 金标：warmup / 改口 / 写失败指标 / 降级策略。 */
class LaunchGoldValidationTest {

    private static final ObjectMapper JSON = new ObjectMapper();
    private static final double PASS_MIN = 0.99;

    @Test
    void gold1000LaunchPathMeetsThresholds() throws Exception {
        List<String> lines = LaunchGoldGenerator.generateLines(1000);
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
        System.out.println("======== Launch Gold 1000 ========");
        System.out.println("total=" + total + " pass=" + String.format("%.2f%%", pass * 100)
                + " criticalMiss=" + criticalMiss + "/" + critical);
        System.out.println("bucketFails=" + bucketFail);
        failures.stream().limit(40).forEach(System.out::println);

        if (pass < PASS_MIN || criticalMiss > 0) {
            fail("上线金标未达标：pass=" + String.format("%.2f%%", pass * 100)
                    + " criticalMiss=" + criticalMiss + "；已停下分析。fails=" + failures.size());
        }
    }

    private static void runOne(JsonNode input, JsonNode expect) {
        switch (input.path("op").asText()) {
            case "WARMUP" -> assertWarmup(input, expect);
            case "RETRACT_RULES" -> assertRetractRules(input, expect);
            case "RETRACT_EXTRACT" -> assertRetractExtract(input, expect);
            case "WRITE_FAIL" -> assertWriteFail(input, expect);
            case "EPOCH" -> assertEpoch(input, expect);
            case "DEGRADE_POLICY" -> assertDegradePolicy(input, expect);
            case "DEGRADE_NEXT" -> assertDegradeNext(input, expect);
            case "GOV_RETRACT" -> assertGovRetract(input, expect);
            default -> throw new AssertionError("unknown op");
        }
    }

    private static void assertWarmup(JsonNode input, JsonNode expect) {
        PreferenceStore store = new PreferenceStore();
        String owner = input.path("patientId").asText();
        store.merge(owner, readStrings(input.path("seedAvoid")), List.of(), List.of(), List.of());
        MemoryMetrics metrics = new MemoryMetrics();
        PreferenceWarmupService warmup = new PreferenceWarmupService(
                new SessionMemoryStore(), new LongTermMemoryLoader(null, store), store, metrics);
        var result = warmup.warmup(input.path("sessionId").asText(), owner);
        if (!result.longTerm().avoidFoods().contains(expect.path("avoidContains").asText())) {
            throw new AssertionError("warmup miss avoid " + result.longTerm().avoidFoods());
        }
        if (result.preferenceEpoch() < expect.path("epochMin").asLong(0)) {
            throw new AssertionError("epoch too small " + result.preferenceEpoch());
        }
        if (metrics.snapshot().warmups() < 1) {
            throw new AssertionError("warmup metric not marked");
        }
    }

    private static void assertRetractRules(JsonNode input, JsonNode expect) {
        PreferenceStore store = new PreferenceStore();
        String owner = input.path("ownerId").asText();
        store.merge(owner, readStrings(input.path("seedAvoid")), List.of(), List.of(), List.of());
        MemoryExtraction extraction = new MemoryExtractor(null).extractRulesOnly(input.path("utterance").asText());
        var write = store.commit(owner, new MemoryWriteValidator().validate(extraction));
        String gone = expect.path("avoidGone").asText();
        if (store.snapshot(owner).avoidFoods().contains(gone)) {
            throw new AssertionError("retract failed still has " + gone
                    + " events=" + extraction.events() + " committed=" + write.committed());
        }
    }

    private static void assertRetractExtract(JsonNode input, JsonNode expect) {
        MemoryExtraction extraction = new MemoryExtractor(null).extractRulesOnly(input.path("utterance").asText());
        boolean hasRetract = extraction.events().stream().anyMatch(e -> e.op() == MemoryOp.RETRACT);
        boolean hint = extraction.turnOnlyHints().contains("RETRACT_PENDING");
        String subject = expect.path("subject").asText();
        boolean subjectHit = extraction.events().stream().anyMatch(e -> subject.equals(e.subject()));
        if (expect.path("hasRetractOrHint").asBoolean(false) && !hasRetract && !hint && !subjectHit) {
            throw new AssertionError("no retract/hint for " + input.path("utterance").asText()
                    + " events=" + extraction.events() + " hints=" + extraction.turnOnlyHints());
        }
    }

    private static void assertWriteFail(JsonNode input, JsonNode expect) {
        PreferenceStore store = new PreferenceStore();
        String owner = input.path("ownerId").asText();
        store.merge(owner, readStrings(input.path("seedAvoid")), List.of(), List.of(), List.of());
        MemoryMetrics metrics = new MemoryMetrics();
        AtomicReference<MemoryMetrics> ref = new AtomicReference<>(metrics);
        ObjectProvider<MemoryMetrics> provider = new ObjectProvider<>() {
            @Override
            public MemoryMetrics getObject() {
                return ref.get();
            }

            @Override
            public MemoryMetrics getIfAvailable() {
                return ref.get();
            }

            @Override
            public MemoryMetrics getIfUnique() {
                return ref.get();
            }
        };
        ModelCompletion boom = prompt -> {
            throw new RuntimeException("model down");
        };
        AsyncMemoryWriter writer = new AsyncMemoryWriter(
                new MemoryExtractor(boom),
                new MemoryWriteValidator(),
                store,
                new AllergySuspectStore(),
                provider,
                null);
        writer.writeQuietly(owner, "随便说点偏好");
        if (metrics.snapshot().writeFails() < expect.path("writeFailsMin").asLong(1)) {
            throw new AssertionError("writeFails=" + metrics.snapshot().writeFails());
        }
        if (!store.snapshot(owner).avoidFoods().contains(expect.path("avoidContains").asText())) {
            throw new AssertionError("store corrupted " + store.snapshot(owner).avoidFoods());
        }
    }

    private static void assertEpoch(JsonNode input, JsonNode expect) {
        PreferenceStore store = new PreferenceStore();
        String owner = input.path("ownerId").asText();
        long before = store.snapshot(owner).epoch();
        store.merge(owner, readStrings(input.path("seedAvoid")), List.of(), List.of(), List.of());
        long after = store.snapshot(owner).epoch();
        if (expect.path("epochIncreased").asBoolean(false) && after <= before) {
            throw new AssertionError("epoch not increased before=" + before + " after=" + after);
        }
    }

    private static void assertDegradePolicy(JsonNode input, JsonNode expect) {
        RecallDegradeProperties props = new RecallDegradeProperties();
        props.setEnabled(input.path("enabled").asBoolean(false));
        RecallDegradeLadder ladder = new RecallDegradeLadder(props);
        RecallContext ctx = new RecallContext(
                input.path("cuisine").asText(""),
                "",
                readStrings(input.path("tags")),
                List.of(),
                "");
        boolean allow = ladder.allowDegrade(ctx, RecallEmptyReason.valueOf(input.path("reason").asText()));
        if (allow != expect.path("allowDegrade").asBoolean()) {
            throw new AssertionError("allowDegrade expect=" + expect.path("allowDegrade").asBoolean()
                    + " actual=" + allow);
        }
    }

    private static void assertDegradeNext(JsonNode input, JsonNode expect) {
        RecallDegradeLadder ladder = new RecallDegradeLadder(new RecallDegradeProperties());
        RecallContext ctx = new RecallContext(
                input.path("cuisine").asText(""),
                "",
                readStrings(input.path("tags")),
                List.of("控糖"),
                input.path("fuzzy").asText(""));
        RecallContext next = ladder.next(ctx, input.path("step").asInt());
        if (next == null) {
            throw new AssertionError("next null");
        }
        if (expect.path("nextTagsEmpty").asBoolean(false) && !next.preferTags().isEmpty()) {
            throw new AssertionError("tags not cleared");
        }
        if (expect.has("nextCuisine") && !expect.path("nextCuisine").asText().equals(next.cuisine())) {
            throw new AssertionError("cuisine expect=" + expect.path("nextCuisine").asText()
                    + " actual=" + next.cuisine());
        }
        if (expect.path("keepConditions").asBoolean(false) && next.conditions().isEmpty()) {
            throw new AssertionError("conditions dropped");
        }
    }

    private static void assertGovRetract(JsonNode input, JsonNode expect) {
        PreferenceStore store = new PreferenceStore();
        String owner = input.path("ownerId").asText();
        store.merge(owner, readStrings(input.path("seedAvoid")), List.of(), List.of(), List.of());
        SessionMemoryStore sessions = new SessionMemoryStore();
        MemoryGovernanceService simple = new MemoryGovernanceService(
                store, new PreferencePersistence((com.moonligh.nutritionist.infrastructure.persistence.DietPreferenceMapper) null),
                sessions, new LongTermMemoryLoader(null, store));
        simple.retract(owner, input.path("subject").asText(), "test", input.path("sessionId").asText());
        if (store.snapshot(owner).avoidFoods().contains(expect.path("avoidGone").asText())) {
            throw new AssertionError("gov retract failed " + store.snapshot(owner).avoidFoods());
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
