package com.moonligh.nutritionist.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.consult.framework.Result;
import com.moonligh.nutritionist.service.dialogue.PreferenceWarmupService;
import com.moonligh.nutritionist.service.dialogue.PreferenceWarmupService.WarmupResult;

@RestController
@RequestMapping("/api/nutrition/agent")
public class PreferenceWarmupController {

    private final PreferenceWarmupService warmup;

    public PreferenceWarmupController(PreferenceWarmupService warmup) {
        this.warmup = warmup;
    }

    @PostMapping("/sessions/{sessionId}/preference/warmup")
    public Result<WarmupResult> warmup(
            @PathVariable String sessionId, @RequestBody(required = false) WarmupRequest request) {
        if (sessionId == null || sessionId.isBlank()) {
            return Result.fail("sessionId 不能为空");
        }
        String patientId = request == null ? null : request.patientId();
        return Result.ok(warmup.warmup(sessionId, patientId));
    }

    public record WarmupRequest(String patientId) {
    }
}
