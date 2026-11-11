package com.moonligh.nutritionist.domain.safety;

public record MedicationSafetyInput(
        boolean acuteRisk,
        boolean medicationInformationComplete,
        ServiceLevel serviceLevel) {
}
