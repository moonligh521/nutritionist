package com.moonligh.nutritionist.api.req;

import java.util.List;

public record ConfirmPantryReq(
        String patientId,
        String patientVersion,
        String draftId,
        List<ConfirmedPantryItemReq> items) {

    public ConfirmPantryReq {
        items = items == null ? List.of() : List.copyOf(items);
    }
}
