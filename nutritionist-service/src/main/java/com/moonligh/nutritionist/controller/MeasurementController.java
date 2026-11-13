package com.moonligh.nutritionist.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.moonligh.consult.framework.Result;
import com.moonligh.consult.security.AccountIds;
import com.moonligh.nutritionist.api.req.CreateMeasurementReq;
import com.moonligh.nutritionist.api.res.MeasurementRes;
import com.moonligh.nutritionist.common.IdempotencyKeyFilter;
import com.moonligh.nutritionist.service.ClinicalRecordService;
import com.moonligh.nutritionist.service.IdempotentCommandService;
import com.moonligh.nutritionist.service.MeasurementFollowUp;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/nutrition/measurements")
public class MeasurementController {

    private final ClinicalRecordService records;
    private final IdempotentCommandService commands;
    private final MeasurementFollowUp followUp;

    public MeasurementController(
            ClinicalRecordService records, IdempotentCommandService commands, MeasurementFollowUp followUp) {
        this.records = records;
        this.commands = commands;
        this.followUp = followUp;
    }

    @PostMapping
    public Result<MeasurementRes> create(
            @RequestBody CreateMeasurementReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        return commands.execute(accountId, "measurements.create", idempotencyKey, request, MeasurementRes.class,
                () -> {
                    MeasurementRes created = records.addMeasurement(accountId, request);
                    followUp.refresh(request);
                    return created;
                });
    }
}
