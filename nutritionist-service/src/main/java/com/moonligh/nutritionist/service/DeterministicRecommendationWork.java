package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.Instant;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.domain.meal.MealComposer;
import com.moonligh.nutritionist.domain.meal.MealOrder;
import com.moonligh.nutritionist.domain.meal.MealPlan;
import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.profile.Profile;
import com.moonligh.nutritionist.domain.profile.ProfileRepository;
import com.moonligh.nutritionist.domain.safety.AutomaticPlanningExclusions;
import com.moonligh.nutritionist.domain.safety.GuidelineOnlyConditions;
import com.moonligh.nutritionist.domain.safety.MedicationAutomaticEnergy;
import com.moonligh.nutritionist.domain.safety.DiabetesAdmission;
import com.moonligh.nutritionist.domain.safety.DiabetesDietInitialization;
import com.moonligh.nutritionist.domain.safety.HyperlipidemiaAdmission;
import com.moonligh.nutritionist.domain.safety.HyperlipidemiaCholesterolInitialization;
import com.moonligh.nutritionist.domain.safety.DiabetesGlycemicIndex;
import com.moonligh.nutritionist.domain.safety.ObesityDietInitialization;
import com.moonligh.nutritionist.domain.solver.SolverConstraint;
import com.moonligh.nutritionist.domain.target.ChineseDri2023Energy;

@Component
public class DeterministicRecommendationWork implements RecommendationWorkflow.RecommendationWork {

    private final HypertensionPlanningService hypertension;
    private final HyperlipidemiaPlanningService hyperlipidemia;
    private final GoutPlanningService gout;
    private final CkdPlanningService ckd;
    private final DiabetesPlanningService diabetes;
    private final MealComposer meals = new MealComposer();
    private final SolvedMealService solvedMeals;
    private final PantryService pantry;
    private final IntakeService intakes;
    private final ProfessionalTargetService targets;
    private static final String PREGNANCY = "PREGNANCY";
    private static final String LACTATION = "LACTATION";

    private final ProfileRepository profiles;
    private final ClinicalRecordService records;
    private final RecommendationAgentLoop presentation;

    public DeterministicRecommendationWork(
            HypertensionPlanningService hypertension,
            HyperlipidemiaPlanningService hyperlipidemia,
            GoutPlanningService gout,
            CkdPlanningService ckd,
            DiabetesPlanningService diabetes,
            SolvedMealService solvedMeals,
            PantryService pantry,
            IntakeService intakes,
            ProfessionalTargetService targets) {
        this(hypertension, hyperlipidemia, gout, ckd, diabetes, solvedMeals, pantry, intakes, targets, null, null);
    }

    public DeterministicRecommendationWork(
            HypertensionPlanningService hypertension,
            HyperlipidemiaPlanningService hyperlipidemia,
            GoutPlanningService gout,
            CkdPlanningService ckd,
            DiabetesPlanningService diabetes,
            SolvedMealService solvedMeals,
            PantryService pantry,
            IntakeService intakes,
            ProfessionalTargetService targets,
            ProfileRepository profiles) {
        this(hypertension, hyperlipidemia, gout, ckd, diabetes, solvedMeals, pantry, intakes, targets, profiles, null, null);
    }

    public DeterministicRecommendationWork(
            HypertensionPlanningService hypertension,
            HyperlipidemiaPlanningService hyperlipidemia,
            GoutPlanningService gout,
            CkdPlanningService ckd,
            DiabetesPlanningService diabetes,
            SolvedMealService solvedMeals,
            PantryService pantry,
            IntakeService intakes,
            ProfessionalTargetService targets,
            ProfileRepository profiles,
            ClinicalRecordService records) {
        this(hypertension, hyperlipidemia, gout, ckd, diabetes, solvedMeals, pantry, intakes, targets, profiles, records, null);
    }

