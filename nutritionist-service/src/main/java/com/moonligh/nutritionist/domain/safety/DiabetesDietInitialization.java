package com.moonligh.nutritionist.domain.safety;

import java.math.BigDecimal;

/**
 * 糖尿病食养的初始额度。
 * 来源：国家卫生健康委《成人糖尿病食养指南（2023年版）》。
 * 食盐每日不宜超过 5 克。表 2.7 写明 5 克食盐含钠 2000 毫克。
 * 碳水化合物供能占全天能量的 45% 至 60%。指南以 1800 至 2000 千卡为例，
 * 对应碳水化合物约 200 至 300 克，换算系数为每克碳水化合物 4 千卡。
 * 没有专业人员给出的全天能量时，不把示例克数写成每个人的碳水上限。
 * 烹调油每日宜控制在 25 克以内。默认大豆油一份为 10 克，不超过该上限。
 */
public final class DiabetesDietInitialization {

    /** 规则标识。 */
    public static final String RULE_ID = "nhc-adult-diabetes-diet";
    /** 指南版本。 */
    public static final String VERSION = "2023";
    /** 全天钠上限，单位毫克。 */
    public static final BigDecimal SODIUM_MAXIMUM_MG = new BigDecimal("2000");
    /** 与钠上限相当的食盐量，单位克。 */
    public static final BigDecimal SALT_MAXIMUM_G = new BigDecimal("5");
    /** 烹调油上限，单位克。 */
    public static final BigDecimal OIL_MAXIMUM_G = new BigDecimal("25");
    /** 碳水化合物供能占全天能量的上限比例。 */
    public static final BigDecimal CARBOHYDRATE_ENERGY_SHARE = new BigDecimal("0.60");
    /** 碳水化合物供能占全天能量的下限比例。达不到时不把整餐判成无解。 */
    public static final BigDecimal CARBOHYDRATE_ENERGY_FLOOR = new BigDecimal("0.45");
    /** 每克碳水化合物的能量，单位千卡。由指南示例反推。 */
    public static final BigDecimal KCAL_PER_CARBOHYDRATE_GRAM = new BigDecimal("4");

    private DiabetesDietInitialization() {
    }

    /** 由当天能量换算碳水化合物上限，单位克。单餐传入按餐次缩小后的能量。 */
    public static BigDecimal carbohydrateMaximumGrams(BigDecimal energyMaximumKcal) {
        return energyShareGrams(energyMaximumKcal, CARBOHYDRATE_ENERGY_SHARE);
    }

    /** 由当天能量换算碳水化合物软下限，单位克。 */
    public static BigDecimal carbohydrateMinimumGrams(BigDecimal energyKcal) {
        return energyShareGrams(energyKcal, CARBOHYDRATE_ENERGY_FLOOR);
    }

    private static BigDecimal energyShareGrams(BigDecimal energyKcal, BigDecimal share) {
        return energyKcal.multiply(share).divide(KCAL_PER_CARBOHYDRATE_GRAM, 1, java.math.RoundingMode.HALF_UP);
    }
}
