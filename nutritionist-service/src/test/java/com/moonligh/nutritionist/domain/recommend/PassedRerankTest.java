package com.moonligh.nutritionist.domain.recommend;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import org.junit.jupiter.api.Test;

class PassedRerankTest {

    @Test
    void keepsRuleOrderWhenRerankTimesOut() {
        List<String> rule = List.of("a", "b", "c");
        List<String> ordered = PassedRerank.withinBudget(rule, () -> {
            try {
                Thread.sleep(80);
            } catch (InterruptedException error) {
                Thread.currentThread().interrupt();
            }
            return List.of("c", "b", "a");
        }, 10);
        assertEquals(rule, ordered);
    }

    @Test
    void appliesRerankWithinBudget() {
        AtomicInteger calls = new AtomicInteger();
        List<String> ordered = PassedRerank.withinBudget(
                List.of("a", "b"),
                () -> {
                    calls.incrementAndGet();
                    return List.of("b", "a");
                },
                500);
        assertEquals(List.of("b", "a"), ordered);
        assertEquals(1, calls.get());
    }
}
