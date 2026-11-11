package com.moonligh.nutritionist.api.res;

import java.time.Instant;

public record ProfileRes(
        String profileId,
        String profileVersion,
        String patientId,
        String patientVersion,
        Instant updatedAt) {
}
