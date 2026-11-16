package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.math.RoundingMode;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.nutrition.FoodItem;
import com.moonligh.nutritionist.domain.nutrition.NutrientQuality;
import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.nutrition.NutrientUnit;
import com.moonligh.nutritionist.domain.nutrition.WeightLossFoods;
import com.moonligh.nutritionist.domain.recipe.Recipe;
import com.moonligh.nutritionist.domain.recipe.WeightLossRecipes;
import com.moonligh.nutritionist.infrastructure.persistence.CatalogMapper;

/** 已发布减重菜的营养由配料复算后写入结果表。缺项留空，不当成 0。 */
@Component
public class PublishedNutritionWriter implements ApplicationRunner {

    private static final String SOURCE = "java:weight-loss-food-nutrient";
    private static final NutrientType[] TYPES = {
            NutrientType.ENERGY,
            NutrientType.PROTEIN,
            NutrientType.CARBOHYDRATE,
            NutrientType.FAT,
            NutrientType.FIBER,
            NutrientType.SODIUM
    };

    private final CatalogMapper catalogMapper;

    public PublishedNutritionWriter(CatalogMapper catalogMapper) {
        this.catalogMapper = catalogMapper;
    }

    @Override
    public void run(ApplicationArguments args) {
        for (Recipe recipe : WeightLossRecipes.published()) {
            for (NutrientType type : TYPES) {
                BigDecimal total = BigDecimal.ZERO;
                boolean known = true;
                for (var ingredient : recipe.ingredients()) {
                    FoodItem food = WeightLossFoods.find(ingredient.foodItemId());
                    BigDecimal per100 = food == null ? null : food.nutrients().stream()
                            .filter(nutrient -> nutrient.type() == type)
                            .map(nutrient -> nutrient.value())
                            .filter(value -> value != null)
                            .findFirst()
                            .orElse(null);
                    if (per100 == null || ingredient.quantity() == null) {
                        known = false;
                        break;
                    }
                    total = total.add(per100.multiply(ingredient.quantity())
                            .divide(new BigDecimal("100"), 6, RoundingMode.HALF_UP));
                }
                int scale = type == NutrientType.ENERGY || type == NutrientType.SODIUM ? 0 : 1;
                catalogMapper.upsertNutrition(
                        recipe.recipeId(),
                        recipe.version(),
                        type.code(),
                        known ? total.setScale(scale, RoundingMode.HALF_UP) : null,
                        unit(type).code(),
                        (known ? NutrientQuality.KNOWN : NutrientQuality.UNKNOWN).code(),
                        SOURCE);
            }
        }
    }

    private static NutrientUnit unit(NutrientType type) {
        if (type == NutrientType.ENERGY) {
            return NutrientUnit.KILOCALORIE;
        }
        if (type == NutrientType.SODIUM) {
            return NutrientUnit.MILLIGRAM;
        }
        return NutrientUnit.GRAM;
    }
}
