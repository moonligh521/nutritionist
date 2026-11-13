package com.moonligh.nutritionist.domain.target;

import java.util.List;

public interface MealBudgetAllocator {

    MealBudgetAllocation allocate(TargetCalculationResult target);

    /** 使用调用方确认的餐次结构。各餐百分比之和必须是 100。 */
    MealBudgetAllocation allocate(TargetCalculationResult target, List<MealBudgetAllocation.MealShare> confirmed);

    record MealBudgetAllocation(String targetReference, List<MealShare> meals) {
        public MealBudgetAllocation {
            meals = meals == null ? List.of() : List.copyOf(meals);
        }

        public record MealShare(int mealTypeCode, int percent) {
        }
    }
}
