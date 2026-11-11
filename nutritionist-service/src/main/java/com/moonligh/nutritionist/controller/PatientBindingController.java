package com.moonligh.nutritionist.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HexFormat;
import java.util.Optional;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.consult.framework.Result;
import com.moonligh.consult.security.AccountIds;
import com.moonligh.nutritionist.api.req.BindPatientReq;
import com.moonligh.nutritionist.api.res.PatientBindingRes;
import com.moonligh.nutritionist.common.IdempotencyKeyFilter;
import com.moonligh.nutritionist.domain.audit.IdempotencyRecord;
import com.moonligh.nutritionist.domain.profile.PatientRef;
import com.moonligh.nutritionist.service.IdempotencyService;
import com.moonligh.nutritionist.service.PatientBindingService;

import jakarta.servlet.http.HttpServletRequest;

/**
 * 绑定挂号就诊人引用。
 */
@RestController
@RequestMapping("/api/nutrition/patients")
public class PatientBindingController {

    public static final String SCOPE = "patients.bind";

    private final PatientBindingService bindings;
    private final IdempotencyService idempotency;
    private final ObjectMapper mapper;

    public PatientBindingController(
            PatientBindingService bindings, IdempotencyService idempotency, ObjectMapper mapper) {
        this.bindings = bindings;
        this.idempotency = idempotency;
        this.mapper = mapper;
    }

    @PostMapping("/bind")
    public Result<PatientBindingRes> bind(
            @RequestBody BindPatientReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        if (request == null || request.patientId() == null || request.patientId().isBlank()
                || request.patientVersion() == null || request.patientVersion().isBlank()) {
            throw new BusinessException(ErrorCode.PARAM_MISSING);
        }
        String accountId = AccountIds.of(http);
        String hash = sha256(mapper.writeValueAsString(request));
        Optional<IdempotencyRecord> replay =
                idempotency.beginOrReplay(accountId, SCOPE, idempotencyKey, hash);
        if (replay.isPresent()) {
            return mapper.readerFor(
                            mapper.getTypeFactory().constructParametricType(Result.class, PatientBindingRes.class))
                    .without(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES)
                    .readValue(replay.get().responseBody());
        }
        PatientRef ref = bindings.bind(accountId, request.patientId(), request.patientVersion());
        PatientBindingRes data =
                new PatientBindingRes(ref.accountId(), ref.patientId(), ref.patientVersion(), ref.boundAt());
        Result<PatientBindingRes> result = Result.ok(data);
        idempotency.complete(
                accountId, SCOPE, idempotencyKey, hash, result.getCode(), mapper.writeValueAsString(result));
        return result;
    }

    private static String sha256(String raw) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(raw.getBytes(StandardCharsets.UTF_8));
            return HexFormat.of().formatHex(digest);
        } catch (NoSuchAlgorithmException error) {
            throw new IllegalStateException(error);
        }
    }
}
