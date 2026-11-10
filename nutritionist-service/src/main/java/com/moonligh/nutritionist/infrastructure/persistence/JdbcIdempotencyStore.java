package com.moonligh.nutritionist.infrastructure.persistence;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.Optional;

import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.moonligh.nutritionist.domain.audit.IdempotencyRecord;
import com.moonligh.nutritionist.domain.audit.IdempotencyStore;

/**
 * 幂等记录 JDBC 实现。
 */
@Repository
@ConditionalOnBean(JdbcTemplate.class)
public class JdbcIdempotencyStore implements IdempotencyStore {

    private static final RowMapper<IdempotencyRecord> MAPPER = JdbcIdempotencyStore::mapRow;

    private final JdbcTemplate jdbcTemplate;

    public JdbcIdempotencyStore(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Optional<IdempotencyRecord> find(String accountId, String endpointScope, String idempotencyKey) {
        var list = jdbcTemplate.query(
                """
                SELECT account_id, endpoint_scope, idempotency_key, request_hash,
                       response_code, response_body, created_at
                FROM idempotency_record
                WHERE account_id = ? AND endpoint_scope = ? AND idempotency_key = ?
                """,
                MAPPER,
                accountId,
                endpointScope,
                idempotencyKey);
        return list.stream().findFirst();
    }

    @Override
    public boolean insert(IdempotencyRecord record) {
        try {
            jdbcTemplate.update(
                    """
                    INSERT INTO idempotency_record
                      (account_id, endpoint_scope, idempotency_key, request_hash,
                       response_code, response_body, created_at)
                    VALUES (?, ?, ?, ?, ?, ?, ?)
                    """,
                    record.accountId(),
                    record.endpointScope(),
                    record.idempotencyKey(),
                    record.requestHash(),
                    record.responseCode(),
                    record.responseBody(),
                    Timestamp.from(record.createdAt()));
            return true;
        } catch (DuplicateKeyException ex) {
            return false;
        }
    }

    private static IdempotencyRecord mapRow(ResultSet rs, int rowNum) throws SQLException {
        Timestamp createdAt = rs.getTimestamp("created_at");
        Instant instant = createdAt == null ? Instant.EPOCH : createdAt.toInstant();
        return new IdempotencyRecord(
                rs.getString("account_id"),
                rs.getString("endpoint_scope"),
                rs.getString("idempotency_key"),
                rs.getString("request_hash"),
                rs.getInt("response_code"),
                rs.getString("response_body"),
                instant);
    }
}
