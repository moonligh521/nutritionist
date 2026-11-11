package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;

public record ActualIngredientChangeReq(
        String foodItemId,
        BigDecimal plannedQuantity,
        BigDecimal actualQuantity,
        boolean allergen) {
}
