package com.moonligh.nutritionist.config;

import java.time.Duration;

import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.moonligh.consult.framework.ErrorCode;
import com.moonligh.consult.framework.redis.ExclusiveGuard;
import com.moonligh.consult.framework.redis.RedissonExclusiveGuard;

@Configuration
public class CapacityConfiguration {

    @Bean
    public ExclusiveGuard nutritionExclusiveGuard(ObjectProvider<RedissonClient> redisson) {
        RedissonClient client = redisson.getIfAvailable();
        if (client == null) {
            return ExclusiveGuard.NONE;
        }
        return new RedissonExclusiveGuard(
                client,
                "nutrition:recommendation:",
                Duration.ofSeconds(30),
                ErrorCode.RECOMMENDATION_IN_PROGRESS,
                "nutrition_exclusive_guard",
                null);
    }
}
