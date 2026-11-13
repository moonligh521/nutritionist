package com.moonligh.nutritionist.domain.recipe;

public enum RecipeStatus {
    DRAFT(1),
    PUBLISHED(2),
    RETIRED(3);

    private final int code;

    RecipeStatus(int code) {
        this.code = code;
    }

    public int code() {
        return code;
    }

    public static RecipeStatus fromCode(int code) {
        for (RecipeStatus status : values()) {
            if (status.code == code) {
                return status;
            }
        }
        throw new IllegalArgumentException("recipe status " + code);
    }
}
