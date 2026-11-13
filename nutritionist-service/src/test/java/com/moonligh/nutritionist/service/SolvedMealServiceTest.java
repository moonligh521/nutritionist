package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.time.LocalDate;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.domain.meal.MealPlan;
import com.moonligh.nutritionist.domain.profile.InMemoryProfileRepository;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;

class SolvedMealServiceTest {

    @Test
    void recommendationStoresGramsAndStepsForLaterLookup() {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        PatientBindingService bindings = new PatientBindingService(new InMemoryPatientBindingStore(), gateway);
        bindings.bind("acc-1", "pat-1", "pv1");
        ClinicalRecordService records = new ClinicalRecordService(bindings);
        ProfessionalTargetService targets = new ProfessionalTargetService();
        SolvedMealService solved = new SolvedMealService();
        PantryService pantry = new PantryService(bindings);
        DeterministicRecommendationWork work = new DeterministicRecommendationWork(
                new HypertensionPlanningService(records, targets),
                new HyperlipidemiaPlanningService(records, targets),
                new GoutPlanningService(records, targets),
                new CkdPlanningService(records, targets, new InMemoryProfileRepository()),
                new DiabetesPlanningService(records, targets),
                solved,
                pantry,
                new IntakeService(bindings, pantry),
                targets);
        LocalDate date = LocalDate.parse("2026-11-11");

        work.perform(new CreateRecommendationReq(
                "pat-1", "pv1", "profile-1", "pantry-1", 1, 2, date, "Asia/Shanghai", 2));

        MealPlan stored = solved.find("pat-1", date);
        MealPlan.Dish rice = stored.dishes().stream()
                .filter(dish -> dish.recipeId().equals("staple-rice"))
                .findFirst()
                .orElseThrow();
        assertTrue(rice.ingredients().getFirst().grams().compareTo(BigDecimal.ZERO) > 0);
        assertEquals("把米饭盛入碗中，不再加盐。", rice.steps().getFirst().instruction());
    }
}
