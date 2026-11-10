package com.moonligh.nutritionist.domain.audit;

import java.time.Instant;

/**
 * 幂等记录：同账号、同接口范围、同键唯一。
 */
public record IdempotencyRecord(
        String accountId,
        String endpointScope,
        String idempotencyKey,
        String requestHash,
        int responseCode,
        String responseBody,
        Instant createdAt) {
}
