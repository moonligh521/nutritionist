package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;

import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.nutritionist.api.req.CreateConditionReq;
import com.moonligh.nutritionist.api.req.CreateMeasurementReq;
import com.moonligh.nutritionist.api.req.CreateMedicationReq;
import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.domain.meal.MealPlan;
import com.moonligh.nutritionist.domain.nutrition.IngredientNutritionCalculator;
import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.nutrition.StapleFoods;
import com.moonligh.nutritionist.domain.profile.InMemoryProfileRepository;
import com.moonligh.nutritionist.domain.profile.Profile;
import com.moonligh.nutritionist.domain.safety.MedicationAutomaticEnergy;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;

class GuidelineOnlyEnergyTest {

    @Test
    void hypertensionDoesNotApplyTheAdultEnergyFormula() {
        Harness hypertension = harness("HYPERTENSION", "OBESITY");
        Harness obesityOnly = harness("OBESITY");

        MealPlan hypertensionPlan = hypertension.work().compose(request());
        MealPlan obesityPlan = obesityOnly.work().compose(request());
        BigDecimal withHypertension = energy(hypertensionPlan);
        BigDecimal obesityEnergy = energy(obesityPlan);

        assertTrue(withHypertension.compareTo(new BigDecimal("1250")) > 0, "hypertension=" + withHypertension);
        assertTrue(obesityEnergy.compareTo(new BigDecimal("1250")) < 0, "obesity=" + obesityEnergy);
    }

    @Test
    void insulinRequiresAProfessionalEnergyTarget() {
        Harness harness = harness();
        harness.records().addMedication("acc-1", medication("门冬胰岛素", null));

        assertThrows(BusinessException.class, () -> harness.work().compose(request()));
    }

    @Test
    void sglt2AloneStillUsesTheAdultFormula() {
        Harness harness = harness("OBESITY");
        harness.records().addMedication("acc-1", medication("达格列净", MedicationAutomaticEnergy.SGLT2_INHIBITOR));

        assertTrue(energy(harness.work().compose(request())).compareTo(new BigDecimal("1250")) < 0);
    }

    @Test
    void urgentMeasurementStopsPlanningUntilALaterReading() {
        Harness harness = harness();
        harness.records().addMeasurement("acc-1", measurement("urgent-1", true, Instant.parse("2026-11-11T01:00:00Z")));

        assertThrows(BusinessException.class, () -> harness.work().compose(request()));

        harness.records().addMeasurement("acc-1", measurement("later-1", false, Instant.parse("2026-11-11T02:00:00Z")));
        assertTrue(energy(harness.work().compose(request())).compareTo(BigDecimal.ZERO) > 0);
    }

    @Test
    void sglt2WithFastingRequiresAProfessionalEnergyTarget() {
        Harness harness = harness("FASTING");
        harness.records().addMedication("acc-1", medication("SGLT2", null));

        assertThrows(BusinessException.class, () -> harness.work().compose(request()));
    }

    private static BigDecimal energy(MealPlan plan) {
        IngredientNutritionCalculator calculator = new IngredientNutritionCalculator();
        BigDecimal total = BigDecimal.ZERO;
        for (MealPlan.Dish dish : plan.dishes()) {
            MealPlan.IngredientGrams ingredient = dish.ingredients().getFirst();
            total = total.add(calculator.calculate(StapleFoods.find(ingredient.foodItemId()), ingredient.grams()).stream()
                    .filter(nutrient -> nutrient.type() == NutrientType.ENERGY && nutrient.value() != null)
                    .map(nutrient -> nutrient.value())
                    .reduce(BigDecimal.ZERO, BigDecimal::add));
        }
        return total;
    }

    private static CreateRecommendationReq request() {
        return new CreateRecommendationReq(
                "pat-1", "pv1", "profile-1", "pantry-1", 2, null, LocalDate.parse("2026-11-11"), "Asia/Shanghai", 2);
    }

    private static CreateMeasurementReq measurement(String eventId, boolean urgent, Instant observedAt) {
        return new CreateMeasurementReq(
                "pat-1", "pv1", eventId, 2, new BigDecimal("70"), 1, observedAt, null, 1, urgent);
    }

    private static CreateMedicationReq medication(String name, Integer category) {
        return new CreateMedicationReq("pat-1", "pv1", name, category, null, null, null, null, true);
    }

    private static Harness harness(String... conditions) {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        PatientBindingService bindings = new PatientBindingService(new InMemoryPatientBindingStore(), gateway);
        bindings.bind("acc-1", "pat-1", "pv1");
        ClinicalRecordService records = new ClinicalRecordService(bindings);
        for (String code : conditions) {
            records.addCondition("acc-1", new CreateConditionReq("pat-1", "pv1", code, null, 1, null));
        }
        ProfessionalTargetService targets = new ProfessionalTargetService();
        InMemoryProfileRepository profiles = new InMemoryProfileRepository();
        profiles.save(new Profile(
                "profile-1", "acc-1", "pat-1", "pv1", 1, 2, LocalDate.parse("1946-01-01"),
                new BigDecimal("160"), "Asia/Shanghai", 1, 1, Instant.parse("2026-11-11T00:00:00Z")), null);
        PantryService pantry = new PantryService(bindings);
        DeterministicRecommendationWork work = new DeterministicRecommendationWork(
                new HypertensionPlanningService(records, targets),
                new HyperlipidemiaPlanningService(records, targets),
                new GoutPlanningService(records, targets),
                new CkdPlanningService(records, targets, profiles),
                new DiabetesPlanningService(records, targets),
                new SolvedMealService(),
                pantry,
                new IntakeService(bindings, pantry),
                targets,
                profiles,
                records);
        return new Harness(records, work);
    }

    private record Harness(ClinicalRecordService records, DeterministicRecommendationWork work) {
    }
}
