package com.moonligh.nutritionist.service;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.safety.MedicationSafetyEvaluator;
import com.moonligh.nutritionist.domain.safety.MedicationSafetyInput;
import com.moonligh.nutritionist.domain.safety.SafetyDecision;

@Service
public class SafetyService {

    private final MedicationSafetyEvaluator medicationEvaluator;

    public SafetyService(MedicationSafetyEvaluator medicationEvaluator) {
        this.medicationEvaluator = medicationEvaluator;
    }

    public SafetyDecision evaluate(MedicationSafetyInput input) {
        return medicationEvaluator.evaluate(input);
    }
}
