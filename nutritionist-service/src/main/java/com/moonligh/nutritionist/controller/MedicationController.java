package com.moonligh.nutritionist.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.moonligh.consult.framework.Result;
import com.moonligh.consult.security.AccountIds;
import com.moonligh.nutritionist.api.req.CreateMedicationReq;
import com.moonligh.nutritionist.api.res.MedicationRes;
import com.moonligh.nutritionist.common.IdempotencyKeyFilter;
import com.moonligh.nutritionist.service.ClinicalRecordService;
import com.moonligh.nutritionist.service.IdempotentCommandService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/nutrition/medications")
public class MedicationController {

    private final ClinicalRecordService records;
    private final IdempotentCommandService commands;

    public MedicationController(ClinicalRecordService records, IdempotentCommandService commands) {
        this.records = records;
        this.commands = commands;
    }

    @PostMapping
    public Result<MedicationRes> create(
            @RequestBody CreateMedicationReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(accountId, "medications.create", idempotencyKey, request, MedicationRes.class,
                () -> records.addMedication(accountId, request));
    }
}
