package com.moonligh.nutritionist.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.moonligh.nutritionist.domain.nutrition.NutrientType;
import com.moonligh.nutritionist.domain.solver.SolverConstraint;

/**
 * 同一营养素只保留更紧的硬约束。专业人员的上限低于指南时，用专业人员的上限。
 */
final class PlanningConstraints {

    private PlanningConstraints() {
    }

    static List<SolverConstraint> tighten(List<SolverConstraint> constraints) {
        List<SolverConstraint> chosen = new ArrayList<>();
        for (SolverConstraint constraint : constraints) {
            int index = indexOf(chosen, constraint.nutrientType());
            if (index < 0) {
                chosen.add(constraint);
                continue;
            }
            chosen.set(index, stricter(chosen.get(index), constraint));
        }
        return List.copyOf(chosen);
    }

    private static int indexOf(List<SolverConstraint> constraints, NutrientType nutrient) {
        for (int index = 0; index < constraints.size(); index++) {
            if (constraints.get(index).nutrientType() == nutrient) {
                return index;
            }
        }
        return -1;
    }

    private static SolverConstraint stricter(SolverConstraint left, SolverConstraint right) {
        return new SolverConstraint(
                source(left, right),
                left.nutrientType(),
                higher(left.minimum(), right.minimum()),
                lower(left.maximum(), right.maximum()),
                null,
                true);
    }

    private static String source(SolverConstraint left, SolverConstraint right) {
        if (left.constraintId().startsWith("PROFESSIONAL")) {
            return left.constraintId();
        }
        if (right.constraintId().startsWith("PROFESSIONAL")) {
            return right.constraintId();
        }
        BigDecimal leftMax = left.maximum();
        BigDecimal rightMax = right.maximum();
        if (leftMax == null) {
            return right.constraintId();
        }
        if (rightMax == null || leftMax.compareTo(rightMax) <= 0) {
            return left.constraintId();
        }
        return right.constraintId();
    }

    private static BigDecimal higher(BigDecimal left, BigDecimal right) {
        if (left == null) {
            return right;
        }
        if (right == null) {
            return left;
        }
        return left.compareTo(right) >= 0 ? left : right;
    }

    private static BigDecimal lower(BigDecimal left, BigDecimal right) {
        if (left == null) {
            return right;
        }
        if (right == null) {
            return left;
        }
        return left.compareTo(right) <= 0 ? left : right;
    }
}
