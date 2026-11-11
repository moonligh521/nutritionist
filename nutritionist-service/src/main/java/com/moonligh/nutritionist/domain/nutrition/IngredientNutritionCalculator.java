package com.moonligh.nutritionist.domain.nutrition;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

public class IngredientNutritionCalculator {

    private static final BigDecimal ONE_HUNDRED = new BigDecimal("100");

    public List<FoodNutrient> calculate(FoodItem food, BigDecimal grams) {
        if (grams == null || grams.signum() < 0) {
            throw new IllegalArgumentException("grams must be non-negative");
        }
        return food.nutrients().stream()
                .map(nutrient -> scale(nutrient, grams))
                .toList();
    }

    private static FoodNutrient scale(FoodNutrient nutrient, BigDecimal grams) {
        if (nutrient.value() == null) {
            return nutrient;
        }
        BigDecimal scaled = nutrient.value()
                .multiply(grams)
                .divide(ONE_HUNDRED, 6, RoundingMode.HALF_UP)
                .stripTrailingZeros();
        return new FoodNutrient(
                nutrient.type(),
                scaled,
                nutrient.unit(),
                nutrient.quality(),
                nutrient.sourceRef());
    }
}
