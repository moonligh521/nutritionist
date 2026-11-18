package com.moonligh.nutritionist.service.dialogue;

import java.time.Instant;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.dialogue.AppliedMemoryWrite;
import com.moonligh.nutritionist.domain.dialogue.MemoryEvent;
import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.domain.dialogue.MemoryOp;
import com.moonligh.nutritionist.domain.dialogue.MemoryQuery;
import com.moonligh.nutritionist.domain.dialogue.PreferenceFact;
import com.moonligh.nutritionist.domain.dialogue.PreferenceItem;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceScope;
import com.moonligh.nutritionist.domain.dialogue.PreferenceSnapshot;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.domain.dialogue.SubjectType;

/**
 * 偏好事实链。生产以 MySQL 为权威；JVM 仅 L1。
 * 无参构造仅供单测纯内存。
 */
@Component
public class PreferenceStore {

    private static final Logger log = LoggerFactory.getLogger(PreferenceStore.class);

    private final ConcurrentHashMap<String, OwnerBook> books = new ConcurrentHashMap<>();
    private final PreferencePersistence persistence;
    private final boolean memoryOnly;
    private final MemoryMetrics metrics;

    /** 单测：仅内存。 */
    public PreferenceStore() {
        this.persistence = null;
        this.memoryOnly = true;
        this.metrics = new MemoryMetrics();
    }

    @Autowired
    public PreferenceStore(PreferencePersistence persistence, ObjectProvider<MemoryMetrics> metrics) {
        this.persistence = persistence;
        this.memoryOnly = false;
        this.metrics = metrics == null ? new MemoryMetrics() : metrics.getIfAvailable(MemoryMetrics::new);
    }

    /** 契约测：注入假 persistence。 */
    PreferenceStore(PreferencePersistence persistence, boolean memoryOnly) {
        this(persistence, memoryOnly, new MemoryMetrics());
    }

    PreferenceStore(PreferencePersistence persistence, boolean memoryOnly, MemoryMetrics metrics) {
        this.persistence = persistence;
        this.memoryOnly = memoryOnly;
        this.metrics = metrics == null ? new MemoryMetrics() : metrics;
    }

    public PreferenceSnapshot snapshot(String ownerId) {
        hydrate(ownerId, false);
        return snapshot(ownerId, Instant.now());
    }

    public PreferenceSnapshot snapshot(String ownerId, Instant asOf) {
        OwnerBook book = book(ownerId);
        if (book == null) {
            return PreferenceSnapshot.empty();
        }
        synchronized (book) {
            Instant when = asOf == null ? Instant.now() : asOf;
            List<PreferenceItem> current = new ArrayList<>();
            for (PreferenceFact fact : book.facts) {
                if (fact.activeAt(when) && fact.polarity() != PreferencePolarity.NEUTRAL) {
                    current.add(fact.toItem());
                }
            }
            return new PreferenceSnapshot(current, book.epoch, List.copyOf(book.facts));
        }
    }

    /**
     * 权威路径：先 DB 事务，成功才替换 L1。
     * 内存路径（单测）：就地 apply。
     */
    public AppliedMemoryWrite commit(String ownerId, MemoryExtraction extraction) {
        if (ownerId == null || ownerId.isBlank() || extraction == null || extraction.events().isEmpty()) {
            long epoch = book(ownerId) == null ? 0L : book(ownerId).epoch;
            return new AppliedMemoryWrite(List.of(), epoch, false);
        }
        String owner = ownerId.trim();
        if (memoryOnly || persistence == null) {
            return commitMemoryOnly(owner, extraction);
        }
        if (!persistence.available()) {
            failWrite(owner, "preference persistence unavailable");
            return AppliedMemoryWrite.none();
        }
        return commitDurable(owner, extraction);
    }

