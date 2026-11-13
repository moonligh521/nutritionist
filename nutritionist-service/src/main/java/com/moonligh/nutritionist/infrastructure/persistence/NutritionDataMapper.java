package com.moonligh.nutritionist.infrastructure.persistence;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moonligh.nutritionist.api.req.IntakeItemReq;
import com.moonligh.nutritionist.api.res.IntakeRes;
import com.moonligh.nutritionist.domain.recipe.RecipeIngredient;
import com.moonligh.nutritionist.domain.recipe.RecipeStep;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataStore.DialogueTurnRow;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataStore.LatestMeasurement;
import com.moonligh.nutritionist.service.ProfessionalTargetService.Target;

@Mapper
public interface NutritionDataMapper {

    record PlanRow(
            String planId,
            String currentVersion,
            String patientId,
            String profileVersion,
            String pantryVersion,
            int statusCode) {
    }

    record MealRow(String mealId, int mealTypeCode, String itemRef, int statusCode, BigDecimal grams) {
    }

    record IntakeHeaderRow(String eventId, String patientId, String patientVersion, String mealId) {
    }

    record MeasurementRow(String measurementId, int decisionCode, int safetyPermissionCode) {
    }

    record CookingRow(
            String executionId,
            String planId,
            String planVersion,
            String mealId,
            String recipeVersion,
            int statusCode) {
    }

    record ReplayRow(
            String planVersion,
            String profileHash,
            String rulesHash,
            String constraintIdsJson,
            String solverVersion,
            String solverLayerHash) {
    }

    record DraftRow(String draftId, String patientId, String candidatesJson) {
    }

    int insertCondition(
            @Param("conditionId") String conditionId,
            @Param("patientId") String patientId,
            @Param("conditionCode") String conditionCode,
            @Param("onsetDate") LocalDate onsetDate,
            @Param("sourceCode") Integer sourceCode,
            @Param("note") String note,
            @Param("version") String version,
            @Param("statusCode") Integer statusCode,
            @Param("createdAt") Instant createdAt);

    List<String> conditionCodes(@Param("patientId") String patientId);

    Integer conditionCount(@Param("patientId") String patientId);

    List<String> medicationNames(@Param("patientId") String patientId);

    List<Integer> medicationCategories(@Param("patientId") String patientId);

    int insertMedication(
            @Param("medicationId") String medicationId,
            @Param("patientId") String patientId,
            @Param("medicationName") String medicationName,
            @Param("categoryCode") Integer categoryCode,
            @Param("doseText") String doseText,
            @Param("frequencyText") String frequencyText,
            @Param("completeConfirmed") int completeConfirmed,
            @Param("version") String version,
            @Param("createdAt") Instant createdAt);

    int insertAllergy(
            @Param("allergyId") String allergyId,
            @Param("patientId") String patientId,
            @Param("allergenCode") String allergenCode,
            @Param("severityCode") Integer severityCode,
            @Param("confirmed") int confirmed,
            @Param("version") String version,
            @Param("createdAt") Instant createdAt);

    int insertMeasurement(
            @Param("measurementId") String measurementId,
            @Param("eventId") String eventId,
            @Param("patientId") String patientId,
            @Param("typeCode") Integer typeCode,
            @Param("measurementValue") BigDecimal measurementValue,
            @Param("unitCode") Integer unitCode,
            @Param("observedAt") Instant observedAt,
            @Param("decisionCode") Integer decisionCode,
            @Param("safetyPermissionCode") Integer safetyPermissionCode,
            @Param("createdAt") Instant createdAt);

    int upsertCapabilitySwitch(
            @Param("scopeType") String scopeType,
            @Param("scopeKey") String scopeKey,
            @Param("enabled") int enabled,
            @Param("updatedAt") Instant updatedAt);

    int insertCapabilitySwitchEvent(
            @Param("scopeType") String scopeType,
            @Param("scopeKey") String scopeKey,
            @Param("action") String action,
            @Param("actorAccountId") String actorAccountId,
            @Param("createdAt") Instant createdAt);

    List<Integer> capabilityEnabled(@Param("scopeType") String scopeType, @Param("scopeKey") String scopeKey);

    int insertTarget(
            @Param("targetId") String targetId,
            @Param("patientId") String patientId,
            @Param("currentVersion") String currentVersion,
            @Param("createdAt") Instant createdAt);

