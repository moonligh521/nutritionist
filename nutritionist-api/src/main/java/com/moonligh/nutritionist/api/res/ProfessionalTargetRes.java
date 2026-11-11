package com.moonligh.nutritionist.api.res;

import java.math.BigDecimal;
import java.time.Instant;

public record ProfessionalTargetRes(
        String targetId,
        String version,
        String patientId,
        String nutrientCode,
        BigDecimal minimum,
        BigDecimal maximum,
        Instant effectiveAt,
        Instant expiresAt) {
}