    @org.springframework.beans.factory.annotation.Autowired
    public DeterministicRecommendationWork(
            HypertensionPlanningService hypertension,
            HyperlipidemiaPlanningService hyperlipidemia,
            GoutPlanningService gout,
            CkdPlanningService ckd,
            DiabetesPlanningService diabetes,
            SolvedMealService solvedMeals,
            PantryService pantry,
            IntakeService intakes,
            ProfessionalTargetService targets,
            ProfileRepository profiles,
            ClinicalRecordService records,
            RecommendationAgentLoop presentation) {
        this.hypertension = hypertension;
        this.hyperlipidemia = hyperlipidemia;
        this.gout = gout;
        this.ckd = ckd;
        this.diabetes = diabetes;
        this.solvedMeals = solvedMeals;
        this.profiles = profiles;
        this.records = records;
        this.presentation = presentation;
        this.pantry = pantry;
        this.intakes = intakes;
        this.targets = targets;
    }

    @Override
    public void perform(CreateRecommendationReq request) {
        MealPlan plan = compose(request);
        solvedMeals.save(request.patientId(), request.date(), plan);
        if (presentation != null) {
            presentation.present(request, plan);
        }
    }

    public MealPlan compose(CreateRecommendationReq request) {
        rejectBlockedConditions(request);
        boolean fullDay = request.scopeCode() != null && request.scopeCode() == 2;
        boolean onlyAvailable = request.pantryModeCode() != null && request.pantryModeCode() == 1;
        boolean preferAvailable = request.pantryModeCode() != null && request.pantryModeCode() == 2;
        List<SolverConstraint> limits = new ArrayList<>(constraints(request));
        addEnergyAndProtein(request, fullDay, limits);
        MealPlan cooked = meals.compose(new MealOrder(
                limits,
                100,
                pantry.stocks(request.patientId()),
                onlyAvailable,
                intakes.consumed(request.patientId()),
                gout.excludedFoodIds(request.patientId()),
                preferAvailable,
                highGlycemicFoods(request)));
        return new MealPlan(cooked.dishes(), fullDay, cooked.missingFoodIds());
    }

    public List<SolverConstraint> constraints(CreateRecommendationReq request) {
        Instant at = Instant.now();
        List<SolverConstraint> combined = new ArrayList<>();
        combined.addAll(hypertension.constraints(request.patientId(), at));
        combined.addAll(hyperlipidemia.constraints(request.patientId(), at));
        combined.addAll(gout.constraints(request.patientId(), at));
        combined.addAll(ckd.constraints(request.patientId(), at));
        combined.addAll(diabetes.constraints(request.patientId(), at));
        return PlanningConstraints.tighten(combined);
    }

    private void addEnergyAndProtein(CreateRecommendationReq request, boolean fullDay, List<SolverConstraint> limits) {
        var professional = targets.activeNutrient(request.patientId(), Instant.now(), "ENERGY");
        if (professional.isPresent() && professional.get().maximum() != null) {
            BigDecimal scaled = scale(request, fullDay, weightCeiling(request, professional.get().maximum()));
            limits.add(energyLimit(scaled, "professional-energy"));
            limits.add(fatLimit(scaled, "professional-energy"));
            limits.add(new SolverConstraint(
                    "professional-energy:FAT-FLOOR",
                    NutrientType.FAT,
                    null,
                    null,
                    ChineseDri2023Energy.fatMinimumGrams(scaled),
                    false));
            if (fullDay) {
                limits.add(fiberMinimum());
            }
            addHyperlipidemiaFat(request, scaled, limits);
            addDiabetesCarbohydrate(request, scaled, limits);
            addCookingOil(request, fullDay, limits);
            return;
        }
        if (profiles == null) {
            return;
        }
        Profile profile = profiles.findByPatientId(request.patientId()).orElse(null);
        if (profile == null || profile.birthDate() == null) {
            return;
        }
        ZoneId zone = ZoneId.of(request.timezone() == null ? "Asia/Shanghai" : request.timezone());
        int age = Period.between(profile.birthDate(), LocalDate.now(zone)).getYears();
        if (age < 18) {
            throw new BusinessException(ErrorCode.SAFETY_NOT_ALLOWED);
        }
        if (records != null && (records.hasCondition(request.patientId(), PREGNANCY)
                || records.hasCondition(request.patientId(), LACTATION))) {
            throw new BusinessException(ErrorCode.PROFESSIONAL_TARGET_REQUIRED);
        }
        if (records != null && MedicationAutomaticEnergy.requiresProfessionalEnergy(
                records.medicationNames(request.patientId()),
                records.medicationCategories(request.patientId()),
                code -> records.hasCondition(request.patientId(), code))) {
            throw new BusinessException(ErrorCode.PROFESSIONAL_TARGET_REQUIRED);
        }
        if (records != null && GuidelineOnlyConditions.matches(code -> records.hasCondition(request.patientId(), code))) {
            return;
        }
        if (profile.activityLevelCode() == null) {
            return;
        }
        if (age >= 65 && profile.activityLevelCode() == 3) {
            throw new BusinessException(ErrorCode.PROFESSIONAL_TARGET_REQUIRED);
        }
        ChineseDri2023Energy.kcal(profile.sexCode(), age, profile.activityLevelCode()).ifPresent(energy -> {
            BigDecimal scaled = scale(request, fullDay, weightCeiling(request, energy));
            limits.add(energyLimit(scaled, ChineseDri2023Energy.RULE_ID));
            limits.add(fatLimit(scaled, ChineseDri2023Energy.RULE_ID));
            limits.add(new SolverConstraint(
                    ChineseDri2023Energy.RULE_ID + ":FAT-FLOOR",
                    NutrientType.FAT,
                    null,
                    null,
                    ChineseDri2023Energy.fatMinimumGrams(scaled),
                    false));
            if (fullDay) {
                limits.add(fiberMinimum());
            }
            addHyperlipidemiaFat(request, scaled, limits);
            addDiabetesCarbohydrate(request, scaled, limits);
            addCookingOil(request, fullDay, limits);
            if (fullDay || sharePercent(request, fullDay) != null) {
                ChineseDri2023Energy.proteinGrams(profile.sexCode(), age).ifPresent(protein -> limits.add(new SolverConstraint(
                        ChineseDri2023Energy.RULE_ID + ":PROTEIN",
                        NutrientType.PROTEIN,
                        scale(request, fullDay, protein),
                        null,
                        null,
                        true)));
            }
        });
    }

