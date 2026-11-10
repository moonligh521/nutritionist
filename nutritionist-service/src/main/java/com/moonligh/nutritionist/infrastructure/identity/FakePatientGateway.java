package com.moonligh.nutritionist.infrastructure.identity;

import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.profile.PatientGateway;
import com.moonligh.nutritionist.domain.profile.PatientSnapshot;

/**
 * 测试/本地用假患者网关。
 */
@Component
@ConditionalOnProperty(name = "nutritionist.identity.mode", havingValue = "fake", matchIfMissing = true)
public class FakePatientGateway implements PatientGateway {

    private final Map<String, PatientSnapshot> patients = new ConcurrentHashMap<>();

    public void put(String accountId, String patientId, String patientVersion) {
        patients.put(key(accountId, patientId), new PatientSnapshot(patientId, patientVersion, true));
    }

    @Override
    public Optional<PatientSnapshot> findOwnedPatient(String accountId, String patientId) {
        return Optional.ofNullable(patients.get(key(accountId, patientId)));
    }

    private static String key(String accountId, String patientId) {
        return accountId + '|' + patientId;
    }
}
