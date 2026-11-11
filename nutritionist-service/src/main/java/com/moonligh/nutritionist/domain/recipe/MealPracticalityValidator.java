package com.moonligh.nutritionist.domain.recipe;

import java.math.BigDecimal;
import java.util.List;

public final class MealPracticalityValidator {

    private final BigDecimal minimumIngredientQuantity;
    private final int maximumFragments;

    public MealPracticalityValidator(BigDecimal minimumIngredientQuantity, int maximumFragments) {
        this.minimumIngredientQuantity = minimumIngredientQuantity;
        this.maximumFragments = maximumFragments;
    }

    public PracticalityResult validate(Recipe recipe) {
        List<String> tinyIngredients = recipe.ingredients().stream()
                .filter(ingredient -> ingredient.quantity().compareTo(minimumIngredientQuantity) < 0)
                .map(RecipeIngredient::foodItemId)
                .toList();
        boolean practical = tinyIngredients.isEmpty() && recipe.ingredients().size() <= maximumFragments;
        return new PracticalityResult(practical, tinyIngredients, practical ? null : "portion-or-fragmentation");
    }

    public record PracticalityResult(boolean practical, List<String> affectedFoodItemIds, String reasonCode) {

        public PracticalityResult {
            affectedFoodItemIds = List.copyOf(affectedFoodItemIds);
        }
    }
}
