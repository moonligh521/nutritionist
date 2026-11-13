package com.moonligh.nutritionist.infrastructure.persistence;

import java.time.Instant;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moonligh.nutritionist.domain.audit.IdempotencyRecord;

@Mapper
public interface IdempotencyMapper {

    List<IdempotencyRecord> find(
            @Param("accountId") String accountId,
            @Param("endpointScope") String endpointScope,
            @Param("idempotencyKey") String idempotencyKey);

    int insert(
            @Param("accountId") String accountId,
            @Param("endpointScope") String endpointScope,
            @Param("idempotencyKey") String idempotencyKey,
            @Param("requestHash") String requestHash,
            @Param("responseCode") int responseCode,
            @Param("responseBody") String responseBody,
            @Param("createdAt") Instant createdAt);
}
