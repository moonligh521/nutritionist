package com.moonligh.nutritionist.domain.recognition;

import java.util.List;

/**
 * 模型接口的请求和回复。
 * 每个字段都有名字，阅读代码时不用猜 Map 里的 key。
 */
public final class ModelChat {

    private ModelChat() {
    }

    /** 发给模型的一句内容。 */
    public record ChatMessage(
            /** 角色。用户输入为 user。 */
            String role,
            /** 内容。 */
            String content) {
    }

    /** 一次模型请求。 */
    public record ChatRequest(
            /** 模型标识。 */
            String model,
            /** 消息序列。 */
            List<ChatMessage> messages) {
    }

    /** 模型返回的一条候选回答。 */
    public record ChatChoice(
            /** 候选消息。 */
            ChatMessage message) {
    }

    /** 模型的完整回复。业务只取第一条候选。 */
    public record ChatResponse(
            /** 候选列表。 */
            List<ChatChoice> choices) {

        public String text() {
            if (choices == null || choices.isEmpty() || choices.getFirst().message() == null) {
                return null;
            }
            return choices.getFirst().message().content();
        }
    }
}
