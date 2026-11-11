package com.moonligh.nutritionist.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HexFormat;

import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.consult.framework.Result;
import com.moonligh.consult.security.AccountIds;
import com.moonligh.nutritionist.api.req.UpsertProfileReq;
import com.moonligh.nutritionist.api.res.ProfileRes;
import com.moonligh.nutritionist.common.IdempotencyKeyFilter;
import com.moonligh.nutritionist.service.IdempotencyService;
import com.moonligh.nutritionist.service.ProfileService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/nutrition/profile")
public class ProfileController {

    private static final String SCOPE = "profile.put";

    private final ProfileService profiles;
    private final IdempotencyService idempotency;
    private final ObjectMapper mapper;

    public ProfileController(ProfileService profiles, IdempotencyService idempotency, ObjectMapper mapper) {
        this.profiles = profiles;
        this.idempotency = idempotency;
        this.mapper = mapper;
    }

    @PutMapping
    public Result<ProfileRes> upsert(
            @RequestBody UpsertProfileReq request,
            @RequestHeader(IdempotencyKeyFilter.HEADER) String idempotencyKey,
            HttpServletRequest http)
            throws JsonProcessingException {
        String accountId = AccountIds.of(http);
        String requestHash = sha256(mapper.writeValueAsString(request));
        var replay = idempotency.beginOrReplay(accountId, SCOPE, idempotencyKey, requestHash);
        if (replay.isPresent()) {
            return mapper.readerFor(
                            mapper.getTypeFactory().constructParametricType(Result.class, ProfileRes.class))
                    .without(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES)
                    .readValue(replay.get().responseBody());
        }
        Result<ProfileRes> result = Result.ok(profiles.upsert(accountId, request));
        idempotency.complete(
                accountId,
                SCOPE,
                idempotencyKey,
                requestHash,
                result.getCode(),
                mapper.writeValueAsString(result));
        return result;
    }

    private static String sha256(String raw) {
        try {
            return HexFormat.of().formatHex(
                    MessageDigest.getInstance("SHA-256").digest(raw.getBytes(StandardCharsets.UTF_8)));
        } catch (NoSuchAlgorithmException error) {
            throw new IllegalStateException(error);
        }
    }
}
