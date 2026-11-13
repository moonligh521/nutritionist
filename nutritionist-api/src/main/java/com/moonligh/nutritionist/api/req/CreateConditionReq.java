package com.moonligh.nutritionist.api.req;

import java.time.LocalDate;

/** 追加一条疾病记录。不覆盖以前的记录。 */
public record CreateConditionReq(
        /** 患者标识。 */
        String patientId,
        /** 患者主数据版本。 */
        String patientVersion,
        /** 疾病代码。 */
        String conditionCode,
        /** 发病日期。可空。 */
        LocalDate onsetDate,
        /** 来源代码，如自行申报、病历。 */
        Integer sourceCode,
        /** 备注。可空。 */
        String note) {
}
