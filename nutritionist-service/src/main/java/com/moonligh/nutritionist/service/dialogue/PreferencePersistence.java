package com.moonligh.nutritionist.service.dialogue;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.time.Instant;
import java.util.ArrayList;
import java.util.HexFormat;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.moonligh.nutritionist.domain.dialogue.MemoryEvent;
import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.domain.dialogue.MemoryOp;
import com.moonligh.nutritionist.domain.dialogue.PreferenceFact;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceScope;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.domain.dialogue.SubjectType;
import com.moonligh.nutritionist.infrastructure.persistence.DietPreferenceMapper;
import com.moonligh.nutritionist.infrastructure.persistence.DietPreferenceMapper.AllergySuspectRow;
import com.moonligh.nutritionist.infrastructure.persistence.DietPreferenceMapper.EventRow;
import com.moonligh.nutritionist.infrastructure.persistence.DietPreferenceMapper.FactRow;
import com.moonligh.nutritionist.infrastructure.persistence.DietPreferenceMapper.ReviewRow;

/**
 * MySQL 偏好权威源。生产路径失败抛错，由 PreferenceStore 决定不提交 L1。
 */
@Component
public class PreferencePersistence {

    private static final String EXTRACTOR_VERSION = "v2.1-memory";

    private final DietPreferenceMapper mapper;

    @Autowired
    public PreferencePersistence(ObjectProvider<DietPreferenceMapper> mapper) {
        this.mapper = mapper.getIfAvailable();
    }

    /** 单测注入。 */
    PreferencePersistence(DietPreferenceMapper mapper) {
        this.mapper = mapper;
    }

    public boolean available() {
        return mapper != null;
    }

    public boolean eventSeen(String eventId) {
        if (mapper == null || eventId == null || eventId.isBlank()) {
            return false;
        }
        return mapper.countEvent(eventId) > 0;
    }

    /**
     * 同事务写入；失败抛错。调用方不得在失败后改 L1。
     * @return true 若本批次新写入；false 若 eventId 已存在（幂等命中）
     */
    @Transactional
    public boolean persistCommit(String ownerId, MemoryExtraction extraction, long epoch) {
        if (mapper == null) {
            throw new IllegalStateException("偏好持久化不可用");
        }
        if (ownerId == null || ownerId.isBlank() || extraction == null) {
            throw new IllegalArgumentException("ownerId/extraction 无效");
        }
        Instant now = Instant.now();
        String batchEventId = extraction.eventId().isBlank()
                ? UUID.randomUUID().toString()
                : extraction.eventId();
        if (mapper.countEvent(batchEventId) > 0) {
            return false;
        }
        int applied = 0;
        for (MemoryEvent event : extraction.events()) {
            if (!event.usable()) {
                continue;
            }
            mapper.closeCurrentFacts(ownerId, event.subject(), event.subjectType().name(), now);
            PreferencePolarity polarity = event.op() == MemoryOp.RETRACT
                    ? PreferencePolarity.NEUTRAL
                    : event.polarity();
            String factId = UUID.randomUUID().toString();
            mapper.insertFact(new FactRow(
                    factId,
                    ownerId,
                    event.subject(),
                    event.subjectType().name(),
                    polarity.name(),
                    event.strength().name(),
                    event.scope().name(),
                    event.condition().isBlank() ? null : event.condition(),
                    now,
                    null,
                    event.evidence().isBlank() ? "extractor" : event.evidence(),
                    batchEventId,
                    epoch,
                    now,
                    now));
            // 明细事件键必须 ≤128；禁止 uuid:uuid（73 已超旧列 64）
            mapper.insertEvent(new EventRow(
                    detailEventId(factId),
                    ownerId,
                    event.op().name(),
                    event.subject(),
                    event.subjectType().name(),
                    polarity.name(),
                    event.strength().name(),
                    event.scope().name(),
                    event.evidence(),
                    hash(event.evidence()),
                    EXTRACTOR_VERSION,
                    "APPLIED",
                    null,
                    batchEventId,
                    now,
                    now));
            applied++;
        }
        if (applied == 0) {
            throw new IllegalStateException("无可落库事件");
        }
        mapper.insertEvent(new EventRow(
                batchEventId,
                ownerId,
                "ASSERT",
                "*",
                "FOOD",
                "NEUTRAL",
                "WEAK",
                "PERMANENT",
                "batch",
                hash(batchEventId),
                EXTRACTOR_VERSION,
                "APPLIED",
                null,
                "epoch=" + epoch,
                now,
                now));
        return true;
    }

