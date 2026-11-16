package com.moonligh.nutritionist.domain.nutrition;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * 减重首批菜谱用到的食材。数值与已编写的公开来源迁移一致。
 * 非烹调油的烹调油含量记为 0，这样限油约束可以计算。草鱼没有公开纤维，不补 0。
 */
public final class WeightLossFoods {

    private WeightLossFoods() {
    }

    public static List<FoodItem> all() {
        return List.of(
                item("1", "大米", "USDA_FDC:168877", "365", "7.13", "79.95", "0.66", "1.3", "5"),
                item("28", "面条", "USDA_FDC:169731", "384", "14.16", "71.27", "4.44", "3.3", "21"),
                item("42", "全麦面包", "USDA_FDC:172688", "252", "12.45", "42.71", "3.5", "6", "455"),
                item("54", "燕麦片", "TFDA:A0810101", "393", "12.3", "64.1", "9.7", "4.7", "3"),
                item("78", "小白菜", "USDA_FDC:170390", "13", "1.5", "2.18", "0.2", "1", "65"),
                item("93", "西兰花", "USDA_FDC:170379", "34", "2.82", "6.64", "0.37", "2.6", "33"),
                item("99", "菠菜", "USDA_FDC:168462", "23", "2.86", "3.63", "0.39", "2.2", "79"),
                item("132", "胡萝卜", "USDA_FDC:170393", "41", "0.93", "9.58", "0.24", "2.8", "69"),
                item("138", "西红柿", "USDA_FDC:170457", "18", "0.88", "3.89", "0.2", "1.2", "5"),
                item("154", "黄瓜", "USDA_FDC:168409", "15", "0.65", "3.63", "0.11", "0.5", "2"),
                item("186", "大葱", "USDA_FDC:170007", "34", "1.9", "6.5", "0.4", "2.4", "17"),
                item("191", "大蒜", "USDA_FDC:169230", "149", "6.36", "33.06", "0.5", "2.1", "17"),
                item("198", "生姜", "USDA_FDC:169231", "80", "1.82", "17.77", "0.75", "2", "13"),
                item("257", "苹果", "USDA_FDC:171688", "52", "0.26", "13.81", "0.17", "2.4", "1"),
                item("310", "香蕉", "USDA_FDC:173944", "89", "1.09", "22.84", "0.33", "2.6", "1"),
                item("352", "猪里脊", "USDA_FDC:168249", "109", "20.95", "0", "2.17", "0", "53"),
                item("405", "鸡胸肉", "TFDA:I0402402", "117", "23.3", "0.6", "1.9", "0", "33"),
                item("449", "草鱼", "TFDA:J0401401", "91", "17.2", "0.8", "2.0", null, "37"),
                item("580", "鸡蛋", "USDA_FDC:171287", "143", "12.56", "0.72", "9.51", "0", "142"),
                item("590", "牛奶", "USDA_FDC:172217", "61", "3.15", "4.8", "3.25", "0", "43"),
                item("595", "酸奶", "USDA_FDC:171284", "61", "3.47", "4.66", "3.25", "0", "46"),
                item("606", "北豆腐", "USDA_FDC:172475", "144", "17.27", "2.78", "8.72", "2.3", "14"),
                item("654", "菜籽油", "USDA_FDC:172336", "884", "0", "0", "100", "0", "0"),
                item("668", "食盐", "USDA_FDC:173468", "0", "0", "0", "0", "0", "38758"),
                item("672", "生抽", "USDA_FDC:174277", "53", "8.14", "4.93", "0.57", "0.8", "5493"),
                item("904", "虾仁", "USDA_FDC:174210", "71", "13.61", "0.91", "1.01", "0", "566"));
    }

    public static FoodItem find(String foodItemId) {
        return all().stream().filter(food -> food.foodItemId().equals(foodItemId)).findFirst().orElse(null);
    }

    private static FoodItem item(
            String id,
            String name,
            String source,
            String energy,
            String protein,
            String carbohydrate,
            String fat,
            String fiber,
            String sodium) {
        List<FoodNutrient> values = new ArrayList<>();
        values.add(known(NutrientType.ENERGY, energy, NutrientUnit.KILOCALORIE, source));
        values.add(known(NutrientType.PROTEIN, protein, NutrientUnit.GRAM, source));
        values.add(known(NutrientType.CARBOHYDRATE, carbohydrate, NutrientUnit.GRAM, source));
        values.add(known(NutrientType.FAT, fat, NutrientUnit.GRAM, source));
        if (fiber != null) {
            values.add(known(NutrientType.FIBER, fiber, NutrientUnit.GRAM, source));
        }
        values.add(known(NutrientType.SODIUM, sodium, NutrientUnit.MILLIGRAM, source));
        values.add(known(NutrientType.COOKING_OIL, "654".equals(id) ? "100" : "0", NutrientUnit.GRAM, "烹调油按食材本身计"));
        return new FoodItem(id, name, source, values);
    }

    private static FoodNutrient known(NutrientType type, String value, NutrientUnit unit, String source) {
        return new FoodNutrient(type, new BigDecimal(value), unit, NutrientQuality.KNOWN, source);
    }
}
