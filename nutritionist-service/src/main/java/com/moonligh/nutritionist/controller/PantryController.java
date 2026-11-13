package com.moonligh.nutritionist.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.moonligh.consult.framework.Result;
import com.moonligh.consult.security.AccountIds;
import com.moonligh.nutritionist.api.req.AdjustPantryReq;
import com.moonligh.nutritionist.api.req.ConfirmPantryReq;
import com.moonligh.nutritionist.api.req.CreatePantryItemReq;
import com.moonligh.nutritionist.api.res.PantryItemRes;
import com.moonligh.nutritionist.api.res.PantrySnapshotRes;
import com.moonligh.nutritionist.common.IdempotencyKeyFilter;
import com.moonligh.nutritionist.service.IdempotentCommandService;
import com.moonligh.nutritionist.service.PantryConfirmationService;
import com.moonligh.nutritionist.service.PantryService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/nutrition/pantry")
public class PantryController {

    private final PantryService pantry;
    private final PantryConfirmationService confirmations;
    private final IdempotentCommandService commands;

    public PantryController(
            PantryService pantry, PantryConfirmationService confirmations, IdempotentCommandService commands) {
        this.pantry = pantry;
        this.confirmations = confirmations;
        this.commands = commands;
    }

    @PostMapping("/confirm")
    public Result<PantrySnapshotRes> confirm(
            @RequestBody ConfirmPantryReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(
                accountId,
                "pantry.confirm",
                idempotencyKey,
                request,
                PantrySnapshotRes.class,
                () -> confirmations.confirm(accountId, request));
    }

    @PostMapping("/items")
    public Result<PantryItemRes> create(
            @RequestBody CreatePantryItemReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(
                accountId,
                "pantry.items.create",
                idempotencyKey,
                request,
                PantryItemRes.class,
                () -> pantry.create(accountId, request));
    }

    @PostMapping("/adjust")
    public Result<PantrySnapshotRes> adjust(
            @RequestBody AdjustPantryReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(
                accountId,
                "pantry.adjust",
                idempotencyKey,
                request,
                PantrySnapshotRes.class,
                () -> pantry.adjust(accountId, request));
    }

    @GetMapping
    public Result<PantrySnapshotRes> snapshot(@RequestParam String patientId, HttpServletRequest http) {
        return Result.ok(pantry.snapshot(AccountIds.of(http), patientId));
    }
}
