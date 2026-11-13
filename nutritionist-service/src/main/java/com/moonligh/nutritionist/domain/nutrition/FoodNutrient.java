package com.moonligh.nutritionist.domain.nutrition;

import java.math.BigDecimal;

/** 一种食材里的一项营养。不知道的值不能写成 0。 */
public record FoodNutrient(
        /** 营养素类型，如能量、钠。 */
        NutrientType type,
        /** 每 100 克含量。质量为未知时须为空。 */
        BigDecimal value,
        /** 含量单位。 */
        NutrientUnit unit,
        /** 数据质量：已知、估算或未知。 */
        NutrientQuality quality,
        /** 数据来源。 */
        String sourceRef) {

    public FoodNutrient {
        if (quality == NutrientQuality.UNKNOWN && value != null) {
            throw new IllegalArgumentException("UNKNOWN nutrient must not carry a numeric value");
        }
        if ((quality == NutrientQuality.KNOWN || quality == NutrientQuality.ESTIMATED) && value == null) {
            throw new IllegalArgumentException("Known nutrient requires a numeric value");
        }
    }
}
