package com.moonligh.nutritionist.domain.recommend;

import java.util.ArrayList;
import java.util.List;

/** 词项出现次数表（BM25 用），用对象列表代替裸 Map。 */
public final class TokenFrequency {

    private final List<Count> counts = new ArrayList<>();

    public void increment(String token) {
        if (token == null || token.isBlank()) {
            return;
        }
        for (int index = 0; index < counts.size(); index++) {
            Count current = counts.get(index);
            if (current.token().equals(token)) {
                counts.set(index, new Count(token, current.value() + 1));
                return;
            }
        }
        counts.add(new Count(token, 1));
    }

    public void incrementAll(Iterable<String> tokens) {
        if (tokens == null) {
            return;
        }
        for (String token : tokens) {
            increment(token);
        }
    }

    public int of(String token) {
        if (token == null) {
            return 0;
        }
        for (Count count : counts) {
            if (count.token().equals(token)) {
                return count.value();
            }
        }
        return 0;
    }

    public record Count(String token, int value) {
    }
}
