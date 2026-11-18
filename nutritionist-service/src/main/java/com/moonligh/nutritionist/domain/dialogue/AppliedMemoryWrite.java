package com.moonligh.nutritionist.domain.dialogue;

import java.util.List;

/** 本轮成功写入偏好后的回执（提交后才可给推荐用）。 */
public record AppliedMemoryWrite(
        List<MemoryEvent> appliedEvents,
        long preferenceEpoch,
        boolean committed) {

    public AppliedMemoryWrite {
        appliedEvents = appliedEvents == null ? List.of() : List.copyOf(appliedEvents);
    }

    public static AppliedMemoryWrite none() {
        return new AppliedMemoryWrite(List.of(), 0L, false);
    }
}
