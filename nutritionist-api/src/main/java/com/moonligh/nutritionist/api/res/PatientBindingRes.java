package com.moonligh.nutritionist.api.res;

import java.time.Instant;

/** 绑定成功后返回的结果。 */
public record PatientBindingRes(
        /** 账号标识。 */
        String accountId,
        /** 患者标识。 */
        String patientId,
        /** 绑定时刻的患者主数据版本。 */
        String patientVersion,
        /** 绑定时间。 */
        Instant boundAt) {
}
