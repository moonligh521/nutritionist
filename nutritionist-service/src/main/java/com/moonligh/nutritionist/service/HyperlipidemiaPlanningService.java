package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.safety.HyperlipidemiaAdmission;
import com.moonligh.nutritionist.domain.safety.HyperlipidemiaCholesterolInitialization;
import com.moonligh.nutritionist.domain.safety.HypertensionSodiumInitialization;
import com.moonligh.nutritionist.domain.solver.SolverConstraint;
import com.moonligh.nutritionist.service.ProfessionalTargetService.Target;

/**
 * 高脂血症配餐使用初始胆固醇上限，并沿用食盐 5 克对应的钠上限。
 * 专业人员写下的有效目标可以替换对应营养素。
 */
@Service
public class HyperlipidemiaPlanningService {

    private final ClinicalRecordService records;
    private final ProfessionalTargetService targets;

    public HyperlipidemiaPlanningService(ClinicalRecordService records, ProfessionalTargetService targets) {
        this.records = records;
        this.targets = targets;
    }

    public List<SolverConstraint> constraints(String patientId, Instant at) {
        if (!applies(patientId)) {
            return List.of();
        }
        List<SolverConstraint> constraints = new ArrayList<>();
        constraints.add(cholesterol(patientId, at));
        constraints.add(sodium(patientId, at));
        return List.copyOf(constraints);
    }

    private boolean applies(String patientId) {
        return records.hasCondition(patientId, HyperlipidemiaAdmission.HYPERLIPIDEMIA)
                || records.hasCondition(patientId, HyperlipidemiaAdmission.HYPERCHOLESTEROLEMIA);
    }

    private SolverConstraint cholesterol(String patientId, Instant at) {
        Optional<Target> professional = targets.activeNutrient(patientId, at, HyperlipidemiaAdmission.CHOLESTEROL);
        if (professional.isPresent()) {
            return hard(
                    "PROFESSIONAL:CHOLESTEROL",
                    NutrientType.CHOLESTEROL,
                    floor(professional.get().minimum()),
                    professional.get().maximum());
        }
        BigDecimal maximum = records.hasCondition(patientId, HyperlipidemiaAdmission.HYPERCHOLESTEROLEMIA)
                ? HyperlipidemiaCholesterolInitialization.HYPERCHOLESTEROLEMIA_MAXIMUM_MG
                : HyperlipidemiaCholesterolInitialization.CHOLESTEROL_MAXIMUM_MG;
        return hard(
                HyperlipidemiaCholesterolInitialization.RULE_ID + ":CHOLESTEROL",
                NutrientType.CHOLESTEROL,
                null,
                maximum);
    }

    private SolverConstraint sodium(String patientId, Instant at) {
        Optional<Target> professional = targets.activeNutrient(patientId, at, "SODIUM");
        if (professional.isPresent()) {
            return hard(
                    "PROFESSIONAL:SODIUM",
                    NutrientType.SODIUM,
                    floor(professional.get().minimum()),
                    professional.get().maximum());
        }
        return hard(
                HyperlipidemiaCholesterolInitialization.RULE_ID + ":SODIUM",
                NutrientType.SODIUM,
                null,
                HypertensionSodiumInitialization.SODIUM_MAXIMUM_MG);
    }

    private static BigDecimal floor(BigDecimal minimum) {
        return minimum == null || minimum.signum() == 0 ? null : minimum;
    }

    private static SolverConstraint hard(String id, NutrientType nutrient, BigDecimal minimum, BigDecimal maximum) {
        return new SolverConstraint(id, nutrient, minimum, maximum, null, true);
    }
}
