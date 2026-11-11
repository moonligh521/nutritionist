package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.ConfirmPantryReq;
import com.moonligh.nutritionist.api.req.ConfirmedPantryItemReq;
import com.moonligh.nutritionist.api.req.CorrectIntakeReq;
import com.moonligh.nutritionist.api.req.CravingEvalReq;
import com.moonligh.nutritionist.api.req.CreateAllergyReq;
import com.moonligh.nutritionist.api.req.CreateConditionReq;
import com.moonligh.nutritionist.api.req.CreateIntakeReq;
import com.moonligh.nutritionist.api.req.CreateMeasurementReq;
import com.moonligh.nutritionist.api.req.CreateMedicationReq;
import com.moonligh.nutritionist.api.req.CreatePantryItemReq;
import com.moonligh.nutritionist.api.req.FoodQuestionReq;
import com.moonligh.nutritionist.api.req.IntakeItemReq;
import com.moonligh.nutritionist.api.req.ReplacePlanItemReq;
import com.moonligh.nutritionist.api.res.PlanSnapshotRes;
import com.moonligh.nutritionist.domain.explanation.RecommendationExplanation;
import com.moonligh.nutritionist.domain.outcome.MeasurementDecision;
import com.moonligh.nutritionist.domain.replay.CandidateRejectionReason;
import com.moonligh.nutritionist.domain.replay.DecisionReplayService;
import com.moonligh.nutritionist.domain.safety.SafetyPermission;
import com.moonligh.nutritionist.domain.target.EvenMealBudgetAllocator;
import com.moonligh.nutritionist.domain.target.TargetCalculationResult;
import com.moonligh.nutritionist.infrastructure.identity.FakePatientGateway;
import com.moonligh.nutritionist.infrastructure.persistence.InMemoryPatientBindingStore;

class RemainingContractTest {

    private PatientBindingService bindings;
    private PantryService pantry;
    private PlanService plans;
    private IntakeService intakes;

    @BeforeEach
    void setUp() {
        FakePatientGateway gateway = new FakePatientGateway();
        gateway.put("acc-1", "pat-1", "pv1");
        bindings = new PatientBindingService(new InMemoryPatientBindingStore(), gateway);
        bindings.bind("acc-1", "pat-1", "pv1");
        pantry = new PantryService(bindings);
        plans = new PlanService(pantry);
        intakes = new IntakeService(bindings, pantry);
    }

    @Test
    void recognitionStaysDraftUntilConfirmWritesPantry() {
        PantryRecognitionService recognition = new PantryRecognitionService();
        var draft = recognition.recognizeText("pat-1", "半斤鸡肉");
        assertEquals(0, pantry.snapshot("acc-1", "pat-1").items().size());

        var snapshot = new PantryConfirmationService(recognition, pantry).confirm(
                "acc-1",
                new ConfirmPantryReq(
                        "pat-1",
                        "pv1",
                        draft.draftId(),
                        List.of(new ConfirmedPantryItemReq("food-chicken", new BigDecimal("250"), 1, 1, "鸡腿肉"))));

        assertEquals(1, snapshot.items().size());
        assertTrue(recognition.findDraft(draft.draftId()).isEmpty());
    }

    @Test
    void clinicalFactsAppendAndMeasurementDoesNotRetargetMeals() {
        ClinicalRecordService records = new ClinicalRecordService(bindings);
        records.addCondition("acc-1", new CreateConditionReq("pat-1", "pv1", "E11", LocalDate.parse("2020-01-01"), 1, null));
        records.addCondition("acc-1", new CreateConditionReq("pat-1", "pv1", "I10", null, 1, "追加"));
        records.addMedication("acc-1", new CreateMedicationReq(
                "pat-1", "pv1", "二甲双胍", 1, "500mg", "bid", null, null, false));
        records.addAllergy("acc-1", new CreateAllergyReq("pat-1", "pv1", "peanut", 3, true));
        var measurement = records.addMeasurement("acc-1", new CreateMeasurementReq(
                "pat-1", "pv1", "m-1", 2, new BigDecimal("80.1"), 1, Instant.now(), null, 1, false));

        assertEquals(2, records.conditionCount("pat-1"));
        assertEquals(MeasurementDecision.RECORD_ONLY.code(), measurement.decisionCode());
    }

