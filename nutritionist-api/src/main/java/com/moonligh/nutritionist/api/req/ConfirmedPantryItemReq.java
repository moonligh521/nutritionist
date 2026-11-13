package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;

/** 用户确认过的一条库存食材。 */
public record ConfirmedPantryItemReq(
        /** 食材标识。 */
        String foodItemId,
        /** 确认后的数量。 */
        BigDecimal quantity,
        /** 数量单位代码。 */
        Integer unitCode,
        /** 状态代码：生、熟或包装。 */
        Integer stateCode,
        /** 展示名称。 */
        String displayName) {
}
