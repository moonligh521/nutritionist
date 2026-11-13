package com.moonligh.nutritionist.domain.safety;

import com.fasterxml.jackson.annotation.JsonValue;

public enum SafetyPermission {
    ALLOWED(1, 0),
    NEED_MORE_DATA(2, 1),
    HUMAN_REVIEW(3, 2),
    STOP(4, 3);

    private final int code;
    private final int severity;

    SafetyPermission(int code, int severity) {
        this.code = code;
        this.severity = severity;
    }

    @JsonValue
    public int code() {
        return code;
    }

    public int severity() {
        return severity;
    }
}
