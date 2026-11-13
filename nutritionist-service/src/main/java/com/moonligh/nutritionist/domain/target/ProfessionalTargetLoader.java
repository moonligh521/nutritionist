package com.moonligh.nutritionist.domain.target;

import java.util.Optional;

public interface ProfessionalTargetLoader {

    Optional<TargetCalculationResult> load(String patientId);
}
