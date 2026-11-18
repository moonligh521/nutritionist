package com.moonligh.nutritionist.service.dialogue;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.api.req.CreateAllergyReq;
import com.moonligh.nutritionist.domain.dialogue.AppliedMemoryWrite;
import com.moonligh.nutritionist.domain.dialogue.MemoryEvent;
import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.domain.dialogue.PreferenceFact;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceSnapshot;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.domain.dialogue.SessionMemory;
import com.moonligh.nutritionist.service.ClinicalRecordService;

/**
 * 记忆治理：合并、撤销、纠错、隐私删除、过敏确认、历史。
 */
@Service
public class MemoryGovernanceService {

    private final PreferenceStore preferences;
    private final PreferencePersistence persistence;
    private final SessionMemoryStore sessions;
    private final LongTermMemoryLoader longTermLoader;
    private final MemoryMetrics metrics;
    private final AllergySuspectStore allergySuspects;
    private final ClinicalRecordService clinical;
    private final DialogueExecutor executor;
    private final FoodNormalizer normalizer;

    @Autowired
    public MemoryGovernanceService(
            PreferenceStore preferences,
            PreferencePersistence persistence,
            SessionMemoryStore sessions,
            LongTermMemoryLoader longTermLoader,
            MemoryMetrics metrics,
            AllergySuspectStore allergySuspects,
            ObjectProvider<ClinicalRecordService> clinical,
            ObjectProvider<DialogueExecutor> executor,
            ObjectProvider<FoodNormalizer> normalizer) {
        this.preferences = preferences;
        this.persistence = persistence;
        this.sessions = sessions;
        this.longTermLoader = longTermLoader;
        this.metrics = metrics == null ? new MemoryMetrics() : metrics;
        this.allergySuspects = allergySuspects;
        this.clinical = clinical.getIfAvailable();
        this.executor = executor.getIfAvailable();
        this.normalizer = normalizer.getIfAvailable();
    }

    /** 测试兼容。 */
    public MemoryGovernanceService(
            PreferenceStore preferences,
            PreferencePersistence persistence,
            SessionMemoryStore sessions,
            LongTermMemoryLoader longTermLoader) {
        this(
                preferences,
                persistence,
                sessions,
                longTermLoader,
                new MemoryMetrics(),
                new AllergySuspectStore(),
                emptyProvider(),
                emptyProvider(),
                emptyProvider());
    }

    private static <T> org.springframework.beans.factory.ObjectProvider<T> emptyProvider() {
        return new org.springframework.beans.factory.ObjectProvider<>() {
            @Override
            public T getObject() {
                return null;
            }

            @Override
            public T getIfAvailable() {
                return null;
            }

            @Override
            public T getIfUnique() {
                return null;
            }
        };
    }

    public AppliedMemoryWrite mergeSessionToPatient(String sessionId, String patientId, String actor) {
        if (sessionId == null || sessionId.isBlank() || patientId == null || patientId.isBlank()) {
            return AppliedMemoryWrite.none();
        }
        SessionMemory memory = sessions.getOrCreate(sessionId);
        if (!memory.patientId().isBlank() && !memory.patientId().equals(patientId.trim())) {
            throw new IllegalStateException("会话已绑定其他患者，禁止误合并");
        }
        String mergeId = "s:" + sessionId.trim() + ":p:" + patientId.trim() + ":a:" + (actor == null ? "" : actor);
        AppliedMemoryWrite write = preferences.mergeSessionToPatient(
                memory.memoryOwnerId(), patientId.trim(), mergeId);
        if (!write.committed()) {
            return write;
        }
        metrics.markMerge();
        memory.setPatientId(patientId.trim());
        memory.setLongTerm(longTermLoader.loadPatient(patientId));
        sessions.save(memory);
        if (persistence.available()) {
            persistence.insertReview(
                    patientId.trim(),
                    mergeId,
                    "CONFIRM",
                    "USER",
                    "",
                    "merge session " + sessionId);
        }
        return write;
    }

