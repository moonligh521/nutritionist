package com.moonligh.nutritionist.domain.solver;

import java.math.BigDecimal;
import java.util.List;

public record SolverCandidate(String candidateId, BigDecimal maximumQuantity, List<CandidateNutrient> nutrients) {

    public SolverCandidate {
        nutrients = List.copyOf(nutrients);
    }
}
