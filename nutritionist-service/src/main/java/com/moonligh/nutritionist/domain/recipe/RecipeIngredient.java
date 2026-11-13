package com.moonligh.nutritionist.domain.recipe;

import java.math.BigDecimal;

/** 菜谱里的一种配料。 */
public record RecipeIngredient(
        /** 食材标识。 */
        String foodItemId,
        /** 用量。 */
        BigDecimal quantity,
        /** 用量单位代码。 */
        int unitCode) {
}
