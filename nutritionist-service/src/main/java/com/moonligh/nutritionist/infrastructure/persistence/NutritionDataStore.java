package com.moonligh.nutritionist.infrastructure.persistence;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.moonligh.nutritionist.api.req.CorrectIntakeReq;
import com.moonligh.nutritionist.api.req.CreateAllergyReq;
import com.moonligh.nutritionist.api.req.CreateConditionReq;
import com.moonligh.nutritionist.api.req.CreateIntakeReq;
import com.moonligh.nutritionist.api.req.CreateMedicationReq;
import com.moonligh.nutritionist.api.req.IntakeItemReq;
import com.moonligh.nutritionist.api.res.AllergyRes;
import com.moonligh.nutritionist.api.res.ConditionRes;
import com.moonligh.nutritionist.api.res.IntakeRes;
import com.moonligh.nutritionist.api.res.MeasurementRes;
import com.moonligh.nutritionist.api.res.MedicationRes;
import com.moonligh.nutritionist.domain.recipe.Recipe;
import com.moonligh.nutritionist.domain.recipe.RecipeIngredient;
import com.moonligh.nutritionist.domain.recipe.RecipeStatus;
import com.moonligh.nutritionist.domain.recipe.RecipeStep;
import com.moonligh.nutritionist.domain.replay.ReplaySnapshot;
import com.moonligh.nutritionist.domain.safety.ActionDisposition;
import com.moonligh.nutritionist.domain.safety.SafetyReasonCategory;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataMapper.CookingRow;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataMapper.DraftRow;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataMapper.IntakeHeaderRow;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataMapper.MealRow;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataMapper.MeasurementRow;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataMapper.PlanRow;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataMapper.ReplayRow;
import com.moonligh.nutritionist.service.CookingExecutionService.CookingStatus;
import com.moonligh.nutritionist.service.CookingExecutionService.Execution;
import com.moonligh.nutritionist.service.PantryRecognitionService.RecognitionCandidate;
import com.moonligh.nutritionist.service.PantryRecognitionService.RecognitionDraft;
import com.moonligh.nutritionist.service.PlanService.MealSlot;
import com.moonligh.nutritionist.service.PlanService.PlanRecord;
import com.moonligh.nutritionist.service.PlanService.PlanStatus;
import com.moonligh.nutritionist.service.ProfessionalTargetService;

/**
 * 把原先只留在内存里的业务事实写进 Flyway 表，重启后还能读回来。
 */
@Repository
public class NutritionDataStore {

    private final NutritionDataMapper records;
    private final ObjectMapper mapper;

    public NutritionDataStore(NutritionDataMapper records, ObjectMapper mapper) {
        this.records = records;
        this.mapper = mapper;
    }

    public void insertCondition(String patientId, ConditionRes created, CreateConditionReq request) {
        records.insertCondition(
                created.conditionId(), patientId, request.conditionCode(), request.onsetDate(),
                request.sourceCode(), request.note(), created.version(), created.statusCode(), Instant.now());
    }

    public List<String> conditionCodes(String patientId) {
        return records.conditionCodes(patientId);
    }

    public int conditionCount(String patientId) {
        Integer count = records.conditionCount(patientId);
        return count == null ? 0 : count;
    }

    public List<String> medicationNames(String patientId) {
        return records.medicationNames(patientId);
    }

    public List<Integer> medicationCategories(String patientId) {
        return records.medicationCategories(patientId);
    }

    public void insertMedication(String patientId, MedicationRes created, CreateMedicationReq request) {
        records.insertMedication(
                created.medicationId(), patientId, request.medicationName(), request.categoryCode(),
                request.doseText(), request.frequencyText(), request.completeConfirmed() ? 1 : 0,
                created.version(), Instant.now());
    }

    public void insertAllergy(String patientId, AllergyRes created, CreateAllergyReq request) {
        records.insertAllergy(
                created.allergyId(), patientId, request.allergenCode(), request.severityCode(),
                request.confirmed() ? 1 : 0, created.version(), Instant.now());
    }

