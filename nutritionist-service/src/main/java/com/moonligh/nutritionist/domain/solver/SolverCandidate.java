package com.moonligh.nutritionist.domain.solver;

import java.math.BigDecimal;
import java.util.List;

/** 求解时的一个候选，例如一种食材或一道菜。 */
public record SolverCandidate(
        /** 候选标识。 */
        String candidateId,
        /** 最大可用量。受库存约束。 */
        BigDecimal maximumQuantity,
        /** 单位营养构成。 */
        List<CandidateNutrient> nutrients,
        /** 最小化时的附加权重。高升糖食材大于 0，其余为 0。 */
        BigDecimal preferenceWeight) {

    public SolverCandidate(String candidateId, BigDecimal maximumQuantity, List<CandidateNutrient> nutrients) {
        this(candidateId, maximumQuantity, nutrients, BigDecimal.ZERO);
    }
}
