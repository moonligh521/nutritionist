package com.moonligh.nutritionist.domain.safety;

import com.fasterxml.jackson.annotation.JsonValue;

public enum SafetyReasonCategory {
    ACUTE_RISK(1),
    MALNUTRITION_RISK(2),
    MEDICATION_RISK(3),
    DATA_QUALITY(4),
    CONTRAINDICATION(5),
    CONSTRAINT_CONFLICT(6),
    PROFESSIONAL_TARGET_INVALID(7),
    OUT_OF_SCOPE(8);

    private final int code;

    SafetyReasonCategory(int code) {
        this.code = code;
    }

    @JsonValue
    public int code() {
        return code;
    }
}
