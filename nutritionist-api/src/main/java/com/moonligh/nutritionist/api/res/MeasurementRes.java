package com.moonligh.nutritionist.api.res;

import java.util.List;

public record MeasurementRes(
        String measurementId,
        Integer decisionCode,
        Integer safetyPermissionCode,
        List<Integer> reasonCategoryCodes,
        List<Integer> actionDispositionCodes) {

    public MeasurementRes {
        reasonCategoryCodes = reasonCategoryCodes == null ? List.of() : List.copyOf(reasonCategoryCodes);
        actionDispositionCodes = actionDispositionCodes == null ? List.of() : List.copyOf(actionDispositionCodes);
    }
}
