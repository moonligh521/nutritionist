package com.moonligh.nutritionist.domain.safety;

import com.fasterxml.jackson.annotation.JsonValue;

public enum ActionDisposition {
    CONTINUE(1),
    REQUEST_DATA(2),
    REJECT_ITEM(3),
    KEEP_CONFIRMED_PLAN(4),
    INVALIDATE_FUTURE_MEALS(5),
    RETURN_CONFLICT(6),
    REFER_PROFESSIONAL(7),
    REFER_URGENT(8);

    private final int code;

    ActionDisposition(int code) {
        this.code = code;
    }

    @JsonValue
    public int code() {
        return code;
    }
}