    int insertTargetVersion(
            @Param("targetId") String targetId,
            @Param("version") String version,
            @Param("nutrientCode") String nutrientCode,
            @Param("minimum") BigDecimal minimum,
            @Param("maximum") BigDecimal maximum,
            @Param("effectiveAt") Instant effectiveAt,
            @Param("expiresAt") Instant expiresAt,
            @Param("createdAt") Instant createdAt);

    List<Target> targets(@Param("patientId") String patientId);

    List<Target> findTarget(@Param("targetId") String targetId);

    int expireTarget(
            @Param("expiresAt") Instant expiresAt,
            @Param("targetId") String targetId,
            @Param("version") String version);

    List<String> confirmedAllergens(@Param("patientId") String patientId);

    List<String> intakeIds(@Param("patientId") String patientId);

    int updatePlan(
            @Param("statusCode") int statusCode,
            @Param("currentVersion") String currentVersion,
            @Param("updatedAt") Instant updatedAt,
            @Param("planId") String planId);

    int insertPlan(
            @Param("planId") String planId,
            @Param("accountId") String accountId,
            @Param("patientId") String patientId,
            @Param("statusCode") int statusCode,
            @Param("currentVersion") String currentVersion,
            @Param("createdAt") Instant createdAt,
            @Param("updatedAt") Instant updatedAt);

    int insertPlanVersion(
            @Param("planVersionId") String planVersionId,
            @Param("planId") String planId,
            @Param("profileVersion") String profileVersion,
            @Param("pantryVersion") String pantryVersion,
            @Param("statusCode") int statusCode,
            @Param("createdAt") Instant createdAt);

    List<PlanRow> findPlan(@Param("planId") String planId);

    List<PlanRow> findConfirmedPlan(@Param("patientId") String patientId, @Param("statusCode") int statusCode);

    List<MealRow> findMeals(@Param("planVersionId") String planVersionId);

    int upsertMeal(
            @Param("mealId") String mealId,
            @Param("planVersionId") String planVersionId,
            @Param("mealTypeCode") int mealTypeCode,
            @Param("statusCode") int statusCode);

    int deleteMealItems(@Param("mealId") String mealId);

    int insertMealItem(
            @Param("mealItemId") String mealItemId,
            @Param("mealId") String mealId,
            @Param("itemRef") String itemRef,
            @Param("quantity") BigDecimal quantity,
            @Param("grams") BigDecimal grams);

    int insertIntakeEvent(
            @Param("intakeId") String intakeId,
            @Param("eventId") String eventId,
            @Param("accountId") String accountId,
            @Param("patientId") String patientId,
            @Param("patientVersion") String patientVersion,
            @Param("mealId") String mealId,
            @Param("recordedAt") Instant recordedAt);

    int insertIntakeItem(
            @Param("intakeId") String intakeId,
            @Param("itemTypeCode") Integer itemTypeCode,
            @Param("foodItemId") String foodItemId,
            @Param("cookingExecutionId") String cookingExecutionId,
            @Param("quantity") BigDecimal quantity,
            @Param("unitCode") Integer unitCode,
            @Param("weightBasisCode") Integer weightBasisCode);

    int insertCorrection(
            @Param("correctionId") String correctionId,
            @Param("eventId") String eventId,
            @Param("originalIntakeId") String originalIntakeId,
            @Param("accountId") String accountId,
            @Param("patientId") String patientId,
            @Param("patientVersion") String patientVersion,
            @Param("note") String note,
            @Param("recordedAt") Instant recordedAt);

    int insertCorrectionItem(
            @Param("correctionId") String correctionId,
            @Param("itemTypeCode") Integer itemTypeCode,
            @Param("foodItemId") String foodItemId,
            @Param("cookingExecutionId") String cookingExecutionId,
            @Param("quantity") BigDecimal quantity,
            @Param("unitCode") Integer unitCode,
            @Param("weightBasisCode") Integer weightBasisCode);

    List<IntakeRes> findCorrection(@Param("eventId") String eventId);

    List<IntakeHeaderRow> findIntakeHeader(@Param("intakeId") String intakeId);

    List<IntakeItemReq> findIntakeItems(@Param("intakeId") String intakeId);

