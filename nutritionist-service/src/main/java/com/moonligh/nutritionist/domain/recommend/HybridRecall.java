package com.moonligh.nutritionist.domain.recommend;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Dish;

/**
 * 关键词和向量各排一队，再用 RRF 合成最多 30 道候选。
 * 这里只缩小范围。主料齐不齐仍交给后面的规则分。
 */
public final class HybridRecall {

    /** RRF 常用常数。名次越靠后，加分越小。 */
    public static final int RRF_K = 60;
    public static final int CANDIDATE_LIMIT = 30;

    private HybridRecall() {
    }

    public record Chunk(String id, String text, float[] vector) {
    }

    public static List<String> recall(String query, List<Chunk> chunks, float[] queryVector) {
        if (query == null || query.isBlank() || chunks == null || chunks.isEmpty()) {
            return List.of();
        }
        List<String> byWord = bm25(query, chunks);
        List<String> byVector = cosine(queryVector, chunks);
        if (byWord.isEmpty() && byVector.isEmpty()) {
            return List.of();
        }
        List<List<String>> rankings = new ArrayList<>();
        if (!byWord.isEmpty()) {
            rankings.add(byWord);
        }
        if (!byVector.isEmpty()) {
            rankings.add(byVector);
        }
        return rrf(rankings, CANDIDATE_LIMIT);
    }

    /** 关键词名次和向量库名次合成。某一边为空时，就用另一边。 */
    public static List<String> merge(List<String> byWord, List<String> byVector) {
        List<List<String>> rankings = new ArrayList<>();
        if (byWord != null && !byWord.isEmpty()) {
            rankings.add(byWord);
        }
        if (byVector != null && !byVector.isEmpty()) {
            rankings.add(byVector);
        }
        if (rankings.isEmpty()) {
            return List.of();
        }
        return rrf(rankings, CANDIDATE_LIMIT);
    }

    /** 召回为空或对不上菜号时，退回全部已发布菜，再做主料门槛。 */
    public static List<Dish> pool(List<Dish> dishes, List<String> recalledIds) {
        if (dishes == null || dishes.isEmpty() || recalledIds == null || recalledIds.isEmpty()) {
            return dishes == null ? List.of() : dishes;
        }
        Set<String> wanted = new LinkedHashSet<>(recalledIds);
        List<Dish> kept = dishes.stream().filter(dish -> wanted.contains(dish.id())).toList();
        return kept.isEmpty() ? dishes : kept;
    }

    static List<String> rrf(List<List<String>> rankings, int limit) {
        Map<String, Double> scores = new HashMap<>();
        for (List<String> ranking : rankings) {
            for (int index = 0; index < ranking.size(); index++) {
                String id = ranking.get(index);
                scores.merge(id, 1.0 / (RRF_K + index + 1), Double::sum);
            }
        }
        return scores.entrySet().stream()
                .sorted(Map.Entry.<String, Double>comparingByValue().reversed().thenComparing(Map.Entry::getKey))
                .limit(limit)
                .map(Map.Entry::getKey)
                .toList();
    }

    private static List<String> bm25(String query, List<Chunk> chunks) {
        List<String> queryTokens = ChineseTokens.of(query);
        if (queryTokens.isEmpty()) {
            return List.of();
        }
        List<List<String>> docs = chunks.stream().map(chunk -> ChineseTokens.of(chunk.text())).toList();
        double average = docs.stream().mapToInt(List::size).average().orElse(0);
        if (average == 0) {
            return List.of();
        }
        Map<String, Integer> documentFrequency = new HashMap<>();
        for (List<String> doc : docs) {
            for (String token : new LinkedHashSet<>(doc)) {
                documentFrequency.merge(token, 1, Integer::sum);
            }
        }
        List<Scored> scored = new ArrayList<>();
        int total = docs.size();
        for (int index = 0; index < chunks.size(); index++) {
            double score = bm25Score(queryTokens, docs.get(index), average, documentFrequency, total);
            if (score > 0) {
                scored.add(new Scored(chunks.get(index).id(), score));
            }
        }
        scored.sort(Comparator.comparingDouble(Scored::score).reversed().thenComparing(Scored::id));
        return scored.stream().map(Scored::id).toList();
    }

    private static double bm25Score(
            List<String> queryTokens,
            List<String> doc,
            double average,
            Map<String, Integer> documentFrequency,
            int total) {
        double k1 = 1.2;
        double b = 0.75;
        Map<String, Integer> counts = new HashMap<>();
        for (String token : doc) {
            counts.merge(token, 1, Integer::sum);
        }
        double score = 0;
        for (String token : queryTokens) {
            int count = counts.getOrDefault(token, 0);
            if (count == 0) {
                continue;
            }
            int df = documentFrequency.getOrDefault(token, 0);
            double idf = Math.log(1 + (total - df + 0.5) / (df + 0.5));
            double numerator = count * (k1 + 1);
            double denominator = count + k1 * (1 - b + b * doc.size() / average);
            score += idf * numerator / denominator;
        }
        return score;
    }

    private static List<String> cosine(float[] query, List<Chunk> chunks) {
        if (query == null || query.length == 0) {
            return List.of();
        }
        List<Scored> scored = new ArrayList<>();
        for (Chunk chunk : chunks) {
            double score = cosine(query, chunk.vector());
            if (score > 0) {
                scored.add(new Scored(chunk.id(), score));
            }
        }
        scored.sort(Comparator.comparingDouble(Scored::score).reversed().thenComparing(Scored::id));
        return scored.stream().limit(CANDIDATE_LIMIT).map(Scored::id).toList();
    }

    private static double cosine(float[] left, float[] right) {
        if (left == null || right == null || left.length == 0 || left.length != right.length) {
            return 0;
        }
        double dot = 0;
        double leftNorm = 0;
        double rightNorm = 0;
        for (int index = 0; index < left.length; index++) {
            dot += left[index] * right[index];
            leftNorm += left[index] * left[index];
            rightNorm += right[index] * right[index];
        }
        if (leftNorm == 0 || rightNorm == 0) {
            return 0;
        }
        return dot / (Math.sqrt(leftNorm) * Math.sqrt(rightNorm));
    }

    private record Scored(String id, double score) {
    }
}
