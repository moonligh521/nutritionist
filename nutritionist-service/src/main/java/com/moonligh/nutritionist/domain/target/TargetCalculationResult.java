package com.moonligh.nutritionist.domain.target;

import java.util.List;

import com.moonligh.nutritionist.domain.safety.SafetyPermission;

public record TargetCalculationResult(
        SafetyPermission permission,
        String formulaId,
        List<String> reasonCodes) {

    public TargetCalculationResult {
        reasonCodes = List.copyOf(reasonCodes);
    }
}
