package com.moonligh.nutritionist.domain.safety;

import java.math.BigDecimal;

/**
 * 高血压钠上限的初始值。
 * 来源：国家卫生健康委《成人高血压食养指南（2023年版）》调味品一节，
 * 每日钠摄入量不超过 2000mg，相当于食盐 5g。
 * 原则一同时写明每人每日食盐摄入量逐步降至 5g 以下。
 * 指南只给上限，不设钠的下限。
 */
public final class HypertensionSodiumInitialization {

    /** 规则标识，对应 2023 年版指南。 */
    public static final String RULE_ID = "nhc-adult-hypertension-diet";
    /** 指南版本。 */
    public static final String VERSION = "2023";
    /** 全天钠上限，单位毫克。 */
    public static final BigDecimal SODIUM_MAXIMUM_MG = new BigDecimal("2000");
    /** 与钠上限相当的食盐量，单位克。 */
    public static final BigDecimal SALT_EQUIVALENT_G = new BigDecimal("5");

    private HypertensionSodiumInitialization() {
    }
}
