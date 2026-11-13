package com.moonligh.nutritionist.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.consult.framework.Result;
import com.moonligh.nutritionist.api.req.CookingAdjustmentReq;
import com.moonligh.nutritionist.service.CookingExecutionService;
import com.moonligh.nutritionist.service.CookingRevisionService;

@RestController
@RequestMapping("/api/nutrition/cooking-executions")
public class CookingExecutionController {

    private final CookingExecutionService executions;
    private final CookingRevisionService revisions;

    public CookingExecutionController(CookingExecutionService executions, CookingRevisionService revisions) {
        this.executions = executions;
        this.revisions = revisions;
    }

    @PostMapping
    public Result<CookingExecutionService.Execution> start(@RequestBody StartCookingReq request) {
        return Result.ok(executions.start(
                request.planId(), request.planVersion(), request.mealId(), request.recipeVersion()));
    }

    @PostMapping("/{executionId}/steps/{stepNo}/complete")
    public Result<CookingExecutionService.Execution> completeStep(
            @PathVariable String executionId,
            @PathVariable int stepNo,
            @RequestBody CompleteStepReq request) {
        return Result.ok(executions.completeStep(executionId, stepNo, request.followPlanExactly()));
    }

    @PostMapping("/{executionId}/adjustments")
    public Result<CookingRevisionService.RevisionResult> adjust(
            @PathVariable String executionId, @RequestBody CookingAdjustmentReq request) {
        return Result.ok(revisions.recalculate(
                executionId,
                request.items().stream()
                        .map(item -> new CookingRevisionService.ActualIngredientChange(
                                item.foodItemId(),
                                item.plannedQuantity(),
                                item.actualQuantity(),
                                item.allergen(),
                                item.finishedWeight(),
                                item.consumedQuantity()))
                        .toList()));
    }

    @PostMapping("/{executionId}/finish")
    public Result<CookingExecutionService.Execution> finish(@PathVariable String executionId) {
        return Result.ok(executions.finish(executionId));
    }

    public record StartCookingReq(String planId, String planVersion, String mealId, String recipeVersion) {
    }

    public record CompleteStepReq(boolean followPlanExactly) {
    }
}
