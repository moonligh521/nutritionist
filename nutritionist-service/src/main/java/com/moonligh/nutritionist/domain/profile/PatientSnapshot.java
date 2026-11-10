package com.moonligh.nutritionist.domain.profile;

/**
 * 挂号侧返回的患者快照（版本校验用）。
 */
public record PatientSnapshot(String patientId, String patientVersion, boolean ownedByAccount) {
}
