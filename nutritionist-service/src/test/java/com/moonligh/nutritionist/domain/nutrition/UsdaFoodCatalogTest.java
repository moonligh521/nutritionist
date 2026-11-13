package com.moonligh.nutritionist.domain.nutrition;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;

import org.junit.jupiter.api.Test;

class UsdaFoodCatalogTest {

    @Test
    void importsEveryGenericUsdaFoodAndKeepsOfficialGaps() {
        assertEquals(8262, UsdaFoodCatalog.all().size());

        FoodItem potato = UsdaFoodCatalog.findHouseholdName("土豆");
        assertEquals("usda-170026", potato.foodItemId());
        assertEquals("Potatoes, flesh and skin, raw", potato.displayName());
        assertEquals(new BigDecimal("77"), amount(potato, NutrientType.ENERGY));
        assertEquals(new BigDecimal("0"), amount(potato, NutrientType.CHOLESTEROL));
        assertEquals(BigDecimal.ZERO, amount(potato, NutrientType.COOKING_OIL));

        FoodItem cloudEar = UsdaFoodCatalog.findHouseholdName("木耳");
        assertEquals("usda-168581", cloudEar.foodItemId());
        assertTrue(cloudEar.nutrients().stream().noneMatch(nutrient -> nutrient.type() == NutrientType.SATURATED_FAT));

        FoodItem babyNapa = UsdaFoodCatalog.findHouseholdName("娃娃菜");
        assertEquals("usda-2727583", babyNapa.foodItemId());
        assertTrue(babyNapa.nutrients().stream().noneMatch(nutrient -> nutrient.type() == NutrientType.ENERGY));

        FoodItem oil = UsdaFoodCatalog.find("usda-171411");
        assertEquals(new BigDecimal("884"), amount(oil, NutrientType.ENERGY));
        assertEquals(new BigDecimal("100"), amount(oil, NutrientType.COOKING_OIL));

        assertEquals(new BigDecimal("130"), amount(UsdaFoodCatalog.find("usda-168878"), NutrientType.ENERGY));
        assertNull(UsdaFoodCatalog.findHouseholdName("挂面"));
        assertNull(UsdaFoodCatalog.findHouseholdName("油麦菜"));
        assertEquals(2, UsdaFoodCatalog.categoryCode("usda-170026"));
        assertEquals("薯类", UsdaFoodCatalog.categoryName(2));
        assertEquals(4, UsdaFoodCatalog.categoryCode("usda-171688"));
        assertEquals("水果", UsdaFoodCatalog.categoryName(4));
        assertEquals(9, UsdaFoodCatalog.categoryCode("usda-175167"));
        assertEquals("水产品", UsdaFoodCatalog.categoryName(9));
        assertEquals(1, UsdaFoodCatalog.categoryCode("usda-168878"));
        assertEquals("主食", UsdaFoodCatalog.categoryName(1));
        assertEquals("羊肉", UsdaFoodCatalog.categoryName(7));
        assertEquals("牛肉", UsdaFoodCatalog.categoryName(6));
        assertEquals(8262L, UsdaFoodCatalog.all().stream().filter(food -> UsdaFoodCatalog.categoryCode(food.foodItemId()) != null).count());
    }

    private static BigDecimal amount(FoodItem food, NutrientType type) {
        return food.nutrients().stream()
                .filter(nutrient -> nutrient.type() == type)
                .map(FoodNutrient::value)
                .findFirst()
                .orElseThrow();
    }
}
