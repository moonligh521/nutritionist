package com.moonligh.nutritionist.domain.meal;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.nutrition.FoodItem;
import com.moonligh.nutritionist.domain.nutrition.FoodNutrient;
import com.moonligh.nutritionist.domain.nutrition.IngredientNutritionCalculator;
import com.moonligh.nutritionist.domain.nutrition.NutrientQuality;
import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.nutrition.NutrientUnit;
import com.moonligh.nutritionist.domain.nutrition.StapleFoods;
import com.moonligh.nutritionist.domain.recipe.StapleRecipes;
import com.moonligh.nutritionist.domain.recipe.Recipe;
import com.moonligh.nutritionist.domain.recipe.RecipeIngredient;
import com.moonligh.nutritionist.domain.recipe.RecipeStatus;
import com.moonligh.nutritionist.domain.recipe.RecipeStep;
import com.moonligh.nutritionist.domain.solver.OjalgoSolverAdapter;
import com.moonligh.nutritionist.domain.solver.SolverConstraint;
import com.moonligh.nutritionist.domain.solver.SolverInfeasibleException;

class MealComposerTest {

    private final MealComposer composer = new MealComposer();

    @Test
    void publishesGramsAndFixedStepsWithoutAModel() {
        MealPlan plan = composer.compose(List.of());

        MealPlan.Dish rice = dish(plan, "staple-rice");
        assertTrue(rice.ingredients().getFirst().grams().compareTo(new BigDecimal("140")) > 0);
        assertTrue(rice.ingredients().getFirst().grams().compareTo(new BigDecimal("150")) <= 0);
        assertEquals("把米饭盛入碗中，不再加盐。", rice.steps().getFirst().instruction());
        assertFalse(plan.dishes().isEmpty());
    }

    @Test
    void unknownSodiumIsNotTreatedAsZeroUnderASodiumCeiling() {
        FoodItem unknownSodium = new FoodItem(
                "unknown-sodium",
                "钠未知",
                "test",
                List.of(new FoodNutrient(
                        NutrientType.SODIUM, null, NutrientUnit.MILLIGRAM, NutrientQuality.UNKNOWN, "test"),
                        new FoodNutrient(
                                NutrientType.ENERGY, new BigDecimal("100"), NutrientUnit.KILOCALORIE,
                                NutrientQuality.KNOWN, "test")));
        Recipe mystery = new Recipe(
                "mystery",
                "1",
                RecipeStatus.PUBLISHED,
                List.of(new RecipeIngredient("unknown-sodium", new BigDecimal("100"), 1)),
                List.of(new RecipeStep(1, "煮熟，不再加盐。")),
                "锅");
        MealComposer custom = new MealComposer(
                new OjalgoSolverAdapter(),
                List.of(StapleRecipes.RICE, mystery),
                List.of(StapleFoods.COOKED_RICE, unknownSodium));
        SolverConstraint sodium = new SolverConstraint(
                "sodium-cap", NutrientType.SODIUM, null, new BigDecimal("50"), null, true);

        MealPlan plan = custom.compose(List.of(sodium));

        assertTrue(plan.dishes().stream().noneMatch(dish -> dish.recipeId().equals("mystery")));
        assertEquals("staple-rice", plan.dishes().getFirst().recipeId());
    }

    @Test
    void sodiumCeilingConflictDoesNotInventAMeal() {
        SolverConstraint sodium = new SolverConstraint(
                "sodium-cap", NutrientType.SODIUM, null, new BigDecimal("0.1"), null, true);
        SolverConstraint energy = new SolverConstraint(
                "energy-min", NutrientType.ENERGY, new BigDecimal("120"), null, null, true);

        SolverInfeasibleException error = assertThrows(
                SolverInfeasibleException.class, () -> composer.compose(List.of(sodium, energy)));
        assertTrue(error.conflicts().stream().anyMatch(conflict -> conflict.constraintId().equals("sodium-cap")));
    }

