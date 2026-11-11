package com.moonligh.nutritionist.api.req;

import java.time.LocalDate;

public record CreateConditionReq(
        String patientId,
        String patientVersion,
        String conditionCode,
        LocalDate onsetDate,
        Integer sourceCode,
        String note) {
}
