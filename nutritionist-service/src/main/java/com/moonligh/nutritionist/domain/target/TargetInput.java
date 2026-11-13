package com.moonligh.nutritionist.domain.target;

import java.math.BigDecimal;

public record TargetInput(
        Integer age,
        Integer sexCode,
        BigDecimal heightCm,
        BigDecimal weightKg,
        BigDecimal activityFactor) {

    public boolean complete() {
        return age != null
                && sexCode != null
                && heightCm != null
                && weightKg != null
                && activityFactor != null;
    }
}
