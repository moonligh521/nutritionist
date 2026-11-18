package com.moonligh.nutritionist.domain.dialogue;

/** 用户确认或自动纠正的食材映射。 */
public record FoodCorrection(String raw, String canonical) {

    public FoodCorrection {
        raw = raw == null ? "" : raw.trim();
        canonical = canonical == null ? "" : canonical.trim();
    }

    public boolean usable() {
        return !raw.isBlank() && !canonical.isBlank();
    }
}
