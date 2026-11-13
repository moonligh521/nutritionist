package com.moonligh.nutritionist.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.moonligh.consult.framework.Result;
import com.moonligh.consult.security.AccountIds;
import com.moonligh.nutritionist.api.req.CorrectIntakeReq;
import com.moonligh.nutritionist.api.req.CreateIntakeReq;
import com.moonligh.nutritionist.api.res.IntakeRes;
import com.moonligh.nutritionist.common.IdempotencyKeyFilter;
import com.moonligh.nutritionist.service.IdempotentCommandService;
import com.moonligh.nutritionist.service.IntakeService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/nutrition/intakes")
public class IntakeController {

    private final IntakeService intakes;
    private final IdempotentCommandService commands;

    public IntakeController(IntakeService intakes, IdempotentCommandService commands) {
        this.intakes = intakes;
        this.commands = commands;
    }

    @PostMapping
    public Result<IntakeRes> create(
            @RequestBody CreateIntakeReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(
                accountId,
                "intakes.create",
                idempotencyKey,
                request,
                IntakeRes.class,
                () -> intakes.create(accountId, request));
    }

    @PostMapping("/{intakeId}/corrections")
    public Result<IntakeRes> correct(
            @PathVariable String intakeId,
            @RequestBody CorrectIntakeReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(
                accountId,
                "intakes.correct",
                idempotencyKey,
                request,
                IntakeRes.class,
                () -> intakes.correct(accountId, intakeId, request));
    }
}