    private BigDecimal weightCeiling(CreateRecommendationReq request, BigDecimal requirement) {
        if (records == null || requirement == null) {
            return requirement;
        }
        if (records.hasCondition(request.patientId(), ObesityDietInitialization.OBESITY)) {
            return ObesityDietInitialization.energyCeiling(requirement, true);
        }
        if (records.hasCondition(request.patientId(), ObesityDietInitialization.OVERWEIGHT)) {
            return ObesityDietInitialization.energyCeiling(requirement, false);
        }
        return requirement;
    }

    private List<String> highGlycemicFoods(CreateRecommendationReq request) {
        if (records == null) {
            return List.of();
        }
        if (!records.hasCondition(request.patientId(), DiabetesAdmission.DIABETES)
                && !records.hasCondition(request.patientId(), DiabetesAdmission.PREDIABETES)) {
            return List.of();
        }
        return DiabetesGlycemicIndex.highFoodIds();
    }

    private static SolverConstraint energyLimit(BigDecimal maximum, String id) {
        return new SolverConstraint(id + ":ENERGY", NutrientType.ENERGY, null, maximum, null, true);
    }

    private void rejectBlockedConditions(CreateRecommendationReq request) {
        if (records == null) {
            return;
        }
        if (AutomaticPlanningExclusions.blocks(code -> records.hasCondition(request.patientId(), code))
                || records.latestMeasurementStopsPlanning(request.patientId())) {
            throw new BusinessException(ErrorCode.SAFETY_NOT_ALLOWED);
        }
    }

    private void addCookingOil(CreateRecommendationReq request, boolean fullDay, List<SolverConstraint> limits) {
        if (records == null) {
            return;
        }
        boolean diabetes = records.hasCondition(request.patientId(), DiabetesAdmission.DIABETES)
                || records.hasCondition(request.patientId(), DiabetesAdmission.PREDIABETES);
        boolean lipids = records.hasCondition(request.patientId(), HyperlipidemiaAdmission.HYPERLIPIDEMIA)
                || records.hasCondition(request.patientId(), HyperlipidemiaAdmission.HYPERCHOLESTEROLEMIA);
        if (!diabetes && !lipids) {
            return;
        }
        limits.add(new SolverConstraint(
                DiabetesDietInitialization.RULE_ID + ":OIL",
                NutrientType.COOKING_OIL,
                null,
                scale(request, fullDay, DiabetesDietInitialization.OIL_MAXIMUM_G),
                null,
                true));
    }

