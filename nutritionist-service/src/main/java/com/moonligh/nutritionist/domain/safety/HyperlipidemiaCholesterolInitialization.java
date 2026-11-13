package com.moonligh.nutritionist.domain.safety;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * 高脂血症胆固醇上限的初始值。
 * 来源：国家卫生健康委《成人高脂血症食养指南（2023年版）》。
 * 高脂血症人群胆固醇每日少于 300mg；高胆固醇血症者每日少于 200mg。
 * 指南没有胆固醇下限。
 */
public final class HyperlipidemiaCholesterolInitialization {

    /** 规则标识，对应 2023 年版指南。 */
    public static final String RULE_ID = "nhc-adult-hyperlipidemia-diet";
    /** 指南版本。 */
    public static final String VERSION = "2023";
    /** 高脂血症全天胆固醇上限，单位毫克。 */
    public static final BigDecimal CHOLESTEROL_MAXIMUM_MG = new BigDecimal("300");
    /** 高胆固醇血症全天胆固醇上限，单位毫克。 */
    public static final BigDecimal HYPERCHOLESTEROLEMIA_MAXIMUM_MG = new BigDecimal("200");

    /**
     * 总脂肪供能不超过当天能量的 25%。指南写 20% 至 25%。每克脂肪按 9 千卡。
     */
    public static BigDecimal fatMaximumGrams(BigDecimal energyKcal) {
        return percentOfEnergy(energyKcal, "0.25");
    }

    /**
     * 饱和脂肪少于当天能量的 10%。高胆固醇血症者少于 7%。每克按 9 千卡。
     */
    public static BigDecimal saturatedFatMaximumGrams(BigDecimal energyKcal, boolean hypercholesterolemia) {
        return percentOfEnergy(energyKcal, hypercholesterolemia ? "0.07" : "0.10");
    }

    private static BigDecimal percentOfEnergy(BigDecimal energyKcal, String fraction) {
        return energyKcal.multiply(new BigDecimal(fraction)).divide(new BigDecimal("9"), 1, RoundingMode.HALF_UP);
    }

    private HyperlipidemiaCholesterolInitialization() {
    }
}