    @Test
        void singleMealKeepsRecipePortionInsteadOfAFixedShare() {
        MealPlan fullDay = composer.compose(new MealOrder(List.of(), 100, List.of(), false, List.of(), List.of()));
        MealComposer riceOnly = new MealComposer(
                new OjalgoSolverAdapter(), List.of(StapleRecipes.RICE), StapleFoods.all());
        MealPlan riceFull = riceOnly.compose(new MealOrder(List.of(), 100, List.of(), false, List.of(), List.of()));
        MealPlan riceShare = riceOnly.compose(new MealOrder(List.of(), 40, List.of(), false, List.of(), List.of()));

        assertEquals(
                dish(fullDay, "staple-rice").ingredients().getFirst().grams(),
                composer.compose(List.of()).dishes().stream()
                        .filter(item -> item.recipeId().equals("staple-rice"))
                        .findFirst()
                        .orElseThrow()
                        .ingredients()
                        .getFirst()
                        .grams());
        assertTrue(dish(riceShare, "staple-rice").ingredients().getFirst().grams()
                .compareTo(dish(riceFull, "staple-rice").ingredients().getFirst().grams()) < 0);
    }

    @Test
    void onlyAvailableOmitsFoodsMissingFromPantry() {
        MealPlan plan = composer.compose(new MealOrder(
                List.of(),
                100,
                List.of(new MealOrder.Stock("usda-168878", new BigDecimal("200"))),
                true,
                List.of(),
                List.of()));

        assertEquals(1, plan.dishes().size());
        assertEquals("staple-rice", plan.dishes().getFirst().recipeId());
    }

    @Test
    void eatenFatReducesTheSoftFloor() {
        SolverConstraint floor = new SolverConstraint(
                "fat-floor", NutrientType.FAT, null, null, new BigDecimal("20"), false);
        MealOrder order = new MealOrder(
                List.of(floor),
                100,
                List.of(),
                false,
                List.of(new MealOrder.Eaten(StapleFoods.SOYBEAN_OIL.foodItemId(), new BigDecimal("10"))),
                List.of());

        assertEquals(0, new MealComposer().remaining(order).getFirst().target().compareTo(new BigDecimal("10")));
    }

    @Test
    void eatenProteinReducesTheRemainingMinimum() {
        SolverConstraint protein = new SolverConstraint(
                "protein-floor", NutrientType.PROTEIN, new BigDecimal("80"), null, null, true);
        SolverConstraint energy = new SolverConstraint(
                "energy-cap", NutrientType.ENERGY, null, new BigDecimal("500"), null, true);
        MealPlan plan = composer.compose(new MealOrder(
                List.of(protein, energy),
                100,
                List.of(),
                false,
                List.of(new MealOrder.Eaten("usda-171477", new BigDecimal("100"))),
                List.of()));

        assertTrue(total(plan, NutrientType.PROTEIN).compareTo(new BigDecimal("80")) < 0);
        assertTrue(total(plan, NutrientType.ENERGY).compareTo(new BigDecimal("500")) <= 0);
    }

    @Test
    void eatenSodiumReducesTheRemainingCeiling() {
        SolverConstraint sodium = new SolverConstraint(
                "sodium-cap", NutrientType.SODIUM, null, new BigDecimal("80"), null, true);
        MealPlan plan = composer.compose(new MealOrder(
                List.of(sodium),
                100,
                List.of(),
                false,
                List.of(new MealOrder.Eaten("usda-171477", new BigDecimal("100"))),
                List.of()));

        assertTrue(plan.dishes().stream().noneMatch(dish -> dish.recipeId().equals("staple-chicken")));
    }

    @Test
    void portionBelowTenGramsIsNotACandidate() {
        Recipe tiny = new Recipe(
                "tiny-rice",
                "1",
                RecipeStatus.PUBLISHED,
                List.of(new RecipeIngredient("usda-168878", new BigDecimal("1"), 1)),
                List.of(new RecipeStep(1, "用量过小。")));
        MealComposer custom = new MealComposer(new OjalgoSolverAdapter(), List.of(tiny), StapleFoods.all());

        assertThrows(SolverInfeasibleException.class, () -> custom.compose(List.of()));
    }

