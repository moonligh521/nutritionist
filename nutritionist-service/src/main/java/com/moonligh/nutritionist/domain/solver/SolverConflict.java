package com.moonligh.nutritionist.domain.solver;

import java.math.BigDecimal;

import com.moonligh.nutritionist.domain.nutrition.NutrientType;

public record SolverConflict(
        String constraintId,
        NutrientType nutrientType,
        BigDecimal requiredMinimum,
        BigDecimal requiredMaximum,
        BigDecimal attainableMinimum,
        BigDecimal attainableMaximum) {
}
