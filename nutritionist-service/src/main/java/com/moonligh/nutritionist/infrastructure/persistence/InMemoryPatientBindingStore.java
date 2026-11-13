package com.moonligh.nutritionist.infrastructure.persistence;

import java.util.Optional;

import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.domain.profile.PatientBindingStore;
import com.moonligh.nutritionist.domain.profile.PatientRef;

/**
 * 没有数据库时，用内存记住患者绑定。单元测试用它。
 */
@Repository
@ConditionalOnMissingBean(JdbcTemplate.class)
public class InMemoryPatientBindingStore implements PatientBindingStore {

    private final EntityTable<PatientRef> bindings = new EntityTable<>(InMemoryPatientBindingStore::idOf);

    @Override
    public Optional<PatientRef> find(String accountId, String patientId) {
        return bindings.find(idOf(accountId, patientId));
    }

    @Override
    public void save(PatientRef ref) {
        bindings.save(ref);
    }

    private static String idOf(PatientRef ref) {
        return idOf(ref.accountId(), ref.patientId());
    }

    private static String idOf(String accountId, String patientId) {
        return accountId + '|' + patientId;
    }
}
