package com.moonligh.nutritionist.domain.nutrition;

import java.math.BigDecimal;

public record FoodNutrient(
        NutrientType type,
        BigDecimal value,
        NutrientUnit unit,
        NutrientQuality quality,
        String sourceRef) {

    public FoodNutrient {
        if (quality == NutrientQuality.UNKNOWN && value != null) {
            throw new IllegalArgumentException("UNKNOWN nutrient must not carry a numeric value");
        }
        if ((quality == NutrientQuality.KNOWN || quality == NutrientQuality.ESTIMATED) && value == null) {
            throw new IllegalArgumentException("Known nutrient requires a numeric value");
        }
    }
}