    public List<PreferenceFact> loadFacts(String ownerId) {
        if (mapper == null || ownerId == null || ownerId.isBlank()) {
            return List.of();
        }
        List<FactRow> rows = mapper.listFacts(ownerId.trim());
        List<PreferenceFact> facts = new ArrayList<>();
        for (FactRow row : rows) {
            facts.add(new PreferenceFact(
                    row.factId(),
                    row.ownerId(),
                    row.subject(),
                    SubjectType.valueOf(row.subjectType()),
                    PreferencePolarity.valueOf(row.polarity()),
                    PreferenceStrength.valueOf(row.strength()),
                    PreferenceScope.valueOf(row.scopeType()),
                    row.conditionJson() == null ? "" : row.conditionJson(),
                    row.validFrom(),
                    row.validTo(),
                    row.sourceText(),
                    row.eventId(),
                    row.versionNo()));
        }
        return facts;
    }

    @Transactional
    public int expireDue(Instant now) {
        if (mapper == null) {
            return 0;
        }
        Instant when = now == null ? Instant.now() : now;
        Instant turnBefore = when.minusSeconds(24 * 3600L);
        Instant tempBefore = when.minusSeconds(14L * 24 * 3600L);
        int closed = mapper.expireTurnFacts(when, turnBefore, tempBefore);
        mapper.expireTimedFacts(when);
        return closed;
    }

    public void insertReview(
            String ownerId,
            String eventId,
            String reviewType,
            String reviewerType,
            String correctedValue,
            String note) {
        if (mapper == null) {
            throw new IllegalStateException("偏好持久化不可用");
        }
        mapper.insertReview(new ReviewRow(
                UUID.randomUUID().toString(),
                eventId == null ? "" : eventId,
                ownerId,
                reviewType,
                reviewerType,
                correctedValue,
                note,
                Instant.now()));
    }

    public void upsertAllergySuspect(String ownerId, String subject, String evidence) {
        if (mapper == null) {
            throw new IllegalStateException("偏好持久化不可用");
        }
        Instant now = Instant.now();
        mapper.upsertAllergySuspect(new AllergySuspectRow(
                UUID.randomUUID().toString(),
                ownerId.trim(),
                subject.trim(),
                evidence == null ? "" : evidence,
                1,
                now,
                now));
    }

    public List<AllergySuspectRow> pendingAllergySuspects(String ownerId) {
        if (mapper == null || ownerId == null || ownerId.isBlank()) {
            return List.of();
        }
        return mapper.listPendingAllergySuspects(ownerId.trim());
    }

    public void markAllergySuspectDone(String ownerId, String subject) {
        if (mapper == null) {
            throw new IllegalStateException("偏好持久化不可用");
        }
        mapper.markAllergySuspectDone(ownerId.trim(), subject.trim(), Instant.now());
    }

    /** 明细事件主键：单 UUID，保证 ≤64/128 列宽。批次幂等仍用 extraction.eventId。 */
    static String detailEventId(String factId) {
        String id = factId == null ? "" : factId.trim();
        if (id.isBlank()) {
            id = UUID.randomUUID().toString();
        }
        return id;
    }

    private static String hash(String text) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] bytes = digest.digest((text == null ? "" : text).getBytes(StandardCharsets.UTF_8));
            return HexFormat.of().formatHex(bytes);
        } catch (Exception error) {
            return "";
        }
    }
}
