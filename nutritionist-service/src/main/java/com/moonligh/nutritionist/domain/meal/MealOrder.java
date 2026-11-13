package com.moonligh.nutritionist.domain.meal;

import java.math.BigDecimal;
import java.util.List;

import com.moonligh.nutritionist.domain.solver.SolverConstraint;

/** 一次配餐要遵守的范围、库存和已经吃掉的量。 */
public record MealOrder(
        /** 病种和专业目标约束。 */
        List<SolverConstraint> constraints,
        /** 本餐占全天能量的百分比。全天为 100。 */
        int mealSharePercent,
        /** 库存可用克数。 */
        List<Stock> stocks,
        /** true 表示只能使用库存食材。 */
        boolean onlyAvailable,
        /** 已经记入的摄入。 */
        List<Eaten> eaten,
        /** 因病种排除的食材标识。 */
        List<String> excludedFoodIds,
        /** true 表示优先使用库存。库存单独无解时才加入库存外食材，并列入缺货。 */
        boolean preferAvailable,
        /** 糖尿病时降低优先级的高升糖食材。不禁止使用。 */
        List<String> deprioritizedFoodIds) {

    public MealOrder(
            List<SolverConstraint> constraints,
            int mealSharePercent,
            List<Stock> stocks,
            boolean onlyAvailable,
            List<Eaten> eaten,
            List<String> excludedFoodIds,
            boolean preferAvailable) {
        this(constraints, mealSharePercent, stocks, onlyAvailable, eaten, excludedFoodIds, preferAvailable, List.of());
    }

    public MealOrder(
            List<SolverConstraint> constraints,
            int mealSharePercent,
            List<Stock> stocks,
            boolean onlyAvailable,
            List<Eaten> eaten,
            List<String> excludedFoodIds) {
        this(constraints, mealSharePercent, stocks, onlyAvailable, eaten, excludedFoodIds, false);
    }

    public MealOrder {
        constraints = List.copyOf(constraints);
        stocks = stocks == null ? List.of() : List.copyOf(stocks);
        eaten = eaten == null ? List.of() : List.copyOf(eaten);
        excludedFoodIds = excludedFoodIds == null ? List.of() : List.copyOf(excludedFoodIds);
        deprioritizedFoodIds = deprioritizedFoodIds == null ? List.of() : List.copyOf(deprioritizedFoodIds);
    }

    /** 库存里一种食材还能用的克数。 */
    public record Stock(String foodItemId, BigDecimal availableGrams) {
    }

    /** 已经吃掉的一种食材克数。 */
    public record Eaten(String foodItemId, BigDecimal grams) {
    }
}
