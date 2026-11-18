package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.fail;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.domain.dialogue.DialoguePhase;
import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.TaskType;
import com.moonligh.nutritionist.domain.dialogue.TurnIntent;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext.DishRef;
import com.moonligh.nutritionist.domain.recommend.RecallEmptyReason;
import com.moonligh.nutritionist.service.dialogue.DialoguePlanner.PlanContext;
import com.moonligh.nutritionist.service.dialogue.FoodNormalizer.Result;

/**
 * P1 规划/指代/空引导 1000 金标。不达标立即 fail。
 */
class PlannerGoldValidationTest {

    private static final ObjectMapper JSON = new ObjectMapper();
    private static final double PASS_MIN = 0.99;

    @Test
    void gold1000PlannerPathMeetsThresholds() throws Exception {
        List<String> lines = PlannerGoldGenerator.generateLines(1000);
        int total = 0;
        int hit = 0;
        int critical = 0;
        int criticalMiss = 0;
        Map<String, Integer> bucketFail = new LinkedHashMap<>();
        List<String> failures = new ArrayList<>();

        DialoguePlanner planner = new DialoguePlanner();
        SlotResolver slots = new SlotResolver();
        EmptyGuideComposer guides = new EmptyGuideComposer();

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
                runOne(row.path("input"), row.path("expect"), planner, slots, guides);
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
        System.out.println("======== Planner Gold 1000 ========");
        System.out.println("total=" + total + " pass=" + String.format("%.2f%%", pass * 100)
                + " criticalMiss=" + criticalMiss + "/" + critical);
        System.out.println("bucketFails=" + bucketFail);
        failures.stream().limit(40).forEach(System.out::println);

        if (pass < PASS_MIN || criticalMiss > 0) {
            fail("规划金标未达标：pass=" + String.format("%.2f%%", pass * 100)
                    + " criticalMiss=" + criticalMiss + "；已停下分析。fails=" + failures.size());
        }
    }

    private static void runOne(
            JsonNode input,
            JsonNode expect,
            DialoguePlanner planner,
            SlotResolver slots,
            EmptyGuideComposer guides) {
        String op = input.path("op").asText();
        switch (op) {
            case "PLAN" -> assertPlan(input, expect, planner);
            case "SLOT" -> assertSlot(input, expect, slots);
            case "EMPTY_GUIDE" -> assertGuide(input, expect, guides);
            default -> throw new AssertionError("unknown op " + op);
        }
    }

    private static void assertPlan(JsonNode input, JsonNode expect, DialoguePlanner planner) {
        List<DialogueTask> tasks = parseTasks(input.path("tasks"));
        boolean needConfirm = input.path("needConfirm").asBoolean(false);
        List<String> foodIds = readStrings(input.path("foodIds"));
        Result foods = needConfirm
                ? new Result(
                        foodIds,
                        List.of(),
                        List.of(),
                        List.of(new DialogueTask.ConfirmCandidate(
                                input.path("confirmRaw").asText("x"), List.of("a", "b"))))
                : new Result(foodIds, List.of(), List.of(), List.of());
        PlanContext ctx = new PlanContext(
                DialoguePhase.parse(input.path("phase").asText("IDLE")),
                input.path("hasDishes").asBoolean(false),
                input.path("utterance").asText("").contains("重新推荐"),
                input.path("measurementBlocked").asBoolean(false)
                        || "BLOCKED".equals(input.path("phase").asText()));
        List<DialogueTask> plan = planner.plan(tasks, foods, ctx);
        List<String> types = plan.stream().map(t -> t.type().name()).toList();

        if (expect.has("planTypes")) {
            List<String> want = readStrings(expect.path("planTypes"));
            if (!types.equals(want)) {
                throw new AssertionError("planTypes expect=" + want + " actual=" + types);
            }
        }
        if (expect.path("blocksRecommend").asBoolean(false) && types.contains("RECOMMEND")) {
            throw new AssertionError("recommend should be blocked: " + types);
        }
        if (expect.has("mustNotContain")) {
            for (String bad : readStrings(expect.path("mustNotContain"))) {
                if (types.contains(bad)) {
                    throw new AssertionError("mustNotContain " + bad + " in " + types);
                }
            }
        }
        if (expect.has("planContains")) {
            for (String need : readStrings(expect.path("planContains"))) {
                if (!types.contains(need)) {
                    throw new AssertionError("missing " + need + " in " + types);
                }
            }
        }
        if (expect.has("replaceCount")) {
            long count = types.stream().filter("REPLACE_ONE"::equals).count();
            if (count != expect.path("replaceCount").asInt()) {
                throw new AssertionError("replaceCount expect=" + expect.path("replaceCount").asInt()
                        + " actual=" + count + " types=" + types);
            }
        }
    }

