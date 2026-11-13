package com.moonligh.nutritionist.domain.solver;

import java.math.BigDecimal;
import java.util.List;

/** 求解成功后，每种候选食材该用多少。 */
public record SolverResult(
        /** 候选用量。 */
        List<CandidateQuantity> quantities,
        /** 目标函数值。 */
        BigDecimal objectiveValue) {

    public SolverResult {
        quantities = List.copyOf(quantities);
    }

    /** 一种候选食材的用量。 */
    public record CandidateQuantity(
            /** 候选标识。可为食材或菜谱。 */
            String candidateId,
            /** 求解用量。 */
            BigDecimal quantity) {
    }
}
