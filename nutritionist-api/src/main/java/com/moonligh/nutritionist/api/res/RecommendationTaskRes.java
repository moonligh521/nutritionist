package com.moonligh.nutritionist.api.res;

public record RecommendationTaskRes(
        String recommendationId,
        Integer taskStatusCode,
        Integer failureCode,
        PlanActionRes plan) {
}
