package com.moonligh.nutritionist.service;

import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataStore;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;

@Service
public class CookingExecutionService {

    /** 正在做的菜，按执行编号查找。 */
    private final EntityTable<Execution> executions = new EntityTable<>(Execution::executionId);
    private final NutritionDataStore records;

    public CookingExecutionService() {
        this(null);
    }

    @Autowired
    public CookingExecutionService(NutritionDataStore records) {
        this.records = records;
    }

    public Execution start(String planId, String planVersion, String mealId, String recipeVersion) {
        if (blank(planId) || blank(planVersion) || blank(mealId) || blank(recipeVersion)) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        Execution execution = new Execution(
                UUID.randomUUID().toString(), planId, planVersion, mealId, recipeVersion,
                CookingStatus.STARTED, Set.of());
        executions.save(execution);
        if (records != null) {
            records.saveCooking(execution.executionId(), planId, planVersion, mealId, recipeVersion, execution.status().code());
        }
        return execution;
    }

    public Execution completeStep(String executionId, int stepNo, boolean followPlanExactly) {
        Execution current = require(executionId);
        if (!followPlanExactly) {
            Execution waiting = new Execution(
                    current.executionId(), current.planId(), current.planVersion(), current.mealId(),
                    current.recipeVersion(), CookingStatus.WAITING_REVISION, current.completedSteps());
            executions.save(waiting);
            if (records != null) {
                records.saveCooking(executionId, waiting.planId(), waiting.planVersion(), waiting.mealId(),
                        waiting.recipeVersion(), waiting.status().code());
            }
            return waiting;
        }
        Set<Integer> completed = new java.util.HashSet<>(current.completedSteps());
        completed.add(stepNo);
        Execution updated = new Execution(
                current.executionId(), current.planId(), current.planVersion(), current.mealId(),
                current.recipeVersion(), CookingStatus.IN_PROGRESS, Set.copyOf(completed));
        executions.save(updated);
        if (records != null) {
            records.saveCooking(executionId, updated.planId(), updated.planVersion(), updated.mealId(),
                    updated.recipeVersion(), updated.status().code());
            records.saveCookingStep(executionId, stepNo);
        }
        return updated;
    }

    public Execution finish(String executionId) {
        Execution current = require(executionId);
        Execution finished = new Execution(
                current.executionId(), current.planId(), current.planVersion(), current.mealId(),
                current.recipeVersion(), CookingStatus.FINISHED, current.completedSteps());
        executions.save(finished);
        if (records != null) {
            records.saveCooking(executionId, finished.planId(), finished.planVersion(), finished.mealId(),
                    finished.recipeVersion(), finished.status().code());
        }
        return finished;
    }

    private Execution require(String executionId) {
        Execution execution = executions.find(executionId).orElse(null);
        if (execution == null && records != null) {
            execution = records.findCooking(executionId).orElse(null);
            if (execution != null) {
                executions.save(execution);
            }
        }
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

        public static CookingStatus fromCode(int code) {
            for (CookingStatus status : values()) {
                if (status.code == code) {
                    return status;
                }
            }
            throw new IllegalArgumentException("cooking status " + code);
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
