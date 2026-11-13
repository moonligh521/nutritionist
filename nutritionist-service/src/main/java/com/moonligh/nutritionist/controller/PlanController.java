package com.moonligh.nutritionist.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.moonligh.consult.framework.Result;
import com.moonligh.consult.security.AccountIds;
import com.moonligh.nutritionist.api.req.ConfirmPlanReq;
import com.moonligh.nutritionist.api.req.ReplacePlanItemReq;
import com.moonligh.nutritionist.api.res.PlanActionRes;
import com.moonligh.nutritionist.api.res.PlanSnapshotRes;
import com.moonligh.nutritionist.api.res.SolvedMealRes;
import com.moonligh.nutritionist.common.IdempotencyKeyFilter;
import com.moonligh.nutritionist.domain.meal.MealPlan;
import com.moonligh.nutritionist.service.IdempotentCommandService;
import com.moonligh.nutritionist.service.PatientBindingService;
import com.moonligh.nutritionist.service.PlanService;
import com.moonligh.nutritionist.service.PresentationStore;
import com.moonligh.nutritionist.service.SolvedMealService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/nutrition/plans")
public class PlanController {

    private final PlanService plans;
    private final IdempotentCommandService commands;
    private final SolvedMealService solvedMeals;
    private final PatientBindingService bindings;
    private final PresentationStore presentations;

    public PlanController(
            PlanService plans,
            IdempotentCommandService commands,
            SolvedMealService solvedMeals,
            PatientBindingService bindings,
            PresentationStore presentations) {
        this.plans = plans;
        this.commands = commands;
        this.solvedMeals = solvedMeals;
        this.bindings = bindings;
        this.presentations = presentations;
    }

    @PostMapping("/{planId}/confirm")
    public Result<PlanActionRes> confirm(
            @PathVariable String planId,
            @RequestBody ConfirmPlanReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(
                accountId,
                "plans.confirm",
                idempotencyKey,
                request,
                PlanActionRes.class,
                () -> plans.confirm(planId, request));
    }

    @PostMapping("/{planId}/cancel")
    public Result<PlanActionRes> cancel(
            @PathVariable String planId,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        CancelPlanCommand request = new CancelPlanCommand(planId);
        return commands.execute(
                accountId,
                "plans.cancel",
                idempotencyKey,
                request,
                PlanActionRes.class,
                () -> plans.cancel(planId));
    }

    @PostMapping("/{planId}/replace")
    public Result<PlanActionRes> replace(
            @PathVariable String planId,
            @RequestBody ReplacePlanItemReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(
                accountId,
                "plans.replace",
                idempotencyKey,
                request,
                PlanActionRes.class,
                () -> plans.replace(planId, request));
    }

    @GetMapping("/current")
    public Result<PlanSnapshotRes> current(@RequestParam String patientId) {
        return Result.ok(plans.current(patientId));
    }

    @GetMapping("/solved")
    public Result<SolvedMealRes> solved(
            @RequestParam String patientId,
            @RequestParam String patientVersion,
            @RequestParam LocalDate date,
            HttpServletRequest http) {
        bindings.requireBoundPatient(AccountIds.of(http), patientId, patientVersion);
        MealPlan plan = solvedMeals.find(patientId, date);
        List<SolvedMealRes.DishRes> dishes = plan.dishes().stream()
                .map(dish -> new SolvedMealRes.DishRes(
                        dish.recipeId(),
                        dish.portions(),
                        dish.ingredients().stream()
                                .map(item -> new SolvedMealRes.IngredientRes(item.foodItemId(), item.grams()))
                                .toList(),
                        dish.steps().stream().map(step -> step.instruction()).toList()))
                .toList();
        return Result.ok(new SolvedMealRes(
                patientId,
                date,
                plan.representsDailyRemainder(),
                plan.representsDailyRemainder() ? "" : "不代表当天完整剩余额度",
                dishes,
                plan.missingFoodIds(),
                presentations.find(patientId, date).map(PresentationStore.Presentation::explanation).orElse("")));
    }

    private record CancelPlanCommand(String planId) {
    }
}
