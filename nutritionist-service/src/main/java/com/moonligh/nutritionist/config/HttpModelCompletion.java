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
import com.moonligh.nutritionist.domain.recognition.TwoModelChain;
import com.moonligh.nutritionist.domain.recognition.TwoModelChain.Outcome;
import com.moonligh.consult.framework.vector.VectorStore;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;

/**
 * 主模型超时会重试一次，还超时就调用兜底模型。
 * 两个都没有返回时，推荐回合改用食材规则或一句提示。
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
        String fallbackKey = firstText(properties.fallbackApiKey(), properties.apiKey());
        if (blank(properties.apiKey()) && blank(fallbackKey)) {
            return prompt -> Optional.empty();
        }
        Semaphore permits = new Semaphore(MODEL_PERMITS);
        TwoModelChain.Call primary = caller(
                properties, permits, properties.baseUrl(), properties.apiKey(), properties.modelName());
        TwoModelChain.Call fallback = blank(properties.fallbackModelName())
                ? null
                : caller(properties, permits, firstText(properties.fallbackBaseUrl(), properties.baseUrl()),
                        fallbackKey, properties.fallbackModelName());
        return new TwoModelChain(primary, fallback);
    }

    /** 向量化走公共模块。没配密钥或向量库连不上时返回空，关键词检索仍可用。 */
    @Bean
    public RecipeVectorizer.TextEmbedding textEmbedding(VectorStore vectors) {
        return vectors::embed;
    }

    /** 一次 HTTP 调用。读超时算超时，其它错误算失败，由 TwoModelChain 决定要不要换模型。 */
    private static TwoModelChain.Call caller(
            ModelProperties properties, Semaphore permits, String baseUrl, String apiKey, String modelName) {
        if (blank(apiKey)) {
            return prompt -> Outcome.failed();
        }
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(Duration.ofSeconds(1));
        factory.setReadTimeout(Duration.ofMillis(properties.timeoutMs()));
        RestClient client = RestClient.builder().requestFactory(factory).baseUrl(baseUrl).build();
        return prompt -> {
            try {
                if (!permits.tryAcquire(properties.acquireWaitMs(), TimeUnit.MILLISECONDS)) {
                    return Outcome.timeout();
                }
            } catch (InterruptedException error) {
                Thread.currentThread().interrupt();
                return Outcome.timeout();
            }
            try {
                ModelChat.ChatRequest request = new ModelChat.ChatRequest(
                        modelName, List.of(new ModelChat.ChatMessage("user", prompt)));
                ModelChat.ChatResponse body = client.post()
                        .uri("/chat/completions")
                        .header("Authorization", "Bearer " + apiKey)
                        .body(request)
                        .retrieve()
                        .body(ModelChat.ChatResponse.class);
                String text = body == null ? "" : body.text();
                return blank(text) ? Outcome.failed() : Outcome.text(text);
            } catch (RuntimeException error) {
                return timedOut(error) ? Outcome.timeout() : Outcome.failed();
            } finally {
                permits.release();
            }
        };
    }

    private static boolean timedOut(Throwable error) {
        Throwable current = error;
        while (current != null) {
            if (current instanceof java.net.SocketTimeoutException || current.getClass().getSimpleName().contains("Timeout")) {
                return true;
            }
            current = current.getCause();
        }
        return false;
    }

    private static boolean blank(String value) {
        return value == null || value.isBlank();
    }

    private static String firstText(String preferred, String fallback) {
        return blank(preferred) ? fallback : preferred;
    }

    public static class ModelProperties {
        private String apiKey = "";
        private String baseUrl = "https://api.deepseek.com";
        private String modelName = "deepseek-v4-pro";
        private int timeoutMs = 2000;
        private int acquireWaitMs = 200;
        /** 兜底模型。名称为空表示还没接，超时重试后直接走食材规则。密钥为空则沿用主模型。 */
        private String fallbackModelName = "";
        private String fallbackBaseUrl = "";
        private String fallbackApiKey = "";

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

        public String fallbackModelName() {
            return fallbackModelName;
        }

        public void setFallbackModelName(String fallbackModelName) {
            this.fallbackModelName = fallbackModelName;
        }

        public String fallbackBaseUrl() {
            return fallbackBaseUrl;
        }

        public void setFallbackBaseUrl(String fallbackBaseUrl) {
            this.fallbackBaseUrl = fallbackBaseUrl;
        }

        public String fallbackApiKey() {
            return fallbackApiKey;
        }

        public void setFallbackApiKey(String fallbackApiKey) {
            this.fallbackApiKey = fallbackApiKey;
        }
    }
}
