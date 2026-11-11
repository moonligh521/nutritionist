package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;

public record CravingEvalReq(
        String patientId,
        String profileVersion,
        String foodItemId,
        BigDecimal desiredPortion,
        Integer unitCode,
        Integer reasonCode,
        BigDecimal maximumPortion) {
}
