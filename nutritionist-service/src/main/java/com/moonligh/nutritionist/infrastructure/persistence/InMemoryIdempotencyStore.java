package com.moonligh.nutritionist.infrastructure.persistence;

import java.util.Optional;

import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.moonligh.nutritionist.domain.audit.IdempotencyRecord;
import com.moonligh.nutritionist.domain.audit.IdempotencyStore;
import com.moonligh.nutritionist.domain.common.EntityTable;

/**
 * 没有数据库时，用内存记住每次写请求。单元测试用它。
 */
@Repository
@ConditionalOnMissingBean(JdbcTemplate.class)
public class InMemoryIdempotencyStore implements IdempotencyStore {

    private final EntityTable<IdempotencyRecord> records = new EntityTable<>(InMemoryIdempotencyStore::idOf);

    @Override
    public Optional<IdempotencyRecord> find(String accountId, String endpointScope, String idempotencyKey) {
        return records.find(idOf(accountId, endpointScope, idempotencyKey));
    }

    @Override
    public boolean insert(IdempotencyRecord record) {
        return records.saveIfAbsent(record);
    }

    private static String idOf(IdempotencyRecord record) {
        return idOf(record.accountId(), record.endpointScope(), record.idempotencyKey());
    }

    private static String idOf(String accountId, String endpointScope, String idempotencyKey) {
        return accountId + '|' + endpointScope + '|' + idempotencyKey;
    }
}
