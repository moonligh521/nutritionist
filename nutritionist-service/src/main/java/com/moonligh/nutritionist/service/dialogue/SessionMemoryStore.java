package com.moonligh.nutritionist.service.dialogue;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.domain.dialogue.DishSlot;
import com.moonligh.nutritionist.domain.dialogue.DishSlotStatus;
import com.moonligh.nutritionist.domain.dialogue.FoodCorrection;
import com.moonligh.nutritionist.domain.dialogue.SessionMemory;
import com.moonligh.nutritionist.domain.dialogue.SessionSnapshot;
import com.moonligh.nutritionist.domain.dialogue.SessionSnapshot.DishSlotView;
import com.moonligh.nutritionist.service.DishRecommendService.Suggestion;

/**
 * 短期会话：生产以 Redis 为权威；JVM 仅 L1。
 */
@Component
public class SessionMemoryStore {

    private static final Logger log = LoggerFactory.getLogger(SessionMemoryStore.class);
    private static final Duration TTL = Duration.ofHours(12);

    private final ConcurrentHashMap<String, SessionMemory> sessions = new ConcurrentHashMap<>();
    private final StringRedisTemplate redis;
    private final ObjectMapper json;

    @Autowired
    public SessionMemoryStore(
            ObjectProvider<StringRedisTemplate> redis, ObjectProvider<ObjectMapper> objectMapper) {
        this.redis = redis.getIfAvailable();
        ObjectMapper mapper = objectMapper == null ? null : objectMapper.getIfAvailable();
        this.json = mapper == null
                ? new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)
                : mapper.copy().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
    }

    /** 单测：纯内存。 */
    public SessionMemoryStore() {
        this.redis = null;
        this.json = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
    }

    public SessionMemory getOrCreate(String sessionId) {
        String id = sessionId == null || sessionId.isBlank() ? UUID.randomUUID().toString() : sessionId.trim();
        if (redis != null) {
            SessionSnapshot remote = loadRemote(id);
            if (remote != null) {
                SessionMemory memory = sessions.computeIfAbsent(id, SessionMemory::new);
                applySnapshot(memory, remote);
                return memory;
            }
        }
        SessionMemory local = sessions.computeIfAbsent(id, SessionMemory::new);
        if (redis != null) {
            // 权威侧尚无会话：回写空壳，避免他实例另起炉灶时丢 epoch 语义
            save(local);
        }
        return local;
    }

    /** 回合结束后刷新 Redis。 */
    public void save(SessionMemory memory) {
        if (memory == null) {
            return;
        }
        sessions.put(memory.sessionId(), memory);
        if (redis == null) {
            return;
        }
        try {
            String payload = json.writeValueAsString(toSnapshot(memory));
            redis.opsForValue().set(key(memory.sessionId()), payload, TTL);
        } catch (Exception error) {
            log.warn("session redis save failed sessionId={}", memory.sessionId(), error);
        }
    }

    private SessionSnapshot loadRemote(String sessionId) {
        if (redis == null) {
            return null;
        }
        try {
            String payload = redis.opsForValue().get(key(sessionId));
            if (payload == null || payload.isBlank()) {
                return null;
            }
            return json.readValue(payload, SessionSnapshot.class);
        } catch (Exception error) {
            log.warn("session redis load failed sessionId={}", sessionId, error);
            return null;
        }
    }

    private static String key(String sessionId) {
        return "nutrition:session:" + sessionId;
    }

    private static SessionSnapshot toSnapshot(SessionMemory memory) {
        List<DishSlotView> slots = new ArrayList<>();
        for (DishSlot slot : memory.dishSlots()) {
            Suggestion dish = slot.dish();
            slots.add(new DishSlotView(
                    dish == null ? "" : dish.id(),
                    dish == null ? "" : dish.name(),
                    dish == null ? null : dish.energy(),
                    dish == null ? 0 : dish.score(),
                    dish == null ? "" : dish.reason(),
                    dish == null ? "" : dish.bring(),
                    dish == null ? "" : dish.step(),
                    slot.status(),
                    slot.replacedFromId()));
        }
        return new SessionSnapshot(
                memory.sessionId(),
                memory.patientId(),
                memory.longTerm(),
                memory.foodIds(),
                memory.missing(),
                memory.corrections(),
                memory.excludedDishIds(),
                slots,
                memory.turnHints(),
                memory.revision(),
                memory.preferenceEpoch(),
                memory.phase().name(),
                memory.lastFocusedDishName(),
                memory.lastEmptyReason(),
                memory.guideActions());
    }

    private static void applySnapshot(SessionMemory memory, SessionSnapshot snapshot) {
        memory.setPatientId(snapshot.patientId());
        memory.setLongTerm(snapshot.longTerm());
        memory.setFoodIds(snapshot.foodIds());
        memory.setTurnHints(snapshot.turnHints());
        memory.setPreferenceEpoch(snapshot.preferenceEpoch());
        memory.setPhase(com.moonligh.nutritionist.domain.dialogue.DialoguePhase.parse(snapshot.phase()));
        memory.setLastFocusedDishName(snapshot.lastFocusedDishName());
        memory.setLastEmptyReason(snapshot.lastEmptyReason());
        memory.setGuideActions(snapshot.guideActions());
        for (String missing : snapshot.missing()) {
            memory.addMissing(missing);
        }
        for (FoodCorrection correction : snapshot.corrections()) {
            memory.rememberCorrection(correction.raw(), correction.canonical());
        }
        for (String excluded : snapshot.excludedDishIds()) {
            memory.rememberExcludedDishId(excluded);
        }
        List<DishSlot> slots = new ArrayList<>();
        for (DishSlotView view : snapshot.dishSlots()) {
            Suggestion dish = new Suggestion(
                    view.dishId(),
                    view.dishName(),
                    view.energy(),
                    view.score(),
                    view.reason(),
                    view.bring(),
                    view.step());
            DishSlotStatus status = view.status() == null ? DishSlotStatus.VALID : view.status();
            slots.add(new DishSlot(dish, status, view.replacedFromId()));
        }
        if (!slots.isEmpty()) {
            memory.setDishSlots(slots);
        }
    }
}
