package com.moonligh.nutritionist.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.Result;
import com.moonligh.consult.security.AccountIds;
import com.moonligh.nutritionist.api.req.CravingEvalReq;
import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.api.res.CravingEvalRes;
import com.moonligh.nutritionist.api.res.RecommendationAcceptedRes;
import com.moonligh.nutritionist.api.res.RecommendationTaskRes;
import com.moonligh.nutritionist.api.res.SolvedMealRes;
import com.moonligh.nutritionist.domain.meal.MealPlan;
import com.moonligh.nutritionist.common.IdempotencyKeyFilter;
import com.moonligh.nutritionist.service.CravingEvaluationService;
import com.moonligh.nutritionist.service.IdempotentCommandService;
import com.moonligh.nutritionist.service.PresentationStore;
import com.moonligh.nutritionist.service.RecommendationWorkflow;
import com.moonligh.nutritionist.service.SolvedMealService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/nutrition/recommendations")
public class RecommendationController {

    private final RecommendationWorkflow workflow;
    private final IdempotentCommandService commands;
    private final CravingEvaluationService cravings;
    private final SolvedMealService solvedMeals;
    private final PresentationStore presentations;

    public RecommendationController(
            RecommendationWorkflow workflow,
            IdempotentCommandService commands,
            CravingEvaluationService cravings,
            SolvedMealService solvedMeals,
            PresentationStore presentations) {
        this.workflow = workflow;
        this.commands = commands;
        this.cravings = cravings;
        this.solvedMeals = solvedMeals;
        this.presentations = presentations;
    }

    @PostMapping("/craving")
    public Result<CravingEvalRes> craving(@RequestBody CravingEvalReq request) {
        return Result.ok(cravings.evaluate(request));
    }

    @PostMapping
    public Result<RecommendationAcceptedRes> create(
            @RequestBody CreateRecommendationReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(
                accountId,
                "recommendations.create",
                idempotencyKey,
                request,
                RecommendationAcceptedRes.class,
                () -> workflow.create(accountId, request));
    }

    @GetMapping("/{recommendationId}")
    public Result<RecommendationTaskRes> find(@PathVariable String recommendationId) {
        RecommendationWorkflow.Task task = workflow.find(recommendationId);
        return Result.ok(new RecommendationTaskRes(
                task.recommendationId(),
                task.status().code(),
                task.failureCode(),
                null,
                solvedMeal(task),
                task.conflicts().stream()
                        .map(conflict -> new com.moonligh.nutritionist.api.res.SolverConflictRes(
                                conflict.constraintId(),
                                conflict.nutrientType().code(),
                                conflict.requiredMinimum(),
                                conflict.requiredMaximum(),
                                conflict.attainableMinimum(),
                                conflict.attainableMaximum()))
                        .toList()));
    }

    private SolvedMealRes solvedMeal(RecommendationWorkflow.Task task) {
        if (task.status() != RecommendationWorkflow.TaskStatus.SUCCEEDED || task.request() == null) {
            return null;
        }
        try {
            MealPlan plan = solvedMeals.find(task.request().patientId(), task.request().date());
            return toSolvedMeal(task.request().patientId(), task.request().date(), plan);
        } catch (BusinessException error) {
            return null;
        }
    }

    private SolvedMealRes toSolvedMeal(String patientId, LocalDate date, MealPlan plan) {
        List<SolvedMealRes.DishRes> dishes = plan.dishes().stream()
                .map(dish -> new SolvedMealRes.DishRes(
                        dish.recipeId(),
                        dish.portions(),
                        dish.ingredients().stream()
                                .map(item -> new SolvedMealRes.IngredientRes(item.foodItemId(), item.grams()))
                                .toList(),
                        dish.steps().stream().map(step -> step.instruction()).toList()))
                .toList();
        return new SolvedMealRes(
                patientId,
                date,
                plan.representsDailyRemainder(),
                plan.representsDailyRemainder() ? "" : "不代表当天完整剩余额度",
                dishes,
                plan.missingFoodIds(),
                presentations.find(patientId, date).map(PresentationStore.Presentation::explanation).orElse(""));
    }

    @DeleteMapping("/{recommendationId}")
    public Result<RecommendationTaskRes> cancel(
            @PathVariable String recommendationId,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        CancelRecommendationCommand request = new CancelRecommendationCommand(recommendationId);
        return commands.execute(
                accountId,
                "recommendations.cancel",
                idempotencyKey,
                request,
                RecommendationTaskRes.class,
                () -> {
                    RecommendationWorkflow.Task task = workflow.cancel(recommendationId);
                    return new RecommendationTaskRes(
                            task.recommendationId(), task.status().code(), task.failureCode(), null);
                });
    }

    private record CancelRecommendationCommand(String recommendationId) {
    }
}
