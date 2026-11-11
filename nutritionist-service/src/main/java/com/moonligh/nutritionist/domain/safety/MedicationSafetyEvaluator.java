package com.moonligh.nutritionist.domain.safety;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class MedicationSafetyEvaluator {

    public SafetyDecision evaluate(MedicationSafetyInput input) {
        if (input.acuteRisk()) {
            return new SafetyDecision(
                    SafetyPermission.STOP,
                    List.of(SafetyReasonCategory.ACUTE_RISK),
                    List.of(ActionDisposition.REFER_URGENT),
                    List.of("ACUTE_RISK"));
        }
        if (!input.medicationInformationComplete()) {
            return new SafetyDecision(
                    SafetyPermission.NEED_MORE_DATA,
                    List.of(SafetyReasonCategory.DATA_QUALITY),
                    List.of(ActionDisposition.REQUEST_DATA),
                    List.of("MEDICATION_INFORMATION_INCOMPLETE"));
        }
        if (input.serviceLevel() == ServiceLevel.C) {
            return new SafetyDecision(
                    SafetyPermission.HUMAN_REVIEW,
                    List.of(SafetyReasonCategory.OUT_OF_SCOPE),
                    List.of(ActionDisposition.REFER_PROFESSIONAL),
                    List.of("SERVICE_LEVEL_C"));
        }
        return new SafetyDecision(
                SafetyPermission.ALLOWED,
                List.of(),
                List.of(ActionDisposition.CONTINUE),
                List.of());
    }
}
