package com.moonligh.nutritionist.domain.dialogue;

import java.util.List;

/** MemoryExtractor 一轮抽取结果。 */
public record MemoryExtraction(
        List<MemoryEvent> events,
        List<MemoryQuery> queries,
        List<String> turnOnlyHints,
        List<String> allergySuspects,
        String needsDisambiguation,
        String eventId) {

    public MemoryExtraction {
        events = events == null ? List.of() : List.copyOf(events);
        queries = queries == null ? List.of() : List.copyOf(queries);
        turnOnlyHints = turnOnlyHints == null ? List.of() : List.copyOf(turnOnlyHints);
        allergySuspects = allergySuspects == null ? List.of() : List.copyOf(allergySuspects);
        needsDisambiguation = needsDisambiguation == null ? "" : needsDisambiguation.trim();
        eventId = eventId == null ? "" : eventId.trim();
    }

    public static MemoryExtraction empty() {
        return new MemoryExtraction(List.of(), List.of(), List.of(), List.of(), "", "");
    }

    public boolean hasWork() {
        return !events.isEmpty() || !queries.isEmpty() || !turnOnlyHints.isEmpty();
    }
}
