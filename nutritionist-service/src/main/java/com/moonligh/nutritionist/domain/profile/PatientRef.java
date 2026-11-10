package com.moonligh.nutritionist.domain.profile;

import java.time.Instant;

/**
 * 营养侧保存的患者引用，不复制主数据。
 */
public record PatientRef(String accountId, String patientId, String patientVersion, Instant boundAt) {
}
