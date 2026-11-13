package com.moonligh.nutritionist.infrastructure.persistence;

import java.time.Instant;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface RecommendationTaskMapper {

    record TaskRow(
            String recommendationId,
            String accountId,
            int statusCode,
            Integer failureCode,
            Instant createdAt,
            Instant updatedAt,
            String requestJson,
            String conflictJson) {
    }

    int insertPending(
            @Param("recommendationId") String recommendationId,
            @Param("accountId") String accountId,
            @Param("patientId") String patientId,
            @Param("requestHash") String requestHash,
            @Param("statusCode") int statusCode,
            @Param("profileVersion") String profileVersion,
            @Param("pantryVersion") String pantryVersion,
            @Param("createdAt") Instant createdAt,
            @Param("updatedAt") Instant updatedAt,
            @Param("scopeKey") String scopeKey,
            @Param("requestJson") String requestJson);

    int update(
            @Param("statusCode") int statusCode,
            @Param("failureCode") Integer failureCode,
            @Param("updatedAt") Instant updatedAt,
            @Param("conflictJson") String conflictJson,
            @Param("openFlag") int openFlag,
            @Param("recommendationId") String recommendationId);

    List<TaskRow> find(@Param("recommendationId") String recommendationId);
}
