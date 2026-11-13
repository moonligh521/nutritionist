package com.moonligh.nutritionist.infrastructure.persistence;

import java.time.Instant;
import java.util.Optional;

import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.moonligh.nutritionist.domain.audit.IdempotencyRecord;
import com.moonligh.nutritionist.domain.audit.IdempotencyStore;

/**
 * 幂等记录 JDBC 实现。
 */
@Repository
@ConditionalOnBean(JdbcTemplate.class)
public class IdempotencyStoreImpl implements IdempotencyStore {

    private final IdempotencyMapper records;

    public IdempotencyStoreImpl(IdempotencyMapper records) {
        this.records = records;
    }

    @Override
    public Optional<IdempotencyRecord> find(String accountId, String endpointScope, String idempotencyKey) {
        return records.find(accountId, endpointScope, idempotencyKey).stream()
                .findFirst()
                .map(IdempotencyStoreImpl::withCreatedAt);
    }

    @Override
    public boolean insert(IdempotencyRecord record) {
        try {
            records.insert(
                    record.accountId(),
                    record.endpointScope(),
                    record.idempotencyKey(),
                    record.requestHash(),
                    record.responseCode(),
                    record.responseBody(),
                    record.createdAt());
            return true;
        } catch (DuplicateKeyException ex) {
            return false;
        }
    }

    private static IdempotencyRecord withCreatedAt(IdempotencyRecord record) {
        if (record.createdAt() != null) {
            return record;
        }
        return new IdempotencyRecord(
                record.accountId(),
                record.endpointScope(),
                record.idempotencyKey(),
                record.requestHash(),
                record.responseCode(),
                record.responseBody(),
                Instant.EPOCH);
    }
}
