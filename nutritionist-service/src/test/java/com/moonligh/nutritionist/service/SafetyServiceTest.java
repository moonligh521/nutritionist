package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.safety.ActionDisposition;
import com.moonligh.nutritionist.domain.safety.MedicationSafetyEvaluator;
import com.moonligh.nutritionist.domain.safety.MedicationSafetyInput;
import com.moonligh.nutritionist.domain.safety.SafetyPermission;
import com.moonligh.nutritionist.domain.safety.SafetyReasonCategory;
import com.moonligh.nutritionist.domain.safety.ServiceLevel;

class SafetyServiceTest {

    private final SafetyService service = new SafetyService(new MedicationSafetyEvaluator());

    @Test
    void acuteRiskStopsEvaluation() {
        var decision = service.evaluate(new MedicationSafetyInput(true, true, ServiceLevel.A));

        assertEquals(SafetyPermission.STOP, decision.permission());
        assertTrue(decision.reasonCategories().contains(SafetyReasonCategory.ACUTE_RISK));
        assertTrue(decision.actionDispositions().contains(ActionDisposition.REFER_URGENT));
    }

    @Test
    void incompleteMedicationNeedsMoreData() {
        var decision = service.evaluate(new MedicationSafetyInput(false, false, ServiceLevel.A));

        assertEquals(SafetyPermission.NEED_MORE_DATA, decision.permission());
        assertTrue(decision.reasonCategories().contains(SafetyReasonCategory.DATA_QUALITY));
        assertTrue(decision.actionDispositions().contains(ActionDisposition.REQUEST_DATA));
    }

    @Test
    void levelCRequiresHumanReview() {
        var decision = service.evaluate(new MedicationSafetyInput(false, true, ServiceLevel.C));

        assertEquals(SafetyPermission.HUMAN_REVIEW, decision.permission());
        assertTrue(decision.reasonCategories().contains(SafetyReasonCategory.OUT_OF_SCOPE));
        assertTrue(decision.actionDispositions().contains(ActionDisposition.REFER_PROFESSIONAL));
    }
}
