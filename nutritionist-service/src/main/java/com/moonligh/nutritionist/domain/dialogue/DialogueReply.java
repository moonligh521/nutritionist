package com.moonligh.nutritionist.domain.dialogue;

import java.util.List;

import com.moonligh.nutritionist.service.DayMenuService.DayMenu;
import com.moonligh.nutritionist.service.DishRecommendService.Suggestion;
import com.moonligh.nutritionist.service.dialogue.AllergySuspectStore.Suspect;

/** 一轮对话规划执行后的对外结果。 */
public record DialogueReply(
        String sessionId,
        List<String> plan,
        List<Suggestion> dishes,
        List<DialogueTask.ConfirmCandidate> needConfirm,
        List<String> corrections,
        List<String> unrecognized,
        String fallback,
        DayMenu day,
        String explanation,
        List<String> toolCalls,
        LongTermMemory longTerm,
        int revision,
        String memoryAnswer,
        List<MemoryEvent> appliedEvents,
        long preferenceEpoch,
        List<DishSlot> dishSlots,
        List<Suspect> allergySuspects,
        String phase,
        String emptyReason,
        List<String> guideActions,
        int degradeStep,
        String rememberedHint) {

    public DialogueReply {
        plan = plan == null ? List.of() : List.copyOf(plan);
        dishes = dishes == null ? List.of() : List.copyOf(dishes);
        needConfirm = needConfirm == null ? List.of() : List.copyOf(needConfirm);
        corrections = corrections == null ? List.of() : List.copyOf(corrections);
        unrecognized = unrecognized == null ? List.of() : List.copyOf(unrecognized);
        toolCalls = toolCalls == null ? List.of() : List.copyOf(toolCalls);
        appliedEvents = appliedEvents == null ? List.of() : List.copyOf(appliedEvents);
        dishSlots = dishSlots == null ? List.of() : List.copyOf(dishSlots);
        allergySuspects = allergySuspects == null ? List.of() : List.copyOf(allergySuspects);
        guideActions = guideActions == null ? List.of() : List.copyOf(guideActions);
        memoryAnswer = memoryAnswer == null ? "" : memoryAnswer;
        fallback = fallback == null ? "" : fallback;
        explanation = explanation == null ? "" : explanation;
        phase = phase == null ? "" : phase;
        emptyReason = emptyReason == null ? "" : emptyReason;
        rememberedHint = rememberedHint == null ? "" : rememberedHint;
    }

    /** 兼容旧构造（无观测扩展字段）。 */
    public DialogueReply(
            String sessionId,
            List<String> plan,
            List<Suggestion> dishes,
            List<DialogueTask.ConfirmCandidate> needConfirm,
            List<String> corrections,
            List<String> unrecognized,
            String fallback,
            DayMenu day,
            String explanation,
            List<String> toolCalls,
            LongTermMemory longTerm,
            int revision,
            String memoryAnswer,
            List<MemoryEvent> appliedEvents,
            long preferenceEpoch,
            List<DishSlot> dishSlots,
            List<Suspect> allergySuspects) {
        this(
                sessionId,
                plan,
                dishes,
                needConfirm,
                corrections,
                unrecognized,
                fallback,
                day,
                explanation,
                toolCalls,
                longTerm,
                revision,
                memoryAnswer,
                appliedEvents,
                preferenceEpoch,
                dishSlots,
                allergySuspects,
                "",
                "",
                List.of(),
                0,
                "");
    }

    /** 兼容旧字段名。 */
    public List<String> conditionsSnapshot() {
        return longTerm == null ? List.of() : longTerm.conditions();
    }
}
