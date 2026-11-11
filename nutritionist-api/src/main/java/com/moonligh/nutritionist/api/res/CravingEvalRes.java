package com.moonligh.nutritionist.api.res;

import java.math.BigDecimal;

public record CravingEvalRes(
        Integer dispositionCode,
        BigDecimal allowedPortion,
        String message,
        boolean claimsNoHarm) {
}
