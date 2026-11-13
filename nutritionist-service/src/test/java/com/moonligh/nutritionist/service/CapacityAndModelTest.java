package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.Duration;
import java.util.Optional;

import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.BusinessException;
import com.moonligh.nutritionist.config.AccountRateLimiter;

class CapacityAndModelTest {

    @Test
    void redisOutageFallsBackToLocalLimit() {
        AccountRateLimiter limiter = new AccountRateLimiter((org.springframework.data.redis.core.StringRedisTemplate) null);
        limiter.acquire("acc", "write", 1);
        assertThrows(BusinessException.class, () -> limiter.acquire("acc", "write", 1));
    }

    @Test
    void slowModelDoesNotBlockRecognition() {
        PantryRecognitionService service = new PantryRecognitionService(prompt -> {
            try {
                Thread.sleep(5_000);
            } catch (InterruptedException error) {
                Thread.currentThread().interrupt();
            }
            return Optional.of("model-text");
        }, Duration.ofMillis(50));

        long started = System.nanoTime();
        var draft = service.recognizeText("pat-1", "半斤鸡肉");
        long elapsedMs = (System.nanoTime() - started) / 1_000_000;

        assertTrue(elapsedMs < 1_000);
        assertEquals("半斤鸡肉", draft.candidates().getFirst().displayName());
    }
}
