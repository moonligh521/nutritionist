package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.api.req.CreateConditionReq;
import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.domain.meal.MealPlan;
import com.moonligh.nutritionist.domain.profile.InMemoryProfileRepository;
import com.moonligh.nutritionist.domain.nutrition.IngredientNutritionCalculator;
import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.nutrition.StapleFoods;
import com.moonligh.nutritionist.domain.safety.DiabetesDietInitialization;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;

class DiabetesPlanningTest {

    private ClinicalRecordService records;
    private ProfessionalTargetService targets;
    private DiabetesPlanningService planning;

    @BeforeEach
    void setUp() {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        PatientBindingService bindings = new PatientBindingService(new InMemoryPatientBindingStore(), gateway);
        bindings.bind("acc-1", "pat-1", "pv1");
        records = new ClinicalRecordService(bindings);
        targets = new ProfessionalTargetService();
        planning = new DiabetesPlanningService(records, targets);
    }

    @Test
    void diabetesWithoutEnergyTargetUsesSodiumCeilingOnly() {
        records.addCondition("acc-1", condition("DIABETES"));

        var limits = planning.constraints("pat-1", Instant.now());

        assertEquals(1, limits.size());
        assertEquals(NutrientType.SODIUM, limits.getFirst().nutrientType());
        assertEquals(DiabetesDietInitialization.SODIUM_MAXIMUM_MG, limits.getFirst().maximum());
    }

    @Test
    void professionalEnergyCeilingSetsCarbohydrateUpperBound() {
        records.addCondition("acc-1", condition("PREDIABETES"));
        targets.create("nutritionist_pro", new ProfessionalTargetService.CreateRequest(
                "pat-1",
                "ENERGY",
                new BigDecimal("1600"),
                new BigDecimal("2000"),
                Instant.now().minusSeconds(60),
                Instant.now().plusSeconds(3600)));

        var carbohydrate = planning.constraints("pat-1", Instant.now()).stream()
                .filter(limit -> limit.nutrientType() == NutrientType.CARBOHYDRATE)
                .findFirst()
                .orElseThrow();

        assertEquals(new BigDecimal("300.0"), carbohydrate.maximum());
        assertEquals(new BigDecimal("225.0"), DiabetesDietInitialization.carbohydrateMinimumGrams(new BigDecimal("2000")));
    }

    @Test
    void breakfastUsesThirtyPercentOfTheCarbohydrateCeiling() {
        records.addCondition("acc-1", condition("DIABETES"));
        targets.create("nutritionist_pro", new ProfessionalTargetService.CreateRequest(
                "pat-1",
                "ENERGY",
                new BigDecimal("1600"),
                new BigDecimal("2000"),
                Instant.now().minusSeconds(60),
                Instant.now().plusSeconds(3600)));
        PatientBindingService bindings = new PatientBindingService(
                new InMemoryPatientBindingStore(), new FakePatientGateway());
        PantryService pantry = new PantryService(bindings);
        DeterministicRecommendationWork work = new DeterministicRecommendationWork(
                new HypertensionPlanningService(records, targets),
                new HyperlipidemiaPlanningService(records, targets),
                new GoutPlanningService(records, targets),
                new CkdPlanningService(records, targets, new InMemoryProfileRepository()),
                planning,
                new SolvedMealService(),
                pantry,
                new IntakeService(bindings, pantry),
                targets,
                new InMemoryProfileRepository(),
                records);
        MealPlan plan = work.compose(new CreateRecommendationReq(
                "pat-1", "pv1", "profile-1", "pantry-1", 1, 1, LocalDate.parse("2026-11-11"), "Asia/Shanghai", 2));
        BigDecimal carbohydrate = BigDecimal.ZERO;
        for (MealPlan.Dish dish : plan.dishes()) {
            MealPlan.IngredientGrams ingredient = dish.ingredients().getFirst();
            carbohydrate = carbohydrate.add(new IngredientNutritionCalculator()
                    .calculate(StapleFoods.find(ingredient.foodItemId()), ingredient.grams()).stream()
                    .filter(nutrient -> nutrient.type() == NutrientType.CARBOHYDRATE && nutrient.value() != null)
                    .map(nutrient -> nutrient.value())
                    .reduce(BigDecimal.ZERO, BigDecimal::add));
        }

        assertTrue(carbohydrate.compareTo(new BigDecimal("90")) <= 0);
        assertTrue(plan.dishes().stream().noneMatch(dish -> dish.recipeId().equals("staple-oil")));
    }

    @Test
    void fiveGramsOfTableSaltIsTwoThousandMilligramsOfSodium() {
        BigDecimal sodium = new IngredientNutritionCalculator()
                .calculate(StapleFoods.TABLE_SALT, new BigDecimal("5")).stream()
                .filter(nutrient -> nutrient.type() == NutrientType.SODIUM)
                .findFirst()
                .orElseThrow()
                .value();

        assertEquals(0, sodium.compareTo(new BigDecimal("2000")));
        assertTrue(StapleFoods.find("nhc-table-salt") != null);
    }

    private static CreateConditionReq condition(String code) {
        return new CreateConditionReq("pat-1", "pv1", code, null, 1, null);
    }
}
