package com.moonligh.nutritionist.domain.dialogue;

/** 会话规划阶段：门禁用，不替代 TaskType。 */
public enum DialoguePhase {
    IDLE,
    CONFIRMING,
    RECOMMENDED,
    ADJUSTING,
    EMPTY_GUIDE,
    BLOCKED;

    public static DialoguePhase parse(String raw) {
        if (raw == null || raw.isBlank()) {
            return IDLE;
        }
        try {
            return DialoguePhase.valueOf(raw.trim().toUpperCase());
        } catch (Exception ignored) {
            return IDLE;
        }
    }
}
