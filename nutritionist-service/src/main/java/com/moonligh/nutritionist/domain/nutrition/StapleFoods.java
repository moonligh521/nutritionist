package com.moonligh.nutritionist.domain.nutrition;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * 第一批家常食材。数值来自 USDA FoodData Central，每 100 克。
 * 未知营养素不在列表里，不用 0 冒充。表内写明为 0 的按已知 0 收录。
 * 每条 USDA 食材收录该条目的钾、磷和饱和脂肪。反式脂肪酸有缺项，不记为 0。
 * 烹调油只记在大豆油上，每 100 克记 100 克；其余食材记已知 0。
 */
public final class StapleFoods {

    /** 熟白米饭。FDC 168878，每 100 克能量 130 千卡、钠 1 毫克、蛋白质 2.69 克、胆固醇 0。 */
    public static final FoodItem COOKED_RICE = food(
            "usda-168878",
            "熟白米饭",
            "USDA FoodData Central FDC 168878",
            kcal("130"),
            mg(NutrientType.SODIUM, "1"),
            gram(NutrientType.PROTEIN, "2.69"),
            gram(NutrientType.CARBOHYDRATE, "28.17"),
            gram(NutrientType.FAT, "0.28"),
            gram(NutrientType.FIBER, "0.4"),
            gram(NutrientType.SATURATED_FAT, "0.077"),
            mg(NutrientType.POTASSIUM, "35"),
            mg(NutrientType.PHOSPHORUS, "43"),
            mg(NutrientType.CHOLESTEROL, "0"));

    /** 烤鸡胸肉。FDC 171477，每 100 克能量 165 千卡、钠 74 毫克、蛋白质 31.02 克、脂肪 3.57 克、胆固醇 85 毫克。 */
    public static final FoodItem ROASTED_CHICKEN_BREAST = food(
            "usda-171477",
            "烤鸡胸肉",
            "USDA FoodData Central FDC 171477",
            kcal("165"),
            mg(NutrientType.SODIUM, "74"),
            gram(NutrientType.PROTEIN, "31.02"),
            gram(NutrientType.FAT, "3.57"),
            gram(NutrientType.CARBOHYDRATE, "0"),
            gram(NutrientType.FIBER, "0"),
            gram(NutrientType.SATURATED_FAT, "1.01"),
            mg(NutrientType.POTASSIUM, "256"),
            mg(NutrientType.PHOSPHORUS, "228"),
            mg(NutrientType.CHOLESTEROL, "85"));

    /** 水煮菠菜，未加盐。FDC 168463，每 100 克能量 23 千卡、钠 70 毫克、蛋白质 2.97 克、脂肪 0.26 克、膳食纤维 2.4 克。 */
    public static final FoodItem BOILED_SPINACH = food(
            "usda-168463",
            "水煮菠菜",
            "USDA FoodData Central FDC 168463",
            kcal("23"),
            mg(NutrientType.SODIUM, "70"),
            gram(NutrientType.PROTEIN, "2.97"),
            gram(NutrientType.FAT, "0.26"),
            gram(NutrientType.CARBOHYDRATE, "3.75"),
            gram(NutrientType.FIBER, "2.4"),
            gram(NutrientType.SATURATED_FAT, "0.043"),
            mg(NutrientType.POTASSIUM, "466"),
            mg(NutrientType.PHOSPHORUS, "56"),
            mg(NutrientType.CHOLESTEROL, "0"));

    /** 大豆油。FDC 171411，每 100 克能量 884 千卡、钠 0 毫克、蛋白质 0 克、胆固醇 0。 */
    public static final FoodItem SOYBEAN_OIL = food(
            "usda-171411",
            "大豆油",
            "USDA FoodData Central FDC 171411",
            kcal("884"),
            mg(NutrientType.SODIUM, "0"),
            gram(NutrientType.PROTEIN, "0"),
            gram(NutrientType.FAT, "100"),
            gram(NutrientType.CARBOHYDRATE, "0"),
            gram(NutrientType.FIBER, "0"),
            gram(NutrientType.SATURATED_FAT, "15.65"),
            mg(NutrientType.POTASSIUM, "0"),
            mg(NutrientType.PHOSPHORUS, "0"),
            mg(NutrientType.CHOLESTEROL, "0"));

