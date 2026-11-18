package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.dialogue.DialoguePhase;
import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.TaskType;

/**
 * 冲突规划：阶段门禁 + 任务优先级整理。
 * 输入已是理解后的任务列表与归一预览。
 */
@Component
public class DialoguePlanner {

    public record PlanContext(
            DialoguePhase phase,
            boolean hasCurrentDishes,
            boolean reRecommend,
            boolean measurementBlocked) {
        public PlanContext {
            phase = phase == null ? DialoguePhase.IDLE : phase;
        }

        public static PlanContext of(
                DialoguePhase phase, boolean hasCurrentDishes, String utterance, boolean measurementBlocked) {
            String text = utterance == null ? "" : utterance;
            boolean reRecommend = text.contains("重新推荐") || text.contains("再推荐一轮") || text.contains("从头推荐");
            return new PlanContext(phase, hasCurrentDishes, reRecommend, measurementBlocked);
        }
    }

    public List<DialogueTask> plan(List<DialogueTask> understood, FoodNormalizer.Result foods) {
        return plan(understood, foods, PlanContext.of(DialoguePhase.IDLE, false, "", false));
    }

    public List<DialogueTask> plan(
            List<DialogueTask> understood, FoodNormalizer.Result foods, PlanContext context) {
        PlanContext ctx = context == null
                ? PlanContext.of(DialoguePhase.IDLE, false, "", false)
                : context;
        List<DialogueTask> source = understood == null ? List.of() : understood;

        if (ctx.measurementBlocked() || ctx.phase() == DialoguePhase.BLOCKED) {
            List<DialogueTask> blocked = new ArrayList<>();
            for (DialogueTask task : source) {
                if (task.type() == TaskType.GREETING || task.type() == TaskType.OUT_OF_SCOPE) {
                    blocked.add(task);
                }
            }
            if (blocked.isEmpty()) {
                blocked.add(DialogueTask.outOfScope("blocked"));
            }
            return blocked;
        }

        if (ctx.phase() == DialoguePhase.CONFIRMING) {
            List<DialogueTask> confirming = new ArrayList<>();
            for (DialogueTask task : source) {
                if (task.type() == TaskType.GREETING
                        || task.type() == TaskType.OUT_OF_SCOPE
                        || task.type() == TaskType.CONFIRM_FOODS) {
                    confirming.add(task);
                }
            }
            if (foods != null && foods.needsConfirm()) {
                confirming.add(DialogueTask.confirmFoods(foods.lowConfidence()));
            }
            if (confirming.stream().noneMatch(t -> t.type() == TaskType.CONFIRM_FOODS)
                    && confirming.stream().noneMatch(t -> t.type() == TaskType.GREETING)) {
                confirming.add(DialogueTask.outOfScope("awaiting_confirm"));
            }
            return dedupeConfirm(confirming);
        }

        List<DialogueTask> ordered = new ArrayList<>();
        for (DialogueTask task : source) {
            if (task.type() == TaskType.GREETING) {
                ordered.add(task);
            }
        }

        boolean softConfirm = foods != null && foods.needsConfirm();
        boolean onlyConfirm = softConfirm && (foods.ids() == null || foods.ids().isEmpty());
        if (softConfirm) {
            ordered.add(DialogueTask.confirmFoods(foods.lowConfidence()));
        }
        for (DialogueTask task : source) {
            if (task.type() == TaskType.OUT_OF_SCOPE) {
                ordered.add(task);
            }
        }
        if (onlyConfirm) {
            return dedupeConfirm(ordered);
        }

        List<DialogueTask> business = new ArrayList<>();
        for (DialogueTask task : source) {
            if (task.type() == TaskType.GREETING
                    || task.type() == TaskType.OUT_OF_SCOPE
                    || task.type() == TaskType.CONFIRM_FOODS) {
                continue;
            }
            business.add(task);
        }
        business = orderBusiness(business, ctx);
        ordered.addAll(business);
        return dedupeConfirm(ordered);
    }

    private static List<DialogueTask> orderBusiness(List<DialogueTask> business, PlanContext ctx) {
        List<DialogueTask> missing = new ArrayList<>();
        List<DialogueTask> substitute = new ArrayList<>();
        List<DialogueTask> replace = new ArrayList<>();
        List<DialogueTask> addKind = new ArrayList<>();
        List<DialogueTask> recommend = new ArrayList<>();
        List<DialogueTask> other = new ArrayList<>();
        for (DialogueTask task : business) {
            switch (task.type()) {
                case MISSING -> missing.add(task);
                case SUBSTITUTE -> substitute.add(task);
                case REPLACE_ONE -> replace.add(task);
                case ADD_KIND -> addKind.add(task);
                case RECOMMEND -> recommend.add(task);
                default -> other.add(task);
            }
        }
        replace = dedupeReplace(replace);

        boolean hasIncremental = !replace.isEmpty() || !addKind.isEmpty() || !missing.isEmpty() || !substitute.isEmpty();
        if (ctx.hasCurrentDishes() && hasIncremental && !ctx.reRecommend()) {
            recommend = List.of();
        }

        List<DialogueTask> out = new ArrayList<>();
        out.addAll(missing);
        out.addAll(substitute);
        out.addAll(replace);
        out.addAll(addKind);
        out.addAll(recommend);
        out.addAll(other);
        return out;
    }

    private static List<DialogueTask> dedupeReplace(List<DialogueTask> replace) {
        Map<String, DialogueTask> byHint = new LinkedHashMap<>();
        for (DialogueTask task : replace) {
            String key = task.dishHint() == null || task.dishHint().isBlank()
                    ? "__default__"
                    : task.dishHint().trim();
            byHint.putIfAbsent(key, task);
        }
        return new ArrayList<>(byHint.values());
    }

    private static List<DialogueTask> dedupeConfirm(List<DialogueTask> tasks) {
        boolean seenConfirm = false;
        List<DialogueTask> out = new ArrayList<>();
        for (DialogueTask task : tasks) {
            if (task.type() == TaskType.CONFIRM_FOODS) {
                if (seenConfirm) {
                    continue;
                }
                seenConfirm = true;
            }
            out.add(task);
        }
        return out;
    }
}
