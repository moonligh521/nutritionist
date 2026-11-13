package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.dialogue.HouseholdUtterance;
import com.moonligh.nutritionist.domain.meal.MealComposer;
import com.moonligh.nutritionist.domain.meal.MealOrder;
import com.moonligh.nutritionist.domain.meal.MealPlan;
import com.moonligh.nutritionist.domain.nutrition.FoodItem;
import com.moonligh.nutritionist.domain.nutrition.StapleFoods;
import com.moonligh.nutritionist.domain.nutrition.UsdaFoodCatalog;
import com.moonligh.nutritionist.domain.recipe.Recipe;
import com.moonligh.nutritionist.domain.recipe.StapleRecipes;
import com.moonligh.nutritionist.domain.solver.SolverInfeasibleException;

/**
 * 家常话先拆成食材和目标。有已发布菜谱的食材里选出最多三道菜，不必全部用上。
 * 没有成分的食材留在方案外并写明。没有任何可做的菜时不编克数和步骤。
 * 第二天或一个月后再问，读上次保存的方案和说明。
 */
@Service
public class KitchenDialogueService {

    private static final int DISH_LIMIT = 3;
    private static final Set<String> STAPLES = Set.of(
            StapleFoods.COOKED_RICE.foodItemId(),
            StapleFoods.DRY_OATS.foodItemId(),
            StapleFoods.COOKED_LENTILS.foodItemId());
    private static final Set<String> PROTEINS = Set.of(
            StapleFoods.ROASTED_CHICKEN_BREAST.foodItemId(),
            StapleFoods.FIRM_TOFU.foodItemId(),
            StapleFoods.WHOLE_EGG.foodItemId(),
            StapleFoods.ATLANTIC_SALMON.foodItemId());
    private static final Set<String> PRODUCE = Set.of(
            StapleFoods.BOILED_SPINACH.foodItemId(),
            StapleFoods.RAW_APPLE.foodItemId());

    private final DialogueMemory memory;
    private final IntakeService intakes;

    public KitchenDialogueService(DialogueMemory memory, IntakeService intakes) {
        this.memory = memory;
        this.intakes = intakes;
    }

    public Reply handle(String patientId, String text, LocalDate date) {
        LocalDate day = date == null ? LocalDate.now() : date;
        HouseholdUtterance.Parsed parsed = HouseholdUtterance.parse(text);
        if (parsed.recall()) {
            return recall(patientId, day);
        }
        List<FoodNote> notes = new ArrayList<>();
        List<String> missing = new ArrayList<>();
        List<String> withoutRecipe = new ArrayList<>();
        List<Prepared> ready = new ArrayList<>();
        for (HouseholdUtterance.Mention mention : parsed.mentions()) {
            FoodItem known = match(mention.name());
            Recipe recipe = known == null ? null : recipeFor(known.foodItemId());
            boolean composition = known != null;
            if (!composition) {
                missing.add(mention.name());
            } else if (recipe == null) {
                withoutRecipe.add(mention.name());
            } else {
                ready.add(new Prepared(mention.name(), known, recipe, mention.grams()));
            }
            notes.add(new FoodNote(mention.name(), known == null ? null : known.foodItemId(), mention.grams(), composition, recipe != null));
        }
        List<Prepared> chosen = choose(ready);
        MealPlan meal = null;
        String explanation;
        if (chosen.isEmpty() && !withoutRecipe.isEmpty()) {
            explanation = aside(missing, withoutRecipe, List.of());
        } else if (chosen.isEmpty() && !missing.isEmpty()) {
            explanation = "这些食材还没有带来源的成分数据，不能编减肥餐的克数和步骤：" + String.join("、", missing)
                    + "。请先确认每种有多少。个数、一颗、一把还不能换成克。";
        } else if (chosen.isEmpty()) {
            explanation = "食材有成分，但还没有已发布菜谱，不能编步骤。";
        } else {
            try {
                meal = solve(chosen);
                List<String> unused = ready.stream()
                        .filter(item -> chosen.stream().noneMatch(picked -> picked.recipe().recipeId().equals(item.recipe().recipeId())))
                        .map(Prepared::name)
                        .toList();
                explanation = steps(meal) + aside(missing, withoutRecipe, unused);
                if ("WEIGHT_LOSS".equals(parsed.goalCode())) {
                    explanation = "对话里的减肥还没有写成病情或专业能量目标，下面不是收紧后的热量方案。" + explanation;
                }
            } catch (SolverInfeasibleException error) {
                explanation = "这些已发布菜谱在当前约束下无解，没有另编一餐。";
            }
        }
        memory.append(patientId, new DialogueMemory.Turn(day, parsed.goalCode(), names(notes), List.copyOf(missing), explanation, meal));
        return new Reply(patientId, day, parsed.goalCode(), notes, missing, meal, explanation, false);
    }

    private Reply recall(String patientId, LocalDate day) {
        DialogueMemory.Turn prior = memory.latest(patientId).orElse(null);
        if (prior == null) {
            String explanation = "还没有保存过方案。";
            memory.append(patientId, new DialogueMemory.Turn(day, null, List.of(), List.of(), explanation, null));
            return new Reply(patientId, day, null, List.of(), List.of(), null, explanation, true);
        }
        String eaten = eatenNote(patientId);
        String explanation = "上次是 " + prior.date() + "。" + prior.explanation() + eaten;
        return new Reply(patientId, prior.date(), prior.goalCode(), List.of(), prior.missingComposition(), prior.meal(), explanation, true);
    }

