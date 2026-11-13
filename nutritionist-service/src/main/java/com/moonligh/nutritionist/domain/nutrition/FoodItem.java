package com.moonligh.nutritionist.domain.nutrition;

import java.util.List;

/** 一种食材，以及它每 100 克含有的营养。 */
public record FoodItem(
        /** 食材标识。 */
        String foodItemId,
        /** 展示名称。 */
        String displayName,
        /** 数据来源，如 USDA。 */
        String sourceRef,
        /** 营养素列表。 */
        List<FoodNutrient> nutrients) {

    public FoodItem {
        nutrients = List.copyOf(nutrients);
    }
}
