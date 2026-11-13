package com.moonligh.nutritionist.domain.outcome;

import com.fasterxml.jackson.annotation.JsonValue;

public enum MeasurementDecision {
    RECORD_ONLY(1),
    KEEP_PLAN(2),
    ADJUST_FUTURE_MEALS(3),
    HUMAN_REVIEW(4),
    STOP(5);

    private final int code;

    MeasurementDecision(int code) {
        this.code = code;
    }

    @JsonValue
    public int code() {
        return code;
    }
}