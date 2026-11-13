package com.moonligh.nutritionist.domain.solver;

import java.util.List;

/** 交给求解器的一次计算：有哪些候选，要满足哪些约束。 */
public record SolverRequest(
        /** 候选集合。 */
        List<SolverCandidate> candidates,
        /** 约束集合。 */
        List<SolverConstraint> constraints) {
}
