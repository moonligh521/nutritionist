package com.moonligh.nutritionist.service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HexFormat;
import java.util.function.Supplier;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.consult.framework.Result;

@Service
public class IdempotentCommandService {

    private final IdempotencyService idempotency;
    private final ObjectMapper mapper;

    public IdempotentCommandService(IdempotencyService idempotency, ObjectMapper mapper) {
        this.idempotency = idempotency;
        this.mapper = mapper;
    }

    public <T> Result<T> execute(
            String accountId,
            String scope,
            String idempotencyKey,
            Object request,
            Class<T> responseType,
            Supplier<T> action)
            throws JsonProcessingException {
        String requestHash = sha256(mapper.writeValueAsString(request));
        var replay = idempotency.beginOrReplay(accountId, scope, idempotencyKey, requestHash);
        if (replay.isPresent()) {
            JavaType resultType = mapper.getTypeFactory().constructParametricType(Result.class, responseType);
            return mapper.readerFor(resultType)
                    .without(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES)
                    .readValue(replay.get().responseBody());
        }
        Result<T> result = Result.ok(action.get());
        idempotency.complete(
                accountId,
                scope,
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
