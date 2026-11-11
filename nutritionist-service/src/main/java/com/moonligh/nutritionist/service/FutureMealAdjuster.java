package com.moonligh.nutritionist.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.api.res.PlanSnapshotRes;

@Service
public class FutureMealAdjuster {

    public List<PlanSnapshotRes.MealSlotRes> adjust(
            List<PlanSnapshotRes.MealSlotRes> meals,
            OutcomeEvaluator.Decision decision,
            int deficitDeltaKcal) {
        if (decision != OutcomeEvaluator.Decision.ADJUST_FUTURE_MEALS || deficitDeltaKcal == 0) {
            return List.copyOf(meals);
        }
        return meals.stream()
                .map(meal -> meal.eaten()
                        ? meal
                        : new PlanSnapshotRes.MealSlotRes(
                                meal.mealId(), false, meal.foodItemId(), meal.energyKcal() - deficitDeltaKcal))
                .toList();
    }
}