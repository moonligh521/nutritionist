package com.moonligh.nutritionist.domain.dialogue;

import java.time.Instant;

/**
 * 一条带时效的偏好事实。validTo == null 表示现行有效。
 */
public record PreferenceFact(
        String factId,
        String ownerId,
        String subject,
        SubjectType subjectType,
        PreferencePolarity polarity,
        PreferenceStrength strength,
        PreferenceScope scope,
        String condition,
        Instant validFrom,
        Instant validTo,
        String source,
        String eventId,
        long version) {

    public PreferenceFact {
        factId = factId == null ? "" : factId;
        ownerId = ownerId == null ? "" : ownerId.trim();
        subject = subject == null ? "" : subject.trim();
        subjectType = subjectType == null ? SubjectType.FOOD : subjectType;
        polarity = polarity == null ? PreferencePolarity.NEUTRAL : polarity;
        strength = strength == null ? PreferenceStrength.MODERATE : strength;
        scope = scope == null ? PreferenceScope.PERMANENT : scope;
        condition = condition == null ? "" : condition.trim();
        source = source == null ? "" : source;
        eventId = eventId == null ? "" : eventId;
    }

    public boolean current() {
        return validTo == null;
    }

    public boolean activeAt(Instant when) {
        Instant at = when == null ? Instant.now() : when;
        if (validFrom != null && validFrom.isAfter(at)) {
            return false;
        }
        return validTo == null || validTo.isAfter(at);
    }

    public PreferenceFact expire(Instant at) {
        return new PreferenceFact(
                factId, ownerId, subject, subjectType, polarity, strength, scope, condition,
                validFrom, at, source, eventId, version);
    }

    public PreferenceItem toItem() {
        return new PreferenceItem(subject, subjectType, polarity, strength, scope, condition);
    }
}
