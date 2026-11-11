package com.moonligh.nutritionist.api.res;

public record RecommendationAcceptedRes(
        String recommendationId,
        Integer taskStatusCode,
        String eventsUrl,
        String resultUrl) {
}
