package com.moonligh.nutritionist.infrastructure.persistence;

import java.time.Instant;
import java.util.Optional;

import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.moonligh.nutritionist.domain.profile.PatientBindingStore;
import com.moonligh.nutritionist.domain.profile.PatientRef;

/**
 * 患者绑定 JDBC 实现。
 */
@Repository
@ConditionalOnBean(JdbcTemplate.class)
public class PatientBindingStoreImpl implements PatientBindingStore {

    private final PatientBindingMapper bindings;

    public PatientBindingStoreImpl(PatientBindingMapper bindings) {
        this.bindings = bindings;
    }

    @Override
    public Optional<PatientRef> find(String accountId, String patientId) {
        return bindings.find(accountId, patientId).stream().findFirst().map(PatientBindingStoreImpl::withBoundAt);
    }

    @Override
    public void save(PatientRef ref) {
        int updated = bindings.update(ref.patientVersion(), ref.boundAt(), ref.accountId(), ref.patientId());
        if (updated == 0) {
            bindings.insert(ref.accountId(), ref.patientId(), ref.patientVersion(), ref.boundAt());
        }
    }

    private static PatientRef withBoundAt(PatientRef ref) {
        if (ref.boundAt() != null) {
            return ref;
        }
        return new PatientRef(ref.accountId(), ref.patientId(), ref.patientVersion(), Instant.EPOCH);
    }
}
