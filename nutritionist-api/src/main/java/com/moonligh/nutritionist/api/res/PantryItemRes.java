package com.moonligh.nutritionist.api.res;

import java.math.BigDecimal;
import java.time.Instant;

/** 库存批次。可用数量等于在库数量减去预留数量。 */
public record PantryItemRes(
        /** 库存项标识。 */
        String pantryItemId,
        /** 批次标识。预留与消耗均引用该标识。 */
        String lotId,
        /** 食材标识。 */
        String foodItemId,
        /** 在库数量。 */
        BigDecimal onHandQuantity,
        /** 已预留且未消耗的数量。 */
        BigDecimal reservedQuantity,
        /** 可用数量。等于在库数量减去预留数量。 */
        BigDecimal availableQuantity,
        /** 数量单位代码。 */
        Integer unitCode,
        /** 状态代码：生、熟或包装。 */
        Integer stateCode,
        /** 失效时间。可空。 */
        Instant expireAt,
        /** 批次代码。 */
        String lotCode) {
}
