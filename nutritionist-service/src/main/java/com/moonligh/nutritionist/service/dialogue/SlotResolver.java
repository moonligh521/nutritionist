package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.IntentAmbiguity;
import com.moonligh.nutritionist.domain.dialogue.TaskType;
import com.moonligh.nutritionist.domain.dialogue.TurnIntent;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext.DishRef;

/** 序数/指代 → dishHint；无法唯一确定则 ambiguities。 */
@Component
public class SlotResolver {

    public TurnIntent resolve(TurnIntent intent, UnderstandContext context, List<Integer> dishIndexes) {
        if (intent == null) {
            return TurnIntent.ofTasks(List.of());
        }
        UnderstandContext ctx = context == null
                ? UnderstandContext.of("", List.of(), null)
                : context;
        List<Integer> indexes = dishIndexes == null ? List.of() : dishIndexes;
        List<DialogueTask> out = new ArrayList<>();
        List<IntentAmbiguity> ambiguities = new ArrayList<>(intent.ambiguities());
        for (int i = 0; i < intent.tasks().size(); i++) {
            DialogueTask task = intent.tasks().get(i);
            int dishIndex = i < indexes.size() && indexes.get(i) != null ? indexes.get(i) : 0;
            if (task.type() != TaskType.REPLACE_ONE) {
                out.add(task);
                continue;
            }
            ResolvedReplace resolved = resolveReplace(task, dishIndex, ctx);
            if (resolved.ambiguity() != null) {
                ambiguities.add(resolved.ambiguity());
                continue;
            }
            out.add(resolved.task());
        }
        return new TurnIntent(out, intent.constraints(), intent.memoryQueries(), ambiguities, intent.degraded());
    }

    private static ResolvedReplace resolveReplace(DialogueTask task, int dishIndex, UnderstandContext ctx) {
        List<DishRef> dishes = ctx.currentDishes();
        if (dishIndex >= 1 && dishIndex <= dishes.size()) {
            DishRef ref = dishes.get(dishIndex - 1);
            return new ResolvedReplace(DialogueTask.replaceOne(ref.name()), null);
        }
        String hint = task.dishHint() == null ? "" : task.dishHint().trim();
        if (!hint.isBlank()) {
            List<DishRef> hits = dishes.stream()
                    .filter(d -> d.name().contains(hint) || hint.contains(d.name()))
                    .toList();
            if (hits.size() == 1) {
                return new ResolvedReplace(DialogueTask.replaceOne(hits.getFirst().name()), null);
            }
            if (hits.size() > 1) {
                return new ResolvedReplace(null, dishAmbiguity(hits, "要换哪一道？"));
            }
            // 原文明确菜名但不在当前列表：保留 hint 交给执行层
            return new ResolvedReplace(DialogueTask.replaceOne(hint), null);
        }
        if (dishes.size() == 1) {
            return new ResolvedReplace(DialogueTask.replaceOne(dishes.getFirst().name()), null);
        }
        String focused = ctx.lastFocusedDishName();
        if (!focused.isBlank()) {
            return new ResolvedReplace(DialogueTask.replaceOne(focused), null);
        }
        if (dishes.isEmpty()) {
            return new ResolvedReplace(DialogueTask.replaceOne(""), null);
        }
        // 「换一个」无菜名：默认槽位 0（第一道），不追问
        return new ResolvedReplace(DialogueTask.replaceOne(dishes.getFirst().name()), null);
    }

    private static IntentAmbiguity dishAmbiguity(List<DishRef> dishes, String ask) {
        List<String> names = dishes.stream().map(DishRef::name).toList();
        return new IntentAmbiguity("DISH_REF", names, ask);
    }

    private record ResolvedReplace(DialogueTask task, IntentAmbiguity ambiguity) {
    }
}
