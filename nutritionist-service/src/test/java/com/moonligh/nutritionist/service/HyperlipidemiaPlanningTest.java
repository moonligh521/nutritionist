package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.api.req.CreateConditionReq;
import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.safety.HyperlipidemiaCholesterolInitialization;
import com.moonligh.nutritionist.domain.solver.SolverConstraint;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;
import com.moonligh.nutritionist.domain.profile.InMemoryProfileRepository;

class HyperlipidemiaPlanningTest {

    private ClinicalRecordService records;
    private ProfessionalTargetService targets;
    private HyperlipidemiaPlanningService planning;
    private DeterministicRecommendationWork work;

    @BeforeEach
    void setUp() {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        PatientBindingService bindings = new PatientBindingService(new InMemoryPatientBindingStore(), gateway);
        bindings.bind("acc-1", "pat-1", "pv1");
        records = new ClinicalRecordService(bindings);
        targets = new ProfessionalTargetService();
        planning = new HyperlipidemiaPlanningService(records, targets);
        PantryService pantry = new PantryService(bindings);
        work = new DeterministicRecommendationWork(
                new HypertensionPlanningService(records, targets),
                planning,
                new GoutPlanningService(records, targets),
                new CkdPlanningService(records, targets, new InMemoryProfileRepository()),
                new DiabetesPlanningService(records, targets),
                new SolvedMealService(),
                pantry,
                new IntakeService(bindings, pantry),
                targets);
    }

    @Test
    void fatCapsFollowTheDayEnergyInsteadOfAFixedGramAmount() {
        assertEquals(new BigDecimal("55.6"), HyperlipidemiaCholesterolInitialization.fatMaximumGrams(new BigDecimal("2000")));
        assertEquals(new BigDecimal("22.2"), HyperlipidemiaCholesterolInitialization.saturatedFatMaximumGrams(new BigDecimal("2000"), false));
        assertEquals(new BigDecimal("15.6"), HyperlipidemiaCholesterolInitialization.saturatedFatMaximumGrams(new BigDecimal("2000"), true));
    }

    @Test
    void hyperlipidemiaUses300MgCholesterolAnd2000MgSodium() {
        records.addCondition("acc-1", condition("HYPERLIPIDEMIA"));

        assertEquals(new BigDecimal("300"), cholesterol().maximum());
        assertEquals(new BigDecimal("2000"), sodium().maximum());
        assertNull(cholesterol().minimum());
        assertTrue(cholesterol().hard());
    }

    @Test
    void hypercholesterolemiaUses200MgEvenWhenBothCodesExist() {
        records.addCondition("acc-1", condition("HYPERLIPIDEMIA"));
        records.addCondition("acc-1", condition("HYPERCHOLESTEROLEMIA"));

        assertEquals(new BigDecimal("200"), cholesterol().maximum());
    }

    @Test
    void professionalCholesterolReplacesGuidelineCeiling() {
        records.addCondition("acc-1", condition("HYPERLIPIDEMIA"));
        targets.create("nutritionist_pro", new ProfessionalTargetService.CreateRequest(
                "pat-1", "CHOLESTEROL", BigDecimal.ZERO, new BigDecimal("180"),
                Instant.now().minusSeconds(60), Instant.now().plusSeconds(3600)));

        assertEquals(new BigDecimal("180"), cholesterol().maximum());
        assertEquals("PROFESSIONAL:CHOLESTEROL", cholesterol().constraintId());
    }

    @Test
    void otherConditionAddsNoLipidConstraint() {
        records.addCondition("acc-1", condition("E11"));

        assertTrue(planning.constraints("pat-1", Instant.now()).isEmpty());
    }

    @Test
    void hypertensionAndHyperlipidemiaKeepTheLowerSodiumCeiling() {
        records.addCondition("acc-1", condition("HYPERTENSION"));
        records.addCondition("acc-1", condition("HYPERLIPIDEMIA"));
        targets.create("staff", new ProfessionalTargetService.CreateRequest(
                "pat-1", "SODIUM", BigDecimal.ZERO, new BigDecimal("1500"),
                Instant.now().minusSeconds(60), Instant.now().plusSeconds(3600)));

        List<SolverConstraint> constraints = work.constraints(recommendation());
        List<SolverConstraint> sodium = constraints.stream()
                .filter(constraint -> constraint.nutrientType() == NutrientType.SODIUM)
                .toList();

        assertEquals(1, sodium.size());
        assertEquals(new BigDecimal("1500"), sodium.getFirst().maximum());
    }

    private SolverConstraint cholesterol() {
        return planning.constraints("pat-1", Instant.now()).stream()
                .filter(constraint -> constraint.nutrientType() == NutrientType.CHOLESTEROL)
                .findFirst()
                .orElseThrow();
    }

    private SolverConstraint sodium() {
        return planning.constraints("pat-1", Instant.now()).stream()
                .filter(constraint -> constraint.nutrientType() == NutrientType.SODIUM)
                .findFirst()
                .orElseThrow();
    }

    private static CreateConditionReq condition(String code) {
        return new CreateConditionReq("pat-1", "pv1", code, null, 1, null);
    }

    private static CreateRecommendationReq recommendation() {
        return new CreateRecommendationReq(
                "pat-1", "pv1", "profile-1", "pantry-1", 1, 2, LocalDate.parse("2026-11-11"), "Asia/Shanghai", 2);
    }
}
