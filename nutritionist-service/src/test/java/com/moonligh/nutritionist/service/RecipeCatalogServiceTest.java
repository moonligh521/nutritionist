package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.math.BigDecimal;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.recipe.Recipe;
import com.moonligh.nutritionist.domain.recipe.RecipeIngredient;
import com.moonligh.nutritionist.domain.recipe.RecipeStatus;
import com.moonligh.nutritionist.domain.recipe.RecipeStep;

class RecipeCatalogServiceTest {

    @Test
    void exposesPublishedVersionAndScalesIngredients() {
        RecipeCatalogService service = new RecipeCatalogService();
        service.register(recipe(RecipeStatus.PUBLISHED));

        assertEquals(new BigDecimal("20"), service.scale("recipe-1", "1", new BigDecimal("2"))
                .ingredients().getFirst().quantity());
    }

    @Test
    void rejectsUnpublishedVersion() {
        RecipeCatalogService service = new RecipeCatalogService();
        service.register(recipe(RecipeStatus.DRAFT));

        BusinessException error = assertThrows(
                BusinessException.class, () -> service.detail("recipe-1", "1"));
        assertEquals(ErrorCode.RECIPE_NOT_PUBLISHED, error.getErrorCode());
    }

    private static Recipe recipe(RecipeStatus status) {
        return new Recipe(
                "recipe-1", "1", status,
                List.of(new RecipeIngredient("food-1", new BigDecimal("10"), 1)),
                List.of(new RecipeStep(1, "cook")));
    }
}
