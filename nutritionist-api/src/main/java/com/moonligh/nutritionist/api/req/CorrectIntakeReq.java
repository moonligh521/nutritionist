package com.moonligh.nutritionist.api.req;

import java.util.List;

public record CorrectIntakeReq(
        String eventId,
        String patientId,
        String patientVersion,
        String note,
        List<IntakeItemReq> items) {

    public CorrectIntakeReq {
        items = items == null ? List.of() : List.copyOf(items);
    }
}
