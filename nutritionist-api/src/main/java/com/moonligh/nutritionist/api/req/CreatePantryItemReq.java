package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;
import java.time.Instant;

/** 手工录入库存批次。 */
public record CreatePantryItemReq(
        /** 患者标识。 */
        String patientId,
        /** 患者主数据版本。 */
        String patientVersion,
        /** 食材标识。 */
        String foodItemId,
        /** 数量。须大于 0。 */
        BigDecimal quantity,
        /** 数量单位代码。 */
        Integer unitCode,
        /** 状态代码：生、熟或包装。 */
        Integer stateCode,
        /** 失效时间。可空。 */
        Instant expireAt,
        /** 批次代码。可空。 */
        String lotCode) {
}