    private AppliedMemoryWrite commitDurable(String owner, MemoryExtraction extraction) {
        if (!extraction.eventId().isBlank() && persistence.eventSeen(extraction.eventId())) {
            invalidate(owner);
            hydrate(owner, true);
            long epoch = book(owner) == null ? 0L : book(owner).epoch;
            return new AppliedMemoryWrite(List.copyOf(extraction.events()), epoch, true);
        }
        List<MemoryEvent> usable = new ArrayList<>();
        for (MemoryEvent event : extraction.events()) {
            if (event.usable()) {
                usable.add(event);
            }
        }
        if (usable.isEmpty()) {
            return AppliedMemoryWrite.none();
        }
        hydrate(owner, true);
        OwnerBook draft = copyBook(owner);
        Instant now = Instant.now();
        for (MemoryEvent event : usable) {
            applyOne(draft, owner, event, now);
        }
        draft.epoch++;
        try {
            persistence.persistCommit(
                    owner,
                    new MemoryExtraction(
                            usable,
                            extraction.queries(),
                            extraction.turnOnlyHints(),
                            extraction.allergySuspects(),
                            extraction.needsDisambiguation(),
                            extraction.eventId()),
                    draft.epoch);
        } catch (RuntimeException error) {
            failWrite(owner, error.toString());
            log.warn("preference persist failed owner={}: {}", owner, error.toString());
            return AppliedMemoryWrite.none();
        }
        books.put(owner, draft);
        return new AppliedMemoryWrite(usable, draft.epoch, true);
    }

    private void failWrite(String owner, String reason) {
        String detail = "owner=" + owner + " " + (reason == null ? "" : reason);
        metrics.markWriteFail(detail);
    }

    private AppliedMemoryWrite commitMemoryOnly(String owner, MemoryExtraction extraction) {
        OwnerBook book = books.computeIfAbsent(owner, id -> new OwnerBook());
        synchronized (book) {
            if (!extraction.eventId().isBlank() && book.seenEventIds.contains(extraction.eventId())) {
                return new AppliedMemoryWrite(List.copyOf(extraction.events()), book.epoch, true);
            }
            Instant now = Instant.now();
            List<MemoryEvent> applied = new ArrayList<>();
            for (MemoryEvent event : extraction.events()) {
                if (!event.usable()) {
                    continue;
                }
                applyOne(book, owner, event, now);
                applied.add(event);
            }
            if (applied.isEmpty()) {
                return AppliedMemoryWrite.none();
            }
            if (!extraction.eventId().isBlank()) {
                book.seenEventIds.add(extraction.eventId());
            }
            book.epoch++;
            return new AppliedMemoryWrite(applied, book.epoch, true);
        }
    }

    public AppliedMemoryWrite mergeSessionToPatient(String sessionOwnerId, String patientId, String mergeId) {
        if (sessionOwnerId == null || patientId == null || patientId.isBlank()) {
            return AppliedMemoryWrite.none();
        }
        PreferenceSnapshot session = snapshot(sessionOwnerId);
        List<MemoryEvent> events = new ArrayList<>();
        for (PreferenceItem item : session.current()) {
            events.add(new MemoryEvent(
                    MemoryOp.ASSERT,
                    item.subject(),
                    item.subjectType(),
                    item.polarity(),
                    item.strength(),
                    item.scope(),
                    null,
                    null,
                    "",
                    "",
                    1.0,
                    "merge:" + (mergeId == null ? "" : mergeId)));
        }
        if (events.isEmpty()) {
            return AppliedMemoryWrite.none();
        }
        String idempotent = mergeId == null || mergeId.isBlank()
                ? "merge:" + sessionOwnerId + "->" + patientId.trim()
                : "merge:" + mergeId.trim();
        return commit(patientId.trim(), new MemoryExtraction(events, List.of(), List.of(), List.of(), "", idempotent));
    }

    public int expireDue(Instant now) {
        Instant when = now == null ? Instant.now() : now;
        if (!memoryOnly && persistence != null && persistence.available()) {
            int closed = persistence.expireDue(when);
            books.clear();
            return closed;
        }
        int closed = 0;
        for (OwnerBook book : books.values()) {
            synchronized (book) {
                List<PreferenceFact> next = new ArrayList<>();
                boolean changed = false;
                for (PreferenceFact fact : book.facts) {
                    if (!fact.current()) {
                        next.add(fact);
                        continue;
                    }
                    boolean due = fact.validTo() != null && !fact.validTo().isAfter(when);
                    boolean turnExpired = fact.scope() == PreferenceScope.TURN
                            && fact.validFrom() != null
                            && fact.validFrom().isBefore(when.minusSeconds(24 * 3600L));
                    if (due || turnExpired) {
                        next.add(fact.expire(when));
                        closed++;
                        changed = true;
                    } else {
                        next.add(fact);
                    }
                }
                if (changed) {
                    book.facts.clear();
                    book.facts.addAll(next);
                    book.epoch++;
                }
            }
        }
        return closed;
    }

