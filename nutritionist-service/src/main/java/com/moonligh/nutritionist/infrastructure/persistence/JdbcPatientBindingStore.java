package com.moonligh.nutritionist.infrastructure.persistence;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.Optional;

import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.moonligh.nutritionist.domain.profile.PatientBindingStore;
import com.moonligh.nutritionist.domain.profile.PatientRef;

/**
 * 患者绑定 JDBC 实现。
 */
@Repository
@ConditionalOnBean(JdbcTemplate.class)
public class JdbcPatientBindingStore implements PatientBindingStore {

    private static final RowMapper<PatientRef> MAPPER = JdbcPatientBindingStore::mapRow;

    private final JdbcTemplate jdbcTemplate;

    public JdbcPatientBindingStore(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Optional<PatientRef> find(String accountId, String patientId) {
        var list = jdbcTemplate.query(
                """
                SELECT account_id, patient_id, patient_version, bound_at
                FROM patient_binding
                WHERE account_id = ? AND patient_id = ?
                """,
                MAPPER,
                accountId,
                patientId);
        return list.stream().findFirst();
    }

    @Override
    public void save(PatientRef ref) {
        int updated = jdbcTemplate.update(
                """
                UPDATE patient_binding
                SET patient_version = ?, bound_at = ?
                WHERE account_id = ? AND patient_id = ?
                """,
                ref.patientVersion(),
                Timestamp.from(ref.boundAt()),
                ref.accountId(),
                ref.patientId());
        if (updated == 0) {
            jdbcTemplate.update(
                    """
                    INSERT INTO patient_binding (account_id, patient_id, patient_version, bound_at)
                    VALUES (?, ?, ?, ?)
                    """,
                    ref.accountId(),
                    ref.patientId(),
                    ref.patientVersion(),
                    Timestamp.from(ref.boundAt()));
        }
    }

    private static PatientRef mapRow(ResultSet rs, int rowNum) throws SQLException {
        Timestamp boundAt = rs.getTimestamp("bound_at");
        Instant instant = boundAt == null ? Instant.EPOCH : boundAt.toInstant();
        return new PatientRef(
                rs.getString("account_id"),
                rs.getString("patient_id"),
                rs.getString("patient_version"),
                instant);
    }
}
