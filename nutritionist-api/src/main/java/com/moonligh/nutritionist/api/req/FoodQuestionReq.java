package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;

/** 方案确定后的食物咨询。应答不得修改克数。 */
public record FoodQuestionReq(
        /** 已确认方案标识。 */
        String planId,
        /** 咨询问题。 */
        String question,
        /** 方案确定克数。 */
        BigDecimal authoritativeGrams,
        /** 拟调整克数。与方案确定值不一致时拒绝。 */
        BigDecimal proposedGrams,
        /** 食材标识。为空时不复算营养。 */
        String foodItemId) {

    public FoodQuestionReq(String planId, String question, BigDecimal authoritativeGrams, BigDecimal proposedGrams) {
        this(planId, question, authoritativeGrams, proposedGrams, null);
    }
}