    public AppliedMemoryWrite retract(String ownerId, String subject, String note, String sessionId) {
        MemoryEvent event = MemoryEvent.retractFood(subject, note == null ? "用户撤销" : note);
        AppliedMemoryWrite write = preferences.commit(
                ownerId,
                new MemoryExtraction(List.of(event), List.of(), List.of(), List.of(), "", UUID.randomUUID().toString()));
        if (!write.committed()) {
            return write;
        }
        metrics.markRetract();
        if (persistence.available()) {
            persistence.insertReview(ownerId, "", "REJECT", "USER", subject, note);
        }
        recheckSession(ownerId, sessionId);
        return write;
    }

    public AppliedMemoryWrite retract(String ownerId, String subject, String note) {
        return retract(ownerId, subject, note, null);
    }

    public AppliedMemoryWrite correctAvoid(
            String ownerId, String subject, PreferenceStrength strength, String note, String sessionId) {
        MemoryEvent event = MemoryEvent.assertFood(
                PreferencePolarity.AVOID,
                strength == null ? PreferenceStrength.MODERATE : strength,
                subject,
                note == null ? "纠错" : note);
        AppliedMemoryWrite write = preferences.commit(
                ownerId,
                new MemoryExtraction(List.of(event), List.of(), List.of(), List.of(), "", UUID.randomUUID().toString()));
        if (!write.committed()) {
            return write;
        }
        if (persistence.available()) {
            persistence.insertReview(ownerId, "", "CORRECT", "USER", subject, note);
        }
        recheckSession(ownerId, sessionId);
        return write;
    }

    public AppliedMemoryWrite correctAvoid(
            String ownerId, String subject, PreferenceStrength strength, String note) {
        return correctAvoid(ownerId, subject, strength, note, null);
    }

    public AppliedMemoryWrite deletePreferences(String ownerId, String note) {
        AppliedMemoryWrite write = preferences.deleteAllCurrent(ownerId, note);
        if (write.committed() && persistence.available()) {
            persistence.insertReview(ownerId, "", "DELETE", "USER", "*", note);
        }
        return write;
    }

    public void confirmAllergySuspect(String ownerId, String subject, String accountId) {
        if (ownerId == null || subject == null) {
            return;
        }
        allergySuspects.markDone(ownerId, subject);
        if (ownerId.startsWith("session:") || clinical == null) {
            return;
        }
        String account = accountId == null || accountId.isBlank() ? ownerId : accountId;
        clinical.addAllergy(
                account,
                new CreateAllergyReq(ownerId.trim(), "memory-confirm", subject.trim(), 1, true));
    }

    public void dismissAllergySuspect(String ownerId, String subject) {
        allergySuspects.dismiss(ownerId, subject);
    }

    public PreferenceSnapshot history(String ownerId) {
        return preferences.snapshot(ownerId);
    }

    public List<PreferenceFact> facts(String ownerId) {
        return preferences.snapshot(ownerId).history();
    }

    private void recheckSession(String ownerId, String sessionId) {
        if (sessionId == null || sessionId.isBlank() || executor == null || normalizer == null) {
            return;
        }
        SessionMemory memory = sessions.getOrCreate(sessionId);
        if (!ownerId.equals(memory.memoryOwnerId()) && !ownerId.equals(memory.patientId())) {
            return;
        }
        if (!memory.patientId().isBlank()) {
            memory.setLongTerm(longTermLoader.loadPatient(memory.patientId()));
        } else {
            memory.setLongTerm(longTermLoader.loadOwner(memory.memoryOwnerId()));
        }
        DialogueExecutor.RunState state = new DialogueExecutor.RunState(memory, normalizer, List.of(), "");
        executor.autoReplaceHitByAbsoluteAvoid(state);
        sessions.save(memory);
    }

}
