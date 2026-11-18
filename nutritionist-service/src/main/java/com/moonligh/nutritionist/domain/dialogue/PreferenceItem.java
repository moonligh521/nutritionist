package com.moonligh.nutritionist.domain.dialogue;

/** 投影中的一条现行偏好（给推荐/问答用）。 */
public record PreferenceItem(
        String subject,
        SubjectType subjectType,
        PreferencePolarity polarity,
        PreferenceStrength strength,
        PreferenceScope scope,
        String condition) {

    public PreferenceItem(
            String subject,
            SubjectType subjectType,
            PreferencePolarity polarity,
            PreferenceStrength strength,
            PreferenceScope scope) {
        this(subject, subjectType, polarity, strength, scope, "");
    }

    public PreferenceItem {
        subject = subject == null ? "" : subject.trim();
        subjectType = subjectType == null ? SubjectType.FOOD : subjectType;
        polarity = polarity == null ? PreferencePolarity.NEUTRAL : polarity;
        strength = strength == null ? PreferenceStrength.MODERATE : strength;
        scope = scope == null ? PreferenceScope.PERMANENT : scope;
        condition = condition == null ? "" : condition.trim();
    }

    /** CONDITIONAL：仅当本轮 hints 包含条件词时才生效。 */
    public boolean activeForHints(String turnHints) {
        if (scope != PreferenceScope.CONDITIONAL) {
            return true;
        }
        if (condition.isBlank()) {
            return false;
        }
        String hints = turnHints == null ? "" : turnHints;
        return hints.contains(condition);
    }
}
