package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;

public record IntakeItemReq(
        Integer itemTypeCode,
        String foodItemId,
        String cookingExecutionId,
        BigDecimal quantity,
        Integer unitCode,
        Integer weightBasisCode) {
}
