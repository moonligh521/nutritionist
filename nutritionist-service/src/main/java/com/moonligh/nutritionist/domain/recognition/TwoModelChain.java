package com.moonligh.nutritionist.domain.recognition;

import java.util.Optional;

/**
 * 两个模型的调用顺序。
 * 主模型超时就再叫一次。还超时就改叫兜底模型。
 * 兜底模型也超时，返回空，让上层用食材规则或一句提示。
 */
public final class TwoModelChain implements ModelCompletion {

    private final Call primary;
    private final Call fallback;
    private final int timeoutRetries;

    public TwoModelChain(Call primary, Call fallback) {
        this(primary, fallback, 1);
    }

    public TwoModelChain(Call primary, Call fallback, int timeoutRetries) {
        this.primary = primary;
        this.fallback = fallback;
        this.timeoutRetries = Math.max(0, timeoutRetries);
    }

    @Override
    public Optional<String> complete(String prompt) {
        Outcome first = primary.call(prompt);
        if (first.hasText()) {
            return Optional.of(first.text());
        }
        // 只有超时才按配置重试；timeoutRetries=0 时立刻结束或改兜底
        if (!first.timedOut()) {
            return Optional.empty();
        }
        Outcome last = first;
        for (int i = 0; i < timeoutRetries; i++) {
            Outcome retry = primary.call(prompt);
            if (retry.hasText()) {
                return Optional.of(retry.text());
            }
            last = retry;
            if (!retry.timedOut()) {
                return Optional.empty();
            }
        }
        if (!last.timedOut() || fallback == null) {
            return Optional.empty();
        }
        Outcome third = fallback.call(prompt);
        if (third.hasText()) {
            return Optional.of(third.text());
        }
        return Optional.empty();
    }

    /** 一次真实调用。测试里换成假的，不访问网络。 */
    public interface Call {
        Outcome call(String prompt);
    }

    public record Outcome(boolean timedOut, String text) {
        public static Outcome text(String text) {
            return new Outcome(false, text);
        }

        public static Outcome timeout() {
            return new Outcome(true, "");
        }

        public static Outcome failed() {
            return new Outcome(false, "");
        }

        boolean hasText() {
            return text != null && !text.isBlank();
        }
    }
}
