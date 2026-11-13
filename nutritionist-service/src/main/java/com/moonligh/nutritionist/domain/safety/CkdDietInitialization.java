package com.moonligh.nutritionist.domain.safety;

import java.math.BigDecimal;

/**
 * 慢性肾脏病食养的固定上限。
 * 来源：国家卫生健康委《成人慢性肾脏病食养指南（2024年版）》。
 * 蛋白质 0.6g/kg 只用于 3～5 期非透析，且要有身高。钾上限只用于高钾血症。
 */
public final class CkdDietInitialization {

    /** 规则标识。 */
    public static final String RULE_ID = "nhc-adult-ckd-diet";
    /** 指南版本。 */
    public static final String VERSION = "2024";
    /** 无水肿时钠上限，单位毫克，相当于食盐 5g。 */
    public static final BigDecimal SODIUM_MAXIMUM_MG = new BigDecimal("2000");
    /** 水肿时钠上限，单位毫克，相当于食盐 3g。 */
    public static final BigDecimal EDEMA_SODIUM_MAXIMUM_MG = new BigDecimal("1200");
    /** 严重水肿无盐膳食的钠上限，单位毫克。 */
    public static final BigDecimal SEVERE_EDEMA_SODIUM_MAXIMUM_MG = new BigDecimal("1000");
    /** 膳食磷上限，单位毫克。指南写不超过 800～1000mg，初始取 1000。 */
    public static final BigDecimal PHOSPHORUS_MAXIMUM_MG = new BigDecimal("1000");
    /** 高钾血症时钾上限，单位毫克。指南写不超过 2000～3000mg，初始取 3000。 */
    public static final BigDecimal HYPERKALEMIA_POTASSIUM_MAXIMUM_MG = new BigDecimal("3000");
    /** 3～5 期非透析蛋白质系数，克/公斤理想体重。 */
    public static final BigDecimal PROTEIN_GRAMS_PER_KG = new BigDecimal("0.6");

    private CkdDietInitialization() {
    }
}
