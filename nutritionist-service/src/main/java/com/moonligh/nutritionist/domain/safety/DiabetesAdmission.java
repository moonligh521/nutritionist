package com.moonligh.nutritionist.domain.safety;

/**
 * 糖尿病病情代码。钠和碳水的初始额度见 {@link DiabetesDietInitialization}。
 */
public final class DiabetesAdmission {

    /** 糖尿病病情代码。 */
    public static final String DIABETES = "DIABETES";
    /** 糖尿病前期病情代码。 */
    public static final String PREDIABETES = "PREDIABETES";

    private DiabetesAdmission() {
    }
}
