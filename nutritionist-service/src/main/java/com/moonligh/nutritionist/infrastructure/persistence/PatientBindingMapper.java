package com.moonligh.nutritionist.infrastructure.persistence;

import java.time.Instant;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moonligh.nutritionist.domain.profile.PatientRef;

@Mapper
public interface PatientBindingMapper {

    List<PatientRef> find(@Param("accountId") String accountId, @Param("patientId") String patientId);

    int update(
            @Param("patientVersion") String patientVersion,
            @Param("boundAt") Instant boundAt,
            @Param("accountId") String accountId,
            @Param("patientId") String patientId);

    int insert(
            @Param("accountId") String accountId,
            @Param("patientId") String patientId,
            @Param("patientVersion") String patientVersion,
            @Param("boundAt") Instant boundAt);
}
