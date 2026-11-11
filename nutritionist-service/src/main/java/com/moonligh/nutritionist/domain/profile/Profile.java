package com.moonligh.nutritionist.domain.profile;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;

public record Profile(
        String profileId,
        String accountId,
        String patientId,
        String patientVersion,
        long version,
        int sexCode,
        LocalDate birthDate,
        BigDecimal heightCm,
        String timezone,
        Integer activityLevelCode,
        int goalTypeCode,
        Instant updatedAt) {
}
