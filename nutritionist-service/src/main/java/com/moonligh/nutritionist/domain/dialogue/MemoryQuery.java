package com.moonligh.nutritionist.domain.dialogue;

/** 用户对记忆的查询意图。 */
public record MemoryQuery(MemoryQueryType type, String subject) {

    public MemoryQuery {
        type = type == null ? MemoryQueryType.CURRENT_AVOID : type;
        subject = subject == null ? "" : subject.trim();
    }
}
