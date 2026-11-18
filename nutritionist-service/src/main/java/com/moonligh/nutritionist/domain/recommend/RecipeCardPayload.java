package com.moonligh.nutritionist.domain.recommend;

import java.math.BigDecimal;
import java.util.List;

/** read_recipe 返回的结构化菜卡（序列化前用对象，不用 Map）。 */
public record RecipeCardPayload(
        boolean found,
        String id,
        String name,
        String version,
        String step,
        List<IngredientLine> ingredients,
        BigDecimal energy) {

    public RecipeCardPayload {
        ingredients = ingredients == null ? List.of() : List.copyOf(ingredients);
        id = id == null ? "" : id;
        name = name == null ? "" : name;
        version = version == null ? "" : version;
        step = step == null ? "" : step;
    }

    public static RecipeCardPayload missing() {
        return new RecipeCardPayload(false, "", "", "", "", List.of(), null);
    }

    public record IngredientLine(String foodId, String name, BigDecimal grams, boolean staple) {
    }
}
