package com.moonligh.nutritionist.config;

import java.time.Duration;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestClient;

import com.moonligh.nutritionist.domain.recognition.ModelChat;
import com.moonligh.nutritionist.domain.recognition.ModelCompletion;

/**
 * 模型调用有 16 路并发和超时。没配密钥、排队超时或调用失败时返回空，识别退回规则草稿。
 */
@Configuration
public class HttpModelCompletion {

    public static final int MODEL_PERMITS = 16;

    @Bean
    @ConfigurationProperties(prefix = "model")
    public ModelProperties modelProperties() {
        return new ModelProperties();
    }

    @Bean
    public ModelCompletion modelCompletion(ModelProperties properties) {
        if (properties.apiKey() == null || properties.apiKey().isBlank()) {
            return prompt -> Optional.empty();
        }
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(Duration.ofSeconds(1));
        factory.setReadTimeout(Duration.ofMillis(properties.timeoutMs()));
        RestClient client = RestClient.builder().requestFactory(factory).baseUrl(properties.baseUrl()).build();
        Semaphore permits = new Semaphore(MODEL_PERMITS);
        return prompt -> {
            try {
                if (!permits.tryAcquire(properties.acquireWaitMs(), TimeUnit.MILLISECONDS)) {
                    return Optional.empty();
                }
            } catch (InterruptedException error) {
                Thread.currentThread().interrupt();
                return Optional.empty();
            }
            try {
                ModelChat.ChatRequest request = new ModelChat.ChatRequest(
                        properties.modelName(),
                        List.of(new ModelChat.ChatMessage("user", prompt)));
                ModelChat.ChatResponse body = client.post()
                        .uri("/chat/completions")
                        .header("Authorization", "Bearer " + properties.apiKey())
                        .body(request)
                        .retrieve()
                        .body(ModelChat.ChatResponse.class);
                return Optional.ofNullable(body).map(ModelChat.ChatResponse::text);
            } catch (RuntimeException error) {
                return Optional.empty();
            } finally {
                permits.release();
            }
        };
    }

    public static class ModelProperties {
        private String apiKey = "";
        private String baseUrl = "https://api.deepseek.com";
        private String modelName = "deepseek-v4-flash";
        private int timeoutMs = 2000;
        private int acquireWaitMs = 200;

        public String apiKey() {
            return apiKey;
        }

        public void setApiKey(String apiKey) {
            this.apiKey = apiKey;
        }

        public String baseUrl() {
            return baseUrl;
        }

        public void setBaseUrl(String baseUrl) {
            this.baseUrl = baseUrl;
        }

        public String modelName() {
            return modelName;
        }

        public void setModelName(String modelName) {
            this.modelName = modelName;
        }

        public int timeoutMs() {
            return timeoutMs;
        }

        public void setTimeoutMs(int timeoutMs) {
            this.timeoutMs = timeoutMs;
        }

        public int acquireWaitMs() {
            return acquireWaitMs;
        }

        public void setAcquireWaitMs(int acquireWaitMs) {
            this.acquireWaitMs = acquireWaitMs;
        }
    }
}
