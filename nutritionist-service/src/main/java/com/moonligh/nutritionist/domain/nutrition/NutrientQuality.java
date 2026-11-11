package com.moonligh.nutritionist.domain.nutrition;

public enum NutrientQuality {
    KNOWN(1),
    ESTIMATED(2),
    UNKNOWN(3),
    NOT_APPLICABLE(4);

    private final int code;

    NutrientQuality(int code) {
        this.code = code;
    }

    public int code() {
        return code;
    }
}
