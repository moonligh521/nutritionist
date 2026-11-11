package com.moonligh.nutritionist.domain.replay;

import java.util.List;

public record CandidateRejectionReason(
        String candidateId,
        int candidateTypeCode,
        String reasonCode,
        String message,
        List<String> constraintIds,
        int capabilityLevel) {

    public CandidateRejectionReason {
        constraintIds = constraintIds == null ? List.of() : List.copyOf(constraintIds);
    }
}