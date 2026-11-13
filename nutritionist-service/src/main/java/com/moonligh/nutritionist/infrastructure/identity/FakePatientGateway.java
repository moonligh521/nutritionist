package com.moonligh.nutritionist.infrastructure.identity;

import java.util.Optional;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.domain.profile.PatientGateway;
import com.moonligh.nutritionist.domain.profile.PatientSnapshot;

/**
 * 本地和测试用的假患者目录。
 * 不访问挂号服务，只记住测试里放进来的患者。
 */
@Component
@ConditionalOnProperty(name = "nutritionist.identity.mode", havingValue = "fake", matchIfMissing = true)
public class FakePatientGateway implements PatientGateway {

    private final EntityTable<OwnedPatient> patients = new EntityTable<>(OwnedPatient::id);

    public void put(String accountId, String patientId, String patientVersion) {
        patients.save(new OwnedPatient(accountId, patientId, new PatientSnapshot(patientId, patientVersion, true)));
    }

    @Override
    public Optional<PatientSnapshot> findOwnedPatient(String accountId, String patientId) {
        return patients.find(OwnedPatient.idOf(accountId, patientId)).map(OwnedPatient::snapshot);
    }

    /** 某个账号名下的一位患者。 */
    record OwnedPatient(String accountId, String patientId, PatientSnapshot snapshot) {

        String id() {
            return idOf(accountId, patientId);
        }

        static String idOf(String accountId, String patientId) {
            return accountId + '|' + patientId;
        }
    }
}