    private static void assertSlot(JsonNode input, JsonNode expect, SlotResolver slots) {
        List<DishRef> dishes = new ArrayList<>();
        List<String> names = readStrings(input.path("dishes"));
        for (int i = 0; i < names.size(); i++) {
            dishes.add(new DishRef(i + 1, "id" + i, names.get(i)));
        }
        UnderstandContext ctx = new UnderstandContext(
                "换一个",
                List.of(),
                dishes,
                input.path("focused").asText(""),
                "RECOMMENDED",
                null);
        DialogueTask task = DialogueTask.replaceOne("");
        String rawTask = input.path("task").asText("REPLACE_ONE:");
        if (rawTask.startsWith("REPLACE_ONE:")) {
            task = DialogueTask.replaceOne(rawTask.substring("REPLACE_ONE:".length()));
        }
        int dishIndex = input.path("dishIndex").asInt(0);
        TurnIntent resolved = slots.resolve(
                TurnIntent.ofTasks(List.of(task)), ctx, List.of(dishIndex));
        boolean clarify = expect.path("clarify").asBoolean(false);
        if (clarify) {
            if (!resolved.needsClarify()) {
                throw new AssertionError("expected clarify");
            }
            return;
        }
        if (resolved.needsClarify() || resolved.tasks().isEmpty()) {
            throw new AssertionError("unexpected clarify/empty tasks=" + resolved.tasks());
        }
        String hint = resolved.tasks().getFirst().dishHint();
        String want = expect.path("dishHint").asText();
        if (!want.equals(hint)) {
            throw new AssertionError("dishHint expect=" + want + " actual=" + hint);
        }
    }

    private static void assertGuide(JsonNode input, JsonNode expect, EmptyGuideComposer guides) {
        RecallEmptyReason reason = RecallEmptyReason.valueOf(input.path("reason").asText());
        EmptyGuideComposer.Guide guide = guides.compose(
                reason,
                input.path("hasCuisine").asBoolean(false),
                input.path("hasTags").asBoolean(false));
        if (expect.path("textNonBlank").asBoolean(false) && guide.text().isBlank()) {
            throw new AssertionError("guide text blank");
        }
        List<String> want = readStrings(expect.path("actions"));
        if (!guide.actions().equals(want)) {
            throw new AssertionError("actions expect=" + want + " actual=" + guide.actions());
        }
        if (!"EMPTY_GUIDE".equals(expect.path("phase").asText()) && expect.has("phase")) {
            throw new AssertionError("phase expect EMPTY_GUIDE");
        }
    }

    private static List<DialogueTask> parseTasks(JsonNode node) {
        List<DialogueTask> out = new ArrayList<>();
        if (node == null || !node.isArray()) {
            return out;
        }
        for (JsonNode item : node) {
            String raw = item.asText();
            if (raw.startsWith("REPLACE_ONE:")) {
                out.add(DialogueTask.replaceOne(raw.substring("REPLACE_ONE:".length())));
            } else if (raw.startsWith("MISSING:")) {
                out.add(DialogueTask.missing(raw.substring("MISSING:".length())));
            } else if (raw.startsWith("ADD_KIND:")) {
                out.add(DialogueTask.addKind(raw.substring("ADD_KIND:".length())));
            } else if (raw.equals("GREETING")) {
                out.add(DialogueTask.greeting());
            } else if (raw.equals("OUT_OF_SCOPE")) {
                out.add(DialogueTask.outOfScope("x"));
            } else if (raw.equals("RECOMMEND")) {
                out.add(DialogueTask.recommend(List.of("番茄")));
            } else if (raw.equals("CONFIRM_FOODS")) {
                out.add(DialogueTask.confirmFoods(List.of(
                        new DialogueTask.ConfirmCandidate("x", List.of("a")))));
            } else {
                out.add(new DialogueTask(TaskType.valueOf(raw)));
            }
        }
        return out;
    }

    private static List<String> readStrings(JsonNode node) {
        List<String> out = new ArrayList<>();
        if (node != null && node.isArray()) {
            node.forEach(n -> out.add(n.asText()));
        }
        return out;
    }
}
