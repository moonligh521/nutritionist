package com.moonligh.nutritionist.domain.dialogue;

import java.util.List;

/**
 * 可序列化的会话快照（Redis）。不含 Profile 对象。
 */
public record SessionSnapshot(
        String sessionId,
        String patientId,
        LongTermMemory longTerm,
        List<String> foodIds,
        List<String> missing,
        List<FoodCorrection> corrections,
        List<String> excludedDishIds,
        List<DishSlotView> dishSlots,
        String turnHints,
        int revision,
        long preferenceEpoch,
        String phase,
        String lastFocusedDishName,
        String lastEmptyReason,
        List<String> guideActions) {

    public SessionSnapshot {
        foodIds = foodIds == null ? List.of() : List.copyOf(foodIds);
        missing = missing == null ? List.of() : List.copyOf(missing);
        corrections = corrections == null ? List.of() : List.copyOf(corrections);
        excludedDishIds = excludedDishIds == null ? List.of() : List.copyOf(excludedDishIds);
        dishSlots = dishSlots == null ? List.of() : List.copyOf(dishSlots);
        patientId = patientId == null ? "" : patientId;
        turnHints = turnHints == null ? "" : turnHints;
        longTerm = longTerm == null ? LongTermMemory.empty() : longTerm;
        phase = phase == null || phase.isBlank() ? DialoguePhase.IDLE.name() : phase.trim();
        lastFocusedDishName = lastFocusedDishName == null ? "" : lastFocusedDishName;
        lastEmptyReason = lastEmptyReason == null ? "" : lastEmptyReason;
        guideActions = guideActions == null ? List.of() : List.copyOf(guideActions);
    }

    public record DishSlotView(
            String dishId,
            String dishName,
            Integer energy,
            int score,
            String reason,
            String bring,
            String step,
            DishSlotStatus status,
            String replacedFromId) {
    }
}
