package com.moonligh.nutritionist.service.dialogue;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.infrastructure.persistence.DietPreferenceMapper.AllergySuspectRow;

/**
 * 过敏嫌疑：生产以 MySQL 为权威；无 Mapper 时退回内存（单测 / 降级）。
 */
@Component
public class AllergySuspectStore {

    private final PreferencePersistence persistence;
    private final ConcurrentHashMap<String, List<Suspect>> byOwner = new ConcurrentHashMap<>();

    @Autowired
    public AllergySuspectStore(PreferencePersistence persistence) {
        this.persistence = persistence;
    }

    /** 单测。 */
    public AllergySuspectStore() {
        this.persistence = null;
    }

    public void addAll(String ownerId, List<String> suspects, String evidence) {
        if (ownerId == null || ownerId.isBlank() || suspects == null || suspects.isEmpty()) {
            return;
        }
        String owner = ownerId.trim();
        if (persistence != null && persistence.available()) {
            for (String name : suspects) {
                if (name == null || name.isBlank()) {
                    continue;
                }
                persistence.upsertAllergySuspect(owner, name.trim(), evidence == null ? "" : evidence);
            }
            return;
        }
        List<Suspect> list = byOwner.computeIfAbsent(owner, id -> new ArrayList<>());
        synchronized (list) {
            for (String name : suspects) {
                if (name == null || name.isBlank()) {
                    continue;
                }
                String subject = name.trim();
                boolean exists = list.stream().anyMatch(item -> item.subject().equals(subject) && item.pending());
                if (!exists) {
                    list.add(new Suspect(subject, evidence == null ? "" : evidence, Instant.now(), true));
                }
            }
        }
    }

    public List<Suspect> pending(String ownerId) {
        if (ownerId == null || ownerId.isBlank()) {
            return List.of();
        }
        if (persistence != null && persistence.available()) {
            List<Suspect> out = new ArrayList<>();
            for (AllergySuspectRow row : persistence.pendingAllergySuspects(ownerId.trim())) {
                out.add(new Suspect(row.subject(), row.evidenceText(), row.createdAt(), row.pendingFlag() == 1));
            }
            return List.copyOf(out);
        }
        List<Suspect> list = byOwner.get(ownerId.trim());
        if (list == null) {
            return List.of();
        }
        synchronized (list) {
            return list.stream().filter(Suspect::pending).toList();
        }
    }

    public void dismiss(String ownerId, String subject) {
        markDone(ownerId, subject);
    }

    public void markDone(String ownerId, String subject) {
        if (ownerId == null || subject == null) {
            return;
        }
        if (persistence != null && persistence.available()) {
            persistence.markAllergySuspectDone(ownerId, subject);
            return;
        }
        List<Suspect> list = byOwner.get(ownerId.trim());
        if (list == null) {
            return;
        }
        synchronized (list) {
            for (int i = 0; i < list.size(); i++) {
                Suspect item = list.get(i);
                if (item.subject().equals(subject.trim()) && item.pending()) {
                    list.set(i, new Suspect(item.subject(), item.evidence(), item.createdAt(), false));
                }
            }
        }
    }

    public record Suspect(String subject, String evidence, Instant createdAt, boolean pending) {
    }
}
