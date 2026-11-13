package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.safety.HypertensionAdmission;
import com.moonligh.nutritionist.domain.safety.HypertensionSodiumInitialization;
import com.moonligh.nutritionist.domain.safety.SafetyPermission;
import com.moonligh.nutritionist.domain.solver.SolverConstraint;
import com.moonligh.nutritionist.service.ProfessionalTargetService.Target;

/**
 * 高血压配餐使用初始钠上限。专业人员写下的有效钠目标可以替换它。
 */
@Service
public class HypertensionPlanningService {

    private final ClinicalRecordService records;
    private final ProfessionalTargetService targets;

    public HypertensionPlanningService(ClinicalRecordService records, ProfessionalTargetService targets) {
        this.records = records;
        this.targets = targets;
    }

    public SodiumPlan assess(String patientId, Instant at) {
        if (!records.hasCondition(patientId, HypertensionAdmission.CONDITION_CODE)) {
            return SodiumPlan.notApplicable();
        }
        Optional<Target> professional = targets.activeNutrient(patientId, at, HypertensionAdmission.SODIUM);
        if (professional.isPresent()) {
            Target target = professional.get();
            return new SodiumPlan(
                    SafetyPermission.ALLOWED,
                    target.minimum(),
                    target.maximum(),
                    "PROFESSIONAL");
        }
        return new SodiumPlan(
                SafetyPermission.ALLOWED,
                BigDecimal.ZERO,
                HypertensionSodiumInitialization.SODIUM_MAXIMUM_MG,
                HypertensionSodiumInitialization.RULE_ID);
    }

    public List<SolverConstraint> constraints(String patientId, Instant at) {
        SodiumPlan plan = assess(patientId, at);
        if (plan.maximumMg() == null) {
            return List.of();
        }
        BigDecimal minimum = plan.minimumMg() == null || plan.minimumMg().signum() == 0
                ? null
                : plan.minimumMg();
        return List.of(new SolverConstraint(
                plan.sourceCode() + ":SODIUM",
                NutrientType.SODIUM,
                minimum,
                plan.maximumMg(),
                null,
                true));
    }

    /** 本次配餐采用的钠额度。没有高血压时上限为空。 */
    public record SodiumPlan(
            /** 安全许可。 */
            SafetyPermission permission,
            /** 钠下限，单位毫克。指南未设下限时为 0。 */
            BigDecimal minimumMg,
            /** 钠上限，单位毫克。 */
            BigDecimal maximumMg,
            /** 额度来源：专业目标，或指南规则标识。 */
            String sourceCode) {

        static SodiumPlan notApplicable() {
            return new SodiumPlan(SafetyPermission.ALLOWED, null, null, "");
        }
    }
}

