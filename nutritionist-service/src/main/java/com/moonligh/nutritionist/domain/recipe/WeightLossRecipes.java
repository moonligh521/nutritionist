package com.moonligh.nutritionist.domain.recipe;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * 减重首批已发布菜谱。番茄用食材 138 西红柿。油、盐、生抽写在配料里。
 */
public final class WeightLossRecipes {

    private WeightLossRecipes() {
    }

    public static List<Recipe> published() {
        return List.of(
                dish("wl-rice-bowl", "碗", "大米按生重下锅煮熟，盛入碗中。", "1", "60"),
                dish("wl-oat-milk", "锅", "燕麦片和牛奶一起煮开，不再另加糖。", "54", "40", "590", "200"),
                dish("wl-bread-milk", "碗", "全麦面包配牛奶，不再另加糖。", "42", "60", "590", "200"),
                dish("wl-noodle-plain", "锅", "面条煮熟，加入食盐 1 克。", "28", "80", "668", "1"),
                dish("wl-chicken-broccoli", "锅",
                        "西兰花掰小朵，大葱切段。锅中放菜籽油 8 克，放入鸡胸肉和葱段翻炒，再加西兰花和食盐 1 克炒熟。",
                        "405", "100", "93", "150", "654", "8", "668", "1", "186", "10"),
                dish("wl-tofu-cabbage", "锅",
                        "北豆腐切块，小白菜洗净。锅中放菜籽油 8 克，放入豆腐、小白菜、大蒜 5 克和生抽 8 克烧熟。",
                        "606", "120", "78", "150", "654", "8", "672", "8", "191", "5"),
                dish("wl-egg-tomato", "锅",
                        "西红柿切块，鸡蛋打散。锅中放菜籽油 8 克，先炒鸡蛋，再加西红柿和食盐 1 克炒熟。",
                        "580", "100", "138", "200", "654", "8", "668", "1"),
                dish("wl-shrimp-cucumber", "锅",
                        "黄瓜切片。锅中放菜籽油 6 克，放入虾仁、黄瓜、生姜 5 克和食盐 1 克炒熟。",
                        "904", "80", "154", "150", "654", "6", "668", "1", "198", "5"),
                dish("wl-grass-carp-steam", "锅",
                        "草鱼段放上大葱 15 克和生姜 5 克，蒸熟后淋生抽 8 克。",
                        "449", "120", "186", "15", "198", "5", "672", "8"),
                dish("wl-pork-carrot", "锅",
                        "胡萝卜切片。锅中放菜籽油 8 克，放入猪里脊、胡萝卜和食盐 1 克炒熟。",
                        "352", "80", "132", "120", "654", "8", "668", "1"),
                dish("wl-spinach-blanch", "锅", "菠菜放入沸水焯熟，加食盐 1 克。", "99", "150", "668", "1"),
                dish("wl-broccoli-blanch", "锅", "西兰花放入沸水焯熟，沥干后食用。", "93", "200"),
                dish("wl-oats-water", "锅", "燕麦片加水煮开，不再另加糖和牛奶。", "54", "50"),
                dish("wl-apple", "碗", "苹果洗净后食用。", "257", "150"),
                dish("wl-banana", "碗", "香蕉去皮后食用。额度不够时不加入这一餐。", "310", "120"),
                dish("wl-yogurt", "碗", "原味酸奶倒入碗中，不再另加糖。", "595", "150"),
                dish("wl-boiled-egg", "锅", "鸡蛋煮熟后去壳。", "580", "50"));
    }

    private static Recipe dish(String recipeId, String cookware, String step, String... foodAndGrams) {
        List<RecipeIngredient> ingredients = new ArrayList<>();
        for (int index = 0; index < foodAndGrams.length; index += 2) {
            ingredients.add(new RecipeIngredient(foodAndGrams[index], new BigDecimal(foodAndGrams[index + 1]), 1));
        }
        return new Recipe(recipeId, "1", RecipeStatus.PUBLISHED, ingredients, List.of(new RecipeStep(1, step)), cookware);
    }
}
