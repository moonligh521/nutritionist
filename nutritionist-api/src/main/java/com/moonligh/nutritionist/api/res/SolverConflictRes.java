package com.moonligh.nutritionist.api.res;

import java.math.BigDecimal;

/** 一条无法同时满足的硬约束，以及当前食材能达到的范围。 */
public record SolverConflictRes(
        /** 约束标识。 */
        String constraintId,
        /** 营养素代码。 */
        int nutrientCode,
        /** 要求下限。 */
        BigDecimal requiredMinimum,
        /** 要求上限。 */
        BigDecimal requiredMaximum,
        /** 当前食材能达到的下限。 */
        BigDecimal attainableMinimum,
        /** 当前食材能达到的上限。 */
        BigDecimal attainableMaximum) {
}
