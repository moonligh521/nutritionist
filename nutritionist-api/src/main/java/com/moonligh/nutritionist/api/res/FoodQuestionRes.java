package com.moonligh.nutritionist.api.res;

import java.math.BigDecimal;

/** 食物咨询应答。克数保持方案确定值。 */
public record FoodQuestionRes(
        /** 应答内容。 */
        String answer,
        /** 方案确定克数。响应不得修改该值。 */
        BigDecimal grams,
        /** 是否变更克数。须为 false。 */
        boolean gramsChanged) {
}