    private String eatenNote(String patientId) {
        if (intakes == null) {
            return "还没有确认吃过。";
        }
        List<String> ids = intakes.consumed(patientId).stream().map(item -> item.foodItemId()).distinct().toList();
        if (ids.isEmpty()) {
            return "还没有确认吃过。";
        }
        return "已确认吃过：" + String.join("、", ids) + "。";
    }

    private static List<Prepared> choose(List<Prepared> ready) {
        List<Prepared> selected = new ArrayList<>();
        for (String role : List.of("STAPLE", "PROTEIN", "PRODUCE")) {
            for (Prepared item : ready) {
                if (selected.size() >= DISH_LIMIT) {
                    return selected;
                }
                if (role.equals(roleOf(item)) && selected.stream().noneMatch(picked -> role.equals(roleOf(picked)))) {
                    selected.add(item);
                    break;
                }
            }
        }
        for (Prepared item : ready) {
            if (selected.size() >= DISH_LIMIT) {
                break;
            }
            if ("SEASONING".equals(roleOf(item)) || selected.contains(item)) {
                continue;
            }
            selected.add(item);
        }
        if (selected.isEmpty()) {
            return ready.stream().limit(DISH_LIMIT).toList();
        }
        return selected;
    }

    private static MealPlan solve(List<Prepared> chosen) {
        List<Recipe> recipes = chosen.stream().map(Prepared::recipe).toList();
        List<FoodItem> foods = chosen.stream().map(Prepared::food).toList();
        List<MealOrder.Stock> stocks = new ArrayList<>();
        for (Prepared item : chosen) {
            if (item.grams() != null) {
                stocks.add(new MealOrder.Stock(item.food().foodItemId(), item.grams()));
            }
        }
        MealComposer composer = new MealComposer(new com.moonligh.nutritionist.domain.solver.OjalgoSolverAdapter(), recipes, foods);
        MealPlan solved = stocks.isEmpty()
                ? composer.compose(List.of())
                : composer.compose(new MealOrder(List.of(), 100, stocks, false, List.of(), List.of()));
        return new MealPlan(solved.dishes(), false, List.of());
    }

    private static String aside(List<String> missing, List<String> withoutRecipe, List<String> unused) {
        StringBuilder text = new StringBuilder();
        if (!missing.isEmpty()) {
            text.append("这些还没有成分，没有放进这餐：").append(String.join("、", missing)).append("。");
        }
        if (!withoutRecipe.isEmpty()) {
            text.append("这些有成分但没有已发布菜谱，没有放进这餐：").append(String.join("、", withoutRecipe)).append("。");
        }
        if (!unused.isEmpty()) {
            text.append("家里还有这些没有用上：").append(String.join("、", unused)).append("。");
        }
        return text.toString();
    }

    private static String roleOf(Prepared item) {
        String foodItemId = item.food().foodItemId();
        if (STAPLES.contains(foodItemId)) {
            return "STAPLE";
        }
        if (PROTEINS.contains(foodItemId)) {
            return "PROTEIN";
        }
        if (PRODUCE.contains(foodItemId)) {
            return "PRODUCE";
        }
        if (StapleFoods.SOYBEAN_OIL.foodItemId().equals(foodItemId)) {
            return "SEASONING";
        }
        return "OTHER";
    }

    private static FoodItem match(String name) {
        for (FoodItem food : StapleFoods.all()) {
            if (food.displayName().equals(name) || food.displayName().contains(name) || name.contains(food.displayName())) {
                return food;
            }
        }
        return UsdaFoodCatalog.findHouseholdName(name);
    }

    private static Recipe recipeFor(String foodItemId) {
        for (Recipe recipe : StapleRecipes.published()) {
            if (recipe.ingredients().getFirst().foodItemId().equals(foodItemId)) {
                return recipe;
            }
        }
        return null;
    }

    private static List<String> names(List<FoodNote> notes) {
        return notes.stream().map(FoodNote::name).toList();
    }

    private static String steps(MealPlan meal) {
        StringBuilder text = new StringBuilder();
        for (MealPlan.Dish dish : meal.dishes()) {
            for (MealPlan.IngredientGrams ingredient : dish.ingredients()) {
                text.append(displayName(ingredient.foodItemId()))
                        .append('：')
                        .append(ingredient.grams().toPlainString())
                        .append("克。");
            }
            for (var step : dish.steps()) {
                text.append(step.instruction());
            }
        }
        return text.toString();
    }

    private static String displayName(String foodItemId) {
        for (FoodItem food : StapleFoods.all()) {
            if (food.foodItemId().equals(foodItemId)) {
                return food.displayName();
            }
        }
        return foodItemId;
    }

    public record FoodNote(String name, String foodItemId, BigDecimal grams, boolean compositionKnown, boolean recipeReady) {
    }

    private record Prepared(String name, FoodItem food, Recipe recipe, BigDecimal grams) {
    }

    public record Reply(
            String patientId,
            LocalDate date,
            String goalCode,
            List<FoodNote> foods,
            List<String> missingComposition,
            MealPlan meal,
            String explanation,
            boolean recall) {
    }
}
