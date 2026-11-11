package com.moonligh.nutritionist.service;

import java.time.Instant;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;

@Service
public class KillSwitchService {

    private final ConcurrentHashMap<String, SwitchState> switches = new ConcurrentHashMap<>();
    private final CopyOnWriteArrayList<AuditEvent> audit = new CopyOnWriteArrayList<>();

    public SwitchState activate(String capability, String scopeKey, String actor, String reason) {
        validate(capability, scopeKey, actor);
        SwitchState state = new SwitchState(capability, scopeKey, true, reason, Instant.now());
        switches.put(key(capability, scopeKey), state);
        audit.add(new AuditEvent(UUID.randomUUID().toString(), capability, scopeKey, "ACTIVATED", actor, null, Instant.now()));
        return state;
    }

    public SwitchState deactivate(
            String capability, String scopeKey, String approvingActorOne, String approvingActorTwo) {
        validate(capability, scopeKey, approvingActorOne);
        if (approvingActorTwo == null || approvingActorTwo.isBlank()
                || approvingActorOne.equals(approvingActorTwo)) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
        SwitchState state = new SwitchState(capability, scopeKey, false, "restored", Instant.now());
        switches.put(key(capability, scopeKey), state);
        audit.add(new AuditEvent(
                UUID.randomUUID().toString(), capability, scopeKey, "DEACTIVATED",
                approvingActorOne, approvingActorTwo, Instant.now()));
        return state;
    }

    public void requireEnabled(String capability, String scopeKey) {
        if (isActive(capability, scopeKey)) {
            throw new BusinessException(ErrorCode.KILL_SWITCH_ACTIVE);
        }
    }

    public boolean isActive(String capability, String scopeKey) {
        SwitchState state = switches.get(key(capability, scopeKey));
        return state != null && state.active();
    }

    public List<AuditEvent> auditEvents() {
        return List.copyOf(audit);
    }

    private static String key(String capability, String scopeKey) {
        return capability + "|" + scopeKey;
    }

    private static void validate(String capability, String scopeKey, String actor) {
        if (capability == null || capability.isBlank() || scopeKey == null || scopeKey.isBlank()
                || actor == null || actor.isBlank()) {
            throw new BusinessException(ErrorCode.PARAM_INVALID);
        }
    }

    public record SwitchState(
            String capability, String scopeKey, boolean active, String reason, Instant changedAt) {
    }

    public record AuditEvent(
            String eventId,
            String capability,
            String scopeKey,
            String action,
            String actorOne,
            String actorTwo,
            Instant occurredAt) {
    }
}
