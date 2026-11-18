package com.moonligh.nutritionist.domain.dialogue;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 长期记忆快照：从档案装载后拷进会话，本会话复用。
 * 口味字符串列表一律从 {@link #tasteItems} 派生，避免双份数据。
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public record LongTermMemory(
        String version,
        List<String> conditions,
        List<String> allergens,
        List<String> medications,
        boolean measurementStopsPlanning,
        List<PreferenceItem> tasteItems,
        long preferenceEpoch) {

    public static LongTermMemory empty() {
        return new LongTermMemory("", List.of(), List.of(), List.of(), false, List.of(), 0L);
    }

    public LongTermMemory {
        conditions = conditions == null ? List.of() : List.copyOf(conditions);
        allergens = allergens == null ? List.of() : List.copyOf(allergens);
        medications = medications == null ? List.of() : List.copyOf(medications);
        tasteItems = tasteItems == null ? List.of() : List.copyOf(tasteItems);
        version = version == null ? "" : version;
    }

    /** 派生判断，禁止写入 Redis/API JSON（否则会多出 empty 字段导致反序列化失败）。 */
    @JsonIgnore
    public boolean isEmpty() {
        return conditions.isEmpty()
                && allergens.isEmpty()
                && medications.isEmpty()
                && !measurementStopsPlanning
                && tasteItems.isEmpty();
    }

    @JsonIgnore
    public List<String> avoidFoods() {
        return subjects(SubjectType.FOOD, PreferencePolarity.AVOID, false);
    }

    @JsonIgnore
    public List<String> absoluteAvoidFoods() {
        return subjects(SubjectType.FOOD, PreferencePolarity.AVOID, true);
    }

    @JsonIgnore
    public List<String> preferLikes() {
        return subjects(SubjectType.FOOD, PreferencePolarity.LIKE, false);
    }

    @JsonIgnore
    public List<String> preferTags() {
        return subjects(SubjectType.TAG, PreferencePolarity.LIKE, false);
    }

    @JsonIgnore
    public List<String> preferCuisines() {
        return subjects(SubjectType.CUISINE, PreferencePolarity.LIKE, false);
    }

    /** 软降权分：负数降权，正数加分；ABSOLUTE 不在此处理。 */
    public int softScoreDelta(String ingredientName, String turnHints) {
        if (ingredientName == null || ingredientName.isBlank()) {
            return 0;
        }
        int delta = 0;
        for (PreferenceItem item : tasteItems) {
            if (item.subjectType() != SubjectType.FOOD || item.subject().isBlank()) {
                continue;
            }
            if (!item.activeForHints(turnHints)) {
                continue;
            }
            if (!ingredientName.contains(item.subject()) && !item.subject().contains(ingredientName)) {
                continue;
            }
            if (item.polarity() == PreferencePolarity.AVOID && item.strength() != PreferenceStrength.ABSOLUTE) {
                delta -= switch (item.strength()) {
                    case STRONG -> 40;
                    case MODERATE -> 20;
                    case WEAK -> 8;
                    default -> 20;
                };
            } else if (item.polarity() == PreferencePolarity.LIKE) {
                delta += switch (item.strength()) {
                    case STRONG, ABSOLUTE -> 25;
                    case MODERATE -> 15;
                    case WEAK -> 8;
                };
            }
        }
        return delta;
    }

    private List<String> subjects(SubjectType type, PreferencePolarity polarity, boolean absoluteOnly) {
        List<String> out = new ArrayList<>();
        for (PreferenceItem item : tasteItems) {
            if (item.subjectType() != type || item.polarity() != polarity) {
                continue;
            }
            if (absoluteOnly && item.strength() != PreferenceStrength.ABSOLUTE) {
                continue;
            }
            out.add(item.subject());
        }
        return List.copyOf(out);
    }
}
