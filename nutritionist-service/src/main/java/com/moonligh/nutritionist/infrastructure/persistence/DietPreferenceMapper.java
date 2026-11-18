package com.moonligh.nutritionist.infrastructure.persistence;

import java.time.Instant;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/** 饮食偏好三表持久化。 */
@Mapper
public interface DietPreferenceMapper {

    int insertFact(FactRow row);

    int closeCurrentFacts(
            @Param("ownerId") String ownerId,
            @Param("subject") String subject,
            @Param("subjectType") String subjectType,
            @Param("validTo") Instant validTo);

    List<FactRow> listFacts(@Param("ownerId") String ownerId);

    int insertEvent(EventRow row);

    int countEvent(@Param("eventId") String eventId);

    int insertReview(ReviewRow row);

    List<ReviewRow> listReviews(@Param("ownerId") String ownerId);

    /** 关闭已到 valid_to 的现行事实。 */
    int expireTimedFacts(@Param("now") Instant now);

    /** 关闭过期 TURN / TEMPORARY 现行事实。 */
    int expireTurnFacts(
            @Param("now") Instant now,
            @Param("turnBefore") Instant turnBefore,
            @Param("tempBefore") Instant tempBefore);

    int upsertAllergySuspect(AllergySuspectRow row);

    List<AllergySuspectRow> listPendingAllergySuspects(@Param("ownerId") String ownerId);

    int markAllergySuspectDone(
            @Param("ownerId") String ownerId,
            @Param("subject") String subject,
            @Param("updatedAt") Instant updatedAt);

    record FactRow(
            String factId,
            String ownerId,
            String subject,
            String subjectType,
            String polarity,
            String strength,
            String scopeType,
            String conditionJson,
            Instant validFrom,
            Instant validTo,
            String sourceText,
            String eventId,
            long versionNo,
            Instant createdAt,
            Instant updatedAt) {
    }

    record EventRow(
            String eventId,
            String ownerId,
            String operation,
            String subject,
            String subjectType,
            String polarity,
            String strength,
            String scopeType,
            String evidenceText,
            String evidenceHash,
            String extractorVersion,
            String statusCode,
            String beforeJson,
            String afterJson,
            Instant appliedAt,
            Instant createdAt) {
    }

    record ReviewRow(
            String reviewId,
            String eventId,
            String ownerId,
            String reviewType,
            String reviewerType,
            String correctedValue,
            String noteText,
            Instant reviewedAt) {
    }

    record AllergySuspectRow(
            String suspectId,
            String ownerId,
            String subject,
            String evidenceText,
            int pendingFlag,
            Instant createdAt,
            Instant updatedAt) {
    }
}
