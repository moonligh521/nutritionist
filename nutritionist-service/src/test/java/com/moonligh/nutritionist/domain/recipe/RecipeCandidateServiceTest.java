package com.moonligh.nutritionist.domain.recipe;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.util.List;

import org.junit.jupiter.api.Test;

class RecipeCandidateServiceTest {

    @Test
    void onlyPublishedRecipesBecomeCandidates() {
        RecipeCandidateService service = new RecipeCandidateService(List.of(
                recipe("published", RecipeStatus.PUBLISHED, "30"),
                recipe("draft", RecipeStatus.DRAFT, "30"),
                recipe("retired", RecipeStatus.RETIRED, "30")));

        assertEquals(List.of("published"), service.publishedCandidates().stream().map(Recipe::recipeId).toList());
    }

    @Test
    void practicalityValidatorRejectsTinyFragmentedPortions() {
        MealPracticalityValidator validator = new MealPracticalityValidator(new BigDecimal("5"), 3);

        assertFalse(validator.validate(recipe("tiny", RecipeStatus.PUBLISHED, "2")).practical());
        assertTrue(validator.validate(recipe("normal", RecipeStatus.PUBLISHED, "30")).practical());
    }

    private static Recipe recipe(String id, RecipeStatus status, String grams) {
        return new Recipe(
                id,
                "1",
                status,
                List.of(new RecipeIngredient("food-rice", new BigDecimal(grams), 1)),
                List.of(new RecipeStep(1, "cook")));
    }
}
