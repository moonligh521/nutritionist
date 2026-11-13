package com.moonligh.nutritionist.domain.solver;

import java.math.BigDecimal;

import com.moonligh.nutritionist.domain.nutrition.NutrientType;

/** 硬约束无解时，说明要求和实际能做到的范围差在哪里。 */
public record SolverConflict(
        /** 约束标识。 */
        String constraintId,
        /** 营养素类型。 */
        NutrientType nutrientType,
        /** 要求下限。 */
        BigDecimal requiredMinimum,
        /** 要求上限。 */
        BigDecimal requiredMaximum,
        /** 可达下限。 */
        BigDecimal attainableMinimum,
        /** 可达上限。 */
        BigDecimal attainableMaximum) {
}