    List<IntakeRes> findIntakeByEventId(@Param("eventId") String eventId);

    List<IntakeRes> findIntakeByIntakeId(@Param("intakeId") String intakeId);

    int insertDialogueTurn(
            @Param("patientId") String patientId,
            @Param("turnDate") LocalDate turnDate,
            @Param("goalCode") String goalCode,
            @Param("foodNames") String foodNames,
            @Param("missingNames") String missingNames,
            @Param("explanation") String explanation,
            @Param("createdAt") Instant createdAt);

    List<DialogueTurnRow> latestDialogueTurn(@Param("patientId") String patientId);

    List<LatestMeasurement> latestMeasurement(@Param("patientId") String patientId);

    List<MeasurementRow> findMeasurement(@Param("eventId") String eventId);

    int updateCooking(
            @Param("statusCode") int statusCode,
            @Param("updatedAt") Instant updatedAt,
            @Param("executionId") String executionId);

    int insertCooking(
            @Param("executionId") String executionId,
            @Param("planId") String planId,
            @Param("planVersion") String planVersion,
            @Param("mealId") String mealId,
            @Param("recipeVersion") String recipeVersion,
            @Param("statusCode") int statusCode,
            @Param("createdAt") Instant createdAt,
            @Param("updatedAt") Instant updatedAt);

    int upsertCookingStep(
            @Param("executionId") String executionId,
            @Param("stepNo") int stepNo,
            @Param("completedAt") Instant completedAt);

    List<CookingRow> findCooking(@Param("executionId") String executionId);

    List<Integer> cookingSteps(@Param("executionId") String executionId);

    int upsertReplay(
            @Param("planVersion") String planVersion,
            @Param("profileHash") String profileHash,
            @Param("rulesHash") String rulesHash,
            @Param("constraintIdsJson") String constraintIdsJson,
            @Param("solverVersion") String solverVersion,
            @Param("solverLayerHash") String solverLayerHash,
            @Param("createdAt") Instant createdAt);

    List<ReplayRow> findReplay(@Param("planVersion") String planVersion);

    int updateRecipe(@Param("currentVersion") String currentVersion, @Param("recipeId") String recipeId);

    int insertRecipe(
            @Param("recipeId") String recipeId,
            @Param("displayName") String displayName,
            @Param("currentVersion") String currentVersion,
            @Param("createdAt") Instant createdAt);

    int updateRecipeVersion(
            @Param("statusCode") int statusCode,
            @Param("recipeId") String recipeId,
            @Param("version") String version);

    int insertRecipeVersion(
            @Param("recipeId") String recipeId,
            @Param("version") String version,
            @Param("statusCode") int statusCode,
            @Param("approvedAt") Instant approvedAt);

    int deleteRecipeIngredients(@Param("recipeId") String recipeId, @Param("recipeVersion") String recipeVersion);

    int deleteRecipeSteps(@Param("recipeId") String recipeId, @Param("recipeVersion") String recipeVersion);

    int insertRecipeIngredient(
            @Param("recipeId") String recipeId,
            @Param("recipeVersion") String recipeVersion,
            @Param("foodItemId") String foodItemId,
            @Param("quantity") BigDecimal quantity,
            @Param("unitCode") int unitCode);

    int insertRecipeStep(
            @Param("recipeId") String recipeId,
            @Param("recipeVersion") String recipeVersion,
            @Param("stepNo") int stepNo,
            @Param("instruction") String instruction);

    List<Integer> recipeStatus(@Param("recipeId") String recipeId, @Param("version") String version);

    List<RecipeIngredient> recipeIngredients(@Param("recipeId") String recipeId, @Param("recipeVersion") String recipeVersion);

    List<RecipeStep> recipeSteps(@Param("recipeId") String recipeId, @Param("recipeVersion") String recipeVersion);

    int insertDraft(
            @Param("draftId") String draftId,
            @Param("patientId") String patientId,
            @Param("sourceTypeCode") int sourceTypeCode,
            @Param("sourceReference") String sourceReference,
            @Param("candidatesJson") String candidatesJson,
            @Param("createdAt") Instant createdAt);

    List<DraftRow> findDraft(@Param("draftId") String draftId);

    int deleteDraft(@Param("draftId") String draftId);
}
