package com.moonligh.nutritionist.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.moonligh.consult.framework.Result;
import com.moonligh.consult.security.AccountIds;
import com.moonligh.nutritionist.api.req.CreateAllergyReq;
import com.moonligh.nutritionist.api.res.AllergyRes;
import com.moonligh.nutritionist.common.IdempotencyKeyFilter;
import com.moonligh.nutritionist.service.ClinicalRecordService;
import com.moonligh.nutritionist.service.IdempotentCommandService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/nutrition/allergies")
public class AllergyController {

    private final ClinicalRecordService records;
    private final IdempotentCommandService commands;

    public AllergyController(ClinicalRecordService records, IdempotentCommandService commands) {
        this.records = records;
        this.commands = commands;
    }

    @PostMapping
    public Result<AllergyRes> create(
            @RequestBody CreateAllergyReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(accountId, "allergies.create", idempotencyKey, request, AllergyRes.class,
                () -> records.addAllergy(accountId, request));
    }
}
