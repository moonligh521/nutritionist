package com.moonligh.nutritionist.domain.recipe;

import java.math.BigDecimal;
import java.util.List;

import com.moonligh.nutritionist.domain.nutrition.StapleFoods;

/**
 * 第一批已发布菜。一份就是下面的克数，步骤固定，不由模型改写。
 */
public final class StapleRecipes {

    public static final Recipe RICE = recipe(
            "staple-rice",
            StapleFoods.COOKED_RICE.foodItemId(),
            "150",
            "把米饭盛入碗中，不再加盐。");

    public static final Recipe CHICKEN = recipe(
            "staple-chicken",
            StapleFoods.ROASTED_CHICKEN_BREAST.foodItemId(),
            "100",
            "鸡胸肉烤熟后切块，不再加盐。");

    public static final Recipe SPINACH = recipe(
            "staple-spinach",
            StapleFoods.BOILED_SPINACH.foodItemId(),
            "100",
            "菠菜煮熟沥干，不再加盐。");

    public static final Recipe OIL = recipe(
            "staple-oil",
            StapleFoods.SOYBEAN_OIL.foodItemId(),
            "10",
            "按克数加入大豆油，不再加盐。");

    public static final Recipe TOFU = recipe(
            "staple-tofu",
            StapleFoods.FIRM_TOFU.foodItemId(),
            "100",
            "豆腐切块煮熟，不再加盐。");

    public static final Recipe EGG = recipe(
            "staple-egg",
            StapleFoods.WHOLE_EGG.foodItemId(),
            "50",
            "鸡蛋煮熟，不再加盐。");

    public static final Recipe SALMON = recipe(
            "staple-salmon",
            StapleFoods.ATLANTIC_SALMON.foodItemId(),
            "100",
            "鲑鱼煮熟，不再加盐。");

    public static final Recipe APPLE = recipe(
            "staple-apple",
            StapleFoods.RAW_APPLE.foodItemId(),
            "100",
            "苹果洗净后食用，不再加盐。");

    public static final Recipe OATS = recipe(
            "staple-oats",
            StapleFoods.DRY_OATS.foodItemId(),
            "40",
            "燕麦片煮熟，不再加盐。");

    public static final Recipe LENTILS = recipe(
            "staple-lentils",
            StapleFoods.COOKED_LENTILS.foodItemId(),
            "180",
            "扁豆煮熟沥干，不再加盐。");

    private StapleRecipes() {
    }

    public static List<Recipe> published() {
        return List.of(RICE, CHICKEN, SPINACH, OIL, TOFU, EGG, SALMON, APPLE, OATS, LENTILS);
    }

    private static Recipe recipe(String id, String foodId, String grams, String step) {
        String cookware = "staple-rice".equals(id) || "staple-apple".equals(id) ? "碗" : "锅";
        return new Recipe(
                id,
                "1",
                RecipeStatus.PUBLISHED,
                List.of(new RecipeIngredient(foodId, new BigDecimal(grams), 1)),
                List.of(new RecipeStep(1, step)),
                cookware);
    }
}
