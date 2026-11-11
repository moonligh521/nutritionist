package com.moonligh.nutritionist.domain.solver;

import java.util.List;

public record SolverRequest(List<SolverCandidate> candidates, List<SolverConstraint> constraints) {

    public SolverRequest {
        candidates = List.copyOf(candidates);
        constraints = List.copyOf(constraints);
    }
}
