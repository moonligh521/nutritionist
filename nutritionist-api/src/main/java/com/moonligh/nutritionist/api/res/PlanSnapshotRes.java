package com.moonligh.nutritionist.api.res;

import java.util.List;

public record PlanSnapshotRes(
        String planId,
        String planVersion,
        String patientId,
        Integer statusCode,
        List<MealSlotRes> meals) {

    public PlanSnapshotRes {
        meals = meals == null ? List.of() : List.copyOf(meals);
    }

    public record MealSlotRes(String mealId, boolean eaten, String foodItemId, int energyKcal) {
    }
}
