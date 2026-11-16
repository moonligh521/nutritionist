package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.infrastructure.persistence.CatalogMapper;

/** 小程序目录从数据库读取已发布菜谱，并按食材成分表复算热量。 */
@Service
public class CatalogBrowse {

    private static final int ENERGY = 1;
    private static final int PROTEIN = 2;
    private static final int CARBOHYDRATE = 3;
    private static final int FAT = 4;
    private static final int FIBER = 5;
    private static final int SODIUM = 6;
    private static final int OIL = 14;
    private static final int SEASONING = 15;

    private final CatalogMapper catalogMapper;

    public CatalogBrowse(CatalogMapper catalogMapper) {
        this.catalogMapper = catalogMapper;
    }

    public CatalogSnapshot snapshot(String origin) {
        Map<String, FoodRow> foods = new LinkedHashMap<>();
        for (CatalogMapper.FoodRow row : catalogMapper.foodsUsedByPublishedRecipes()) {
            foods.put(row.id(), new FoodRow(row.name(), row.categoryCode(), new LinkedHashMap<>()));
        }
        for (CatalogMapper.NutrientRow row : catalogMapper.nutrientsForPublishedFoods()) {
            FoodRow food = foods.get(row.foodId());
            if (food != null && row.amount() != null) {
                food.amounts.put(row.nutrientCode(), row.amount());
            }
        }
        Map<String, List<CatalogMapper.IngredientRow>> ingredients = new LinkedHashMap<>();
        for (CatalogMapper.IngredientRow row : catalogMapper.publishedIngredients()) {
            ingredients.computeIfAbsent(row.recipeId(), key -> new ArrayList<>()).add(row);
        }
        List<FoodView> foodViews = foods.entrySet().stream()
                .map(entry -> new FoodView(
                        entry.getKey(),
                        entry.getValue().name,
                        image(origin, entry.getKey()),
                        entry.getValue().categoryCode == OIL || entry.getValue().categoryCode == SEASONING))
                .toList();
        List<RecipeView> recipeViews = catalogMapper.publishedRecipes().stream()
                .map(recipe -> toRecipe(recipe, ingredients.getOrDefault(recipe.id(), List.of()), foods, origin))
                .toList();
        return new CatalogSnapshot(foodViews, recipeViews);
    }

    /** 按菜号读取当前已发布版本。草稿不会出现在目录里，所以这里找不到就是未发布。 */
    public Optional<RecipeView> findRecipe(String recipeId, String origin) {
        if (recipeId == null || recipeId.isBlank()) {
            return Optional.empty();
        }
        return snapshot(origin).recipes().stream()
                .filter(recipe -> recipe.id().equals(recipeId))
                .findFirst();
    }

    private static RecipeView toRecipe(
            CatalogMapper.RecipeHead recipe,
            List<CatalogMapper.IngredientRow> rows,
            Map<String, FoodRow> foods,
            String origin) {
        List<IngredientView> ingredients = new ArrayList<>();
        BigDecimal energy = null;
        BigDecimal protein = null;
        BigDecimal carb = null;
        BigDecimal fat = null;
        BigDecimal sodium = null;
        BigDecimal fiber = null;
        boolean fiberKnown = true;
        for (CatalogMapper.IngredientRow row : rows) {
            FoodRow food = foods.get(row.foodId());
            String name = food == null ? row.foodId() : food.name;
            ingredients.add(new IngredientView(row.foodId(), name, row.grams(), image(origin, row.foodId())));
            if (food == null || row.grams() == null) {
                fiberKnown = false;
                continue;
            }
            BigDecimal scale = row.grams().divide(new BigDecimal("100"), 6, RoundingMode.HALF_UP);
            energy = add(energy, scale(food, ENERGY, scale));
            protein = add(protein, scale(food, PROTEIN, scale));
            carb = add(carb, scale(food, CARBOHYDRATE, scale));
            fat = add(fat, scale(food, FAT, scale));
            sodium = add(sodium, scale(food, SODIUM, scale));
            BigDecimal fiberPart = scale(food, FIBER, scale);
            if (fiberPart == null) {
                fiberKnown = false;
            } else {
                fiber = add(fiber, fiberPart);
            }
        }
        return new RecipeView(
                recipe.id(),
                recipe.name(),
                recipe.version(),
                "weight",
                recipe.cookware(),
                recipe.step(),
                ingredients,
                new NutritionView(
                        round(energy, 0),
                        round(protein, 1),
                        round(carb, 1),
                        round(fat, 1),
                        fiberKnown ? round(fiber, 1) : null,
                        round(sodium, 0)));
    }

    private static BigDecimal scale(FoodRow food, int code, BigDecimal scale) {
        BigDecimal amount = food.amounts.get(code);
        return amount == null ? null : amount.multiply(scale);
    }

    private static BigDecimal add(BigDecimal total, BigDecimal part) {
        if (part == null) {
            return total;
        }
        return total == null ? part : total.add(part);
    }

    private static BigDecimal round(BigDecimal value, int scale) {
        return value == null ? null : value.setScale(scale, RoundingMode.HALF_UP);
    }

    private static String image(String origin, String foodId) {
        return origin + "/api/nutrition/catalog/foods/" + foodId + "/image";
    }

    private record FoodRow(String name, int categoryCode, Map<Integer, BigDecimal> amounts) {
    }

    public record CatalogSnapshot(List<FoodView> foods, List<RecipeView> recipes) {
    }

    public record FoodView(String id, String name, String image, boolean seasoning) {
    }

    public record IngredientView(String foodId, String name, BigDecimal grams, String image) {
    }

    public record NutritionView(
            BigDecimal energy,
            BigDecimal protein,
            BigDecimal carb,
            BigDecimal fat,
            BigDecimal fiber,
            BigDecimal sodium) {
    }

    public record RecipeView(
            String id,
            String name,
            /** 当前已发布版本。草稿不会出现在这里。 */
            String version,
            String category,
            String cookware,
            String step,
            List<IngredientView> ingredients,
            NutritionView nutrition) {
    }
}
