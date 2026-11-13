package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.math.BigDecimal;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.api.req.CravingEvalReq;
import com.moonligh.nutritionist.api.req.CreateAllergyReq;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;

class RecordedAllergyCravingTest {

    @Test
    void confirmedAllergyRejectsAPortionTheCallerMarkedAsWithinBudget() {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acct", "pat-1", "v1");
        PatientBindingService bindings = new PatientBindingService(new InMemoryPatientBindingStore(), gateway);
        bindings.bind("acct", "pat-1", "v1");
        ClinicalRecordService clinical = new ClinicalRecordService(bindings);
        clinical.addAllergy("acct", new CreateAllergyReq("pat-1", "v1", "usda-171477", 1, true));

        var result = new CravingEvaluationService(clinical).evaluate(new CravingEvalReq(
                "pat-1",
                "v1",
                "usda-171477",
                new BigDecimal("20"),
                1,
                CravingEvaluationService.REASON_WITHIN_BUDGET,
                new BigDecimal("20")));

        assertEquals(CravingEvaluationService.Disposition.REJECTED_ALLERGY.code(), result.dispositionCode());
    }
}
