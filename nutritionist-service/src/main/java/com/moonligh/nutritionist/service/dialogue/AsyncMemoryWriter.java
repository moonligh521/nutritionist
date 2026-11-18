package com.moonligh.nutritionist.service.dialogue;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.moonligh.consult.framework.observability.AgentSpan;
import com.moonligh.consult.framework.observability.AgentTrace;
import com.moonligh.nutritionist.domain.dialogue.AppliedMemoryWrite;
import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.observability.NutritionTraceNames;

/**
 * 记忆模型抽取异步写路径。失败不影响问餐同步链。
 */
@Component
public class AsyncMemoryWriter {

    private static final Logger log = LoggerFactory.getLogger(AsyncMemoryWriter.class);

    private final MemoryExtractor extractor;
    private final MemoryWriteValidator validator;
    private final PreferenceStore preferences;
    private final AllergySuspectStore allergySuspects;
    private final MemoryMetrics metrics;
    private final AgentTrace agentTrace;

    @Autowired
    public AsyncMemoryWriter(
            MemoryExtractor extractor,
            MemoryWriteValidator validator,
            PreferenceStore preferences,
            AllergySuspectStore allergySuspects,
            ObjectProvider<MemoryMetrics> metrics,
            ObjectProvider<AgentTrace> agentTrace) {
        this.extractor = extractor;
        this.validator = validator == null ? new MemoryWriteValidator() : validator;
        this.preferences = preferences;
        this.allergySuspects = allergySuspects == null ? new AllergySuspectStore() : allergySuspects;
        this.metrics = metrics == null ? new MemoryMetrics() : metrics.getIfAvailable(MemoryMetrics::new);
        this.agentTrace = agentTrace == null ? AgentTrace.NOOP : agentTrace.getIfAvailable(() -> AgentTrace.NOOP);
    }

    public AsyncMemoryWriter(
            MemoryExtractor extractor,
            PreferenceStore preferences,
            AllergySuspectStore allergySuspects) {
        this(extractor, new MemoryWriteValidator(), preferences, allergySuspects, null, null);
    }

    /** 投递后立即返回；调用方不得 join。 */
    public void submit(String ownerId, String text) {
        String owner = ownerId == null ? "" : ownerId;
        String utter = text == null ? "" : text;
        if (owner.isBlank() || utter.isBlank()) {
            return;
        }
        Thread.startVirtualThread(() -> writeQuietly(owner, utter));
    }

    void writeQuietly(String ownerId, String text) {
        try {
            metrics.markExtraction();
            MemoryExtraction extraction;
            try (AgentSpan extract = agentTrace.span(NutritionTraceNames.MEMORY_EXTRACT)) {
                extraction = validator.validate(extractor.extract(text));
                extract.attr("async", true)
                        .attr("event_count", extraction.events().size())
                        .attr("query_count", extraction.queries().size());
            }
            if (!extraction.events().isEmpty() && !alreadyProjected(ownerId, extraction)) {
                try (AgentSpan commit = agentTrace.span(NutritionTraceNames.MEMORY_COMMIT)) {
                    AppliedMemoryWrite write = preferences.commit(ownerId, extraction);
                    commit.attr("async", true).attr("committed", write.committed());
                    if (write.committed()) {
                        metrics.markCommit();
                    }
                }
            }
            if (!extraction.allergySuspects().isEmpty()) {
                allergySuspects.addAll(ownerId, extraction.allergySuspects(), text);
            }
        } catch (RuntimeException error) {
            metrics.markWriteFail();
            log.warn("async memory write skipped owner={}: {}", ownerId, error.toString());
        }
    }

    /** 现行投影已覆盖相同主体+极性+强度时跳过旁路重复写，避免无意义 epoch 膨胀。 */
    private boolean alreadyProjected(String ownerId, MemoryExtraction extraction) {
        if (preferences == null || extraction == null || extraction.events().isEmpty()) {
            return false;
        }
        var snap = preferences.snapshot(ownerId);
        if (snap.current().isEmpty()) {
            return false;
        }
        for (var event : extraction.events()) {
            if (event == null || !event.usable()) {
                continue;
            }
            boolean hit = snap.current().stream().anyMatch(item ->
                    item.subject().equals(event.subject())
                            && item.subjectType() == event.subjectType()
                            && item.polarity() == event.polarity()
                            && item.strength() == event.strength());
            if (!hit) {
                return false;
            }
        }
        return true;
    }
}
