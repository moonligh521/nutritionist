package com.moonligh.nutritionist.domain.nutrition;

import java.util.List;

public record DataQualityDecision(
        DataQualityDisposition disposition,
        String policyVersion,
        List<String> reasonCodes) {

    public DataQualityDecision {
        reasonCodes = List.copyOf(reasonCodes);
    }
}
