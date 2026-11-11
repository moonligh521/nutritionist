package com.moonligh.nutritionist.domain.nutrition;

public enum NutrientUnit {
    KILOCALORIE(1),
    GRAM(2),
    MILLIGRAM(3);

    private final int code;

    NutrientUnit(int code) {
        this.code = code;
    }

    public int code() {
        return code;
    }
}
