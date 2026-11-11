package com.moonligh.nutritionist.domain.solver;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.nutrition.NutrientType;

class OjalgoSolverAdapterTest {

    private final NutritionSolver solver = new OjalgoSolverAdapter();

    @Test
    void satisfiesHardBoundsAndUsesSoftTarget() {
        var rice = new SolverCandidate(
                "rice", new BigDecimal("4"), List.of(new CandidateNutrient(NutrientType.ENERGY, new BigDecimal("100"))));
        var result = solver.solve(new SolverRequest(
                List.of(rice),
                List.of(new SolverConstraint(
                        "energy-hard",
                        NutrientType.ENERGY,
                        new BigDecimal("300"),
                        new BigDecimal("400"),
                        new BigDecimal("350"),
                        true))));

        assertTrue(result.quantities().getFirst().quantity().compareTo(new BigDecimal("3")) >= 0);
        assertTrue(result.quantities().getFirst().quantity().compareTo(new BigDecimal("4")) <= 0);
    }

    @Test
    void returnsStructuredConflictsWhenHardConstraintsAreInfeasible() {
        var rice = new SolverCandidate(
                "rice", BigDecimal.ONE, List.of(new CandidateNutrient(NutrientType.ENERGY, new BigDecimal("100"))));

        SolverInfeasibleException error = assertThrows(
                SolverInfeasibleException.class,
                () -> solver.solve(new SolverRequest(
                        List.of(rice),
                        List.of(new SolverConstraint(
                                "energy-min",
                                NutrientType.ENERGY,
                                new BigDecimal("500"),
                                null,
                                null,
                                true)))));

        assertEquals(ErrorCode.SOLVER_INFEASIBLE, error.getErrorCode());
        assertEquals("energy-min", error.conflicts().getFirst().constraintId());
    }
}
