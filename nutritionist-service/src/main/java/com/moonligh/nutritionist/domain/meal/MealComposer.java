package com.moonligh.nutritionist.domain.meal;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.nutrition.DataQualityDisposition;
import com.moonligh.nutritionist.domain.nutrition.FoodItem;
import com.moonligh.nutritionist.domain.nutrition.IngredientNutritionCalculator;
import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.nutrition.NutritionDataQualityPolicy;
import com.moonligh.nutritionist.domain.nutrition.StapleFoods;
import com.moonligh.nutritionist.domain.recipe.MealPracticalityValidator;
import com.moonligh.nutritionist.domain.recipe.Recipe;
import com.moonligh.nutritionist.domain.recipe.RecipeStatus;
import com.moonligh.nutritionist.domain.recipe.StapleRecipes;
import com.moonligh.nutritionist.domain.solver.CandidateNutrient;
import com.moonligh.nutritionist.domain.solver.NutritionSolver;
import com.moonligh.nutritionist.domain.solver.OjalgoSolverAdapter;
import com.moonligh.nutritionist.domain.solver.SolverCandidate;
import com.moonligh.nutritionist.domain.solver.SolverConflict;
import com.moonligh.nutritionist.domain.solver.SolverConstraint;
import com.moonligh.nutritionist.domain.solver.SolverInfeasibleException;
import com.moonligh.nutritionist.domain.solver.SolverRequest;
import com.moonligh.nutritionist.domain.solver.SolverResult;

/**
 * 不调用模型。已发布菜的一份营养交给求解器，病种上限是硬约束。
 * 无解时抛出冲突，不另编一餐。
 */
@Component
public class MealComposer {

    private static final BigDecimal PORTION = BigDecimal.ONE;
    private static final MealPracticalityValidator PRACTICALITY =
            new MealPracticalityValidator(new BigDecimal("10"), 12);

    private final NutritionSolver solver;
    private final List<Recipe> recipes;
    private final List<FoodItem> foods;
    private final IngredientNutritionCalculator calculator = new IngredientNutritionCalculator();
    private final NutritionDataQualityPolicy qualityPolicy = new NutritionDataQualityPolicy("critical-known");

    public MealComposer() {
        this(new OjalgoSolverAdapter(), StapleRecipes.published(), StapleFoods.all());
    }

    public MealComposer(NutritionSolver solver, List<Recipe> recipes, List<FoodItem> foods) {
        this.solver = solver;
        this.recipes = List.copyOf(recipes);
        this.foods = List.copyOf(foods);
    }

    public MealPlan compose(List<SolverConstraint> diseaseConstraints) {
        return compose(new MealOrder(diseaseConstraints, 100, List.of(), false, List.of(), List.of()));
    }

    public MealPlan compose(MealOrder order) {
        List<Recipe> published = recipes.stream()
                .filter(recipe -> recipe.status() == RecipeStatus.PUBLISHED)
                .filter(recipe -> !order.excludedFoodIds().contains(recipe.ingredients().getFirst().foodItemId()))
                .filter(recipe -> PRACTICALITY.validate(recipe).practical())
                .toList();
        if (order.onlyAvailable()) {
            published = published.stream().filter(recipe -> inStock(recipe, order)).toList();
        }
        Set<NutrientType> critical = criticalNutrients(order);
        published = published.stream()
                .filter(recipe -> qualityPolicy.evaluate(food(recipe.ingredients().getFirst().foodItemId()), critical)
                        .disposition() != DataQualityDisposition.REJECT)
                .toList();
        if (published.isEmpty()) {
            throw infeasible(order);
        }
        if (order.preferAvailable() && !order.onlyAvailable()) {
            List<Recipe> stocked = published.stream().filter(recipe -> inStock(recipe, order)).toList();
            if (!stocked.isEmpty()) {
                try {
                    return solve(stocked, order, List.of());
                } catch (SolverInfeasibleException ignored) {
                    return solve(published, order, missing(published, order));
                }
            }
            return solve(published, order, missing(published, order));
        }
        return solve(published, order, List.of());
    }

    private MealPlan solve(List<Recipe> published, MealOrder order, List<String> missingFoodIds) {
        List<SolverCandidate> candidates = published.stream().map(recipe -> candidate(recipe, order)).toList();
        List<SolverConstraint> constraints = new ArrayList<>(remaining(order));
        constraints.add(energyTarget(candidates, order.mealSharePercent()));
        SolverResult solved = solver.solve(new SolverRequest(candidates, constraints));
        List<MealPlan.Dish> dishes = new ArrayList<>();
        for (int index = 0; index < published.size(); index++) {
            BigDecimal portions = solved.quantities().get(index).quantity();
            MealPlan.Dish served = dish(published.get(index), portions);
            if (served.ingredients().getFirst().grams().compareTo(new BigDecimal("10")) < 0) {
                continue;
            }
            dishes.add(served);
        }
        if (dishes.isEmpty()) {
            throw infeasible(order);
        }
        List<String> stillMissing = missingFoodIds.stream()
                .filter(foodId -> dishes.stream().anyMatch(item -> item.ingredients().getFirst().foodItemId().equals(foodId)))
                .toList();
        return new MealPlan(List.copyOf(dishes), false, stillMissing);
    }

    private List<String> missing(List<Recipe> published, MealOrder order) {
        return published.stream()
                .map(recipe -> recipe.ingredients().getFirst().foodItemId())
                .filter(foodId -> stock(order, foodId) == null)
                .distinct()
                .toList();
    }

