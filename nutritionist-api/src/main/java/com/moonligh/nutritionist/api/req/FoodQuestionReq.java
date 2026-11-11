package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;

public record FoodQuestionReq(
        String planId,
        String question,
        BigDecimal authoritativeGrams,
        BigDecimal proposedGrams) {
}
