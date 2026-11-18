package com.moonligh.nutritionist.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.moonligh.consult.framework.observability.AgentTrace;

/**
 * 兜底：platform-observability 未装上 OTel 时仍提供 NOOP，业务不判空。
 * 正常环境由 ObservabilityAutoConfiguration 装配 OtelAgentTrace（与挂号同 Langfuse）。
 */
@Configuration
public class NutritionObservabilityConfiguration {

    @Bean
    @ConditionalOnMissingBean(AgentTrace.class)
    public AgentTrace agentTraceFallback() {
        return AgentTrace.NOOP;
    }
}
