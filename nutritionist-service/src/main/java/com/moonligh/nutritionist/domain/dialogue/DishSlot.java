package com.moonligh.nutritionist.domain.dialogue;

import com.moonligh.nutritionist.service.DishRecommendService.Suggestion;

/** 会话里的一道荐菜槽位。 */
public record DishSlot(Suggestion dish, DishSlotStatus status, String replacedFromId) {

    public DishSlot {
        status = status == null ? DishSlotStatus.VALID : status;
        replacedFromId = replacedFromId == null ? "" : replacedFromId;
    }

    public static DishSlot valid(Suggestion dish) {
        return new DishSlot(dish, DishSlotStatus.VALID, "");
    }

    public boolean countable() {
        return status == DishSlotStatus.VALID || status == DishSlotStatus.REPLACED;
    }

    public DishSlot pending() {
        return new DishSlot(dish, DishSlotStatus.REPLACEMENT_PENDING, replacedFromId);
    }

    public DishSlot invalidated() {
        return new DishSlot(dish, DishSlotStatus.INVALIDATED, replacedFromId);
    }

    public DishSlot replacedBy(Suggestion next) {
        return new DishSlot(next, DishSlotStatus.REPLACED, dish == null ? "" : dish.id());
    }

    public DishSlot noFeasible() {
        return new DishSlot(dish, DishSlotStatus.NO_FEASIBLE_REPLACEMENT, replacedFromId);
    }
}
