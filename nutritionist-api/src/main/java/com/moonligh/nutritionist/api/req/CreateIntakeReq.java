package com.moonligh.nutritionist.api.req;

import java.util.List;

public record CreateIntakeReq(
        String eventId,
        String patientId,
        String patientVersion,
        String mealId,
        List<IntakeItemReq> items) {

    public CreateIntakeReq {
        items = items == null ? List.of() : List.copyOf(items);
    }
}
