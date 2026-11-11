package com.moonligh.nutritionist.domain.safety;

import java.util.List;

public record SafetyDecision(
        SafetyPermission permission,
        List<SafetyReasonCategory> reasonCategories,
        List<ActionDisposition> actionDispositions,
        List<String> decisionReasonCodes) {

    public SafetyDecision {
        reasonCategories = List.copyOf(reasonCategories);
        actionDispositions = List.copyOf(actionDispositions);
        decisionReasonCodes = List.copyOf(decisionReasonCodes);
    }
}