    public void insertMeasurement(String patientId, String eventId, BigDecimal value, Integer typeCode, Integer unitCode,
            Instant observedAt, MeasurementRes created) {
        records.insertMeasurement(
                created.measurementId(), eventId, patientId, typeCode, value, unitCode, observedAt,
                created.decisionCode(), created.safetyPermissionCode(), Instant.now());
    }

    public void saveKill(String capability, String scopeKey, boolean active, String actor, String action) {
        records.upsertCapabilitySwitch(capability, scopeKey, active ? 0 : 1, Instant.now());
        records.insertCapabilitySwitchEvent(capability, scopeKey, action, actor, Instant.now());
    }

    public Optional<Boolean> killActive(String capability, String scopeKey) {
        List<Integer> enabled = records.capabilityEnabled(capability, scopeKey);
        if (enabled.isEmpty()) {
            return Optional.empty();
        }
        return Optional.of(enabled.getFirst() == 0);
    }

    public void saveTarget(ProfessionalTargetService.Target target) {
        records.insertTarget(target.targetId(), target.patientId(), target.version(), target.createdAt());
        records.insertTargetVersion(
                target.targetId(), target.version(), target.nutrientCode(), target.minimum(), target.maximum(),
                target.effectiveAt(), target.expiresAt(), target.createdAt());
    }

    public List<ProfessionalTargetService.Target> targets(String patientId) {
        return records.targets(patientId);
    }

    public Optional<ProfessionalTargetService.Target> findTarget(String targetId) {
        return records.findTarget(targetId).stream().findFirst();
    }

    public void expireTarget(String targetId, String version, Instant expiresAt) {
        records.expireTarget(expiresAt, targetId, version);
    }

    public List<String> confirmedAllergens(String patientId) {
        return records.confirmedAllergens(patientId);
    }

    public List<CreateIntakeReq> intakeRequests(String patientId) {
        List<CreateIntakeReq> requests = new ArrayList<>();
        for (String id : records.intakeIds(patientId)) {
            findIntakeRequest(id).ifPresent(requests::add);
        }
        return requests;
    }

    public void savePlan(String planId, String planVersion, String patientId, String profileVersion, String pantryVersion, int statusCode) {
        int updated = records.updatePlan(statusCode, planVersion, Instant.now(), planId);
        if (updated == 0) {
            records.insertPlan(planId, patientId, patientId, statusCode, planVersion, Instant.now(), Instant.now());
            records.insertPlanVersion(planVersion, planId, profileVersion, pantryVersion, statusCode, Instant.now());
        }
    }

    public Optional<PlanRecord> findPlan(String planId) {
        return records.findPlan(planId).stream().findFirst().map(NutritionDataStore::plan);
    }

    public Optional<PlanRecord> findConfirmedPlan(String patientId) {
        return records.findConfirmedPlan(patientId, PlanStatus.CONFIRMED.code()).stream()
                .findFirst()
                .map(NutritionDataStore::plan);
    }

    public List<MealSlot> findMeals(String planId) {
        List<MealSlot> meals = new ArrayList<>();
        for (MealRow row : records.findMeals(planId)) {
            meals.add(new MealSlot(
                    row.mealId(),
                    row.mealTypeCode() == 1,
                    row.itemRef(),
                    row.statusCode(),
                    row.grams()));
        }
        return meals;
    }

    public void saveMeal(String planId, String mealId, boolean eaten, String foodItemId, int energyKcal, BigDecimal grams) {
        records.upsertMeal(mealId, planId, eaten ? 1 : 0, energyKcal);
        records.deleteMealItems(mealId);
        records.insertMealItem(mealId + ":item", mealId, foodItemId, BigDecimal.valueOf(energyKcal), grams);
    }

    public void saveIntake(String accountId, CreateIntakeReq request, IntakeRes created) {
        records.insertIntakeEvent(
                created.intakeId(), request.eventId(), accountId, request.patientId(), request.patientVersion(),
                request.mealId(), created.recordedAt());
        for (IntakeItemReq item : request.items()) {
            records.insertIntakeItem(
                    created.intakeId(), item.itemTypeCode(), item.foodItemId(), item.cookingExecutionId(),
                    item.quantity(), item.unitCode(), item.weightBasisCode());
        }
    }

