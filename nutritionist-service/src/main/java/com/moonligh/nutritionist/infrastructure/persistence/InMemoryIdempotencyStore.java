package com.moonligh.nutritionist.infrastructure.persistence;

import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.moonligh.nutritionist.domain.audit.IdempotencyRecord;
import com.moonligh.nutritionist.domain.audit.IdempotencyStore;

/**
 * 无数据源时的内存幂等实现，便于离线单测。
 */
@Repository
@ConditionalOnMissingBean(JdbcTemplate.class)
public class InMemoryIdempotencyStore implements IdempotencyStore {

    private final ConcurrentHashMap<String, IdempotencyRecord> records = new ConcurrentHashMap<>();

    @Override
    public Optional<IdempotencyRecord> find(String accountId, String endpointScope, String idempotencyKey) {
        return Optional.ofNullable(records.get(key(accountId, endpointScope, idempotencyKey)));
    }

    @Override
    public boolean insert(IdempotencyRecord record) {
        return records.putIfAbsent(
                        key(record.accountId(), record.endpointScope(), record.idempotencyKey()), record)
                == null;
    }

    private static String key(String accountId, String endpointScope, String idempotencyKey) {
        return accountId + '|' + endpointScope + '|' + idempotencyKey;
    }
}
