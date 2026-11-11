package com.moonligh.nutritionist.api.req;

import java.time.Instant;

public record CreateMedicationReq(
        String patientId,
        String patientVersion,
        String medicationName,
        Integer categoryCode,
        String doseText,
        String frequencyText,
        Instant startedAt,
        Instant endedAt,
        boolean completeConfirmed) {
}
