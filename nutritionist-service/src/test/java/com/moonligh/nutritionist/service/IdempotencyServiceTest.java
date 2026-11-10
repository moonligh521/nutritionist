package com.moonligh.nutritionist.service;

import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.common.BusinessException;
import com.moonligh.nutritionist.common.ErrorCode;
import com.moonligh.nutritionist.domain.audit.IdempotencyRecord;
import com.moonligh.nutritionist.domain.audit.IdempotencyStore;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

class IdempotencyServiceTest {

    private IdempotencyService service;

    @BeforeEach
    void setUp() {
        service = new IdempotencyService(new InMemoryIdempotencyStore());
    }

    @Test
    void sameKeySameHashReturnsCachedResponse() {
        IdempotencyRecord first = service.beginOrReplay("acc-1", "profile.put", "key-1", "hash-a")
                .orElseGet(() -> service.complete("acc-1", "profile.put", "key-1", "hash-a", 200, "{\"ok\":true}"));

        Optional<IdempotencyRecord> replay = service.beginOrReplay("acc-1", "profile.put", "key-1", "hash-a");

        assertTrue(replay.isPresent());
        assertEquals(first.responseBody(), replay.get().responseBody());
        assertEquals(200, replay.get().responseCode());
    }

    @Test
    void sameKeyDifferentHashConflicts() {
        service.complete("acc-1", "profile.put", "key-1", "hash-a", 200, "{\"ok\":true}");

        BusinessException ex = assertThrows(
                BusinessException.class,
                () -> service.beginOrReplay("acc-1", "profile.put", "key-1", "hash-b"));

        assertEquals(ErrorCode.IDEMPOTENCY_CONFLICT, ex.getErrorCode());
    }

    private static final class InMemoryIdempotencyStore implements IdempotencyStore {

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
}
