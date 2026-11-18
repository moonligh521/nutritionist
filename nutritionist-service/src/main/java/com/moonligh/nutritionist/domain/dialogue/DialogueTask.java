package com.moonligh.nutritionist.domain.dialogue;

import java.util.List;

/** 单条规划任务。槽位按类型选用，未用字段为空。 */
public record DialogueTask(
        TaskType type,
        List<String> rawFoods,
        String dishHint,
        String kind,
        String missingFood,
        String fromFood,
        String toFood,
        String topic,
        List<ConfirmCandidate> confirmCandidates) {

    public DialogueTask(TaskType type) {
        this(type, List.of(), "", "", "", "", "", "", List.of());
    }

    public static DialogueTask greeting() {
        return new DialogueTask(TaskType.GREETING);
    }

    public static DialogueTask outOfScope(String topic) {
        return new DialogueTask(TaskType.OUT_OF_SCOPE, List.of(), "", "", "", "", "", topic == null ? "" : topic, List.of());
    }

    public static DialogueTask recommend(List<String> rawFoods) {
        return new DialogueTask(
                TaskType.RECOMMEND,
                rawFoods == null ? List.of() : List.copyOf(rawFoods),
                "",
                "",
                "",
                "",
                "",
                "",
                List.of());
    }

    public static DialogueTask replaceOne(String dishHint) {
        return new DialogueTask(TaskType.REPLACE_ONE, List.of(), dishHint == null ? "" : dishHint, "", "", "", "", "", List.of());
    }

    public static DialogueTask addKind(String kind) {
        return new DialogueTask(TaskType.ADD_KIND, List.of(), "", kind == null ? "" : kind, "", "", "", "", List.of());
    }

    public static DialogueTask missing(String food) {
        return new DialogueTask(TaskType.MISSING, List.of(), "", "", food == null ? "" : food, "", "", "", List.of());
    }

    public static DialogueTask substitute(String from, String to) {
        return new DialogueTask(
                TaskType.SUBSTITUTE, List.of(), "", "", "", from == null ? "" : from, to == null ? "" : to, "", List.of());
    }

    public static DialogueTask confirmFoods(List<ConfirmCandidate> candidates) {
        return new DialogueTask(
                TaskType.CONFIRM_FOODS, List.of(), "", "", "", "", "", "", candidates == null ? List.of() : List.copyOf(candidates));
    }

    public record ConfirmCandidate(String raw, List<String> options) {
    }
}
