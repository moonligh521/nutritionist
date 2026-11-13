package com.moonligh.nutritionist.domain.solver;

import java.math.BigDecimal;

import com.moonligh.nutritionist.domain.nutrition.NutrientType;

/** 配餐时的一条营养约束。硬约束必须满足，软约束只是尽量靠近。 */
public record SolverConstraint(
        /** 约束标识。 */
        String constraintId,
        /** 营养素类型。 */
        NutrientType nutrientType,
        /** 下限值。 */
        BigDecimal minimum,
        /** 上限值。 */
        BigDecimal maximum,
        /** 目标值。 */
        BigDecimal target,
        /** 是否为硬约束。true 为必须满足。 */
        boolean hard) {
}