    @Test
    void shortTermWeightStallDoesNotExpandDeficitAndFutureAdjustSkipsEatenMeals() {
        OutcomeEvaluator evaluator = new OutcomeEvaluator();
        var evaluation = evaluator.evaluate(new OutcomeEvaluator.Input(
                new BigDecimal("80"), new BigDecimal("80.1"), false, false, Instant.now()));
        assertEquals(OutcomeEvaluator.Decision.KEEP_PLAN, evaluation.decision());
        assertEquals(0, evaluation.deficitDeltaKcal());

        FutureMealAdjuster adjuster = new FutureMealAdjuster();
        List<PlanSnapshotRes.MealSlotRes> meals = List.of(
                new PlanSnapshotRes.MealSlotRes("breakfast", true, "oats", 400),
                new PlanSnapshotRes.MealSlotRes("dinner", false, "fish", 500));
        List<PlanSnapshotRes.MealSlotRes> adjusted = adjuster.adjust(
                meals, OutcomeEvaluator.Decision.ADJUST_FUTURE_MEALS, 40);

        assertEquals(400, adjusted.getFirst().energyKcal());
        assertEquals(460, adjusted.get(1).energyKcal());
        assertTrue(adjusted.getFirst().eaten());
    }

    @Test
    void modelRewriteThatChangesGramsIsRejected() {
        RecommendationExplanation explanations = new RecommendationExplanation();
        BusinessException error = assertThrows(BusinessException.class, () -> explanations.acceptRewrite(
                new RecommendationExplanation.Explanation("鸡胸 120 克", new BigDecimal("120")),
                "改成 80 克更轻",
                new BigDecimal("80")));
        assertEquals(ErrorCode.PARAM_INVALID, error.getErrorCode());

        FoodQuestionService questions = new FoodQuestionService(explanations);
        assertThrows(BusinessException.class, () -> questions.answer(
                new FoodQuestionReq("plan-1", "能不能少一点", new BigDecimal("120"), new BigDecimal("80"))));
    }

    @Test
    void cravingUsesThreeReasonCodesAndNeverClaimsNoHarm() {
        CravingEvaluationService service = new CravingEvaluationService();
        var allergy = service.evaluate(new CravingEvalReq("pat-1", "p1", "peanut", new BigDecimal("20"), 1, 1, new BigDecimal("10")));
        var limited = service.evaluate(new CravingEvalReq("pat-1", "p1", "cake", new BigDecimal("50"), 1, 2, new BigDecimal("10")));
        var allowed = service.evaluate(new CravingEvalReq("pat-1", "p1", "yogurt", new BigDecimal("100"), 1, 3, new BigDecimal("100")));

        assertEquals(CravingEvaluationService.Disposition.REJECTED_ALLERGY.code(), allergy.dispositionCode());
        assertEquals(0, allergy.allowedPortion().signum());
        assertEquals(CravingEvaluationService.Disposition.LIMITED_PORTION.code(), limited.dispositionCode());
        assertEquals(new BigDecimal("10"), limited.allowedPortion());
        assertEquals(CravingEvaluationService.Disposition.ALLOWED.code(), allowed.dispositionCode());
        assertFalse(allergy.claimsNoHarm());
        assertFalse(limited.claimsNoHarm());
        assertFalse(allowed.claimsNoHarm());
    }

