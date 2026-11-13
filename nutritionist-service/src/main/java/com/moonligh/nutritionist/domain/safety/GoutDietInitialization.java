package com.moonligh.nutritionist.domain.safety;

import java.math.BigDecimal;

/**
 * 痛风与高尿酸血症的固定上限。
 * 来源：国家卫生健康委《成人高尿酸血症与痛风食养指南（2024年版）》。
 * 每天食盐不超过 5g。指南按食物嘌呤分类，没有给出全天嘌呤毫克上限。
 */
public final class GoutDietInitialization {

    /** 规则标识。 */
    public static final String RULE_ID = "nhc-adult-gout-diet";
    /** 指南版本。 */
    public static final String VERSION = "2024";
    /** 全天钠上限，单位毫克。5g 食盐按指南交换表 1g 盐含 400mg 钠。 */
    public static final BigDecimal SODIUM_MAXIMUM_MG = new BigDecimal("2000");

    private GoutDietInitialization() {
    }
}
