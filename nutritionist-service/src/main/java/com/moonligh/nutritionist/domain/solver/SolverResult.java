package com.moonligh.nutritionist.domain.solver;

import java.math.BigDecimal;
import java.util.List;

public record SolverResult(List<CandidateQuantity> quantities, BigDecimal objectiveValue) {

    public SolverResult {
        quantities = List.copyOf(quantities);
    }

    public record CandidateQuantity(String candidateId, BigDecimal quantity) {
    }
}
