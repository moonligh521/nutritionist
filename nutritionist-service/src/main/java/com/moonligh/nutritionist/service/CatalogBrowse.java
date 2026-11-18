package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.Duration;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.nutrition.FoodNutrientProfile;
import com.moonligh.nutritionist.domain.nutrition.FoodNutrientTable;
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
    private static final long SNAPSHOT_TTL_MS = Duration.ofMinutes(5).toMillis();

    private final CatalogMapper catalogMapper;
    private final Object snapshotLock = new Object();
    private volatile CachedCore cached;

    public CatalogBrowse(CatalogMapper catalogMapper) {
        this.catalogMapper = catalogMapper;
    }

    /** 检索/归一化用：不含请求 host，避免与目录 API 抢缓存。 */
    public CatalogSnapshot coreSnapshot() {
        return core().snapshot();
    }

    public void invalidate() {
        synchronized (snapshotLock) {
            cached = null;
        }
    }

    public CatalogSnapshot snapshot(String origin) {
        CatalogSnapshot core = coreSnapshot();
        String key = origin == null ? "" : origin;
        if (key.isBlank()) {
            return core;
        }
        return withOrigin(core, key);
    }

    private CachedCore core() {
        long now = System.currentTimeMillis();
        CachedCore hit = cached;
        if (hit != null && now - hit.loadedAtMs() < SNAPSHOT_TTL_MS) {
            return hit;
        }
        synchronized (snapshotLock) {
            hit = cached;
            now = System.currentTimeMillis();
            if (hit != null && now - hit.loadedAtMs() < SNAPSHOT_TTL_MS) {
                return hit;
            }
            CatalogSnapshot loaded = loadSnapshot("");
            cached = new CachedCore(loaded, now);
            return cached;
        }
    }

    private static CatalogSnapshot withOrigin(CatalogSnapshot core, String origin) {
        List<FoodView> foods = core.foods().stream()
                .map(food -> new FoodView(food.id(), food.name(), image(origin, food.id()), food.seasoning()))
                .toList();
        List<RecipeView> recipes = core.recipes().stream()
                .map(recipe -> new RecipeView(
                        recipe.id(),
                        recipe.name(),
                        recipe.version(),
                        recipe.category(),
                        recipe.cookware(),
                        recipe.step(),
                        recipe.ingredients().stream()
                                .map(item -> new IngredientView(
                                        item.foodId(), item.name(), item.grams(), image(origin, item.foodId())))
                                .toList(),
                        recipe.nutrition()))
                .toList();
        return new CatalogSnapshot(foods, recipes);
    }

    private CatalogSnapshot loadSnapshot(String origin) {
        FoodNutrientTable foods = new FoodNutrientTable();
        for (CatalogMapper.FoodRow row : catalogMapper.foodsUsedByPublishedRecipes()) {
            foods.put(row.id(), new FoodNutrientProfile(row.name(), row.categoryCode(), List.of()));
        }
        for (CatalogMapper.NutrientRow row : catalogMapper.nutrientsForPublishedFoods()) {
            foods.find(row.foodId()).ifPresent(food -> food.put(row.nutrientCode(), row.amount()));
        }
        RecipeIngredientIndex ingredients = new RecipeIngredientIndex();
        for (CatalogMapper.IngredientRow row : catalogMapper.publishedIngredients()) {
            ingredients.add(row);
        }
        List<FoodView> foodViews = foods.entries().stream()
                .map(entry -> new FoodView(
                        entry.foodId(),
                        entry.profile().name(),
                        image(origin, entry.foodId()),
                        entry.profile().categoryCode() == OIL || entry.profile().categoryCode() == SEASONING))
                .toList();
        List<RecipeView> recipeViews = catalogMapper.publishedRecipes().stream()
                .map(recipe -> toRecipe(recipe, ingredients.of(recipe.id()), foods, origin))
                .toList();
        return new CatalogSnapshot(foodViews, recipeViews);
    }

    /** 按菜号读取当前已发布版本。草稿不会出现在目录里，所以这里找不到就是未发布。 */
    public Optional<RecipeView> findRecipe(String recipeId, String origin) {
        if (recipeId == null || recipeId.isBlank()) {
            return Optional.empty();
        }
        return snapshot(origin).recipe(recipeId);
    }

    private static RecipeView toRecipe(
            CatalogMapper.RecipeHead recipe,
            List<CatalogMapper.IngredientRow> rows,
            FoodNutrientTable foods,
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
            Optional<FoodNutrientProfile> foodOpt = foods.find(row.foodId());
            String name = foodOpt.map(FoodNutrientProfile::name).orElse(row.foodId());
            ingredients.add(new IngredientView(row.foodId(), name, row.grams(), image(origin, row.foodId())));
            if (foodOpt.isEmpty() || row.grams() == null) {
                fiberKnown = false;
                continue;
            }
            FoodNutrientProfile food = foodOpt.get();
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

    private static BigDecimal scale(FoodNutrientProfile food, int code, BigDecimal scale) {
        BigDecimal amount = food.amountOf(code);
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

    /** 菜谱 → 用料行。 */
    private static final class RecipeIngredientIndex {
        private final Map<String, List<CatalogMapper.IngredientRow>> byRecipe = new LinkedHashMap<>();

        void add(CatalogMapper.IngredientRow row) {
            if (row == null || row.recipeId() == null) {
                return;
            }
            byRecipe.computeIfAbsent(row.recipeId(), key -> new ArrayList<>()).add(row);
        }

        List<CatalogMapper.IngredientRow> of(String recipeId) {
            List<CatalogMapper.IngredientRow> rows = byRecipe.get(recipeId);
            return rows == null ? List.of() : List.copyOf(rows);
        }
    }

    private record CachedCore(CatalogSnapshot snapshot, long loadedAtMs) {
    }

    public record CatalogSnapshot(
            List<FoodView> foods,
            List<RecipeView> recipes,
            Map<String, RecipeView> recipeById) {

        public CatalogSnapshot(List<FoodView> foods, List<RecipeView> recipes) {
            this(foods, recipes, indexRecipes(recipes));
        }

        public CatalogSnapshot {
            foods = foods == null ? List.of() : List.copyOf(foods);
            recipes = recipes == null ? List.of() : List.copyOf(recipes);
            recipeById = recipeById == null ? indexRecipes(recipes) : Map.copyOf(recipeById);
        }

        /** O(1) 按菜号取已发布菜谱。 */
        public Optional<RecipeView> recipe(String recipeId) {
            if (recipeId == null || recipeId.isBlank()) {
                return Optional.empty();
            }
            return Optional.ofNullable(recipeById.get(recipeId));
        }

        private static Map<String, RecipeView> indexRecipes(List<RecipeView> recipes) {
            if (recipes == null || recipes.isEmpty()) {
                return Map.of();
            }
            Map<String, RecipeView> map = new LinkedHashMap<>();
            for (RecipeView recipe : recipes) {
                if (recipe != null && recipe.id() != null && !recipe.id().isBlank()) {
                    map.putIfAbsent(recipe.id(), recipe);
                }
            }
            return map;
        }
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
