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
import com.moonligh.nutritionist.api.req.CreateConditionReq;
import com.moonligh.nutritionist.api.req.CreateMeasurementReq;
import com.moonligh.nutritionist.api.req.CreateMedicationReq;
import com.moonligh.nutritionist.api.res.AllergyRes;
import com.moonligh.nutritionist.api.res.ConditionRes;
import com.moonligh.nutritionist.api.res.MeasurementRes;
import com.moonligh.nutritionist.api.res.MedicationRes;
import com.moonligh.nutritionist.common.IdempotencyKeyFilter;
import com.moonligh.nutritionist.service.ClinicalRecordService;
import com.moonligh.nutritionist.service.IdempotentCommandService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/nutrition")
public class ClinicalRecordController {

    private final ClinicalRecordService records;
    private final IdempotentCommandService commands;

    public ClinicalRecordController(ClinicalRecordService records, IdempotentCommandService commands) {
        this.records = records;
        this.commands = commands;
    }

    @PostMapping("/conditions")
    public Result<ConditionRes> condition(
            @RequestBody CreateConditionReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(accountId, "conditions.create", idempotencyKey, request, ConditionRes.class,
                () -> records.addCondition(accountId, request));
    }

    @PostMapping("/medications")
    public Result<MedicationRes> medication(
            @RequestBody CreateMedicationReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(accountId, "medications.create", idempotencyKey, request, MedicationRes.class,
                () -> records.addMedication(accountId, request));
    }

    @PostMapping("/allergies")
    public Result<AllergyRes> allergy(
            @RequestBody CreateAllergyReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(accountId, "allergies.create", idempotencyKey, request, AllergyRes.class,
                () -> records.addAllergy(accountId, request));
    }

    @PostMapping("/measurements")
    public Result<MeasurementRes> measurement(
            @RequestBody CreateMeasurementReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(accountId, "measurements.create", idempotencyKey, request, MeasurementRes.class,
                () -> records.addMeasurement(accountId, request));
    }
}