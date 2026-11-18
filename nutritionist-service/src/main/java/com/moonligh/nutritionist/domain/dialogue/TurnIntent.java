package com.moonligh.nutritionist.domain.dialogue;

import java.util.List;

/** 同步语义理解结果：任务 + 本轮约束 + 澄清 + 可选记忆问答。 */
public record TurnIntent(
        List<DialogueTask> tasks,
        TurnConstraints constraints,
        List<MemoryQuery> memoryQueries,
        List<IntentAmbiguity> ambiguities,
        boolean degraded) {

    public static TurnIntent ofTasks(List<DialogueTask> tasks) {
        return new TurnIntent(tasks, TurnConstraints.empty(), List.of(), List.of(), false);
    }

    public TurnIntent(List<DialogueTask> tasks, TurnConstraints constraints, List<MemoryQuery> memoryQueries) {
        this(tasks, constraints, memoryQueries, List.of(), false);
    }

    public TurnIntent {
        tasks = tasks == null ? List.of() : List.copyOf(tasks);
        constraints = constraints == null ? TurnConstraints.empty() : constraints;
        memoryQueries = memoryQueries == null ? List.of() : List.copyOf(memoryQueries);
        ambiguities = ambiguities == null ? List.of() : List.copyOf(ambiguities);
    }

    public boolean needsClarify() {
        return !ambiguities.isEmpty();
    }

    public TurnIntent withAmbiguities(List<IntentAmbiguity> next) {
        return new TurnIntent(tasks, constraints, memoryQueries, next, degraded);
    }

    public TurnIntent withTasks(List<DialogueTask> next) {
        return new TurnIntent(next, constraints, memoryQueries, ambiguities, degraded);
    }

    public TurnIntent withDegraded(boolean value) {
        return new TurnIntent(tasks, constraints, memoryQueries, ambiguities, value);
    }
}
