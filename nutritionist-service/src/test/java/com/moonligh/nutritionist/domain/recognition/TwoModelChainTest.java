package com.moonligh.nutritionist.domain.recognition;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.recognition.TwoModelChain.Outcome;

class TwoModelChainTest {

    @Test
    void retriesPrimaryOnceAfterTimeout() {
        List<String> called = new ArrayList<>();
        TwoModelChain chain = new TwoModelChain(prompt -> {
            called.add("primary");
            return called.size() == 1 ? Outcome.timeout() : Outcome.text("主模型");
        }, prompt -> {
            called.add("fallback");
            return Outcome.text("兜底");
        });

        assertEquals(Optional.of("主模型"), chain.complete("说明"));
        assertEquals(List.of("primary", "primary"), called);
    }

    @Test
    void usesFallbackModelAfterSecondTimeout() {
        List<String> called = new ArrayList<>();
        TwoModelChain chain = new TwoModelChain(prompt -> {
            called.add("primary");
            return Outcome.timeout();
        }, prompt -> {
            called.add("fallback");
            return Outcome.text("兜底模型");
        });

        assertEquals(Optional.of("兜底模型"), chain.complete("说明"));
        assertEquals(List.of("primary", "primary", "fallback"), called);
    }

    @Test
    void returnsEmptyWhenFallbackAlsoTimesOut() {
        TwoModelChain chain = new TwoModelChain(prompt -> Outcome.timeout(), prompt -> Outcome.timeout());

        assertTrue(chain.complete("说明").isEmpty());
    }

    @Test
    void zeroTimeoutRetriesSkipsPrimaryRetry() {
        List<String> called = new ArrayList<>();
        TwoModelChain chain = new TwoModelChain(prompt -> {
            called.add("primary");
            return Outcome.timeout();
        }, null, 0);

        assertTrue(chain.complete("说明").isEmpty());
        assertEquals(List.of("primary"), called);
    }
}
