package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.safety.DiabetesAdmission;
import com.moonligh.nutritionist.domain.safety.DiabetesDietInitialization;
import com.moonligh.nutritionist.domain.solver.SolverConstraint;

/**
 * 糖尿病和糖尿病前期使用指南里的钠上限。
 * 只有专业人员写下全天能量上限时，才换算碳水化合物上限。
 */
@Service
public class DiabetesPlanningService {

    private final ClinicalRecordService records;
    private final ProfessionalTargetService targets;

    public DiabetesPlanningService(ClinicalRecordService records, ProfessionalTargetService targets) {
        this.records = records;
        this.targets = targets;
    }

    public List<SolverConstraint> constraints(String patientId, Instant at) {
        if (!records.hasCondition(patientId, DiabetesAdmission.DIABETES)
                && !records.hasCondition(patientId, DiabetesAdmission.PREDIABETES)) {
            return List.of();
        }
        List<SolverConstraint> limits = new ArrayList<>();
        var professionalSodium = targets.activeNutrient(patientId, at, "SODIUM");
        if (professionalSodium.isEmpty()) {
            limits.add(new SolverConstraint(
                    DiabetesDietInitialization.RULE_ID + ":SODIUM",
                    NutrientType.SODIUM,
                    null,
                    DiabetesDietInitialization.SODIUM_MAXIMUM_MG,
                    null,
                    true));
        }
        targets.activeNutrient(patientId, at, "ENERGY").ifPresent(energy -> {
            if (energy.maximum() == null) {
                return;
            }
            BigDecimal carbohydrate = DiabetesDietInitialization.carbohydrateMaximumGrams(energy.maximum());
            limits.add(new SolverConstraint(
                    DiabetesDietInitialization.RULE_ID + ":CARBOHYDRATE",
                    NutrientType.CARBOHYDRATE,
                    null,
                    carbohydrate,
                    null,
                    true));
        });
        return List.copyOf(limits);
    }
}
