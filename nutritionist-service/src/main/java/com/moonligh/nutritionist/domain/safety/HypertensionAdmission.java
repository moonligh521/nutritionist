package com.moonligh.nutritionist.domain.safety;

/**
 * 高血压病情代码。钠的初始上限见 {@link HypertensionSodiumInitialization}。
 */
public final class HypertensionAdmission {

    /** 高血压病情代码。 */
    public static final String CONDITION_CODE = "HYPERTENSION";
    /** 钠营养素代码。 */
    public static final String SODIUM = "SODIUM";

    private HypertensionAdmission() {
    }
}
