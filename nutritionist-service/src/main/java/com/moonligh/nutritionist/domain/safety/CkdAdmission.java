package com.moonligh.nutritionist.domain.safety;

/**
 * 慢性肾脏病病情代码。分期和并发症用单独代码，避免把 3～5 期蛋白质额度用到 1～2 期。
 */
public final class CkdAdmission {

    /** 慢性肾脏病，未标明分期。 */
    public static final String CKD = "CKD";
    /** 3～5 期且未透析。 */
    public static final String CKD_STAGE_3_5 = "CKD_STAGE_3_5";
    /** 水肿。食盐不超过 3g。 */
    public static final String CKD_EDEMA = "CKD_EDEMA";
    /** 严重水肿，无盐膳食，钠低于 1000mg。 */
    public static final String CKD_SEVERE_EDEMA = "CKD_SEVERE_EDEMA";
    /** 高钾血症。 */
    public static final String CKD_HYPERKALEMIA = "CKD_HYPERKALEMIA";
    /** 蛋白质营养素代码。 */
    public static final String PROTEIN = "PROTEIN";
    /** 磷营养素代码。 */
    public static final String PHOSPHORUS = "PHOSPHORUS";
    /** 钾营养素代码。 */
    public static final String POTASSIUM = "POTASSIUM";

    private CkdAdmission() {
    }
}
