package com.moonligh.nutritionist.service;

import java.time.Instant;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.audit.IdempotencyRecord;
import com.moonligh.nutritionist.domain.audit.IdempotencyStore;

/**
 * 写接口幂等：同键同哈希重放，同键不同哈希冲突。
 */
@Service
public class IdempotencyService {

    private final IdempotencyStore store;

    public IdempotencyService(IdempotencyStore store) {
        this.store = store;
    }

    /**
     * 开始或重放。空表示可执行业务；有值表示直接返回缓存结果。
     */
    public Optional<IdempotencyRecord> beginOrReplay(
            String accountId, String endpointScope, String idempotencyKey, String requestHash) {
        Optional<IdempotencyRecord> existing = store.find(accountId, endpointScope, idempotencyKey);
        if (existing.isEmpty()) {
            return Optional.empty();
        }
        IdempotencyRecord record = existing.get();
        if (!record.requestHash().equals(requestHash)) {
            throw new BusinessException(ErrorCode.IDEMPOTENCY_CONFLICT);
        }
        return Optional.of(record);
    }

    public IdempotencyRecord complete(
            String accountId,
            String endpointScope,
            String idempotencyKey,
            String requestHash,
            int responseCode,
            String responseBody) {
        IdempotencyRecord record = new IdempotencyRecord(
                accountId,
                endpointScope,
                idempotencyKey,
                requestHash,
                responseCode,
                responseBody,
                Instant.now());
        if (!store.insert(record)) {
            // 并发下另一请求已写入，走重放或冲突判定。
            return beginOrReplay(accountId, endpointScope, idempotencyKey, requestHash)
                    .orElseThrow(() -> new BusinessException(ErrorCode.IDEMPOTENCY_CONFLICT));
        }
        return record;
    }
}
