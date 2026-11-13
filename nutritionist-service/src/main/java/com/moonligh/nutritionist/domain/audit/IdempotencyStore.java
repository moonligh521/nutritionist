package com.moonligh.nutritionist.domain.audit;

import java.util.Optional;

/**
 * 幂等存储端口。
 */
public interface IdempotencyStore {

    Optional<IdempotencyRecord> find(String accountId, String endpointScope, String idempotencyKey);

    /**
     * @return true 插入成功；false 唯一键冲突
     */
    boolean insert(IdempotencyRecord record);
}
