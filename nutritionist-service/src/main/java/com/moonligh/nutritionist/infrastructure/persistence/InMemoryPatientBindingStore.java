package com.moonligh.nutritionist.infrastructure.persistence;

import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.moonligh.nutritionist.domain.profile.PatientBindingStore;
import com.moonligh.nutritionist.domain.profile.PatientRef;

/**
 * 无数据源时的内存绑定存储。
 */
@Repository
@ConditionalOnMissingBean(JdbcTemplate.class)
public class InMemoryPatientBindingStore implements PatientBindingStore {

    private final ConcurrentHashMap<String, PatientRef> bindings = new ConcurrentHashMap<>();

    @Override
    public Optional<PatientRef> find(String accountId, String patientId) {
        return Optional.ofNullable(bindings.get(key(accountId, patientId)));
    }

    @Override
    public void save(PatientRef ref) {
        bindings.put(key(ref.accountId(), ref.patientId()), ref);
    }

    private static String key(String accountId, String patientId) {
        return accountId + '|' + patientId;
    }
}