    public void saveCorrection(String accountId, String originalIntakeId, CorrectIntakeReq request, IntakeRes created) {
        records.insertCorrection(
                created.intakeId(), request.eventId(), originalIntakeId, accountId, request.patientId(),
                request.patientVersion(), request.note(), created.recordedAt());
        for (IntakeItemReq item : request.items()) {
            records.insertCorrectionItem(
                    created.intakeId(), item.itemTypeCode(), item.foodItemId(), item.cookingExecutionId(),
                    item.quantity(), item.unitCode(), item.weightBasisCode());
        }
    }

    public Optional<IntakeRes> findCorrection(String eventId) {
        return records.findCorrection(eventId).stream().findFirst();
    }

    public Optional<IntakeRes> findIntakeByEvent(String eventId) {
        return records.findIntakeByEventId(eventId).stream().findFirst();
    }

    public Optional<IntakeRes> findIntakeById(String intakeId) {
        return records.findIntakeByIntakeId(intakeId).stream().findFirst();
    }

    public Optional<CreateIntakeReq> findIntakeRequest(String intakeId) {
        List<IntakeHeaderRow> headers = records.findIntakeHeader(intakeId);
        if (headers.isEmpty()) {
            return Optional.empty();
        }
        List<IntakeItemReq> items = records.findIntakeItems(intakeId);
        IntakeHeaderRow header = headers.getFirst();
        return Optional.of(new CreateIntakeReq(
                header.eventId(), header.patientId(), header.patientVersion(), header.mealId(), items));
    }

    public void insertDialogueTurn(String patientId, LocalDate date, String goalCode, String foodNames, String missingNames, String explanation) {
        records.insertDialogueTurn(patientId, date, goalCode, foodNames, missingNames, explanation, Instant.now());
    }

    public Optional<DialogueTurnRow> latestDialogueTurn(String patientId) {
        return records.latestDialogueTurn(patientId).stream().findFirst();
    }

    public record DialogueTurnRow(
            LocalDate date, String goalCode, String foodNames, String missingNames, String explanation) {
    }

    public Optional<LatestMeasurement> latestMeasurement(String patientId) {
        return records.latestMeasurement(patientId).stream().findFirst();
    }

    public record LatestMeasurement(Instant observedAt, int safetyPermissionCode) {
    }

    public Optional<MeasurementRes> findMeasurement(String eventId) {
        return records.findMeasurement(eventId).stream().findFirst().map(NutritionDataStore::measurement);
    }

    private static MeasurementRes measurement(MeasurementRow row) {
        return measurement(row.measurementId(), row.decisionCode(), row.safetyPermissionCode());
    }

    private static MeasurementRes measurement(String measurementId, int decisionCode, int permissionCode) {
        boolean urgent = decisionCode == 5;
        return new MeasurementRes(
                measurementId,
                decisionCode,
                permissionCode,
                urgent ? List.of(SafetyReasonCategory.ACUTE_RISK.code()) : List.of(),
                urgent ? List.of(ActionDisposition.REFER_URGENT.code()) : List.of(ActionDisposition.CONTINUE.code()));
    }

    public void saveCooking(String executionId, String planId, String planVersion, String mealId, String recipeVersion, int statusCode) {
        int updated = records.updateCooking(statusCode, Instant.now(), executionId);
        if (updated == 0) {
            records.insertCooking(
                    executionId, planId, planVersion, mealId, recipeVersion, statusCode, Instant.now(), Instant.now());
        }
    }

    public void saveCookingStep(String executionId, int stepNo) {
        records.upsertCookingStep(executionId, stepNo, Instant.now());
    }

    public Optional<Execution> findCooking(String executionId) {
        List<CookingRow> rows = records.findCooking(executionId);
        if (rows.isEmpty()) {
            return Optional.empty();
        }
        Set<Integer> steps = Set.copyOf(records.cookingSteps(executionId));
        CookingRow stored = rows.getFirst();
        return Optional.of(new Execution(
                stored.executionId(), stored.planId(), stored.planVersion(), stored.mealId(),
                stored.recipeVersion(), CookingStatus.fromCode(stored.statusCode()), steps));
    }

