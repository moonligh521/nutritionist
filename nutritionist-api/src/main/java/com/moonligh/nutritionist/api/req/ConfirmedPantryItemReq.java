package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;

public record ConfirmedPantryItemReq(
        String foodItemId,
        BigDecimal quantity,
        Integer unitCode,
        Integer stateCode,
        String displayName) {
}
