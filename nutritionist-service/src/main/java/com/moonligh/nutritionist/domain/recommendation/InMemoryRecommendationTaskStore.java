package com.moonligh.nutritionist.domain.recommendation;

import java.util.Optional;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.service.RecommendationWorkflow;

/**
 * 测试用的推荐任务表。正式运行时改由数据库保存。
 */
public class InMemoryRecommendationTaskStore implements RecommendationTaskStore {

    private final EntityTable<RecommendationWorkflow.Task> tasks =
            new EntityTable<>(RecommendationWorkflow.Task::recommendationId);
    /** 同一范围同时只允许一个进行中的任务。 */
    private final EntityTable<ActiveScope> scopes = new EntityTable<>(ActiveScope::scopeKey);

    @Override
    public void insertPending(RecommendationWorkflow.Task task, String scopeKey) {
        if (!scopes.saveIfAbsent(new ActiveScope(scopeKey, task.recommendationId()))) {
            throw new BusinessException(ErrorCode.RECOMMENDATION_IN_PROGRESS);
        }
        tasks.save(task);
    }

    @Override
    public void save(RecommendationWorkflow.Task task) {
        tasks.save(task);
        if (task.status() != RecommendationWorkflow.TaskStatus.PENDING
                && task.status() != RecommendationWorkflow.TaskStatus.RUNNING) {
            scopes.removeIf(scope -> scope.recommendationId().equals(task.recommendationId()));
        }
    }

    @Override
    public Optional<RecommendationWorkflow.Task> find(String recommendationId) {
        return tasks.find(recommendationId);
    }

    /** 一个进行中的配餐范围，对应一个推荐任务编号。 */
    record ActiveScope(String scopeKey, String recommendationId) {
    }
}
