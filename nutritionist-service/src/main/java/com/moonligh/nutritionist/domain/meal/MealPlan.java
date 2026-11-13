package com.moonligh.nutritionist.domain.meal;

import java.math.BigDecimal;
import java.util.List;

import com.moonligh.nutritionist.domain.recipe.RecipeStep;

/** 一次无模型配餐结果。克数和步骤都来自已发布菜与求解用量。 */
public record MealPlan(
        /** 入选的菜。用量过小的不列入。 */
        List<Dish> dishes,
        /** 是否表示当天完整剩余额度。单餐且没有已发布餐次比例时为 false。 */
        boolean representsDailyRemainder,
        /** 优先使用库存时，方案里仍缺少的食材。需要另行购买。 */
        List<String> missingFoodIds) {

    public MealPlan(List<Dish> dishes, boolean representsDailyRemainder) {
        this(dishes, representsDailyRemainder, List.of());
    }

    public MealPlan {
        dishes = List.copyOf(dishes);
        missingFoodIds = missingFoodIds == null ? List.of() : List.copyOf(missingFoodIds);
    }

    /** 一道菜在本次方案里的用量。 */
    public record Dish(
            /** 菜谱标识。 */
            String recipeId,
            /** 份数。1 表示菜谱上的整份克数。 */
            BigDecimal portions,
            /** 食材克数。 */
            List<IngredientGrams> ingredients,
            /** 固定步骤。 */
            List<RecipeStep> steps) {

        public Dish {
            ingredients = List.copyOf(ingredients);
            steps = List.copyOf(steps);
        }
    }

    /** 一种食材在本次方案里的克数。 */
    public record IngredientGrams(
            /** 食材标识。 */
            String foodItemId,
            /** 克数。 */
            BigDecimal grams) {
    }
}
