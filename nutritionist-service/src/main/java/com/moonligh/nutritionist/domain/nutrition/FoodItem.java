package com.moonligh.nutritionist.domain.nutrition;

import java.util.List;

public record FoodItem(
        String foodItemId,
        String displayName,
        String sourceRef,
        List<FoodNutrient> nutrients) {

    public FoodItem {
        nutrients = List.copyOf(nutrients);
    }
}
