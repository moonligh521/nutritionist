package com.moonligh.nutritionist.domain.dialogue;

import java.util.List;

/**
 * 本轮语义理解产出的口头约束；与长期 {@link LongTermMemory} 并集用于过滤，不代替权威落库。
 */
public record TurnConstraints(
        List<String> avoidFoods,
        List<String> absoluteAvoidFoods,
        String cuisine,
        String kind,
        List<String> preferTags,
        List<String> turnHints) {

    public static TurnConstraints empty() {
        return new TurnConstraints(List.of(), List.of(), "", "", List.of(), List.of());
    }

    public TurnConstraints {
        avoidFoods = avoidFoods == null ? List.of() : List.copyOf(avoidFoods);
        absoluteAvoidFoods = absoluteAvoidFoods == null ? List.of() : List.copyOf(absoluteAvoidFoods);
        cuisine = cuisine == null ? "" : cuisine.trim();
        kind = kind == null ? "" : kind.trim();
        preferTags = preferTags == null ? List.of() : List.copyOf(preferTags);
        turnHints = turnHints == null ? List.of() : List.copyOf(turnHints);
    }

    public boolean isEmpty() {
        return avoidFoods.isEmpty()
                && absoluteAvoidFoods.isEmpty()
                && cuisine.isBlank()
                && kind.isBlank()
                && preferTags.isEmpty()
                && turnHints.isEmpty();
    }
}
