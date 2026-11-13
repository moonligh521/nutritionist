package com.moonligh.nutritionist.domain.audit;

import java.time.Instant;

/**
 * 幂等记录：同账号、同接口范围、同键唯一。
 */
public record IdempotencyRecord(
        /** 账号标识。 */
        String accountId,
        /** 接口范围。同一幂等键在不同范围互不影响。 */
        String endpointScope,
        /** 幂等键。相同键表示同一操作。 */
        String idempotencyKey,
        /** 请求体哈希。同键异体视为冲突。 */
        String requestHash,
        /** 首次响应业务码。 */
        int responseCode,
        /** 首次响应体。用于重放。 */
        String responseBody,
        /** 首次完成时间。 */
        Instant createdAt) {
}
