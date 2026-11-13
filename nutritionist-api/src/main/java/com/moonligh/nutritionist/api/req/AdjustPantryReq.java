package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;
import java.time.Instant;

/** 手工增减库存。正数入库，负数按绝对值消耗。 */
public record AdjustPantryReq(
        /** 患者标识。 */
        String patientId,
        /** 患者主数据版本。 */
        String patientVersion,
        /** 食材标识。 */
        String foodItemId,
        /** 变动数量。正数增加，负数减少。 */
        BigDecimal quantity,
        /** 数量单位代码。 */
        Integer unitCode,
        /** 入库时的状态代码。消耗时仍须给出。 */
        Integer stateCode,
        /** 失效时间。可空。 */
        Instant expireAt,
        /** 批次代码。可空。 */
        String lotCode) {
}
