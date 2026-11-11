package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;
import java.time.Instant;

public record CreateMeasurementReq(
        String patientId,
        String patientVersion,
        String eventId,
        Integer typeCode,
        BigDecimal value,
        Integer unitCode,
        Instant observedAt,
        Integer contextCode,
        Integer sourceCode,
        boolean urgent) {
}
