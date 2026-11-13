package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.safety.GoutAdmission;
import com.moonligh.nutritionist.domain.safety.GoutDietInitialization;
import com.moonligh.nutritionist.domain.solver.SolverConstraint;
import com.moonligh.nutritionist.service.ProfessionalTargetService.Target;

/**
 * 痛风与高尿酸血症使用食盐 5 克对应的钠上限。指南没有全天嘌呤毫克上限。
 */
@Service
public class GoutPlanningService {

    private final ClinicalRecordService records;
    private final ProfessionalTargetService targets;

    public GoutPlanningService(ClinicalRecordService records, ProfessionalTargetService targets) {
        this.records = records;
        this.targets = targets;
    }

    public List<SolverConstraint> constraints(String patientId, Instant at) {
        if (!records.hasCondition(patientId, GoutAdmission.GOUT)
                && !records.hasCondition(patientId, GoutAdmission.HYPERURICEMIA)) {
            return List.of();
        }
        Optional<Target> professional = targets.activeNutrient(patientId, at, "SODIUM");
        if (professional.isPresent()) {
            return List.of(hard("PROFESSIONAL:SODIUM", professional.get().minimum(), professional.get().maximum()));
        }
        return List.of(hard(GoutDietInitialization.RULE_ID + ":SODIUM", null, GoutDietInitialization.SODIUM_MAXIMUM_MG));
    }

    public List<String> excludedFoodIds(String patientId) {
        if (!records.hasCondition(patientId, GoutAdmission.GOUT)
                && !records.hasCondition(patientId, GoutAdmission.HYPERURICEMIA)) {
            return List.of();
        }
        return List.of(GoutAdmission.HIGH_PURINE_LIVER);
    }

    private static SolverConstraint hard(String id, BigDecimal minimum, BigDecimal maximum) {
        BigDecimal floor = minimum == null || minimum.signum() == 0 ? null : minimum;
        return new SolverConstraint(id, NutrientType.SODIUM, floor, maximum, null, true);
    }
}
