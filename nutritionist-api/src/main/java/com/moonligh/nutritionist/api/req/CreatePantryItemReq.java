package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;
import java.time.Instant;

public record CreatePantryItemReq(
        String patientId,
        String patientVersion,
        String foodItemId,
        BigDecimal quantity,
        Integer unitCode,
        Integer stateCode,
        Instant expireAt,
        String lotCode) {
}
