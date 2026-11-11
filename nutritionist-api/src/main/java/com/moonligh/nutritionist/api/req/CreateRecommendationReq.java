package com.moonligh.nutritionist.api.req;

import java.time.LocalDate;

public record CreateRecommendationReq(
        String patientId,
        String patientVersion,
        String profileVersion,
        String pantryVersion,
        Integer scopeCode,
        Integer mealTypeCode,
        LocalDate date,
        String timezone,
        Integer pantryModeCode) {
}
