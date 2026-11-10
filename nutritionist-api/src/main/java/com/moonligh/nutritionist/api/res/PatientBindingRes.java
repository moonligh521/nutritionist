package com.moonligh.nutritionist.api.res;

import java.time.Instant;

/**
 * 患者绑定结果。
 */
public record PatientBindingRes(
        String accountId, String patientId, String patientVersion, Instant boundAt) {
}
