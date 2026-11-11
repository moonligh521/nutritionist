package com.moonligh.nutritionist.controller;

import java.time.Duration;
import java.time.Instant;
import java.util.UUID;

import org.springframework.http.MediaType;
import org.springframework.http.codec.ServerSentEvent;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.nutritionist.api.res.RecommendationEventRes;
import com.moonligh.nutritionist.service.RecommendationWorkflow;

import reactor.core.publisher.BufferOverflowStrategy;
import reactor.core.publisher.Flux;

@RestController
@RequestMapping("/api/nutrition/recommendations")
public class RecommendationSseController {

    private final RecommendationWorkflow workflow;

    public RecommendationSseController(RecommendationWorkflow workflow) {
        this.workflow = workflow;
    }

    @GetMapping(path = "/{recommendationId}/events", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<ServerSentEvent<RecommendationEventRes>> events(@PathVariable String recommendationId) {
        return Flux.interval(Duration.ZERO, Duration.ofMillis(100))
                .onBackpressureBuffer(32, BufferOverflowStrategy.DROP_OLDEST)
                .map(ignored -> workflow.find(recommendationId))
                .distinctUntilChanged(RecommendationWorkflow.Task::status)
                .map(this::toEvent)
                .takeUntil(event -> terminal(event.data().eventTypeCode()))
                .doOnCancel(() -> cancelQuietly(recommendationId));
    }

    private ServerSentEvent<RecommendationEventRes> toEvent(RecommendationWorkflow.Task task) {
        int eventType = switch (task.status()) {
            case PENDING -> 1;
            case RUNNING -> 3;
            case SUCCEEDED -> 5;
            case FAILED, CANCELLED, TIMED_OUT -> 6;
        };
        RecommendationEventRes body = new RecommendationEventRes(
                UUID.randomUUID().toString(), eventType, task.status().code(),
                task.status().name(), Instant.now(), null);
        return ServerSentEvent.<RecommendationEventRes>builder()
                .id(body.eventId())
                .event(task.status().name())
                .data(body)
                .build();
    }

    private static boolean terminal(int eventType) {
        return eventType == 5 || eventType == 6;
    }

    private void cancelQuietly(String recommendationId) {
        try {
            workflow.cancel(recommendationId);
        } catch (RuntimeException ignored) {
            // 客户端断开时任务可能已经结束。
        }
    }
}
