package com.moonligh.nutritionist.domain.profile;

import java.util.Optional;

/**
 * 本地患者绑定存储。
 */
public interface PatientBindingStore {

    Optional<PatientRef> find(String accountId, String patientId);

    void save(PatientRef ref);
}
