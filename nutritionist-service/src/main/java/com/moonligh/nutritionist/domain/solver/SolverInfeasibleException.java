package com.moonligh.nutritionist.domain.solver;

import java.util.List;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;

public final class SolverInfeasibleException extends BusinessException {

    private final List<SolverConflict> conflicts;

    public SolverInfeasibleException(List<SolverConflict> conflicts) {
        super(ErrorCode.SOLVER_INFEASIBLE);
        this.conflicts = List.copyOf(conflicts);
    }

    public List<SolverConflict> conflicts() {
        return conflicts;
    }
}
