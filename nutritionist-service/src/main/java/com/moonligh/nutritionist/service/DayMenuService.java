package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.meal.MealComposer;
import com.moonligh.nutritionist.domain.meal.MealOrder;
import com.moonligh.nutritionist.domain.meal.MealPlan;
import com.moonligh.nutritionist.domain.nutrition.FoodItem;
import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.nutrition.WeightLossFoods;
import com.moonligh.nutritionist.domain.recipe.WeightLossRecipes;
import com.moonligh.nutritionist.domain.safety.ObesityDietInitialization;
import com.moonligh.nutritionist.domain.solver.OjalgoSolverAdapter;
import com.moonligh.nutritionist.domain.solver.SolverConstraint;
import com.moonligh.nutritionist.domain.target.ChineseDri2023Energy;

/** 按已发布减重菜和当日额度配一天。不调用模型，克数来自求解结果。 */
@Service
public class DayMenuService {

    private static final BigDecimal STOCKED = new BigDecimal("5000");
    private static final List<String> ALWAYS = List.of("654", "668", "672");
    private static final Set<String> BREAKFAST = Set.of(
            WeightLossRecipes.OAT_MILK,
            WeightLossRecipes.OATS_WATER,
            WeightLossRecipes.BREAD_MILK,
            WeightLossRecipes.BOILED_EGG,
            WeightLossRecipes.YOGURT,
            WeightLossRecipes.APPLE,
            WeightLossRecipes.BANANA);

    private final MealComposer meals = new MealComposer(
            new OjalgoSolverAdapter(), WeightLossRecipes.published(), WeightLossFoods.all());

    public DayMenu plan(int sex, int age, int activity, String mode, List<String> ownedFoodIds) {
        if (sex != 1 && sex != 2) {
            throw new IllegalArgumentException("性别无法估算");
        }
        if (age < 18) {
            throw new IllegalArgumentException("未满 18 岁不估算");
        }
        if (activity < 1 || activity > 3 || (age >= 65 && activity == 3)) {
            throw new IllegalArgumentException("这个年龄或活动量不估算");
        }
        BigDecimal need = ChineseDri2023Energy.kcal(sex, age, activity)
                .orElseThrow(() -> new IllegalArgumentException("这个年龄或活动量不估算"));
        BigDecimal energy = target(need, sex, mode);
        List<SolverConstraint> limits = List.of(
                new SolverConstraint("day:ENERGY", NutrientType.ENERGY, null, energy, null, true),
                new SolverConstraint("day:PROTEIN", NutrientType.PROTEIN,
                        ChineseDri2023Energy.proteinGrams(sex, age).orElse(null), null, null, true),
                new SolverConstraint("day:FAT", NutrientType.FAT, null, ChineseDri2023Energy.fatMaximumGrams(energy), null, true),
                new SolverConstraint("day:FIBER", NutrientType.FIBER, ChineseDri2023Energy.FIBER_AI_MINIMUM_GRAMS, null, null, true));
        boolean limited = ownedFoodIds != null && !ownedFoodIds.isEmpty();
        List<MealOrder.Stock> stocks = new ArrayList<>();
        if (limited) {
            ownedFoodIds.forEach(id -> stocks.add(new MealOrder.Stock(id, STOCKED)));
            ALWAYS.forEach(id -> stocks.add(new MealOrder.Stock(id, STOCKED)));
        }
        MealPlan solved = meals.compose(new MealOrder(
                limits, 100, stocks, limited, List.of(), List.of(), false));
        List<DishView> dishes = solved.dishes().stream()
                .map(this::view)
                .filter(dish -> dish.energy() >= 40)
                .sorted(Comparator.comparingInt(DishView::energy).reversed())
                .toList();
        return assign(energy.intValue(), dishes);
    }

    private static BigDecimal target(BigDecimal need, int sex, String mode) {
        if ("keep".equals(mode) || "home".equals(mode)) {
            return need;
        }
        if ("gain".equals(mode)) {
            return need.multiply(new BigDecimal("1.1")).setScale(0, RoundingMode.HALF_UP);
        }
        BigDecimal ceiling = ObesityDietInitialization.energyCeiling(need, false);
        BigDecimal floor = sex == 2 ? new BigDecimal("1200") : new BigDecimal("1500");
        return ceiling.max(floor);
    }

    private DishView view(MealPlan.Dish dish) {
        List<IngredientView> ingredients = dish.ingredients().stream()
                .map(item -> {
                    FoodItem food = WeightLossFoods.find(item.foodItemId());
                    return new IngredientView(item.foodItemId(), food == null ? item.foodItemId() : food.displayName(), item.grams());
                })
                .toList();
        return new DishView(dish.recipeId(), dish.portions(), energy(dish), ingredients);
    }

    private static int energy(MealPlan.Dish dish) {
        BigDecimal total = BigDecimal.ZERO;
        for (MealPlan.IngredientGrams item : dish.ingredients()) {
            FoodItem food = WeightLossFoods.find(item.foodItemId());
            if (food == null || item.grams() == null) {
                continue;
            }
            BigDecimal per100 = food.nutrients().stream()
                    .filter(nutrient -> nutrient.type() == NutrientType.ENERGY)
                    .map(nutrient -> nutrient.value())
                    .filter(value -> value != null)
                    .findFirst()
                    .orElse(null);
            if (per100 == null) {
                continue;
            }
            total = total.add(per100.multiply(item.grams()).divide(new BigDecimal("100"), 6, RoundingMode.HALF_UP));
        }
        return total.setScale(0, RoundingMode.HALF_UP).intValue();
    }

    private static DayMenu assign(int target, List<DishView> dishes) {
        int breakfastBudget = target * 30 / 100;
        List<DishView> breakfast = new ArrayList<>();
        List<DishView> lunch = new ArrayList<>();
        List<DishView> dinner = new ArrayList<>();
        int breakfastEnergy = 0;
        int lunchEnergy = 0;
        int dinnerEnergy = 0;
        for (DishView dish : dishes) {
            if (BREAKFAST.contains(dish.id()) && breakfastEnergy + dish.energy() <= breakfastBudget + 80) {
                breakfast.add(dish);
                breakfastEnergy += dish.energy();
                continue;
            }
            if (lunchEnergy <= dinnerEnergy) {
                lunch.add(dish);
                lunchEnergy += dish.energy();
            } else {
                dinner.add(dish);
                dinnerEnergy += dish.energy();
            }
        }
        return new DayMenu(target, List.copyOf(breakfast), List.copyOf(lunch), List.copyOf(dinner));
    }

    public record DayMenu(int energyTarget, List<DishView> breakfast, List<DishView> lunch, List<DishView> dinner) {
    }

    public record DishView(String id, BigDecimal portions, int energy, List<IngredientView> ingredients) {
    }

    public record IngredientView(String foodId, String name, BigDecimal grams) {
    }
}
