package com.moonligh.nutritionist.domain.dialogue;

/** 会话内已荐菜状态（增量换菜状态机）。 */
public enum DishSlotStatus {
    VALID,
    INVALIDATED,
    REPLACEMENT_PENDING,
    REPLACED,
    NO_FEASIBLE_REPLACEMENT
}
