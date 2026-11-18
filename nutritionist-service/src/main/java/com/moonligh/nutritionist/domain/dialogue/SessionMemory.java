package com.moonligh.nutritionist.domain.dialogue;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import com.moonligh.nutritionist.service.DishRecommendService.Suggestion;
import com.moonligh.nutritionist.service.IngredientAgent.Profile;

/**
 * 会话短期记忆：长期快照副本 + 本轮推荐过程态。
 */
public final class SessionMemory {

    private final String sessionId;
    private String patientId = "";
    private LongTermMemory longTerm = LongTermMemory.empty();
    private List<Suggestion> currentDishes = List.of();
    private List<DishSlot> dishSlots = List.of();
    private final List<String> missing = new ArrayList<>();
    private final List<String> foodIds = new ArrayList<>();
    private final List<FoodCorrection> corrections = new ArrayList<>();
    private final List<String> excludedDishIds = new ArrayList<>();
    /** 当次口味提示，不升长期，例如「今天清淡一点」。 */
    private String turnHints = "";
    /** 本轮口头绝对忌口（理解/规则），不写 Redis 权威。 */
    private List<String> turnAbsoluteAvoidFoods = List.of();
    /** 本轮口头软忌口，仅降权。 */
    private List<String> turnAvoidFoods = List.of();
    private Profile profile;
    private int revision;
    private long preferenceEpoch;
    private DialoguePhase phase = DialoguePhase.IDLE;
    private String lastFocusedDishName = "";
    private String lastEmptyReason = "";
    private List<String> guideActions = List.of();

    public SessionMemory(String sessionId) {
        this.sessionId = sessionId;
    }

    public String sessionId() {
        return sessionId;
    }

    public String patientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId == null ? "" : patientId;
    }

    public LongTermMemory longTerm() {
        return longTerm;
    }

    public void setLongTerm(LongTermMemory longTerm) {
        this.longTerm = longTerm == null ? LongTermMemory.empty() : longTerm;
        this.preferenceEpoch = this.longTerm.preferenceEpoch();
    }

    public boolean hasLongTerm(String version) {
        return longTerm != null
                && !longTerm.version().isBlank()
                && longTerm.version().equals(version == null ? "" : version);
    }

    /** 兼容旧调用：病情过滤标签。 */
    public List<String> conditionsSnapshot() {
        return longTerm.conditions();
    }

    public List<Suggestion> currentDishes() {
        return currentDishes;
    }

    public List<DishSlot> dishSlots() {
        return dishSlots;
    }

    public void setCurrentDishes(List<Suggestion> dishes) {
        List<Suggestion> unique = uniqueById(dishes);
        this.currentDishes = unique;
        List<DishSlot> slots = new ArrayList<>();
        for (Suggestion dish : unique) {
            slots.add(DishSlot.valid(dish));
        }
        this.dishSlots = List.copyOf(slots);
        revision++;
    }

    public void setDishSlots(List<DishSlot> slots) {
        this.dishSlots = slots == null ? List.of() : List.copyOf(slots);
        List<Suggestion> visible = new ArrayList<>();
        for (DishSlot slot : this.dishSlots) {
            if (slot != null && slot.dish() != null && slot.countable()) {
                visible.add(slot.dish());
            }
        }
        this.currentDishes = uniqueById(visible);
        revision++;
    }

    public void rememberExcludedDishId(String dishId) {
        if (dishId != null && !dishId.isBlank() && !excludedDishIds.contains(dishId)) {
            excludedDishIds.add(dishId.trim());
        }
    }

    public List<String> excludedDishIds() {
        return List.copyOf(excludedDishIds);
    }

    private static List<Suggestion> uniqueById(List<Suggestion> dishes) {
        if (dishes == null || dishes.isEmpty()) {
            return List.of();
        }
        Set<String> seen = new LinkedHashSet<>();
        List<Suggestion> unique = new ArrayList<>();
        for (Suggestion dish : dishes) {
            if (dish == null || dish.id() == null || dish.id().isBlank()) {
                continue;
            }
            if (seen.add(dish.id())) {
                unique.add(dish);
            }
        }
        return List.copyOf(unique);
    }

    public List<String> missing() {
        return List.copyOf(missing);
    }

    public void addMissing(String food) {
        if (food != null && !food.isBlank() && !missing.contains(food.trim())) {
            missing.add(food.trim());
        }
    }

    public List<String> foodIds() {
        return List.copyOf(foodIds);
    }

    public void setFoodIds(List<String> ids) {
        foodIds.clear();
        if (ids != null) {
            foodIds.addAll(ids);
        }
    }

    public List<FoodCorrection> corrections() {
        return List.copyOf(corrections);
    }

    public Optional<String> canonicalOf(String raw) {
        if (raw == null || raw.isBlank()) {
            return Optional.empty();
        }
        String token = raw.trim();
        for (FoodCorrection correction : corrections) {
            if (correction.raw().equals(token)) {
                return Optional.of(correction.canonical());
            }
        }
        return Optional.empty();
    }

    public void rememberCorrection(String raw, String canonical) {
        FoodCorrection next = new FoodCorrection(raw, canonical);
        if (!next.usable()) {
            return;
        }
        corrections.removeIf(item -> item.raw().equals(next.raw()));
        corrections.add(next);
    }

    public String turnHints() {
        return turnHints;
    }

    public void setTurnHints(String turnHints) {
        this.turnHints = turnHints == null ? "" : turnHints.trim();
    }

    public List<String> turnAbsoluteAvoidFoods() {
        return turnAbsoluteAvoidFoods;
    }

    public List<String> turnAvoidFoods() {
        return turnAvoidFoods;
    }

    /** 每回合开始清空；再由规则/理解重新注入。 */
    public void clearTurnConstraints() {
        this.turnAbsoluteAvoidFoods = List.of();
        this.turnAvoidFoods = List.of();
    }

    public void setTurnConstraints(List<String> absoluteAvoidFoods, List<String> avoidFoods) {
        this.turnAbsoluteAvoidFoods = absoluteAvoidFoods == null ? List.of() : List.copyOf(absoluteAvoidFoods);
        this.turnAvoidFoods = avoidFoods == null ? List.of() : List.copyOf(avoidFoods);
    }

    public Profile profile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public int revision() {
        return revision;
    }

    public long preferenceEpoch() {
        return preferenceEpoch;
    }

    public void setPreferenceEpoch(long preferenceEpoch) {
        this.preferenceEpoch = preferenceEpoch;
    }

    /** 会话级 owner：有患者用患者，否则用 session: 前缀。 */
    public String memoryOwnerId() {
        if (patientId != null && !patientId.isBlank()) {
            return patientId.trim();
        }
        return "session:" + sessionId;
    }

    public DialoguePhase phase() {
        return phase == null ? DialoguePhase.IDLE : phase;
    }

    public void setPhase(DialoguePhase phase) {
        this.phase = phase == null ? DialoguePhase.IDLE : phase;
    }

    public String lastFocusedDishName() {
        return lastFocusedDishName;
    }

    public void setLastFocusedDishName(String name) {
        this.lastFocusedDishName = name == null ? "" : name.trim();
    }

    public String lastEmptyReason() {
        return lastEmptyReason;
    }

    public void setLastEmptyReason(String reason) {
        this.lastEmptyReason = reason == null ? "" : reason.trim();
    }

    public List<String> guideActions() {
        return guideActions;
    }

    public void setGuideActions(List<String> actions) {
        this.guideActions = actions == null ? List.of() : List.copyOf(actions);
    }

    public void clearEmptyGuide() {
        this.lastEmptyReason = "";
        this.guideActions = List.of();
    }
}
