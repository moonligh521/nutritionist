package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;
import java.time.Instant;

public record CreateProfessionalTargetReq(
        String patientId,
        String nutrientCode,
        BigDecimal minimum,
        BigDecimal maximum,
        Instant effectiveAt,
        Instant expiresAt) {
}