    public void saveReplay(ReplaySnapshot snapshot) {
        try {
            records.upsertReplay(
                    snapshot.planVersion(), snapshot.profileHash(), snapshot.rulesHash(),
                    mapper.writeValueAsString(snapshot.constraintIds()), snapshot.solverVersion(),
                    snapshot.solverLayerHash(), Instant.now());
        } catch (JsonProcessingException error) {
            throw new IllegalStateException(error);
        }
    }

    public Optional<ReplaySnapshot> findReplay(String planVersion) {
        return records.findReplay(planVersion).stream().findFirst().map(this::snapshot);
    }

    public void saveRecipe(Recipe recipe) {
        int updated = records.updateRecipe(recipe.version(), recipe.recipeId());
        if (updated == 0) {
            records.insertRecipe(recipe.recipeId(), recipe.recipeId(), recipe.version(), Instant.now());
        }
        int versionUpdated = records.updateRecipeVersion(recipe.status().code(), recipe.recipeId(), recipe.version());
        if (versionUpdated == 0) {
            records.insertRecipeVersion(
                    recipe.recipeId(), recipe.version(), recipe.status().code(),
                    recipe.status() == RecipeStatus.PUBLISHED ? Instant.now() : null);
        }
        records.deleteRecipeIngredients(recipe.recipeId(), recipe.version());
        records.deleteRecipeSteps(recipe.recipeId(), recipe.version());
        for (RecipeIngredient ingredient : recipe.ingredients()) {
            records.insertRecipeIngredient(
                    recipe.recipeId(), recipe.version(), ingredient.foodItemId(), ingredient.quantity(), ingredient.unitCode());
        }
        for (RecipeStep step : recipe.steps()) {
            records.insertRecipeStep(recipe.recipeId(), recipe.version(), step.stepNo(), step.instruction());
        }
    }

    public Optional<Recipe> findRecipe(String recipeId, String version) {
        List<Integer> status = records.recipeStatus(recipeId, version);
        if (status.isEmpty()) {
            return Optional.empty();
        }
        List<RecipeIngredient> ingredients = records.recipeIngredients(recipeId, version);
        List<RecipeStep> steps = records.recipeSteps(recipeId, version);
        return Optional.of(new Recipe(recipeId, version, RecipeStatus.fromCode(status.getFirst()), ingredients, steps));
    }

    public void saveDraft(RecognitionDraft draft, int sourceTypeCode, String sourceReference) {
        try {
            records.insertDraft(
                    draft.draftId(), draft.patientId(), sourceTypeCode, sourceReference,
                    mapper.writeValueAsString(draft.candidates()), Instant.now());
        } catch (JsonProcessingException error) {
            throw new IllegalStateException(error);
        }
    }

    public Optional<RecognitionDraft> findDraft(String draftId) {
        return records.findDraft(draftId).stream().findFirst().map(this::draft);
    }

    public void deleteDraft(String draftId) {
        records.deleteDraft(draftId);
    }

    private static PlanRecord plan(PlanRow row) {
        return new PlanRecord(
                row.planId(),
                row.currentVersion(),
                row.patientId(),
                row.profileVersion(),
                row.pantryVersion(),
                PlanStatus.fromCode(row.statusCode()));
    }

    private ReplaySnapshot snapshot(ReplayRow row) {
        try {
            List<String> constraints = mapper.readValue(row.constraintIdsJson(), new TypeReference<List<String>>() {
            });
            return new ReplaySnapshot(
                    row.planVersion(),
                    row.profileHash(),
                    row.rulesHash(),
                    constraints,
                    row.solverVersion(),
                    row.solverLayerHash());
        } catch (JsonProcessingException error) {
            throw new IllegalStateException(error);
        }
    }

    private RecognitionDraft draft(DraftRow row) {
        try {
            List<RecognitionCandidate> candidates = mapper.readValue(
                    row.candidatesJson(), new TypeReference<List<RecognitionCandidate>>() {
                    });
            return new RecognitionDraft(row.draftId(), row.patientId(), candidates);
        } catch (JsonProcessingException error) {
            throw new IllegalStateException(error);
        }
    }
}
