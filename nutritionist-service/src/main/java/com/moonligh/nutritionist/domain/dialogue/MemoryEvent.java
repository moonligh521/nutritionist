package com.moonligh.nutritionist.domain.dialogue;

import java.time.Instant;

/** 旁路抽取后的一条结构化记忆事件。 */
public record MemoryEvent(
        MemoryOp op,
        String subject,
        SubjectType subjectType,
        PreferencePolarity polarity,
        PreferenceStrength strength,
        PreferenceScope scope,
        Instant validFrom,
        Instant validTo,
        String condition,
        String targetOwner,
        double confidence,
        String evidence) {

    public MemoryEvent {
        op = op == null ? MemoryOp.ASSERT : op;
        subject = subject == null ? "" : subject.trim();
        subjectType = subjectType == null ? SubjectType.FOOD : subjectType;
        polarity = polarity == null ? PreferencePolarity.NEUTRAL : polarity;
        strength = strength == null ? PreferenceStrength.MODERATE : strength;
        scope = scope == null ? PreferenceScope.PERMANENT : scope;
        condition = condition == null ? "" : condition.trim();
        targetOwner = targetOwner == null ? "" : targetOwner.trim();
        evidence = evidence == null ? "" : evidence.trim();
    }

    public static MemoryEvent assertFood(
            PreferencePolarity polarity,
            PreferenceStrength strength,
            String subject,
            String evidence) {
        return new MemoryEvent(
                MemoryOp.ASSERT,
                subject,
                SubjectType.FOOD,
                polarity,
                strength,
                PreferenceScope.PERMANENT,
                null,
                null,
                "",
                "",
                1.0,
                evidence);
    }

    public static MemoryEvent retractFood(String subject, String evidence) {
        return new MemoryEvent(
                MemoryOp.RETRACT,
                subject,
                SubjectType.FOOD,
                PreferencePolarity.NEUTRAL,
                PreferenceStrength.WEAK,
                PreferenceScope.PERMANENT,
                null,
                null,
                "",
                "",
                1.0,
                evidence);
    }

    public boolean usable() {
        return !subject.isBlank() && op != null;
    }
}
