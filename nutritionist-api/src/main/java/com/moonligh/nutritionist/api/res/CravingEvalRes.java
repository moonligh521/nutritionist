package com.moonligh.nutritionist.api.res;

import java.math.BigDecimal;

/** 解馋评估的结果。不会说“吃了也没有风险”。 */
public record CravingEvalRes(
        /** 处置代码。1 过敏拒绝，2 限量，3 按请求份量。 */
        Integer dispositionCode,
        /** 允许份量。过敏处置时为 0。 */
        BigDecimal allowedPortion,
        /** 说明。 */
        String message,
        /** 是否声明无风险。固定为 false。 */
        boolean claimsNoHarm) {
}
