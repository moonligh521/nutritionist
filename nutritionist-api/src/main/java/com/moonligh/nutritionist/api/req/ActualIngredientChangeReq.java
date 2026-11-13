package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;

/** 单种食材的计划用量与实际用量。 */
public record ActualIngredientChangeReq(
        /** 食材标识。 */
        String foodItemId,
        /** 计划用量。 */
        BigDecimal plannedQuantity,
        /** 实际用量。 */
        BigDecimal actualQuantity,
        /** 是否为过敏原。为真时拒绝该调整。 */
        boolean allergen,
        /** 成品重量。可空。 */
        BigDecimal finishedWeight,
        /** 实际食用量。可空。 */
        BigDecimal consumedQuantity) {

    public ActualIngredientChangeReq(
            String foodItemId, BigDecimal plannedQuantity, BigDecimal actualQuantity, boolean allergen) {
        this(foodItemId, plannedQuantity, actualQuantity, allergen, null, null);
    }
}
