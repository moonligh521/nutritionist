package com.moonligh.nutritionist.infrastructure.persistence;

import java.util.List;
import java.util.Optional;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.api.req.CreateRecommendationReq;
import com.moonligh.nutritionist.domain.recommendation.RecommendationTaskStore;
import com.moonligh.nutritionist.domain.solver.SolverConflict;
import com.moonligh.nutritionist.infrastructure.persistence.RecommendationTaskMapper.TaskRow;
import com.moonligh.nutritionist.service.RecommendationWorkflow.Task;
import com.moonligh.nutritionist.service.RecommendationWorkflow.TaskStatus;

@Repository
public class RecommendationTaskStoreImpl implements RecommendationTaskStore {

    private final RecommendationTaskMapper tasks;
    private final ObjectMapper mapper;

    public RecommendationTaskStoreImpl(RecommendationTaskMapper tasks, ObjectMapper mapper) {
        this.tasks = tasks;
        this.mapper = mapper;
    }

    @Override
    public void insertPending(Task task, String scopeKey) {
        try {
            tasks.insertPending(
                    task.recommendationId(),
                    task.accountId(),
                    task.request().patientId(),
                    Integer.toHexString(scopeKey.hashCode()),
                    task.status().code(),
                    task.request().profileVersion(),
                    task.request().pantryVersion(),
                    task.createdAt(),
                    task.updatedAt(),
                    scopeKey,
                    mapper.writeValueAsString(task.request()));
        } catch (DuplicateKeyException error) {
            throw new BusinessException(ErrorCode.RECOMMENDATION_IN_PROGRESS);
        } catch (JsonProcessingException error) {
            throw new IllegalStateException(error);
        }
    }

    @Override
    public void save(Task task) {
        boolean open = task.status() == TaskStatus.PENDING || task.status() == TaskStatus.RUNNING;
        try {
            tasks.update(
                    task.status().code(),
                    task.failureCode(),
                    task.updatedAt(),
                    task.conflicts().isEmpty() ? null : mapper.writeValueAsString(task.conflicts()),
                    open ? 1 : 0,
                    task.recommendationId());
        } catch (JsonProcessingException error) {
            throw new IllegalStateException(error);
        }
    }

    @Override
    public Optional<Task> find(String recommendationId) {
        return tasks.find(recommendationId).stream().findFirst().map(this::toTask);
    }

    private Task toTask(TaskRow row) {
        try {
            CreateRecommendationReq request = mapper.readValue(row.requestJson(), CreateRecommendationReq.class);
            String conflictJson = row.conflictJson();
            List<SolverConflict> conflicts = conflictJson == null
                    ? List.of()
                    : mapper.readerForListOf(SolverConflict.class).readValue(conflictJson);
            return new Task(
                    row.recommendationId(),
                    row.accountId(),
                    request,
                    status(row.statusCode()),
                    row.failureCode(),
                    row.createdAt(),
                    row.updatedAt(),
                    conflicts);
        } catch (JsonProcessingException error) {
            throw new IllegalStateException(error);
        }
    }

    private static TaskStatus status(int code) {
        for (TaskStatus value : TaskStatus.values()) {
            if (value.code() == code) {
                return value;
            }
        }
        throw new IllegalArgumentException("status " + code);
    }
}
