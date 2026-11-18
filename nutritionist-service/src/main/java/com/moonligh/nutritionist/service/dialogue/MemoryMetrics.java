package com.moonligh.nutritionist.service.dialogue;

import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

import org.springframework.stereotype.Component;

/** 记忆链路简易计数，供治理观察与上线看板。 */
@Component
public class MemoryMetrics {

    private final AtomicLong extractions = new AtomicLong();
    private final AtomicLong commits = new AtomicLong();
    private final AtomicLong queries = new AtomicLong();
    private final AtomicLong merges = new AtomicLong();
    private final AtomicLong retracts = new AtomicLong();
    private final AtomicLong autoReplaces = new AtomicLong();
    private final AtomicLong expiries = new AtomicLong();
    private final AtomicLong writeFails = new AtomicLong();
    private final AtomicLong warmups = new AtomicLong();
    private final AtomicReference<String> lastWriteError = new AtomicReference<>("");

    public void markExtraction() {
        extractions.incrementAndGet();
    }

    public void markCommit() {
        commits.incrementAndGet();
    }

    public void markQuery() {
        queries.incrementAndGet();
    }

    public void markMerge() {
        merges.incrementAndGet();
    }

    public void markRetract() {
        retracts.incrementAndGet();
    }

    public void markAutoReplace() {
        autoReplaces.incrementAndGet();
    }

    public void markExpiry(long count) {
        expiries.addAndGet(Math.max(0, count));
    }

    public void markWriteFail() {
        markWriteFail("");
    }

    public void markWriteFail(String reason) {
        writeFails.incrementAndGet();
        if (reason != null && !reason.isBlank()) {
            lastWriteError.set(reason.length() > 500 ? reason.substring(0, 500) : reason);
        }
    }

    public void markWarmup() {
        warmups.incrementAndGet();
    }

    public Snapshot snapshot() {
        return new Snapshot(
                extractions.get(),
                commits.get(),
                queries.get(),
                merges.get(),
                retracts.get(),
                autoReplaces.get(),
                expiries.get(),
                writeFails.get(),
                warmups.get(),
                lastWriteError.get());
    }

    public record Snapshot(
            long extractions,
            long commits,
            long queries,
            long merges,
            long retracts,
            long autoReplaces,
            long expiries,
            long writeFails,
            long warmups,
            String lastWriteError) {
        public Snapshot {
            lastWriteError = lastWriteError == null ? "" : lastWriteError;
        }
    }
}
