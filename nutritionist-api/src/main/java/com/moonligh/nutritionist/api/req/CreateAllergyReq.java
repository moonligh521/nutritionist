package com.moonligh.nutritionist.api.req;

/** 追加一条过敏记录。 */
public record CreateAllergyReq(
        /** 患者标识。 */
        String patientId,
        /** 患者主数据版本。 */
        String patientVersion,
        /** 过敏原代码。 */
        String allergenCode,
        /** 严重程度。 */
        Integer severityCode,
        /** 是否已确认。 */
        boolean confirmed) {
}
