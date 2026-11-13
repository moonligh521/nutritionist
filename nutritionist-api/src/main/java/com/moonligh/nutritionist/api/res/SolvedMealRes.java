package com.moonligh.nutritionist.api.res;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

/** 一次无模型配餐已经保存，可按患者和日期再查。 */
public record SolvedMealRes(
        /** 患者标识。 */
        String patientId,
        /** 方案日期。 */
        LocalDate date,
        /** 是否表示当天完整剩余额度。 */
        boolean representsDailyRemainder,
        /** 单餐且没有已发布餐次比例时的说明。全天方案为空。 */
        String scopeNote,
        /** 入选的菜。 */
        List<DishRes> dishes,
        /** 优先使用库存时仍缺少的食材标识。 */
        List<String> missingFoodIds,
        /** 模型生成的说明。克数仍以 dishes 为准。模型未采用时为空。 */
        String explanation) {

    public SolvedMealRes(
            String patientId,
            LocalDate date,
            boolean representsDailyRemainder,
            String scopeNote,
            List<DishRes> dishes) {
        this(patientId, date, representsDailyRemainder, scopeNote, dishes, List.of(), "");
    }

    public SolvedMealRes(
            String patientId,
            LocalDate date,
            boolean representsDailyRemainder,
            String scopeNote,
            List<DishRes> dishes,
            List<String> missingFoodIds) {
        this(patientId, date, representsDailyRemainder, scopeNote, dishes, missingFoodIds, "");
    }

    public SolvedMealRes {
        dishes = dishes == null ? List.of() : List.copyOf(dishes);
        missingFoodIds = missingFoodIds == null ? List.of() : List.copyOf(missingFoodIds);
        explanation = explanation == null ? "" : explanation;
    }

    /** 一道菜的份数、克数和固定步骤。 */
    public record DishRes(
            /** 菜谱标识。 */
            String recipeId,
            /** 份数。1 表示菜谱上的整份。 */
            BigDecimal portions,
            /** 食材克数。 */
            List<IngredientRes> ingredients,
            /** 步骤说明。 */
            List<String> steps) {

        public DishRes {
            ingredients = ingredients == null ? List.of() : List.copyOf(ingredients);
            steps = steps == null ? List.of() : List.copyOf(steps);
        }
    }

    /** 一种食材在本次方案里的克数。 */
    public record IngredientRes(
            /** 食材标识。 */
            String foodItemId,
            /** 克数。 */
            BigDecimal grams) {
    }
}
