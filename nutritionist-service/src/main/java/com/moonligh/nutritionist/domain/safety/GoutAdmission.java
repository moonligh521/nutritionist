package com.moonligh.nutritionist.domain.safety;

/**
 * 痛风与高尿酸血症病情代码。
 */
public final class GoutAdmission {

    /** 痛风。 */
    public static final String GOUT = "GOUT";
    /** 高尿酸血症。 */
    public static final String HYPERURICEMIA = "HYPERURICEMIA";
    /** 指南第一类高嘌呤：动物肝。不进入痛风配餐。 */
    public static final String HIGH_PURINE_LIVER = "guide-liver";

    private GoutAdmission() {
    }
}
