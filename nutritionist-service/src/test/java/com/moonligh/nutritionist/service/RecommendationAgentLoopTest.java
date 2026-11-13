package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.domain.meal.MealPlan;
import com.moonligh.nutritionist.domain.recipe.RecipeStep;
import com.moonligh.nutritionist.domain.workflow.ToolCatalog;

class RecommendationAgentLoopTest {

    @Test
    void modelMayExplainButCannotChangeLockedGrams() {
        AtomicInteger calls = new AtomicInteger();
        RecommendationAgentLoop loop = new RecommendationAgentLoop(
                prompt -> {
                    int attempt = calls.incrementAndGet();
                    if (attempt == 1) {
                        return java.util.Optional.of("{\"tool\":\"read_meal_facts\"}");
                    }
                    if (attempt == 2) {
                        return java.util.Optional.of("""
                                {"explanation":"改成 1 克","items":[{"foodItemId":"usda-168878","grams":"1"}]}
                                """);
                    }
                    return java.util.Optional.of("""
                            {"explanation":"米饭 150 克","items":[{"foodItemId":"usda-168878","grams":"150.0"}]}
                            """);
                },
                null,
                new PresentationStore());

        RecommendationAgentLoop.Result result = loop.present(request(), ricePlan());

        assertEquals(List.of(ToolCatalog.READ_MEAL_FACTS), result.toolCalls());
        assertTrue(result.fromModel());
        assertEquals("米饭 150 克", result.explanation());
    }

    @Test
    void forbiddenToolFallsBackToSolverText() {
        RecommendationAgentLoop loop = new RecommendationAgentLoop(
                prompt -> java.util.Optional.of("{\"tool\":\"update_target\"}"),
                null,
                new PresentationStore());

        RecommendationAgentLoop.Result result = loop.present(request(), ricePlan());

        assertFalse(result.fromModel());
        assertTrue(result.explanation().contains("usda-168878"));
        assertTrue(result.explanation().contains("150"));
        assertTrue(result.toolCalls().isEmpty());
    }

    private static CreateRecommendationReq request() {
        return new CreateRecommendationReq(
                "pat-1", "pv1", "profile-1", "pantry-1", 1, 1, LocalDate.parse("2026-11-11"), "Asia/Shanghai", 2);
    }

    private static MealPlan ricePlan() {
        return new MealPlan(List.of(new MealPlan.Dish(
                "staple-rice",
                BigDecimal.ONE,
                List.of(new MealPlan.IngredientGrams("usda-168878", new BigDecimal("150.0"))),
                List.of(new RecipeStep(1, "把米饭盛入碗中，不再加盐。")))), false, List.of());
    }
}
