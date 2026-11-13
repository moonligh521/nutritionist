package com.moonligh.nutritionist.domain.profile;

import java.time.Instant;

/** 营养服务只保存患者引用，不保存姓名、身份证等主数据。 */
public record PatientRef(
        /** 账号标识。 */
        String accountId,
        /** 患者标识。 */
        String patientId,
        /** 绑定时刻的患者主数据版本。 */
        String patientVersion,
        /** 绑定时间。 */
        Instant boundAt) {
}