    @Test
    void replaceSkipsEatenMealsAndCorrectionDoesNotOverwriteIntake() {
        plans.addValidated("plan-1", "v1", "pat-1", "profile-1", "0");
        plans.addMeal("plan-1", "breakfast", true, "oats", 400);
        plans.addMeal("plan-1", "dinner", false, "fish", 500);
        assertThrows(BusinessException.class, () -> plans.replace(
                "plan-1", new ReplacePlanItemReq("v1", "breakfast", "bread", null, 1)));
        plans.replace("plan-1", new ReplacePlanItemReq("v1", "dinner", "tofu", null, 1));

        pantry.create("acc-1", new CreatePantryItemReq(
                "pat-1", "pv1", "food-apple", new BigDecimal("10"), 1, 1, Instant.now().plusSeconds(3600), "a"));
        var intake = intakes.create("acc-1", new CreateIntakeReq(
                "event-1", "pat-1", "pv1", null,
                List.of(new IntakeItemReq(1, "food-apple", null, new BigDecimal("2"), 1, 1))));
        intakes.correct("acc-1", intake.intakeId(), new CorrectIntakeReq(
                "event-1-fix", "pat-1", "pv1", "记错了",
                List.of(new IntakeItemReq(1, "food-apple", null, new BigDecimal("9"), 1, 1))));

        assertEquals(new BigDecimal("2"), intakes.originalRequest(intake.intakeId()).items().getFirst().quantity());
    }

    @Test
    void expiredProfessionalTargetCannotPlanAndLockedSafetyReturnsHumanReview() {
        ProfessionalTargetService service = new ProfessionalTargetService();
        service.create("nutritionist_pro", new ProfessionalTargetService.CreateRequest(
                "pat-1", "ENERGY", new BigDecimal("1200"), new BigDecimal("1500"),
                Instant.now().minusSeconds(7200), Instant.now().minusSeconds(60)));
        assertThrows(BusinessException.class, () -> service.authorizePlanning("pat-1", Instant.now(), false));

        service.create("staff", new ProfessionalTargetService.CreateRequest(
                "pat-1", "ENERGY", new BigDecimal("1200"), new BigDecimal("1500"),
                Instant.now().minusSeconds(60), Instant.now().plusSeconds(3600)));
        assertEquals(SafetyPermission.HUMAN_REVIEW, service.authorizePlanning("pat-1", Instant.now(), true));
        assertEquals(SafetyPermission.ALLOWED, service.authorizePlanning("pat-1", Instant.now(), false));
    }

    @Test
    void replayStoresContentHashAndRejectionReasonStaysTyped() {
        DecisionReplayService replay = new DecisionReplayService();
        var first = replay.record("plan-v1", "profile-a", "rules-a", List.of("c1"), "ojalgo-1", "layer-a");
        var same = replay.record("plan-v1", "profile-a", "rules-a", List.of("c1"), "ojalgo-1", "layer-a");
        var changed = replay.record("plan-v2", "profile-b", "rules-a", List.of("c1"), "ojalgo-1", "layer-a");
        assertEquals(first.profileHash(), same.profileHash());
        assertFalse(first.profileHash().equals(changed.profileHash()));

        CandidateRejectionReason reason = new CandidateRejectionReason(
                "recipe-1", 1, "allergy", "花生过敏", List.of("c1"), 1);
        assertEquals("allergy", reason.reasonCode());
        assertEquals(List.of("c1"), reason.constraintIds());
    }

    @Test
    void mealBudgetRequiresAllowedTarget() {
        EvenMealBudgetAllocator allocator = new EvenMealBudgetAllocator();
        var allocation = allocator.allocate(new TargetCalculationResult(SafetyPermission.ALLOWED, "formula-1", List.of()));
        assertEquals(100, allocation.meals().stream().mapToInt(share -> share.percent()).sum());
        assertThrows(BusinessException.class, () -> allocator.allocate(
                new TargetCalculationResult(SafetyPermission.HUMAN_REVIEW, null, List.of("LOCKED"))));
    }
}
