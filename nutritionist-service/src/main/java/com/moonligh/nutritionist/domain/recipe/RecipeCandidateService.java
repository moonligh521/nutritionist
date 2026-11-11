package com.moonligh.nutritionist.domain.recipe;

import java.util.List;

public final class RecipeCandidateService {

    private final List<Recipe> recipes;

    public RecipeCandidateService(List<Recipe> recipes) {
        this.recipes = List.copyOf(recipes);
    }

    public List<Recipe> publishedCandidates() {
        return recipes.stream().filter(recipe -> recipe.status() == RecipeStatus.PUBLISHED).toList();
    }
}
