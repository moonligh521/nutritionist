package com.moonligh.nutritionist.domain.recipe;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.meal.MealComposer;
import com.moonligh.nutritionist.domain.meal.MealPlan;
import com.moonligh.nutritionist.domain.nutrition.WeightLossFoods;
import com.moonligh.nutritionist.domain.solver.OjalgoSolverAdapter;

class WeightLossRecipesTest {

    @Test
    void tomatoEggsUsesTheCatalogTomatoAndListsOilAndSalt() {
        Recipe recipe = WeightLossRecipes.published().stream()
                .filter(item -> item.recipeId().equals("7"))
                .findFirst()
                .orElseThrow();

        assertEquals("138", recipe.ingredients().get(1).foodItemId());
        assertEquals(0, recipe.ingredients().get(2).quantity().compareTo(new BigDecimal("8")));
        assertEquals("668", recipe.ingredients().get(3).foodItemId());
        assertEquals("锅", recipe.cookware());
    }

    @Test
    void composerKeepsEveryIngredientWhenTheDishIsServed() {
        Recipe tomatoEggs = WeightLossRecipes.published().stream()
                .filter(item -> item.recipeId().equals("7"))
                .findFirst()
                .orElseThrow();
        MealComposer composer = new MealComposer(new OjalgoSolverAdapter(), List.of(tomatoEggs), WeightLossFoods.all());

        MealPlan plan = composer.compose(List.of());

        MealPlan.Dish dish = plan.dishes().getFirst();
        assertEquals(4, dish.ingredients().size());
        assertEquals(0, dish.ingredients().get(2).grams().compareTo(new BigDecimal("8.0")));
        assertTrue(dish.ingredients().stream().anyMatch(item -> item.foodItemId().equals("668")));
    }
}
