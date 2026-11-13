package com.moonligh.nutritionist.infrastructure.persistence;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moonligh.nutritionist.domain.profile.Profile;

@Mapper
public interface ProfileMapper {

    List<Profile> findByPatientId(@Param("patientId") String patientId);

    int insert(
            @Param("profileId") String profileId,
            @Param("accountId") String accountId,
            @Param("patientId") String patientId,
            @Param("patientVersion") String patientVersion,
            @Param("version") long version,
            @Param("sexCode") int sexCode,
            @Param("birthDate") LocalDate birthDate,
            @Param("heightCm") BigDecimal heightCm,
            @Param("timezone") String timezone,
            @Param("activityLevelCode") Integer activityLevelCode,
            @Param("goalTypeCode") int goalTypeCode,
            @Param("updatedAt") Instant updatedAt);

    int update(
            @Param("patientVersion") String patientVersion,
            @Param("version") long version,
            @Param("sexCode") int sexCode,
            @Param("birthDate") LocalDate birthDate,
            @Param("heightCm") BigDecimal heightCm,
            @Param("timezone") String timezone,
            @Param("activityLevelCode") Integer activityLevelCode,
            @Param("goalTypeCode") int goalTypeCode,
            @Param("updatedAt") Instant updatedAt,
            @Param("patientId") String patientId,
            @Param("expectedVersion") Long expectedVersion);

    int insertSnapshot(
            @Param("profileId") String profileId,
            @Param("version") long version,
            @Param("snapshotJson") String snapshotJson,
            @Param("createdAt") Instant createdAt);
}
