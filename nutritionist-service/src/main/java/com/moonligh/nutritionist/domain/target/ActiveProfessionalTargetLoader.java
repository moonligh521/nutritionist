package com.moonligh.nutritionist.domain.target;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.safety.SafetyPermission;
import com.moonligh.nutritionist.service.ProfessionalTargetService;

@Component
public class ActiveProfessionalTargetLoader implements ProfessionalTargetLoader {

    private final ProfessionalTargetService targets;

    public ActiveProfessionalTargetLoader(ProfessionalTargetService targets) {
        this.targets = targets;
    }

    @Override
    public Optional<TargetCalculationResult> load(String patientId) {
        return targets.activeFor(patientId, Instant.now())
                .map(target -> new TargetCalculationResult(
                        SafetyPermission.ALLOWED, target.targetId(), List.of()));
    }
}