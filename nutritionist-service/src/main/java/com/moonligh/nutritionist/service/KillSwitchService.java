package com.moonligh.nutritionist.service;

import java.time.Instant;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.nutritionist.domain.common.EntityTable;
import com.moonligh.nutritionist.infrastructure.persistence.NutritionDataStore;

@Service
public class KillSwitchService {

    /** 按“能力 + 病种”记住开关。编号例子：recommendation|diabetes。 */
    private final EntityTable<SwitchState> switches =
            new EntityTable<>(state -> state.capability() + "|" + state.scopeKey());
    private final CopyOnWriteArrayList<AuditEvent> audit = new CopyOnWriteArrayList<>();
    private final NutritionDataStore records;

    public KillSwitchService() {
        this(null);
    }

    @Autowired
    public KillSwitchService(NutritionDataStore records) {
        this.records = records;
    }

    public SwitchState activate(String capability, String scopeKey, String actor, String reason) {
        validate(capability, scopeKey, actor);
        SwitchState state = new SwitchState(capability, scopeKey, true, reason, Instant.now());
        switches.save(state);
        audit.add(new AuditEvent(UUID.randomUUID().toString(), capability, scopeKey, "ACTIVATED", actor, null, Instant.now()));
        if (records != null) {
            records.saveKill(capability, scopeKey, true, actor, "ACTIVATED");
        }
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
        switches.save(state);
        audit.add(new AuditEvent(
                UUID.randomUUID().toString(), capability, scopeKey, "DEACTIVATED",
                approvingActorOne, approvingActorTwo, Instant.now()));
        if (records != null) {
            records.saveKill(capability, scopeKey, false, approvingActorOne + "|" + approvingActorTwo, "DEACTIVATED");
        }
        return state;
    }

    public void requireEnabled(String capability, String scopeKey) {
        if (isActive(capability, scopeKey)) {
            throw new BusinessException(ErrorCode.KILL_SWITCH_ACTIVE);
        }
    }

    public boolean isActive(String capability, String scopeKey) {
        SwitchState state = switches.find(key(capability, scopeKey)).orElse(null);
        if (state != null) {
            return state.active();
        }
        return records != null && records.killActive(capability, scopeKey).orElse(false);
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

    /** 某个能力在某个病种上是否被紧急停掉。 */
    public record SwitchState(
            /** 能力标识，如推荐。 */
            String capability,
            /** 作用范围，如病种。 */
            String scopeKey,
            /** 是否处于停止状态。 */
            boolean active,
            /** 变更原因。 */
            String reason,
            /** 变更时间。 */
            Instant changedAt) {
    }

    /** 开关的一次操作记录。只追加，不修改旧记录。 */
    public record AuditEvent(
            /** 审计事件标识。 */
            String eventId,
            /** 能力标识。 */
            String capability,
            /** 作用范围。 */
            String scopeKey,
            /** 动作：激活或恢复。 */
            String action,
            /** 操作人标识。 */
            String actorOne,
            /** 第二审批人标识。恢复时须与操作人不同。 */
            String actorTwo,
            /** 发生时间。 */
            Instant occurredAt) {
    }
}