    /** 北豆腐，硫酸钙凝固。FDC 172475，每 100 克能量 144 千卡、钠 14 毫克、蛋白质 17.27 克、膳食纤维 2.3 克。 */
    public static final FoodItem FIRM_TOFU = food(
            "usda-172475",
            "北豆腐",
            "USDA FoodData Central FDC 172475",
            kcal("144"),
            mg(NutrientType.SODIUM, "14"),
            gram(NutrientType.PROTEIN, "17.27"),
            gram(NutrientType.FAT, "8.72"),
            gram(NutrientType.CARBOHYDRATE, "2.78"),
            gram(NutrientType.FIBER, "2.3"),
            gram(NutrientType.SATURATED_FAT, "1.261"),
            mg(NutrientType.POTASSIUM, "237"),
            mg(NutrientType.PHOSPHORUS, "190"),
            mg(NutrientType.CHOLESTEROL, "0"));

    /** 全蛋。FDC 171287，每 100 克能量 143 千卡、钠 142 毫克、蛋白质 12.56 克、胆固醇 372 毫克。 */
    public static final FoodItem WHOLE_EGG = food(
            "usda-171287",
            "全蛋",
            "USDA FoodData Central FDC 171287",
            kcal("143"),
            mg(NutrientType.SODIUM, "142"),
            gram(NutrientType.PROTEIN, "12.56"),
            gram(NutrientType.FAT, "9.51"),
            gram(NutrientType.CARBOHYDRATE, "0.72"),
            gram(NutrientType.FIBER, "0"),
            gram(NutrientType.SATURATED_FAT, "3.126"),
            mg(NutrientType.POTASSIUM, "138"),
            mg(NutrientType.PHOSPHORUS, "198"),
            mg(NutrientType.CHOLESTEROL, "372"));

    /** 生大西洋鲑。FDC 175167，每 100 克能量 208 千卡、钠 59 毫克、蛋白质 20.42 克、胆固醇 55 毫克。 */
    public static final FoodItem ATLANTIC_SALMON = food(
            "usda-175167",
            "大西洋鲑",
            "USDA FoodData Central FDC 175167",
            kcal("208"),
            mg(NutrientType.SODIUM, "59"),
            gram(NutrientType.PROTEIN, "20.42"),
            gram(NutrientType.FAT, "13.42"),
            gram(NutrientType.CARBOHYDRATE, "0"),
            gram(NutrientType.FIBER, "0"),
            gram(NutrientType.SATURATED_FAT, "3.05"),
            mg(NutrientType.POTASSIUM, "363"),
            mg(NutrientType.PHOSPHORUS, "240"),
            mg(NutrientType.CHOLESTEROL, "55"));

    /** 生燕麦片。FDC 173904，每 100 克能量 379 千卡、钠 6 毫克、蛋白质 13.15 克、脂肪 6.52 克、膳食纤维 10.1 克。 */
    public static final FoodItem DRY_OATS = food(
            "usda-173904",
            "燕麦片",
            "USDA FoodData Central FDC 173904",
            kcal("379"),
            mg(NutrientType.SODIUM, "6"),
            gram(NutrientType.PROTEIN, "13.15"),
            gram(NutrientType.FAT, "6.52"),
            gram(NutrientType.CARBOHYDRATE, "67.7"),
            gram(NutrientType.FIBER, "10.1"),
            gram(NutrientType.SATURATED_FAT, "1.11"),
            mg(NutrientType.POTASSIUM, "362"),
            mg(NutrientType.PHOSPHORUS, "410"),
            mg(NutrientType.CHOLESTEROL, "0"));

