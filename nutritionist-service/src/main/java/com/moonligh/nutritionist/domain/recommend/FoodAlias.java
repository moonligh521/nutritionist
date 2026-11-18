package com.moonligh.nutritionist.domain.recommend;

/** 食材口语别名 → 标准食材编号。 */
public record FoodAlias(String alias, String foodId) {

    public FoodAlias {
        alias = alias == null ? "" : alias.trim();
        foodId = foodId == null ? "" : foodId.trim();
    }

    public boolean usable() {
        return !alias.isBlank() && !foodId.isBlank();
    }
}
