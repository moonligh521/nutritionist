package com.moonligh.nutritionist.domain.safety;

/** 药物安全评估输入。 */
public record MedicationSafetyInput(
        /** 是否存在急症。存在急症时禁止自动配餐。 */
        boolean acuteRisk,
        /** 用药信息是否完整。不完整时返回资料不足。 */
        boolean medicationInformationComplete,
        /** 服务等级。C 级须人工复核。 */
        ServiceLevel serviceLevel) {
}
