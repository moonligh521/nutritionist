package com.moonligh.nutritionist.domain.recommend;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/** 候选 id 得分板，代替 Map&lt;String, Double&gt;。 */
public final class IdScoreBoard {

    private final List<Score> scores = new ArrayList<>();

    public void add(String id, double delta) {
        if (id == null || id.isBlank()) {
            return;
        }
        for (int index = 0; index < scores.size(); index++) {
            Score current = scores.get(index);
            if (current.id().equals(id)) {
                scores.set(index, new Score(id, current.value() + delta));
                return;
            }
        }
        scores.add(new Score(id, delta));
    }

    public List<String> topIds(int limit) {
        return scores.stream()
                .sorted(Comparator.comparingDouble(Score::value).reversed().thenComparing(Score::id))
                .limit(Math.max(0, limit))
                .map(Score::id)
                .toList();
    }

    public record Score(String id, double value) {
    }
}
