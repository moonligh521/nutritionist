package com.moonligh.nutritionist.domain.recipe;

import java.util.List;

public record Recipe(
        String recipeId,
        String version,
        RecipeStatus status,
        List<RecipeIngredient> ingredients,
        List<RecipeStep> steps) {

    public Recipe {
        ingredients = List.copyOf(ingredients);
        steps = List.copyOf(steps);
    }
}
