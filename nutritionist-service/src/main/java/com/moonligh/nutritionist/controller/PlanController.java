package com.moonligh.nutritionist.controller;

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
import com.moonligh.nutritionist.common.IdempotencyKeyFilter;
import com.moonligh.nutritionist.service.IdempotentCommandService;
import com.moonligh.nutritionist.service.PlanService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/nutrition/plans")
public class PlanController {

    private final PlanService plans;
    private final IdempotentCommandService commands;

    public PlanController(PlanService plans, IdempotentCommandService commands) {
        this.plans = plans;
        this.commands = commands;
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

    private record CancelPlanCommand(String planId) {
    }
}