    private void addDiabetesCarbohydrate(CreateRecommendationReq request, BigDecimal scaled, List<SolverConstraint> limits) {
        if (records == null) {
            return;
        }
        if (!records.hasCondition(request.patientId(), DiabetesAdmission.DIABETES)
                && !records.hasCondition(request.patientId(), DiabetesAdmission.PREDIABETES)) {
            return;
        }
        BigDecimal maximum = DiabetesDietInitialization.carbohydrateMaximumGrams(scaled);
        String id = DiabetesDietInitialization.RULE_ID + ":CARBOHYDRATE";
        for (int index = 0; index < limits.size(); index++) {
            SolverConstraint existing = limits.get(index);
            if (!id.equals(existing.constraintId())) {
                continue;
            }
            BigDecimal tighter = existing.maximum() == null ? maximum : existing.maximum().min(maximum);
            limits.set(index, new SolverConstraint(
                    id, NutrientType.CARBOHYDRATE, existing.minimum(), tighter, existing.target(), true));
            addCarbohydrateFloor(scaled, limits);
            return;
        }
        limits.add(new SolverConstraint(id, NutrientType.CARBOHYDRATE, null, maximum, null, true));
        addCarbohydrateFloor(scaled, limits);
    }

    private static void addCarbohydrateFloor(BigDecimal scaled, List<SolverConstraint> limits) {
        limits.add(new SolverConstraint(
                DiabetesDietInitialization.RULE_ID + ":CARBOHYDRATE-FLOOR",
                NutrientType.CARBOHYDRATE,
                null,
                null,
                DiabetesDietInitialization.carbohydrateMinimumGrams(scaled),
                false));
    }

    private void addHyperlipidemiaFat(CreateRecommendationReq request, BigDecimal scaled, List<SolverConstraint> limits) {
        if (records == null) {
            return;
        }
        boolean hypercholesterolemia = records.hasCondition(
                request.patientId(), HyperlipidemiaAdmission.HYPERCHOLESTEROLEMIA);
        if (!hypercholesterolemia && !records.hasCondition(request.patientId(), HyperlipidemiaAdmission.HYPERLIPIDEMIA)) {
            return;
        }
        limits.add(new SolverConstraint(
                HyperlipidemiaCholesterolInitialization.RULE_ID + ":FAT",
                NutrientType.FAT,
                null,
                HyperlipidemiaCholesterolInitialization.fatMaximumGrams(scaled),
                null,
                true));
        limits.add(new SolverConstraint(
                HyperlipidemiaCholesterolInitialization.RULE_ID + ":SATURATED-FAT",
                NutrientType.SATURATED_FAT,
                null,
                HyperlipidemiaCholesterolInitialization.saturatedFatMaximumGrams(scaled, hypercholesterolemia),
                null,
                true));
    }

    private static SolverConstraint fiberMinimum() {
        return new SolverConstraint(
                ChineseDri2023Energy.RULE_ID + ":FIBER",
                NutrientType.FIBER,
                ChineseDri2023Energy.FIBER_AI_MINIMUM_GRAMS,
                null,
                null,
                true);
    }

    private static SolverConstraint fatLimit(BigDecimal energyKcal, String id) {
        return new SolverConstraint(
                id + ":FAT",
                NutrientType.FAT,
                null,
                ChineseDri2023Energy.fatMaximumGrams(energyKcal),
                null,
                true);
    }

    private static BigDecimal scale(CreateRecommendationReq request, boolean fullDay, BigDecimal amount) {
        Integer share = sharePercent(request, fullDay);
        if (share == null) {
            return amount;
        }
        return amount.multiply(BigDecimal.valueOf(share)).divide(new BigDecimal("100"), 0, RoundingMode.HALF_UP);
    }

    private static Integer sharePercent(CreateRecommendationReq request, boolean fullDay) {
        if (fullDay) {
            return null;
        }
        Integer confirmed = request.confirmedMealSharePercent();
        if (confirmed != null) {
            if (confirmed < 1 || confirmed > 99) {
                throw new BusinessException(ErrorCode.PARAM_INVALID);
            }
            return confirmed;
        }
        return ObesityDietInitialization.publishedSharePercent(request.mealTypeCode());
    }
}
