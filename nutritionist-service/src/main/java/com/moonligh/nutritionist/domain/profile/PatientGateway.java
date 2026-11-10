package com.moonligh.nutritionist.domain.profile;

import java.util.Optional;

/**
 * 挂号患者校验端口。
 */
public interface PatientGateway {

    Optional<PatientSnapshot> findOwnedPatient(String accountId, String patientId);
}
