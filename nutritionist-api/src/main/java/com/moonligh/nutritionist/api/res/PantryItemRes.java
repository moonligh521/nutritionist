package com.moonligh.nutritionist.api.res;

import java.math.BigDecimal;
import java.time.Instant;

public record PantryItemRes(
        String pantryItemId,
        String lotId,
        String foodItemId,
        BigDecimal onHandQuantity,
        BigDecimal reservedQuantity,
        BigDecimal availableQuantity,
        Integer unitCode,
        Integer stateCode,
        Instant expireAt,
        String lotCode) {
}
