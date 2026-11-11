package com.moonligh.nutritionist.api.res;

import java.time.Instant;

public record RecommendationEventRes(
        String eventId,
        Integer eventTypeCode,
        Integer stageCode,
        String message,
        Instant occurredAt,
        String planId) {
}
