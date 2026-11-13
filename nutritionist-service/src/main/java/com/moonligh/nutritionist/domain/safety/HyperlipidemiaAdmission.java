package com.moonligh.nutritionist.domain.safety;

/**
 * 高脂血症病情代码。胆固醇初始上限见 {@link HyperlipidemiaCholesterolInitialization}。
 */
public final class HyperlipidemiaAdmission {

    /** 高脂血症病情代码。胆固醇上限用 300 毫克。 */
    public static final String HYPERLIPIDEMIA = "HYPERLIPIDEMIA";
    /** 高胆固醇血症病情代码。胆固醇上限用 200 毫克。 */
    public static final String HYPERCHOLESTEROLEMIA = "HYPERCHOLESTEROLEMIA";
    /** 胆固醇营养素代码。 */
    public static final String CHOLESTEROL = "CHOLESTEROL";

    private HyperlipidemiaAdmission() {
    }
}
