package com.moonligh.nutritionist.domain.recipe;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * 减重首批已发布菜谱（内存夹具）。
 * id 与空库执行 V39 后的 {@code recipe.id} 顺序一致：1..17。
 * 番茄用食材 138 西红柿。油、盐、生抽写在配料里。
 */
public final class WeightLossRecipes {

    public static final String RICE_BOWL = "1";
    public static final String OAT_MILK = "2";
    public static final String BREAD_MILK = "3";
    public static final String NOODLE_PLAIN = "4";
    public static final String CHICKEN_BROCCOLI = "5";
    public static final String TOFU_CABBAGE = "6";
    public static final String EGG_TOMATO = "7";
    public static final String SHRIMP_CUCUMBER = "8";
    public static final String GRASS_CARP_STEAM = "9";
    public static final String PORK_CARROT = "10";
    public static final String SPINACH_BLANCH = "11";
    public static final String BROCCOLI_BLANCH = "12";
    public static final String OATS_WATER = "13";
    public static final String APPLE = "14";
    public static final String BANANA = "15";
    public static final String YOGURT = "16";
    public static final String BOILED_EGG = "17";

    private WeightLossRecipes() {
    }

    public static List<Recipe> published() {
        return List.of(
                dish(RICE_BOWL, "碗", "大米按生重下锅煮熟，盛入碗中。", "1", "60"),
                dish(OAT_MILK, "锅", "燕麦片和牛奶一起煮开，不再另加糖。", "54", "40", "590", "200"),
                dish(BREAD_MILK, "碗", "全麦面包配牛奶，不再另加糖。", "42", "60", "590", "200"),
                dish(NOODLE_PLAIN, "锅", "面条煮熟，加入食盐 1 克。", "28", "80", "668", "1"),
                dish(CHICKEN_BROCCOLI, "锅",
                        "西兰花掰小朵，大葱切段。锅中放菜籽油 8 克，放入鸡胸肉和葱段翻炒，再加西兰花和食盐 1 克炒熟。",
                        "405", "100", "93", "150", "654", "8", "668", "1", "186", "10"),
                dish(TOFU_CABBAGE, "锅",
                        "北豆腐切块，小白菜洗净。锅中放菜籽油 8 克，放入豆腐、小白菜、大蒜 5 克和生抽 8 克烧熟。",
                        "606", "120", "78", "150", "654", "8", "672", "8", "191", "5"),
                dish(EGG_TOMATO, "锅",
                        "西红柿切块，鸡蛋打散。锅中放菜籽油 8 克，先炒鸡蛋，再加西红柿和食盐 1 克炒熟。",
                        "580", "100", "138", "200", "654", "8", "668", "1"),
                dish(SHRIMP_CUCUMBER, "锅",
                        "黄瓜切片。锅中放菜籽油 6 克，放入虾仁、黄瓜、生姜 5 克和食盐 1 克炒熟。",
                        "904", "80", "154", "150", "654", "6", "668", "1", "198", "5"),
                dish(GRASS_CARP_STEAM, "锅",
                        "草鱼段放上大葱 15 克和生姜 5 克，蒸熟后淋生抽 8 克。",
                        "449", "120", "186", "15", "198", "5", "672", "8"),
                dish(PORK_CARROT, "锅",
                        "胡萝卜切片。锅中放菜籽油 8 克，放入猪里脊、胡萝卜和食盐 1 克炒熟。",
                        "352", "80", "132", "120", "654", "8", "668", "1"),
                dish(SPINACH_BLANCH, "锅", "菠菜放入沸水焯熟，加食盐 1 克。", "99", "150", "668", "1"),
                dish(BROCCOLI_BLANCH, "锅", "西兰花放入沸水焯熟，沥干后食用。", "93", "200"),
                dish(OATS_WATER, "锅", "燕麦片加水煮开，不再另加糖和牛奶。", "54", "50"),
                dish(APPLE, "碗", "苹果洗净后食用。", "257", "150"),
                dish(BANANA, "碗", "香蕉去皮后食用。额度不够时不加入这一餐。", "310", "120"),
                dish(YOGURT, "碗", "原味酸奶倒入碗中，不再另加糖。", "595", "150"),
                dish(BOILED_EGG, "锅", "鸡蛋煮熟后去壳。", "580", "50"));
    }

    private static Recipe dish(String recipeId, String cookware, String step, String... foodAndGrams) {
        List<RecipeIngredient> ingredients = new ArrayList<>();
        for (int index = 0; index < foodAndGrams.length; index += 2) {
            ingredients.add(new RecipeIngredient(foodAndGrams[index], new BigDecimal(foodAndGrams[index + 1]), 1));
        }
        return new Recipe(recipeId, "1", RecipeStatus.PUBLISHED, ingredients, List.of(new RecipeStep(1, step)), cookware);
    }
}
