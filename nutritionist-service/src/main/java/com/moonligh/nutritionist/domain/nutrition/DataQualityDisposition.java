package com.moonligh.nutritionist.domain.nutrition;

public enum DataQualityDisposition {
    ACCEPT(1),
    RESTRICT(2),
    REJECT(3);

    private final int code;

    DataQualityDisposition(int code) {
        this.code = code;
    }

    public int code() {
        return code;
    }
}
