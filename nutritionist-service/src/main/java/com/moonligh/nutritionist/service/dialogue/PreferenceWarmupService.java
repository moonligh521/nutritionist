package com.moonligh.nutritionist.service.dialogue;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.dialogue.DialoguePhase;
import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.SessionMemory;

/**
 * 点「问餐」预热：只读投影进会话，不调理解/召回。
 */
@Service
public class PreferenceWarmupService {

    private final SessionMemoryStore sessions;
    private final LongTermMemoryLoader longTermLoader;
    private final PreferenceStore preferences;
    private final MemoryMetrics metrics;

    public PreferenceWarmupService(
            SessionMemoryStore sessions,
            LongTermMemoryLoader longTermLoader,
            PreferenceStore preferences,
            MemoryMetrics metrics) {
        this.sessions = sessions;
        this.longTermLoader = longTermLoader == null ? new LongTermMemoryLoader(null, preferences) : longTermLoader;
        this.preferences = preferences == null ? new PreferenceStore() : preferences;
        this.metrics = metrics == null ? new MemoryMetrics() : metrics;
    }

    public WarmupResult warmup(String sessionId, String patientId) {
        SessionMemory memory = sessions.getOrCreate(sessionId);
        if (patientId != null && !patientId.isBlank()) {
            memory.setPatientId(patientId.trim());
        }
        preferences.expireDue(null);
        LongTermMemory loaded = patientId != null && !patientId.isBlank()
                ? longTermLoader.loadPatient(patientId.trim())
                : longTermLoader.loadOwner(memory.memoryOwnerId());
        memory.setLongTerm(loaded);
        memory.setPreferenceEpoch(loaded.preferenceEpoch());
        if (memory.phase() == DialoguePhase.IDLE && memory.currentDishes().isEmpty()) {
            memory.setPhase(DialoguePhase.IDLE);
        }
        sessions.save(memory);
        metrics.markWarmup();
        return new WarmupResult(
                memory.sessionId(),
                memory.memoryOwnerId(),
                memory.preferenceEpoch(),
                memory.phase().name(),
                loaded);
    }

    public record WarmupResult(
            String sessionId,
            String ownerId,
            long preferenceEpoch,
            String phase,
            LongTermMemory longTerm) {
    }
}
