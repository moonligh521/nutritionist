package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;
import java.time.LocalDate;

public record UpsertProfileReq(
        String patientId,
        String patientVersion,
        String profileVersion,
        Integer sexCode,
        LocalDate birthDate,
        BigDecimal heightCm,
        String timezone,
        Integer activityLevelCode,
        Integer goalTypeCode) {
}
