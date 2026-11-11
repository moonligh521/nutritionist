package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;

class AdvancedNutritionServicesTest {

    @Test
    void recognitionProducesDraftWithoutChangingPantry() {
        PantryRecognitionService service = new PantryRecognitionService();

        var draft = service.recognizeText("pat-1", "半斤鸡肉");

        assertEquals(1, draft.candidates().size());
        assertTrue(draft.candidates().getFirst().needsConfirmation());
        assertTrue(service.findDraft(draft.draftId()).isPresent());
    }

    @Test
    void cookingRejectsDeviationUntilAdjustmentPathIsUsed() {
        CookingExecutionService service = new CookingExecutionService();
        String executionId = service.start("plan-1", "pv1", "meal-1", "recipe-v1").executionId();

        BusinessException error = assertThrows(
                BusinessException.class, () -> service.completeStep(executionId, 1, false));

        assertEquals(ErrorCode.COOKING_DEVIATION_UNSUPPORTED, error.getErrorCode());
    }

    @Test
    void adjustmentRecalculatesNutritionAndKeepsSessionOpenOnConflict() {
        CookingRevisionService service = new CookingRevisionService(new BigDecimal("5"));

        var result = service.recalculate(
                "execution-1",
                List.of(new CookingRevisionService.ActualIngredientChange(
                        "oil", new BigDecimal("2"), new BigDecimal("8"), false)));

        assertFalse(result.accepted());
        assertEquals(CookingRevisionService.RevisionStatus.WAITING_REVISION, result.status());
    }

    @Test
    void outcomeEvaluatorAlwaysReturnsSixTypedCategories() {
        OutcomeEvaluator evaluator = new OutcomeEvaluator();

        var result = evaluator.evaluate(new OutcomeEvaluator.Input(
                new BigDecimal("80"), new BigDecimal("80.1"), false, false, Instant.now()));

        assertEquals(6, result.categories().size());
        assertEquals(OutcomeEvaluator.Decision.KEEP_PLAN, result.decision());
    }

    @Test
    void cravingRejectsAllergyAndLimitsOtherwiseAllowedPortion() {
        CravingEvaluationService service = new CravingEvaluationService();

        var rejected = service.evaluate(new CravingEvaluationService.Request(
                "food-peanut", new BigDecimal("50"), new BigDecimal("10"), true));
        var limited = service.evaluate(new CravingEvaluationService.Request(
                "food-cake", new BigDecimal("50"), new BigDecimal("10"), false));

        assertEquals(CravingEvaluationService.Disposition.REJECTED_ALLERGY, rejected.disposition());
        assertEquals(CravingEvaluationService.Disposition.LIMITED_PORTION, limited.disposition());
        assertEquals(new BigDecimal("10"), limited.allowedPortion());
    }
}