    private static SolverInfeasibleException infeasible(MealOrder order) {
        List<SolverConflict> conflicts = order.constraints().stream()
                .filter(SolverConstraint::hard)
                .map(constraint -> new SolverConflict(
                        constraint.constraintId(),
                        constraint.nutrientType(),
                        constraint.minimum(),
                        constraint.maximum(),
                        BigDecimal.ZERO,
                        BigDecimal.ZERO))
                .toList();
        return new SolverInfeasibleException(conflicts);
    }

    private static Set<NutrientType> criticalNutrients(MealOrder order) {
        return order.constraints().stream()
                .filter(constraint -> constraint.hard() && (constraint.minimum() != null || constraint.maximum() != null))
                .map(SolverConstraint::nutrientType)
                .collect(Collectors.toSet());
    }

    private boolean inStock(Recipe recipe, MealOrder order) {
        return stock(order, recipe.ingredients().getFirst().foodItemId()) != null;
    }

    private SolverCandidate candidate(Recipe recipe, MealOrder order) {
        FoodItem food = food(recipe.ingredients().getFirst().foodItemId());
        BigDecimal grams = recipe.ingredients().getFirst().quantity();
        BigDecimal maximum = PORTION;
        MealOrder.Stock stock = stock(order, food.foodItemId());
        if (stock != null && grams.signum() > 0) {
            maximum = stock.availableGrams().divide(grams, 6, RoundingMode.HALF_UP).min(PORTION);
            if (maximum.signum() < 0) {
                maximum = BigDecimal.ZERO;
            }
        }
        List<CandidateNutrient> nutrients = calculator.calculate(food, grams).stream()
                .filter(nutrient -> nutrient.value() != null)
                .map(nutrient -> new CandidateNutrient(nutrient.type(), nutrient.value()))
                .toList();
        BigDecimal weight = order.deprioritizedFoodIds().contains(food.foodItemId()) ? BigDecimal.ONE : BigDecimal.ZERO;
        return new SolverCandidate(recipe.recipeId(), maximum, nutrients, weight);
    }

    List<SolverConstraint> remaining(MealOrder order) {
        List<SolverConstraint> adjusted = new ArrayList<>();
        for (SolverConstraint constraint : order.constraints()) {
            if (!constraint.hard()) {
                adjusted.add(soften(order, constraint));
                continue;
            }
            if (constraint.minimum() == null && constraint.maximum() == null) {
                adjusted.add(constraint);
                continue;
            }
            BigDecimal used = eaten(order.eaten(), constraint.nutrientType());
            BigDecimal minimum = constraint.minimum();
            if (minimum != null) {
                minimum = minimum.subtract(used);
                if (minimum.signum() < 0) {
                    minimum = BigDecimal.ZERO;
                }
            }
            BigDecimal maximum = constraint.maximum() == null ? null : constraint.maximum().subtract(used);
            adjusted.add(new SolverConstraint(
                    constraint.constraintId(),
                    constraint.nutrientType(),
                    minimum,
                    maximum,
                    constraint.target(),
                    true));
        }
        return adjusted;
    }

    private SolverConstraint soften(MealOrder order, SolverConstraint constraint) {
        if (constraint.target() == null) {
            return constraint;
        }
        BigDecimal target = constraint.target().subtract(eaten(order.eaten(), constraint.nutrientType()));
        if (target.signum() < 0) {
            target = BigDecimal.ZERO;
        }
        return new SolverConstraint(
                constraint.constraintId(),
                constraint.nutrientType(),
                constraint.minimum(),
                constraint.maximum(),
                target,
                false);
    }

    private BigDecimal eaten(List<MealOrder.Eaten> eaten, NutrientType type) {
        BigDecimal total = BigDecimal.ZERO;
        for (MealOrder.Eaten item : eaten) {
            FoodItem known = foods.stream().filter(food -> food.foodItemId().equals(item.foodItemId())).findFirst().orElse(null);
            if (known == null) {
                continue;
            }
            total = total.add(calculator.calculate(known, item.grams()).stream()
                    .filter(nutrient -> nutrient.type() == type && nutrient.value() != null)
                    .map(nutrient -> nutrient.value())
                    .findFirst()
                    .orElse(BigDecimal.ZERO));
        }
        return total;
    }

    private static SolverConstraint energyTarget(List<SolverCandidate> candidates, int mealSharePercent) {
        BigDecimal energy = candidates.stream()
                .map(candidate -> amount(candidate, NutrientType.ENERGY))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        int share = mealSharePercent <= 0 ? 100 : Math.min(mealSharePercent, 100);
        BigDecimal target = energy.multiply(BigDecimal.valueOf(share)).divide(new BigDecimal("100"), 6, RoundingMode.HALF_UP);
        return new SolverConstraint("meal-energy-target", NutrientType.ENERGY, null, null, target, false);
    }

    private static MealOrder.Stock stock(MealOrder order, String foodItemId) {
        return order.stocks().stream().filter(item -> item.foodItemId().equals(foodItemId)).findFirst().orElse(null);
    }

    private MealPlan.Dish dish(Recipe recipe, BigDecimal portions) {
        List<MealPlan.IngredientGrams> ingredients = recipe.ingredients().stream()
                .map(item -> new MealPlan.IngredientGrams(
                        item.foodItemId(),
                        item.quantity().multiply(portions).setScale(1, RoundingMode.HALF_UP)))
                .toList();
        return new MealPlan.Dish(recipe.recipeId(), portions, ingredients, recipe.steps());
    }

    private FoodItem food(String foodItemId) {
        return foods.stream()
                .filter(item -> item.foodItemId().equals(foodItemId))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("food " + foodItemId));
    }

    private static BigDecimal amount(SolverCandidate candidate, NutrientType type) {
        return candidate.nutrients().stream()
                .filter(nutrient -> nutrient.nutrientType() == type)
                .map(CandidateNutrient::amountPerUnit)
                .findFirst()
                .orElse(BigDecimal.ZERO);
    }
}
