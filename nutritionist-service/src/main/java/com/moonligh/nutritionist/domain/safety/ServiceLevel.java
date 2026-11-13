package com.moonligh.nutritionist.domain.safety;

import com.fasterxml.jackson.annotation.JsonValue;

public enum ServiceLevel {
    A(1),
    B(2),
    C(3);

    private final int code;

    ServiceLevel(int code) {
        this.code = code;
    }

    @JsonValue
    public int code() {
        return code;
    }
}
