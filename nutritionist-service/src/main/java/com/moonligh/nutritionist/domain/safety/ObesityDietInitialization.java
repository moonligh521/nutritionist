package com.moonligh.nutritionist.domain.safety;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * 减重额度。
 * 餐次比例来自国家卫生健康委《体重管理指导原则（2024）》：早、晚餐各占 30%，午餐占 40%。
 * 能量比例来自《成人肥胖食养指南（2024年版）》：超重按需要量的 85%，肥胖按 80%。
 * 餐次代码 1 早餐、2 午餐、3 晚餐。其他餐次没有公布比例。
 */
public final class ObesityDietInitialization {

    public static final String SHARE_RULE_ID = "nhc-weight-management-2024";
    public static final String ENERGY_RULE_ID = "nhc-adult-obesity-diet-2024";
    public static final String OVERWEIGHT = "OVERWEIGHT";
    public static final String OBESITY = "OBESITY";

    private ObesityDietInitialization() {
    }

    public static Integer publishedSharePercent(Integer mealTypeCode) {
        if (mealTypeCode == null) {
            return null;
        }
        return switch (mealTypeCode) {
            case 1, 3 -> 30;
            case 2 -> 40;
            default -> null;
        };
    }

    public static BigDecimal energyCeiling(BigDecimal requirement, boolean obesity) {
        BigDecimal ratio = obesity ? new BigDecimal("0.80") : new BigDecimal("0.85");
        return requirement.multiply(ratio).setScale(0, RoundingMode.HALF_UP);
    }
}
