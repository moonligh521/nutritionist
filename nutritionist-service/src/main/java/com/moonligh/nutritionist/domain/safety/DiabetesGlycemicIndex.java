package com.moonligh.nutritionist.domain.safety;

import java.util.List;

/**
 * 《成人糖尿病食养指南（2023年版）》表 1.1 的升糖指数分类。
 * 大米饭为高，苹果为低。高升糖食物并不禁止，只在求解时降低优先级。
 */
public final class DiabetesGlycemicIndex {

    private DiabetesGlycemicIndex() {
    }

    public static List<String> highFoodIds() {
        return List.of("usda-168878");
    }

    public static String band(String foodItemId) {
        if ("usda-168878".equals(foodItemId)) {
            return "HIGH";
        }
        if ("usda-171688".equals(foodItemId)
                || "usda-173904".equals(foodItemId)
                || "usda-172475".equals(foodItemId)
                || "usda-168463".equals(foodItemId)) {
            return "LOW";
        }
        return null;
    }
}