    @Test
    void preferAvailableUsesStockBeforeOutsideFoods() {
        MealPlan plan = composer.compose(new MealOrder(
                List.of(),
                100,
                List.of(new MealOrder.Stock("usda-168878", new BigDecimal("200"))),
                false,
                List.of(),
                List.of(),
                true));

        assertEquals(1, plan.dishes().size());
        assertEquals("staple-rice", plan.dishes().getFirst().recipeId());
        assertTrue(plan.missingFoodIds().isEmpty());
    }

    @Test
    void publishedMenuMeetsTwentyFiveGramsOfFiberInsideATightDay() {
        MealPlan plan = composer.compose(List.of(
                new SolverConstraint("fiber", NutrientType.FIBER, new BigDecimal("25"), null, null, true),
                new SolverConstraint("energy", NutrientType.ENERGY, null, new BigDecimal("1201"), null, true),
                new SolverConstraint("fat", NutrientType.FAT, null, new BigDecimal("40.0"), null, true),
                new SolverConstraint("protein", NutrientType.PROTEIN, new BigDecimal("62"), null, null, true),
                new SolverConstraint("cholesterol", NutrientType.CHOLESTEROL, null, new BigDecimal("300"), null, true)));
        IngredientNutritionCalculator calculator = new IngredientNutritionCalculator();
        BigDecimal fiber = BigDecimal.ZERO;
        for (MealPlan.Dish dish : plan.dishes()) {
            MealPlan.IngredientGrams ingredient = dish.ingredients().getFirst();
            fiber = fiber.add(calculator.calculate(StapleFoods.find(ingredient.foodItemId()), ingredient.grams()).stream()
                    .filter(nutrient -> nutrient.type() == NutrientType.FIBER && nutrient.value() != null)
                    .map(nutrient -> nutrient.value())
                    .reduce(BigDecimal.ZERO, BigDecimal::add));
        }

        assertTrue(fiber.compareTo(new BigDecimal("25")) >= 0);
    }

    @Test
    void phosphorusAndSaturatedFatCeilingsStayInsideTheServedMeal() {
        MealPlan phosphorus = composer.compose(List.of(new SolverConstraint(
                "phosphorus", NutrientType.PHOSPHORUS, null, new BigDecimal("1000"), null, true)));
        MealPlan saturated = composer.compose(List.of(new SolverConstraint(
                "saturated-fat", NutrientType.SATURATED_FAT, null, new BigDecimal("1.0"), null, true)));

        assertTrue(total(phosphorus, NutrientType.PHOSPHORUS).compareTo(new BigDecimal("1000")) <= 0);
        assertTrue(total(saturated, NutrientType.SATURATED_FAT).compareTo(new BigDecimal("1.0")) <= 0);
    }

    @Test
    void preferAvailableListsFoodsThatMustBeBought() {
        MealPlan plan = composer.compose(new MealOrder(
                List.of(), 100, List.of(), false, List.of(), List.of(), true));

        assertFalse(plan.dishes().isEmpty());
        assertFalse(plan.missingFoodIds().isEmpty());
    }

    private static BigDecimal total(MealPlan plan, NutrientType type) {
        IngredientNutritionCalculator calculator = new IngredientNutritionCalculator();
        BigDecimal sum = BigDecimal.ZERO;
        for (MealPlan.Dish dish : plan.dishes()) {
            MealPlan.IngredientGrams ingredient = dish.ingredients().getFirst();
            sum = sum.add(calculator.calculate(StapleFoods.find(ingredient.foodItemId()), ingredient.grams()).stream()
                    .filter(nutrient -> nutrient.type() == type && nutrient.value() != null)
                    .map(nutrient -> nutrient.value())
                    .reduce(BigDecimal.ZERO, BigDecimal::add));
        }
        return sum;
    }

    private static MealPlan.Dish dish(MealPlan plan, String recipeId) {
        return plan.dishes().stream()
                .filter(item -> item.recipeId().equals(recipeId))
                .findFirst()
                .orElseThrow();
    }
}
