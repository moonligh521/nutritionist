package com.moonligh.nutritionist.infrastructure.persistence;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/** 小程序目录只读已发布菜谱和这些菜用到的食材。 */
@Mapper
public interface CatalogMapper {

    List<FoodRow> foodsUsedByPublishedRecipes();

    List<NutrientRow> nutrientsForPublishedFoods();

    List<RecipeHead> publishedRecipes();

    List<IngredientRow> publishedIngredients();

    int upsertNutrition(
            @Param("recipeId") String recipeId,
            @Param("version") String version,
            @Param("nutrientCode") int nutrientCode,
            @Param("amount") java.math.BigDecimal amount,
            @Param("unitCode") int unitCode,
            @Param("qualityCode") int qualityCode,
            @Param("sourceRef") String sourceRef);

    record FoodRow(String id, String name, int categoryCode) {
    }

    record NutrientRow(String foodId, int nutrientCode, BigDecimal amount) {
    }

    record RecipeHead(String id, String name, String cookware, String step, String version) {
    }

    record IngredientRow(String recipeId, String foodId, BigDecimal grams) {
    }
}
