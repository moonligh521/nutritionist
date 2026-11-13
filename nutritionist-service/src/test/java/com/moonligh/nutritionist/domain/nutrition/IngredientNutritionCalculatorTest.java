package com.moonligh.nutritionist.domain.nutrition;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.math.BigDecimal;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.Test;

class IngredientNutritionCalculatorTest {

    private final IngredientNutritionCalculator calculator = new IngredientNutritionCalculator();
    private final NutritionDataQualityPolicy qualityPolicy = new NutritionDataQualityPolicy("p1");

    @Test
    void unknownNutrientDoesNotBecomeZero() {
        FoodItem food = foodWithUnknownSodium();

        FoodNutrient result = calculator.calculate(food, new BigDecimal("50")).stream()
                .filter(nutrient -> nutrient.type() == NutrientType.SODIUM)
                .findFirst()
                .orElseThrow();

        assertEquals(NutrientQuality.UNKNOWN, result.quality());
        assertNull(result.value());
    }

    @Test
    void sodiumLimitedScenarioRejectsUnknownSodium() {
        var decision = qualityPolicy.evaluate(foodWithUnknownSodium(), Set.of(NutrientType.SODIUM));

        assertEquals(DataQualityDisposition.REJECT, decision.disposition());
        assertEquals(List.of("CRITICAL_NUTRIENT_UNKNOWN:SODIUM"), decision.reasonCodes());
    }

    @Test
    void knownNutrientScalesFromPerHundredGrams() {
        FoodItem food = new FoodItem(
                "food-2",
                "Oats",
                "USDA:FDC-2346396",
                List.of(new FoodNutrient(
                        NutrientType.ENERGY,
                        new BigDecimal("379"),
                        NutrientUnit.KILOCALORIE,
                        NutrientQuality.KNOWN,
                        "USDA:FDC-2346396")));

        FoodNutrient result = calculator.calculate(food, new BigDecimal("50")).getFirst();

        assertEquals(new BigDecimal("189.5"), result.value());
    }

    private static FoodItem foodWithUnknownSodium() {
        return new FoodItem(
                "food-1",
                "Raw chicken breast",
                "USDA:FDC-171077",
                List.of(new FoodNutrient(
                        NutrientType.SODIUM,
                        null,
                        NutrientUnit.MILLIGRAM,
                        NutrientQuality.UNKNOWN,
                        "USDA:FDC-171077")));
    }
}
