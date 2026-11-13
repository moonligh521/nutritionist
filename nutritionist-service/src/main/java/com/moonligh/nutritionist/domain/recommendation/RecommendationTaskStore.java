package com.moonligh.nutritionist.domain.recommendation;

import java.util.Optional;

import com.moonligh.nutritionist.service.RecommendationWorkflow;

public interface RecommendationTaskStore {

    void insertPending(RecommendationWorkflow.Task task, String scopeKey);

    void save(RecommendationWorkflow.Task task);

    Optional<RecommendationWorkflow.Task> find(String recommendationId);
}
