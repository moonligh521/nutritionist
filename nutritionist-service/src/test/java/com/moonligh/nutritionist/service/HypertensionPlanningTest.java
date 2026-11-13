package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.api.req.CreateConditionReq;
import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.safety.SafetyPermission;
import com.moonligh.nutritionist.domain.solver.CandidateNutrient;
import com.moonligh.nutritionist.domain.solver.OjalgoSolverAdapter;
import com.moonligh.nutritionist.domain.solver.SolverCandidate;
import com.moonligh.nutritionist.domain.solver.SolverConstraint;
import com.moonligh.nutritionist.domain.solver.SolverInfeasibleException;
import com.moonligh.nutritionist.domain.solver.SolverRequest;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;

class HypertensionPlanningTest {

    private ClinicalRecordService records;
    private ProfessionalTargetService targets;
    private HypertensionPlanningService planning;

    @BeforeEach
    void setUp() {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        PatientBindingService bindings = new PatientBindingService(new InMemoryPatientBindingStore(), gateway);
        bindings.bind("acc-1", "pat-1", "pv1");
        records = new ClinicalRecordService(bindings);
        targets = new ProfessionalTargetService();
        planning = new HypertensionPlanningService(records, targets);
    }

    @Test
    void hypertensionWithoutProfessionalTargetUsesGuidelineCeiling() {
        records.addCondition("acc-1", condition("HYPERTENSION"));
        targets.create("nutritionist_pro", energy());

        var plan = planning.assess("pat-1", Instant.now());

        assertEquals(SafetyPermission.ALLOWED, plan.permission());
        assertEquals(new BigDecimal("2000"), plan.maximumMg());
        assertEquals(0, plan.minimumMg().signum());
        assertEquals("nhc-adult-hypertension-diet", plan.sourceCode());
        var constraint = planning.constraints("pat-1", Instant.now()).getFirst();
        assertEquals(NutrientType.SODIUM, constraint.nutrientType());
        assertEquals(new BigDecimal("2000"), constraint.maximum());
        assertNull(constraint.minimum());
        assertTrue(constraint.hard());
    }

    @Test
    void defaultSodiumCeilingRejectsRequiredPortionAbove2000Mg() {
        records.addCondition("acc-1", condition("HYPERTENSION"));
        var constraints = new ArrayList<>(planning.constraints("pat-1", Instant.now()));
        constraints.add(new SolverConstraint(
                "energy-min", NutrientType.ENERGY, new BigDecimal("100"), null, null, true));
        var solver = new OjalgoSolverAdapter();
        var tooSalty = new SolverCandidate("soup", BigDecimal.ONE, List.of(
                new CandidateNutrient(NutrientType.ENERGY, new BigDecimal("100")),
                new CandidateNutrient(NutrientType.SODIUM, new BigDecimal("2500"))));
        assertThrows(SolverInfeasibleException.class, () -> solver.solve(new SolverRequest(List.of(tooSalty), constraints)));

        var acceptable = new SolverCandidate("porridge", BigDecimal.ONE, List.of(
                new CandidateNutrient(NutrientType.ENERGY, new BigDecimal("100")),
                new CandidateNutrient(NutrientType.SODIUM, new BigDecimal("400"))));
        var result = solver.solve(new SolverRequest(List.of(acceptable), constraints));
        BigDecimal quantity = result.quantities().getFirst().quantity();
        assertTrue(quantity.compareTo(BigDecimal.ZERO) > 0);
        assertTrue(quantity.compareTo(BigDecimal.ONE) <= 0);
    }

    @Test
    void activeSodiumTargetReplacesGuidelineCeiling() {
        records.addCondition("acc-1", condition("HYPERTENSION"));
        targets.create("staff", sodium(new BigDecimal("1500"), Instant.now().minusSeconds(60), Instant.now().plusSeconds(3600)));

        var plan = planning.assess("pat-1", Instant.now());

        assertEquals(SafetyPermission.ALLOWED, plan.permission());
        assertEquals(new BigDecimal("1500"), plan.maximumMg());
        assertEquals("PROFESSIONAL", plan.sourceCode());
    }

    @Test
    void expiredSodiumTargetFallsBackToGuidelineCeiling() {
        records.addCondition("acc-1", condition("HYPERTENSION"));
        targets.create("staff", sodium(new BigDecimal("1500"), Instant.now().minusSeconds(7200), Instant.now().minusSeconds(60)));

        var plan = planning.assess("pat-1", Instant.now());

        assertEquals(new BigDecimal("2000"), plan.maximumMg());
        assertEquals("nhc-adult-hypertension-diet", plan.sourceCode());
    }

    @Test
    void otherConditionDoesNotRequireSodiumTarget() {
        records.addCondition("acc-1", condition("E11"));

        assertEquals(SafetyPermission.ALLOWED, planning.assess("pat-1", Instant.now()).permission());
        assertTrue(planning.constraints("pat-1", Instant.now()).isEmpty());
    }

    private static CreateConditionReq condition(String code) {
        return new CreateConditionReq("pat-1", "pv1", code, null, 1, null);
    }

    private static ProfessionalTargetService.CreateRequest energy() {
        return new ProfessionalTargetService.CreateRequest(
                "pat-1", "ENERGY", new BigDecimal("1200"), new BigDecimal("1500"),
                Instant.now().minusSeconds(60), Instant.now().plusSeconds(3600));
    }

    private static ProfessionalTargetService.CreateRequest sodium(BigDecimal maximum, Instant from, Instant until) {
        return new ProfessionalTargetService.CreateRequest(
                "pat-1", "SODIUM", BigDecimal.ZERO, maximum, from, until);
    }
}
