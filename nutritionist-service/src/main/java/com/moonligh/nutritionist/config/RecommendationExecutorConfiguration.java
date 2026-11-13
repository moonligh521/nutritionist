package com.moonligh.nutritionist.config;

import java.util.concurrent.Executor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.task.SimpleAsyncTaskExecutor;

@Configuration
public class RecommendationExecutorConfiguration {

    @Bean("recommendationExecutor")
    Executor recommendationExecutor() {
        SimpleAsyncTaskExecutor executor = new SimpleAsyncTaskExecutor("recommendation-");
        executor.setVirtualThreads(true);
        executor.setConcurrencyLimit(32);
        executor.setTaskTerminationTimeout(5_000);
        return executor;
    }
}
