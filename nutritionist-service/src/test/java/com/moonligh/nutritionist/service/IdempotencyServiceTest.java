package com.moonligh.nutritionist.service;

import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.audit.IdempotencyRecord;
import com.moonligh.nutritionist.domain.audit.IdempotencyStore;
import com.moonligh.nutritionist.domain.common.EntityTable;

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

        private final EntityTable<IdempotencyRecord> records = new EntityTable<>(record -> key(
                record.accountId(), record.endpointScope(), record.idempotencyKey()));

        @Override
        public Optional<IdempotencyRecord> find(String accountId, String endpointScope, String idempotencyKey) {
            return records.find(key(accountId, endpointScope, idempotencyKey));
        }

        @Override
        public boolean insert(IdempotencyRecord record) {
            return records.saveIfAbsent(record);
        }

        private static String key(String accountId, String endpointScope, String idempotencyKey) {
            return accountId + '|' + endpointScope + '|' + idempotencyKey;
        }
    }
}
