package com.moonligh.nutritionist.service;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.recommend.RecallEmptyReason;

/** 推荐检索进程内指标。 */
@Component
public class RecallMetrics {

    private final AtomicLong success = new AtomicLong();
    private final AtomicLong filterEmpty = new AtomicLong();
    private final AtomicLong annEmpty = new AtomicLong();
    private final AtomicLong fallbackAll = new AtomicLong();
    private final AtomicLong failClosed = new AtomicLong();

    public void mark(RecallEmptyReason reason, boolean hasDishes) {
        if (hasDishes) {
            success.incrementAndGet();
            if (reason == RecallEmptyReason.FALLBACK_ALL_PUBLISHED) {
                fallbackAll.incrementAndGet();
            }
            return;
        }
        if (reason == null) {
            return;
        }
        switch (reason) {
            case SCALAR_EMPTY, NO_PUBLISHED_INTERSECT, NO_FEASIBLE_MAINS -> filterEmpty.incrementAndGet();
            case ANN_EMPTY, EMBED_FAILED -> annEmpty.incrementAndGet();
            case VECTOR_STORE_UNAVAILABLE, FILTER_FAIL_CLOSED -> failClosed.incrementAndGet();
            case FALLBACK_ALL_PUBLISHED -> fallbackAll.incrementAndGet();
            default -> {
            }
        }
    }

    public Snapshot snapshot() {
        return new Snapshot(
                success.get(),
                filterEmpty.get(),
                annEmpty.get(),
                fallbackAll.get(),
                failClosed.get());
    }

    public record Snapshot(
            long success,
            long filterEmpty,
            long annEmpty,
            long fallbackAll,
            long failClosed) {
    }
}
