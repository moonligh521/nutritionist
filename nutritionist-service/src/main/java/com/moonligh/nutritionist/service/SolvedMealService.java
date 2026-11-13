package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.domain.meal.MealPlan;
import com.moonligh.nutritionist.domain.recipe.RecipeStep;
import com.moonligh.nutritionist.infrastructure.persistence.SolvedMealMapper;
import com.moonligh.nutritionist.infrastructure.persistence.SolvedMealMapper.DishRow;

/**
 * 按患者和日期保存求解出的一餐。进程内没有时从数据库读回。
 */
@Service
public class SolvedMealService {

    private final EntityTable<StoredMeal> meals = new EntityTable<>(StoredMeal::id);
    private final SolvedMealMapper database;

    public SolvedMealService() {
        this.database = null;
    }

    @Autowired
    public SolvedMealService(ObjectProvider<SolvedMealMapper> database) {
        this.database = database.getIfAvailable();
    }

    public void save(String patientId, LocalDate date, MealPlan plan) {
        StoredMeal stored = new StoredMeal(key(patientId, date), patientId, date, plan);
        meals.save(stored);
        if (database != null) {
            replace(stored);
        }
    }

    public MealPlan find(String patientId, LocalDate date) {
        StoredMeal cached = meals.find(key(patientId, date)).orElse(null);
        if (cached != null) {
            return cached.plan();
        }
        if (database == null) {
            throw new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE);
        }
        MealPlan loaded = load(patientId, date);
        meals.save(new StoredMeal(key(patientId, date), patientId, date, loaded));
        return loaded;
    }

    private void replace(StoredMeal stored) {
        database.deleteDishes(stored.patientId(), stored.date());
        database.deleteShortages(stored.patientId(), stored.date());
        for (String foodId : stored.plan().missingFoodIds()) {
            database.insertShortage(stored.patientId(), stored.date(), foodId);
        }
        int remainder = stored.plan().representsDailyRemainder() ? 1 : 0;
        for (MealPlan.Dish dish : stored.plan().dishes()) {
            String foodId = dish.ingredients().isEmpty() ? "" : dish.ingredients().getFirst().foodItemId();
            BigDecimal grams = dish.ingredients().isEmpty() ? BigDecimal.ZERO : dish.ingredients().getFirst().grams();
            String step = dish.steps().isEmpty() ? "" : dish.steps().getFirst().instruction();
            database.insertDish(
                    stored.patientId(), stored.date(), dish.recipeId(), dish.portions(), foodId, grams, step, remainder);
        }
    }

    private MealPlan load(String patientId, LocalDate date) {
        List<MealPlan.Dish> dishes = new ArrayList<>();
        for (DishRow row : database.findDishes(patientId, date)) {
            dishes.add(new MealPlan.Dish(
                    row.recipeId(),
                    row.portions(),
                    List.of(new MealPlan.IngredientGrams(row.foodItemId(), row.grams())),
                    List.of(new RecipeStep(1, row.stepText()))));
        }
        List<Integer> flags = database.findRemainder(patientId, date);
        if (dishes.isEmpty()) {
            throw new BusinessException(ErrorCode.PLAN_NOT_CONFIRMABLE);
        }
        List<String> missing = database.findShortages(patientId, date);
        boolean remainder = !flags.isEmpty() && flags.getFirst() != null && flags.getFirst() == 1;
        return new MealPlan(dishes, remainder, missing);
    }

    private static String key(String patientId, LocalDate date) {
        return patientId + "|" + date;
    }

    private record StoredMeal(String id, String patientId, LocalDate date, MealPlan plan) {
    }
}
