package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertThrows;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;

import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.nutritionist.api.req.CreateConditionReq;
import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.domain.profile.InMemoryProfileRepository;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;

class AutomaticPlanningExclusionTest {

    @Test
    void dialysisIsNotPlannedEvenWhenEnergyIsSet() {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        PatientBindingService bindings = new PatientBindingService(new InMemoryPatientBindingStore(), gateway);
        bindings.bind("acc-1", "pat-1", "pv1");
        ClinicalRecordService records = new ClinicalRecordService(bindings);
        ProfessionalTargetService targets = new ProfessionalTargetService();
        records.addCondition("acc-1", new CreateConditionReq("pat-1", "pv1", "DIALYSIS", null, 1, null));
        targets.create("nutritionist_pro", new ProfessionalTargetService.CreateRequest(
                "pat-1", "ENERGY", new BigDecimal("1600"), new BigDecimal("2000"),
                Instant.now().minusSeconds(60), Instant.now().plusSeconds(3600)));
        PantryService pantry = new PantryService(bindings);
        DeterministicRecommendationWork work = new DeterministicRecommendationWork(
                new HypertensionPlanningService(records, targets),
                new HyperlipidemiaPlanningService(records, targets),
                new GoutPlanningService(records, targets),
                new CkdPlanningService(records, targets, new InMemoryProfileRepository()),
                new DiabetesPlanningService(records, targets),
                new SolvedMealService(),
                pantry,
                new IntakeService(bindings, pantry),
                targets,
                new InMemoryProfileRepository(),
                records);

        assertThrows(BusinessException.class, () -> work.compose(new CreateRecommendationReq(
                "pat-1", "pv1", "profile-1", "pantry-1", 2, null, LocalDate.parse("2026-11-11"),
                "Asia/Shanghai", 2)));
    }
}
