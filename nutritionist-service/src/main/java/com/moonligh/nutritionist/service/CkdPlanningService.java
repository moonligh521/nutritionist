package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.profile.ProfileRepository;
import com.moonligh.nutritionist.domain.safety.CkdAdmission;
import com.moonligh.nutritionist.domain.safety.CkdDietInitialization;
import com.moonligh.nutritionist.domain.solver.SolverConstraint;
import com.moonligh.nutritionist.service.ProfessionalTargetService.Target;

/**
 * 慢性肾脏病按分期使用钠、磷、钾和蛋白质上限。没有身高时不编造蛋白质克数。
 */
@Service
public class CkdPlanningService {

    private static final BigDecimal IDEAL_WEIGHT_OFFSET = new BigDecimal("105");

    private final ClinicalRecordService records;
    private final ProfessionalTargetService targets;
    private final ProfileRepository profiles;

    public CkdPlanningService(
            ClinicalRecordService records, ProfessionalTargetService targets, ProfileRepository profiles) {
        this.records = records;
        this.targets = targets;
        this.profiles = profiles;
    }

    public List<SolverConstraint> constraints(String patientId, Instant at) {
        if (!applies(patientId)) {
            return List.of();
        }
        List<SolverConstraint> constraints = new ArrayList<>();
        constraints.add(sodium(patientId, at));
        constraints.add(nutrient(
                patientId, at, CkdAdmission.PHOSPHORUS, NutrientType.PHOSPHORUS,
                CkdDietInitialization.PHOSPHORUS_MAXIMUM_MG));
        if (records.hasCondition(patientId, CkdAdmission.CKD_HYPERKALEMIA)) {
            constraints.add(nutrient(
                    patientId, at, CkdAdmission.POTASSIUM, NutrientType.POTASSIUM,
                    CkdDietInitialization.HYPERKALEMIA_POTASSIUM_MAXIMUM_MG));
        }
        protein(patientId, at).ifPresent(constraints::add);
        return List.copyOf(constraints);
    }

    private boolean applies(String patientId) {
        return records.hasCondition(patientId, CkdAdmission.CKD)
                || records.hasCondition(patientId, CkdAdmission.CKD_STAGE_3_5)
                || records.hasCondition(patientId, CkdAdmission.CKD_EDEMA)
                || records.hasCondition(patientId, CkdAdmission.CKD_SEVERE_EDEMA)
                || records.hasCondition(patientId, CkdAdmission.CKD_HYPERKALEMIA);
    }

    private SolverConstraint sodium(String patientId, Instant at) {
        Optional<Target> professional = targets.activeNutrient(patientId, at, "SODIUM");
        if (professional.isPresent()) {
            return hard("PROFESSIONAL:SODIUM", NutrientType.SODIUM, professional.get().minimum(), professional.get().maximum());
        }
        BigDecimal maximum = CkdDietInitialization.SODIUM_MAXIMUM_MG;
        String source = CkdDietInitialization.RULE_ID + ":SODIUM";
        if (records.hasCondition(patientId, CkdAdmission.CKD_SEVERE_EDEMA)) {
            maximum = CkdDietInitialization.SEVERE_EDEMA_SODIUM_MAXIMUM_MG;
        } else if (records.hasCondition(patientId, CkdAdmission.CKD_EDEMA)) {
            maximum = CkdDietInitialization.EDEMA_SODIUM_MAXIMUM_MG;
        }
        return hard(source, NutrientType.SODIUM, null, maximum);
    }

    private SolverConstraint nutrient(
            String patientId, Instant at, String code, NutrientType type, BigDecimal guidelineMaximum) {
        Optional<Target> professional = targets.activeNutrient(patientId, at, code);
        if (professional.isPresent()) {
            return hard("PROFESSIONAL:" + code, type, professional.get().minimum(), professional.get().maximum());
        }
        return hard(CkdDietInitialization.RULE_ID + ":" + code, type, null, guidelineMaximum);
    }

    private Optional<SolverConstraint> protein(String patientId, Instant at) {
        if (!records.hasCondition(patientId, CkdAdmission.CKD_STAGE_3_5)) {
            return Optional.empty();
        }
        Optional<Target> professional = targets.activeNutrient(patientId, at, CkdAdmission.PROTEIN);
        if (professional.isPresent()) {
            return Optional.of(hard(
                    "PROFESSIONAL:PROTEIN", NutrientType.PROTEIN,
                    professional.get().minimum(), professional.get().maximum()));
        }
        return profiles.findByPatientId(patientId)
                .map(profile -> idealProteinGrams(profile.heightCm()))
                .filter(grams -> grams.signum() > 0)
                .map(grams -> hard(CkdDietInitialization.RULE_ID + ":PROTEIN", NutrientType.PROTEIN, null, grams));
    }

    static BigDecimal idealProteinGrams(BigDecimal heightCm) {
        if (heightCm == null) {
            return BigDecimal.ZERO;
        }
        BigDecimal idealKg = heightCm.subtract(IDEAL_WEIGHT_OFFSET);
        if (idealKg.signum() <= 0) {
            return BigDecimal.ZERO;
        }
        return idealKg.multiply(CkdDietInitialization.PROTEIN_GRAMS_PER_KG).setScale(1, RoundingMode.HALF_UP);
    }

    private static SolverConstraint hard(String id, NutrientType type, BigDecimal minimum, BigDecimal maximum) {
        BigDecimal floor = minimum == null || minimum.signum() == 0 ? null : minimum;
        return new SolverConstraint(id, type, floor, maximum, null, true);
    }
}
