package com.moonligh.nutritionist.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.moonligh.consult.framework.Result;
import com.moonligh.consult.security.AccountIds;
import com.moonligh.nutritionist.service.KillSwitchService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/nutrition/admin/kill-switches")
public class KillSwitchController {

    private final KillSwitchService switches;

    public KillSwitchController(KillSwitchService switches) {
        this.switches = switches;
    }

    @PostMapping("/activate")
    public Result<KillSwitchService.SwitchState> activate(
            @RequestBody ActivateReq request, HttpServletRequest http) {
        return Result.ok(switches.activate(
                request.capability(), request.scopeKey(), AccountIds.of(http), request.reason()));
    }

    @PostMapping("/deactivate")
    public Result<KillSwitchService.SwitchState> deactivate(@RequestBody DeactivateReq request) {
        return Result.ok(switches.deactivate(
                request.capability(), request.scopeKey(), request.approvingActorOne(), request.approvingActorTwo()));
    }

    @GetMapping("/audit")
    public Result<List<KillSwitchService.AuditEvent>> audit() {
        return Result.ok(switches.auditEvents());
    }

    public record ActivateReq(String capability, String scopeKey, String reason) {
    }

    public record DeactivateReq(
            String capability, String scopeKey, String approvingActorOne, String approvingActorTwo) {
    }
}
