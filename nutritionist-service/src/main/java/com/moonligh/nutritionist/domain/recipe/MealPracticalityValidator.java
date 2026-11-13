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
        boolean stepsReady = recipe.steps() != null
                && !recipe.steps().isEmpty()
                && recipe.steps().stream().allMatch(step -> step.instruction() != null && !step.instruction().isBlank());
        boolean toolReady = recipe.cookware() != null && !recipe.cookware().isBlank();
        boolean notFried = recipe.steps() == null
                || recipe.steps().stream().noneMatch(step -> step.instruction() != null
                        && (step.instruction().contains("炸") || step.instruction().contains("煎")));
        boolean practical = tinyIngredients.isEmpty()
                && recipe.ingredients().size() <= maximumFragments
                && stepsReady
                && toolReady
                && notFried;
        return new PracticalityResult(practical, tinyIngredients, practical ? null : "portion-or-fragmentation");
    }

    public record PracticalityResult(boolean practical, List<String> affectedFoodItemIds, String reasonCode) {

        public PracticalityResult {
            affectedFoodItemIds = List.copyOf(affectedFoodItemIds);
        }
    }
}
