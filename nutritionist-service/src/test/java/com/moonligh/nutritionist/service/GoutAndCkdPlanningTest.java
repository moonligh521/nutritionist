package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.api.req.CreateConditionReq;
import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.profile.InMemoryProfileRepository;
import com.moonligh.nutritionist.domain.profile.Profile;
import com.moonligh.nutritionist.domain.solver.SolverConstraint;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;

class GoutAndCkdPlanningTest {

    private ClinicalRecordService records;
    private InMemoryProfileRepository profiles;
    private GoutPlanningService gout;
    private CkdPlanningService ckd;

    @BeforeEach
    void setUp() {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        PatientBindingService bindings = new PatientBindingService(new InMemoryPatientBindingStore(), gateway);
        bindings.bind("acc-1", "pat-1", "pv1");
        records = new ClinicalRecordService(bindings);
        profiles = new InMemoryProfileRepository();
        ProfessionalTargetService targets = new ProfessionalTargetService();
        gout = new GoutPlanningService(records, targets);
        ckd = new CkdPlanningService(records, targets, profiles);
    }

    @Test
    void goutUses2000MgSodiumAndNoPurineCeiling() {
        records.addCondition("acc-1", condition("GOUT"));

        List<SolverConstraint> constraints = gout.constraints("pat-1", Instant.now());

        assertEquals(1, constraints.size());
        assertEquals(NutrientType.SODIUM, constraints.getFirst().nutrientType());
        assertEquals(new BigDecimal("2000"), constraints.getFirst().maximum());
    }

    @Test
    void ckdStage35UsesIdealBodyWeightProtein() {
        records.addCondition("acc-1", condition("CKD_STAGE_3_5"));
        profiles.save(profile(new BigDecimal("165")), null);

        List<SolverConstraint> constraints = ckd.constraints("pat-1", Instant.now());

        assertEquals(new BigDecimal("36.0"), nutrient(constraints, NutrientType.PROTEIN).maximum());
        assertEquals(new BigDecimal("1000"), nutrient(constraints, NutrientType.PHOSPHORUS).maximum());
        assertEquals(new BigDecimal("2000"), nutrient(constraints, NutrientType.SODIUM).maximum());
        assertTrue(constraints.stream().noneMatch(item -> item.nutrientType() == NutrientType.POTASSIUM));
    }

    @Test
    void edemaAndHyperkalemiaTightenSodiumAndAddPotassium() {
        records.addCondition("acc-1", condition("CKD"));
        records.addCondition("acc-1", condition("CKD_EDEMA"));
        records.addCondition("acc-1", condition("CKD_HYPERKALEMIA"));

        List<SolverConstraint> constraints = ckd.constraints("pat-1", Instant.now());

        assertEquals(new BigDecimal("1200"), nutrient(constraints, NutrientType.SODIUM).maximum());
        assertEquals(new BigDecimal("3000"), nutrient(constraints, NutrientType.POTASSIUM).maximum());
    }

    @Test
    void stage35WithoutHeightDoesNotInventProteinGrams() {
        records.addCondition("acc-1", condition("CKD_STAGE_3_5"));

        assertTrue(ckd.constraints("pat-1", Instant.now()).stream()
                .noneMatch(item -> item.nutrientType() == NutrientType.PROTEIN));
    }

    private static SolverConstraint nutrient(List<SolverConstraint> constraints, NutrientType type) {
        return constraints.stream().filter(item -> item.nutrientType() == type).findFirst().orElseThrow();
    }

    private static CreateConditionReq condition(String code) {
        return new CreateConditionReq("pat-1", "pv1", code, null, 1, null);
    }

    private static Profile profile(BigDecimal heightCm) {
        return new Profile(
                "profile-1", "acc-1", "pat-1", "pv1", 1, 1, LocalDate.parse("1980-01-01"),
                heightCm, "Asia/Shanghai", 1, 1, Instant.parse("2026-11-11T00:00:00Z"));
    }
}