    /** 删除现行口味（隐私）：批量 RETRACT。 */
    public AppliedMemoryWrite deleteAllCurrent(String ownerId, String note) {
        PreferenceSnapshot snap = snapshot(ownerId);
        List<MemoryEvent> events = new ArrayList<>();
        for (PreferenceItem item : snap.current()) {
            events.add(new MemoryEvent(
                    MemoryOp.RETRACT,
                    item.subject(),
                    item.subjectType(),
                    PreferencePolarity.NEUTRAL,
                    PreferenceStrength.WEAK,
                    PreferenceScope.PERMANENT,
                    null,
                    null,
                    "",
                    "",
                    1.0,
                    note == null ? "privacy-delete" : note));
        }
        if (events.isEmpty()) {
            return AppliedMemoryWrite.none();
        }
        return commit(
                ownerId,
                new MemoryExtraction(
                        events, List.of(), List.of(), List.of(), "", "delete:" + ownerId + ":" + UUID.randomUUID()));
    }

    public void invalidate(String ownerId) {
        if (ownerId == null || ownerId.isBlank()) {
            return;
        }
        books.remove(ownerId.trim());
    }

    private void hydrate(String ownerId, boolean force) {
        if (memoryOnly || persistence == null || !persistence.available() || ownerId == null || ownerId.isBlank()) {
            return;
        }
        String owner = ownerId.trim();
        if (!force) {
            OwnerBook existing = books.get(owner);
            if (existing != null && !existing.facts.isEmpty()) {
                return;
            }
        }
        List<PreferenceFact> loaded = persistence.loadFacts(owner);
        OwnerBook book = books.computeIfAbsent(owner, id -> new OwnerBook());
        synchronized (book) {
            book.facts.clear();
            book.facts.addAll(loaded);
            long maxVersion = 0;
            for (PreferenceFact fact : loaded) {
                maxVersion = Math.max(maxVersion, fact.version());
            }
            book.epoch = Math.max(book.epoch, maxVersion);
            book.seenEventIds.clear();
        }
    }

    /**
     * 客户端字段入口：忌口最多 MODERATE，evidence=client，不得当 ABSOLUTE 硬过滤。
     */
    public PreferenceSnapshot merge(
            String ownerId,
            List<String> avoidFoods,
            List<String> preferLikes,
            List<String> preferTags,
            List<String> preferCuisines) {
        List<MemoryEvent> events = new ArrayList<>();
        addAsserts(events, avoidFoods, SubjectType.FOOD, PreferencePolarity.AVOID, PreferenceStrength.MODERATE, "client");
        addAsserts(events, preferLikes, SubjectType.FOOD, PreferencePolarity.LIKE, PreferenceStrength.MODERATE, "client");
        addAsserts(events, preferTags, SubjectType.TAG, PreferencePolarity.LIKE, PreferenceStrength.MODERATE, "client");
        addAsserts(events, preferCuisines, SubjectType.CUISINE, PreferencePolarity.LIKE, PreferenceStrength.MODERATE, "client");
        if (!events.isEmpty()) {
            commit(ownerId, new MemoryExtraction(events, List.of(), List.of(), List.of(), "", UUID.randomUUID().toString()));
        }
        return snapshot(ownerId);
    }

    public List<String> answer(String ownerId, MemoryQuery query) {
        if (query == null) {
            return List.of();
        }
        PreferenceSnapshot snap = snapshot(ownerId);
        return switch (query.type()) {
            case CURRENT_AVOID -> snap.avoidFoods();
            case PAST_AVOID -> pastPolarity(snap.history(), PreferencePolarity.AVOID, query.subject());
            case AVOID_THEN_LIKE -> changed(snap.history(), PreferencePolarity.AVOID, PreferencePolarity.LIKE, query.subject());
            case LIKE_THEN_AVOID -> changed(snap.history(), PreferencePolarity.LIKE, PreferencePolarity.AVOID, query.subject());
            case WHEN_CHANGED -> whenChanged(snap.history(), query.subject());
        };
    }

