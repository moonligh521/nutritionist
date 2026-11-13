package com.moonligh.nutritionist.domain.nutrition;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * USDA FoodData Central 的通用食材。SR Legacy 2018-04 的全部 sr_legacy_food，
 * 以及 Foundation Foods 2026-04-30 的全部 foundation_food。数据属美国政府作品，公共领域。
 * 只收录营养素 1008 能量（千卡）和蛋白质、碳水、脂肪、纤维、钠、钾、磷、胆固醇、饱和脂肪。
 * 官方表里没有的数值留空，不写成 0。样品、品牌包装食品不在这里。
 */
public final class UsdaFoodCatalog {

    private static final List<FoodItem> FOODS = loadFoods();
    private static final Map<String, FoodItem> BY_ID = indexById();
    private static final Map<String, FoodItem> BY_HOUSEHOLD_NAME = loadHouseholdNames();
    private static final Map<String, Integer> CATEGORY_BY_FOOD = loadCategoryByFood();
    private static final Map<Integer, String> CATEGORY_NAMES = loadCategoryNames();

    private UsdaFoodCatalog() {
    }

    public static List<FoodItem> all() {
        return FOODS;
    }

    public static FoodItem find(String foodItemId) {
        return BY_ID.get(foodItemId);
    }

    /** 家常叫法只做精确对应，不对英文描述做包含匹配。 */
    public static FoodItem findHouseholdName(String name) {
        return name == null ? null : BY_HOUSEHOLD_NAME.get(name);
    }

    /** 中国配餐分类编号。没有分到类时为空。 */
    public static Integer categoryCode(String foodItemId) {
        return CATEGORY_BY_FOOD.get(foodItemId);
    }

    /** 中国配餐分类名。未知编号返回空。 */
    public static String categoryName(Integer categoryCode) {
        return categoryCode == null ? null : CATEGORY_NAMES.get(categoryCode);
    }

    private static List<FoodItem> loadFoods() {
        List<FoodItem> foods = new ArrayList<>();
        for (String[] row : rows("/food/usda-fdc.tsv")) {
            foods.add(food(row));
        }
        return List.copyOf(foods);
    }

    private static Map<String, FoodItem> indexById() {
        Map<String, FoodItem> byId = new LinkedHashMap<>();
        for (FoodItem food : FOODS) {
            byId.put(food.foodItemId(), food);
        }
        return Map.copyOf(byId);
    }

    private static Map<String, Integer> loadCategoryByFood() {
        Map<String, Integer> categories = new LinkedHashMap<>();
        for (String[] row : rows("/food/usda-category.tsv")) {
            categories.put("usda-" + row[0], Integer.valueOf(row[1]));
        }
        return Map.copyOf(categories);
    }

    private static Map<Integer, String> loadCategoryNames() {
        Map<Integer, String> names = new LinkedHashMap<>();
        for (String[] row : rows("/food/food-category.tsv")) {
            names.put(Integer.valueOf(row[0]), row[1]);
        }
        return Map.copyOf(names);
    }

    private static Map<String, FoodItem> loadHouseholdNames() {
        Map<String, FoodItem> names = new LinkedHashMap<>();
        for (String[] row : rows("/food/household-name.tsv")) {
            FoodItem food = BY_ID.get("usda-" + row[1]);
            if (food == null || !food.displayName().equals(row[2])) {
                throw new IllegalStateException("household name " + row[0]);
            }
            names.put(row[0], food);
        }
        return Map.copyOf(names);
    }

    private static FoodItem food(String[] row) {
        String fdcId = row[0];
        String dataset = row[1];
        String description = row[2];
        String source = source(dataset, fdcId);
        List<FoodNutrient> nutrients = new ArrayList<>();
        add(nutrients, NutrientType.ENERGY, row[3], NutrientUnit.KILOCALORIE, source);
        add(nutrients, NutrientType.PROTEIN, row[4], NutrientUnit.GRAM, source);
        add(nutrients, NutrientType.CARBOHYDRATE, row[5], NutrientUnit.GRAM, source);
        add(nutrients, NutrientType.FAT, row[6], NutrientUnit.GRAM, source);
        add(nutrients, NutrientType.FIBER, row[7], NutrientUnit.GRAM, source);
        add(nutrients, NutrientType.SODIUM, row[8], NutrientUnit.MILLIGRAM, source);
        add(nutrients, NutrientType.POTASSIUM, row[9], NutrientUnit.MILLIGRAM, source);
        add(nutrients, NutrientType.PHOSPHORUS, row[10], NutrientUnit.MILLIGRAM, source);
        add(nutrients, NutrientType.CHOLESTEROL, row[11], NutrientUnit.MILLIGRAM, source);
        add(nutrients, NutrientType.SATURATED_FAT, row[12], NutrientUnit.GRAM, source);
        nutrients.add(cookingOil(description, nutrients));
        return new FoodItem("usda-" + fdcId, description, source, nutrients);
    }

    private static String source(String dataset, String fdcId) {
        String release = switch (dataset) {
            case "sr-legacy-2018-04" -> "SR Legacy 2018-04";
            case "foundation-2026-04-30" -> "Foundation Foods 2026-04-30";
            default -> throw new IllegalStateException(dataset);
        };
        return "USDA FoodData Central " + release + " FDC " + fdcId;
    }

    private static void add(
            List<FoodNutrient> nutrients,
            NutrientType type,
            String amount,
            NutrientUnit unit,
            String source) {
        if (amount == null || amount.isBlank()) {
            return;
        }
        nutrients.add(new FoodNutrient(type, new BigDecimal(amount), unit, NutrientQuality.KNOWN, source));
    }

    /** 脂肪正好 100 克且名称以 Oil 开头的，每 100 克记 100 克烹调油。其余记已知 0。 */
    private static FoodNutrient cookingOil(String description, List<FoodNutrient> nutrients) {
        BigDecimal fat = nutrients.stream()
                .filter(nutrient -> nutrient.type() == NutrientType.FAT)
                .map(FoodNutrient::value)
                .findFirst()
                .orElse(null);
        boolean pureOil = description.startsWith("Oil,") && fat != null && fat.compareTo(new BigDecimal("100")) == 0;
        return new FoodNutrient(
                NutrientType.COOKING_OIL,
                pureOil ? new BigDecimal("100") : BigDecimal.ZERO,
                NutrientUnit.GRAM,
                NutrientQuality.KNOWN,
                "烹调油按食材本身计");
    }

    private static List<String[]> rows(String resource) {
        List<String[]> rows = new ArrayList<>();
        var stream = UsdaFoodCatalog.class.getResourceAsStream(resource);
        if (stream == null) {
            throw new IllegalStateException(resource);
        }
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(stream, StandardCharsets.UTF_8))) {
            reader.readLine();
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.isBlank()) {
                    rows.add(line.split("\t", -1));
                }
            }
        } catch (IOException error) {
            throw new IllegalStateException(resource, error);
        }
        return rows;
    }
}
