package com.moonligh.nutritionist.api.req;

/**
 * 把挂号里的一位患者绑到当前账号。
 */
public record BindPatientReq(
        /** 患者标识。 */
        String patientId,
        /** 患者主数据版本。 */
        String patientVersion) {
}