    private OwnerBook copyBook(String owner) {
        OwnerBook source = books.computeIfAbsent(owner, id -> new OwnerBook());
        OwnerBook draft = new OwnerBook();
        synchronized (source) {
            draft.facts.addAll(source.facts);
            draft.epoch = source.epoch;
            draft.seenEventIds.addAll(source.seenEventIds);
        }
        return draft;
    }

    private void applyOne(OwnerBook book, String owner, MemoryEvent event, Instant now) {
        PreferencePolarity nextPolarity = event.op() == MemoryOp.RETRACT
                ? PreferencePolarity.NEUTRAL
                : event.polarity();
        PreferenceStrength strength = event.strength();
        PreferenceScope scope = event.scope();
        SubjectType type = event.subjectType();
        String subject = event.subject();

        List<PreferenceFact> next = new ArrayList<>();
        for (PreferenceFact fact : book.facts) {
            if (fact.current() && sameSlot(fact, type, subject)) {
                next.add(fact.expire(now));
            } else {
                next.add(fact);
            }
        }
        PreferenceFact created = new PreferenceFact(
                UUID.randomUUID().toString(),
                owner,
                subject,
                type,
                nextPolarity,
                strength,
                scope,
                event.condition(),
                now,
                null,
                evidenceSource(event),
                "",
                book.epoch + 1);
        next.add(created);
        book.facts.clear();
        book.facts.addAll(next);
    }

    private static boolean sameSlot(PreferenceFact fact, SubjectType type, String subject) {
        return fact.subjectType() == type && fact.subject().equals(subject);
    }

    private static String evidenceSource(MemoryEvent event) {
        return event.evidence().isBlank() ? "extractor" : event.evidence();
    }

    private static void addAsserts(
            List<MemoryEvent> events,
            List<String> subjects,
            SubjectType type,
            PreferencePolarity polarity,
            PreferenceStrength strength,
            String evidence) {
        if (subjects == null) {
            return;
        }
        for (String subject : subjects) {
            if (subject == null || subject.isBlank()) {
                continue;
            }
            events.add(new MemoryEvent(
                    MemoryOp.ASSERT,
                    subject.trim(),
                    type,
                    polarity,
                    strength,
                    PreferenceScope.PERMANENT,
                    null,
                    null,
                    "",
                    "",
                    1.0,
                    evidence));
        }
    }

    private static List<String> pastPolarity(List<PreferenceFact> history, PreferencePolarity polarity, String subjectFilter) {
        Set<String> subjects = new LinkedHashSet<>();
        for (PreferenceFact fact : history) {
            if (fact.subjectType() != SubjectType.FOOD || fact.polarity() != polarity) {
                continue;
            }
            if (!subjectFilter.isBlank() && !fact.subject().equals(subjectFilter)) {
                continue;
            }
            subjects.add(fact.subject());
        }
        return List.copyOf(subjects);
    }

    private static List<String> changed(
            List<PreferenceFact> history,
            PreferencePolarity was,
            PreferencePolarity now,
            String subjectFilter) {
        Set<String> everWas = new LinkedHashSet<>();
        Set<String> currentNow = new LinkedHashSet<>();
        for (PreferenceFact fact : history) {
            if (fact.subjectType() != SubjectType.FOOD) {
                continue;
            }
            if (!subjectFilter.isBlank() && !fact.subject().equals(subjectFilter)) {
                continue;
            }
            if (fact.polarity() == was) {
                everWas.add(fact.subject());
            }
            if (fact.current() && fact.polarity() == now) {
                currentNow.add(fact.subject());
            }
        }
        everWas.retainAll(currentNow);
        return List.copyOf(everWas);
    }

    private static List<String> whenChanged(List<PreferenceFact> history, String subject) {
        if (subject == null || subject.isBlank()) {
            return List.of();
        }
        for (int i = history.size() - 1; i >= 0; i--) {
            PreferenceFact fact = history.get(i);
            if (fact.subject().equals(subject) && fact.validFrom() != null) {
                return List.of(fact.validFrom().toString());
            }
        }
        return List.of();
    }

    private OwnerBook book(String ownerId) {
        if (ownerId == null || ownerId.isBlank()) {
            return null;
        }
        return books.get(ownerId.trim());
    }

    private static final class OwnerBook {
        private final List<PreferenceFact> facts = new ArrayList<>();
        private final Set<String> seenEventIds = ConcurrentHashMap.newKeySet();
        private long epoch;
    }
}
