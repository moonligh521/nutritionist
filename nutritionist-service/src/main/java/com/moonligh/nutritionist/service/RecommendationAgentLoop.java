package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.domain.meal.MealPlan;
import com.moonligh.nutritionist.domain.recognition.ModelCompletion;
import com.moonligh.nutritionist.domain.workflow.ToolCatalog;
import com.moonligh.nutritionist.domain.workflow.WorkflowStep;

/**
 * 规则先锁定克数，模型只在生成说明这一步读记忆和白名单工具。
 * 长期记忆是病情、用药和测量许可，不保存对话原文。
 * 短期记忆只保留这一轮的锁定克数、工具记录和草稿。
 * 格式修复和内容修复各最多一次。
 */
@Service
public class RecommendationAgentLoop {

    private static final int MAX_FORMAT_REPAIRS = 1;
    private static final int MAX_CONTENT_REPAIRS = 1;
    private static final int MAX_MODEL_CALLS = 4;

    private final ModelCompletion model;
    private final ClinicalRecordService records;
    private final PresentationStore presentations;
    private final ObjectMapper mapper = new ObjectMapper();

    public RecommendationAgentLoop(
            ModelCompletion model, ClinicalRecordService records, PresentationStore presentations) {
        this.model = model;
        this.records = records;
        this.presentations = presentations;
    }

    public Result present(CreateRecommendationReq request, MealPlan plan) {
        List<LockedItem> locked = lockedItems(plan);
        LongTermMemory longTerm = longTerm(request.patientId());
        List<String> tools = new ArrayList<>();
        String draft = "";
        int formatRepairs = 0;
        int contentRepairs = 0;
        int calls = 0;
        String repairNote = "";
        boolean fromModel = false;
        while (model != null && calls < MAX_MODEL_CALLS && formatRepairs <= MAX_FORMAT_REPAIRS
                && contentRepairs <= MAX_CONTENT_REPAIRS) {
            calls++;
            String prompt = prompt(longTerm, locked, tools, repairNote);
            String raw = model.complete(prompt).orElse("");
            if (raw.isBlank()) {
                break;
            }
            Parsed parsed = parse(raw);
            if (parsed.tool() != null) {
                if (!ToolCatalog.allowed(parsed.tool())) {
                    contentRepairs++;
                    repairNote = "工具不在白名单，不能修改目标、方案、摄入或用药。";
                    continue;
                }
                tools.add(parsed.tool());
                repairNote = toolResult(parsed.tool(), longTerm, locked);
                continue;
            }
            if (!parsed.valid()) {
                formatRepairs++;
                repairNote = "请只返回 JSON，包含 explanation 和 items。";
                continue;
            }
            if (!sameGrams(locked, parsed.items())) {
                contentRepairs++;
                repairNote = "食材和克数已由求解器锁定，不能改写。";
                continue;
            }
            draft = parsed.explanation();
            fromModel = true;
            break;
        }
        if (!fromModel) {
            draft = deterministic(locked);
        }
        if (presentations != null && request.date() != null) {
            presentations.save(request.patientId(), request.date(), draft, fromModel);
        }
        return new Result(List.of(WorkflowStep.GENERATE_PRESENTATION, WorkflowStep.REVALIDATE_OUTPUT, WorkflowStep.COMPLETE),
                longTerm, tools, draft, fromModel);
    }

    private LongTermMemory longTerm(String patientId) {
        if (records == null || patientId == null) {
            return new LongTermMemory(patientId, List.of(), List.of(), false);
        }
        return new LongTermMemory(
                patientId,
                records.conditionCodes(patientId),
                records.medicationNames(patientId),
                records.latestMeasurementStopsPlanning(patientId));
    }

    private static List<LockedItem> lockedItems(MealPlan plan) {
        List<LockedItem> items = new ArrayList<>();
        for (MealPlan.Dish dish : plan.dishes()) {
            for (MealPlan.IngredientGrams ingredient : dish.ingredients()) {
                items.add(new LockedItem(ingredient.foodItemId(), ingredient.grams()));
            }
        }
        return List.copyOf(items);
    }

    private static String prompt(LongTermMemory memory, List<LockedItem> locked, List<String> tools, String repairNote) {
        return """
                你只生成说明。食材标识和克数已经锁定。
                可以请求的工具只有 read_meal_facts 和 read_long_term_memory。
                不能调用 update_target、confirm_plan、record_intake、change_medication、relax_constraint。
                长期记忆只含结构化病情和用药，没有对话原文。
                返回 JSON：{"explanation":"...","items":[{"foodItemId":"...","grams":"..."}]}
                或 {"tool":"read_meal_facts"}。
                记忆=%s
                锁定克数=%s
                已调用工具=%s
                %s
                """.formatted(memory, locked, tools, repairNote);
    }

    private static String toolResult(String tool, LongTermMemory memory, List<LockedItem> locked) {
        if (ToolCatalog.READ_LONG_TERM_MEMORY.equals(tool)) {
            return memory.toString();
        }
        return locked.toString();
    }

    private Parsed parse(String raw) {
        try {
            JsonNode node = mapper.readTree(raw);
            if (node.hasNonNull("tool")) {
                return Parsed.tool(node.get("tool").asText());
            }
            if (!node.hasNonNull("explanation") || !node.has("items") || !node.get("items").isArray()) {
                return Parsed.invalid();
            }
            List<LockedItem> items = new ArrayList<>();
            for (JsonNode item : node.get("items")) {
                if (!item.hasNonNull("foodItemId") || !item.hasNonNull("grams")) {
                    return Parsed.invalid();
                }
                items.add(new LockedItem(item.get("foodItemId").asText(), new BigDecimal(item.get("grams").asText())));
            }
            return Parsed.explanation(node.get("explanation").asText(), items);
        } catch (Exception error) {
            return Parsed.invalid();
        }
    }

    private static boolean sameGrams(List<LockedItem> locked, List<LockedItem> proposed) {
        if (locked.size() != proposed.size()) {
            return false;
        }
        for (int index = 0; index < locked.size(); index++) {
            LockedItem expected = locked.get(index);
            LockedItem actual = proposed.get(index);
            if (!expected.foodItemId().equals(actual.foodItemId())
                    || expected.grams().compareTo(actual.grams()) != 0) {
                return false;
            }
        }
        return true;
    }

    private static String deterministic(List<LockedItem> locked) {
        StringBuilder text = new StringBuilder("求解器锁定的食材和克数：");
        for (LockedItem item : locked) {
            text.append(item.foodItemId()).append(' ').append(item.grams().toPlainString()).append("克；");
        }
        return text.toString();
    }

    public record LongTermMemory(
            String patientId, List<String> conditionCodes, List<String> medicationNames, boolean measurementStop) {
    }

    public record LockedItem(String foodItemId, BigDecimal grams) {
    }

    public record Result(
            List<WorkflowStep> steps, LongTermMemory longTerm, List<String> toolCalls, String explanation, boolean fromModel) {
    }

    private record Parsed(String tool, String explanation, List<LockedItem> items, boolean valid) {
        static Parsed tool(String name) {
            return new Parsed(name, "", List.of(), false);
        }

        static Parsed invalid() {
            return new Parsed(null, "", List.of(), false);
        }

        static Parsed explanation(String text, List<LockedItem> items) {
            return new Parsed(null, text, List.copyOf(items), true);
        }
    }
}
