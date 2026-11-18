package com.moonligh.nutritionist.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.http.codec.ServerSentEvent;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.nutritionist.service.IngredientAgent;
import com.moonligh.nutritionist.service.dialogue.DialogueOrchestrator;
import com.moonligh.nutritionist.service.dialogue.DialogueOrchestrator.FoodConfirmation;
import com.moonligh.nutritionist.service.dialogue.DialogueOrchestrator.TurnCommand;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

/**
 * 对话规划入口：可问候/拒答/推荐/增量换菜。
 * 最外层仅 SSE；同步算完后推 reply，再推 done。
 */
@RestController
@RequestMapping("/api/nutrition/agent")
public class AgentTurnController {

    private final DialogueOrchestrator orchestrator;

    public AgentTurnController(DialogueOrchestrator orchestrator) {
        this.orchestrator = orchestrator;
    }

    @PostMapping(path = "/turns", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<ServerSentEvent<Object>> turn(@RequestBody TurnRequest request) {
        if (request == null) {
            return error("请求不能为空");
        }
        String text = request.text() == null ? "" : request.text().trim();
        List<String> foods = request.foods() == null ? List.of() : request.foods();
        boolean hasConfirm = request.confirmations() != null && !request.confirmations().isEmpty();
        if (text.isBlank() && foods.isEmpty() && !hasConfirm) {
            return error("请输入内容，或给出至少一种食材");
        }
        TurnCommand command = new TurnCommand(
                request.sessionId(),
                request.patientId(),
                text,
                foods,
                request.conditions(),
                request.allergens(),
                request.avoidFoods(),
                request.preferTags(),
                request.preferCuisines(),
                request.profile(),
                toConfirmations(request.confirmations()));
        return Mono.fromCallable(() -> orchestrator.handle(command))
                .subscribeOn(Schedulers.boundedElastic())
                .flatMapMany(reply -> Flux.just(event("reply", reply), event("done", Map.of())))
                .onErrorResume(error -> error(error.getMessage() == null ? "回合执行失败" : error.getMessage()));
    }

    private static Flux<ServerSentEvent<Object>> error(String message) {
        return Flux.just(event("error", Map.of("message", message == null ? "" : message)));
    }

    private static ServerSentEvent<Object> event(String name, Object data) {
        return ServerSentEvent.builder(data).event(name).build();
    }

    private static List<FoodConfirmation> toConfirmations(List<ConfirmItem> items) {
        if (items == null) {
            return List.of();
        }
        return items.stream()
                .filter(item -> item != null)
                .map(item -> new FoodConfirmation(item.raw(), item.chosen()))
                .toList();
    }

    public record ConfirmItem(String raw, String chosen) {
    }

    public record TurnRequest(
            String sessionId,
            String patientId,
            List<String> foods,
            List<String> conditions,
            List<String> allergens,
            List<String> avoidFoods,
            List<String> preferTags,
            List<String> preferCuisines,
            IngredientAgent.Profile profile,
            String text,
            List<ConfirmItem> confirmations) {
    }
}
