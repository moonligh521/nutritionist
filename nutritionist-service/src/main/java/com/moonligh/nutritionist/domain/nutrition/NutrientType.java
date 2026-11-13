package com.moonligh.nutritionist.domain.nutrition;

public enum NutrientType {
    ENERGY(1),
    PROTEIN(2),
    CARBOHYDRATE(3),
    FAT(4),
    FIBER(5),
    SODIUM(6),
    POTASSIUM(7),
    PHOSPHORUS(8),
    CHOLESTEROL(9),
    SATURATED_FAT(10),
    COOKING_OIL(11),
    WATER(12),
    VITAMIN_E(13),
    CALCIUM(14);

    private final int code;

    NutrientType(int code) {
        this.code = code;
    }

    public int code() {
        return code;
    }
}
