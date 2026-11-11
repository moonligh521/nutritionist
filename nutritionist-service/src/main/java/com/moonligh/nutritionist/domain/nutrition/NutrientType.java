package com.moonligh.nutritionist.domain.nutrition;

public enum NutrientType {
    ENERGY(1),
    PROTEIN(2),
    CARBOHYDRATE(3),
    FAT(4),
    FIBER(5),
    SODIUM(6),
    POTASSIUM(7),
    PHOSPHORUS(8);

    private final int code;

    NutrientType(int code) {
        this.code = code;
    }

    public int code() {
        return code;
    }
}
