package com.moonligh.nutritionist.service;

import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;

@Service
public class CookingExecutionService {

    private final ConcurrentHashMap<String, Execution> executions = new ConcurrentHashMap<>();

    public Execution start(String planId, String planVersion, String mealId, String recipeVersion) {
        if (blank(planId) || blank(planVersion) || blank(mealId) || blank(recipeVersion)) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        Execution execution = new Execution(
                UUID.randomUUID().toString(), planId, planVersion, mealId, recipeVersion,
                CookingStatus.STARTED, Set.of());
        executions.put(execution.executionId(), execution);
        return execution;
    }

    public Execution completeStep(String executionId, int stepNo, boolean followPlanExactly) {
        if (!followPlanExactly) {
            throw new BusinessException(ErrorCode.COOKING_DEVIATION_UNSUPPORTED);
        }
        Execution current = require(executionId);
        Set<Integer> completed = new java.util.HashSet<>(current.completedSteps());
        completed.add(stepNo);
        Execution updated = new Execution(
                current.executionId(), current.planId(), current.planVersion(), current.mealId(),
                current.recipeVersion(), CookingStatus.IN_PROGRESS, Set.copyOf(completed));
        executions.put(executionId, updated);
        return updated;
    }

    public Execution finish(String executionId) {
        Execution current = require(executionId);
        Execution finished = new Execution(
                current.executionId(), current.planId(), current.planVersion(), current.mealId(),
                current.recipeVersion(), CookingStatus.FINISHED, current.completedSteps());
        executions.put(executionId, finished);
        return finished;
    }

    private Execution require(String executionId) {
        Execution execution = executions.get(executionId);
        if (execution == null) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        return execution;
    }

    private static boolean blank(String value) {
        return value == null || value.isBlank();
    }

    public enum CookingStatus {
        STARTED(1), IN_PROGRESS(2), FINISHED(3), ABORTED(4), WAITING_REVISION(5);

        private final int code;

        CookingStatus(int code) {
            this.code = code;
        }

        public int code() {
            return code;
        }
    }

    public record Execution(
            String executionId,
            String planId,
            String planVersion,
            String mealId,
            String recipeVersion,
            CookingStatus status,
            Set<Integer> completedSteps) {
        public Execution {
            completedSteps = Set.copyOf(completedSteps);
        }
    }
}
