package com.moonligh.nutritionist.domain.dialogue;

import java.util.ArrayList;
import java.util.List;

/** 某 owner 在某时刻的偏好投影。 */
public record PreferenceSnapshot(
        List<PreferenceItem> current,
        long epoch,
        List<PreferenceFact> history) {

    public PreferenceSnapshot {
        current = current == null ? List.of() : List.copyOf(current);
        history = history == null ? List.of() : List.copyOf(history);
    }

    public static PreferenceSnapshot empty() {
        return new PreferenceSnapshot(List.of(), 0L, List.of());
    }

    public List<String> avoidFoods() {
        return subjects(SubjectType.FOOD, PreferencePolarity.AVOID);
    }

    public List<String> preferLikes() {
        return subjects(SubjectType.FOOD, PreferencePolarity.LIKE);
    }

    public List<String> preferTags() {
        return subjects(SubjectType.TAG, PreferencePolarity.LIKE);
    }

    public List<String> preferCuisines() {
        return subjects(SubjectType.CUISINE, PreferencePolarity.LIKE);
    }

    /** 推荐硬过滤：现行 FOOD + AVOID + ABSOLUTE。 */
    public List<String> absoluteAvoidFoods() {
        List<String> out = new ArrayList<>();
        for (PreferenceItem item : current) {
            if (item.subjectType() == SubjectType.FOOD
                    && item.polarity() == PreferencePolarity.AVOID
                    && item.strength() == PreferenceStrength.ABSOLUTE) {
                out.add(item.subject());
            }
        }
        return List.copyOf(out);
    }

    private List<String> subjects(SubjectType type, PreferencePolarity polarity) {
        List<String> out = new ArrayList<>();
        for (PreferenceItem item : current) {
            if (item.subjectType() == type && item.polarity() == polarity) {
                out.add(item.subject());
            }
        }
        return List.copyOf(out);
    }
}