    /** 带皮苹果。FDC 171688，每 100 克能量 52 千卡、钠 1 毫克、蛋白质 0.26 克、碳水化合物 13.81 克、膳食纤维 2.4 克。 */
    public static final FoodItem RAW_APPLE = food(
            "usda-171688",
            "苹果",
            "USDA FoodData Central FDC 171688",
            kcal("52"),
            mg(NutrientType.SODIUM, "1"),
            gram(NutrientType.PROTEIN, "0.26"),
            gram(NutrientType.FAT, "0.17"),
            gram(NutrientType.CARBOHYDRATE, "13.81"),
            gram(NutrientType.FIBER, "2.4"),
            gram(NutrientType.SATURATED_FAT, "0.028"),
            mg(NutrientType.POTASSIUM, "107"),
            mg(NutrientType.PHOSPHORUS, "11"),
            mg(NutrientType.CHOLESTEROL, "0"));

    /** 煮扁豆，未加盐。FDC 172421，每 100 克能量 116 千卡、钠 2 毫克、蛋白质 9.02 克、膳食纤维 7.9 克。 */
    public static final FoodItem COOKED_LENTILS = food(
            "usda-172421",
            "煮扁豆",
            "USDA FoodData Central FDC 172421",
            kcal("116"),
            mg(NutrientType.SODIUM, "2"),
            gram(NutrientType.PROTEIN, "9.02"),
            gram(NutrientType.FAT, "0.38"),
            gram(NutrientType.CARBOHYDRATE, "20.13"),
            gram(NutrientType.FIBER, "7.9"),
            gram(NutrientType.SATURATED_FAT, "0.053"),
            mg(NutrientType.POTASSIUM, "369"),
            mg(NutrientType.PHOSPHORUS, "180"),
            mg(NutrientType.CHOLESTEROL, "0"));

    /**
     * 食用盐。国家卫生健康委《成人糖尿病食养指南（2023年版）》表 2.7：
     * 5 克食盐含钠 2000 毫克。不进入默认菜谱，避免一份盐顶破全天钠上限。
     */
    public static final FoodItem TABLE_SALT = food(
            "nhc-table-salt",
            "食用盐",
            "国家卫生健康委成人糖尿病食养指南（2023年版）表2.7",
            mg(NutrientType.SODIUM, "40000"));

    private StapleFoods() {
    }

    public static List<FoodItem> all() {
        return List.of(
                COOKED_RICE,
                ROASTED_CHICKEN_BREAST,
                BOILED_SPINACH,
                SOYBEAN_OIL,
                FIRM_TOFU,
                WHOLE_EGG,
                ATLANTIC_SALMON,
                RAW_APPLE,
                DRY_OATS,
                COOKED_LENTILS,
                TABLE_SALT);
    }

    public static FoodItem find(String foodItemId) {
        return all().stream().filter(food -> food.foodItemId().equals(foodItemId)).findFirst().orElse(null);
    }

    private static FoodItem food(String id, String name, String source, FoodNutrient... nutrients) {
        List<FoodNutrient> values = new ArrayList<>(List.of(nutrients));
        if (id.startsWith("usda-")) {
            String oilGrams = "usda-171411".equals(id) ? "100" : "0";
            values.add(new FoodNutrient(
                    NutrientType.COOKING_OIL,
                    new BigDecimal(oilGrams),
                    NutrientUnit.GRAM,
                    NutrientQuality.KNOWN,
                    "烹调油按食材本身计"));
        }
        return new FoodItem(id, name, source, List.copyOf(values));
    }

    private static FoodNutrient kcal(String value) {
        return known(NutrientType.ENERGY, value, NutrientUnit.KILOCALORIE);
    }

    private static FoodNutrient mg(NutrientType type, String value) {
        return known(type, value, NutrientUnit.MILLIGRAM);
    }

    private static FoodNutrient gram(NutrientType type, String value) {
        return known(type, value, NutrientUnit.GRAM);
    }

    private static FoodNutrient known(NutrientType type, String value, NutrientUnit unit) {
        return new FoodNutrient(type, new BigDecimal(value), unit, NutrientQuality.KNOWN, "USDA FoodData Central");
    }
}
