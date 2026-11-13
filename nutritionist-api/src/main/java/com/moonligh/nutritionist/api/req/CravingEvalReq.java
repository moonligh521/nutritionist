package com.moonligh.nutritionist.api.req;

import java.math.BigDecimal;

/** 受限食物份量评估。过敏直接拒绝。 */
public record CravingEvalReq(
        /** 患者标识。 */
        String patientId,
        /** 当前画像版本。 */
        String profileVersion,
        /** 目标食材标识。 */
        String foodItemId,
        /** 期望份量。 */
        BigDecimal desiredPortion,
        /** 份量单位代码。 */
        Integer unitCode,
        /** 评估原因代码。1 过敏，2 量化限制，3 额度内。 */
        Integer reasonCode,
        /** 允许的最大份量。过敏场景可空。 */
        BigDecimal maximumPortion) {
}
