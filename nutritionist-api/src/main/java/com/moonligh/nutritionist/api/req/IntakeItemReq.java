package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;

/** 实际吃下去的一样东西。 */
public record IntakeItemReq(
        /** 条目类型。1 简单食物，2 烹饪成品。 */
        Integer itemTypeCode,
        /** 食材标识。类型为简单食物时必填。 */
        String foodItemId,
        /** 烹饪执行标识。类型为烹饪成品时必填。 */
        String cookingExecutionId,
        /** 实际摄入数量。 */
        BigDecimal quantity,
        /** 数量单位代码。 */
        Integer unitCode,
        /** 重量基准代码，如生重、熟重。 */
        Integer weightBasisCode) {
}
