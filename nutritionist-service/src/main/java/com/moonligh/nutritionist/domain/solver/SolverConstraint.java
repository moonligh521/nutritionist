package com.moonligh.nutritionist.domain.solver;

import java.math.BigDecimal;

import com.moonligh.nutritionist.domain.nutrition.NutrientType;

public record SolverConstraint(
        String constraintId,
        NutrientType nutrientType,
        BigDecimal minimum,
        BigDecimal maximum,
        BigDecimal target,
        boolean hard) {
}
