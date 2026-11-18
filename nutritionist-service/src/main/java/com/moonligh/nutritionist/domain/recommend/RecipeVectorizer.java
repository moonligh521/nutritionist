package com.moonligh.nutritionist.domain.recommend;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/** 把填好的表变成向量。未发布的菜只保存文本，不进入“能做的三道”。 */
public final class RecipeVectorizer {

    private RecipeVectorizer() {
    }

    public record Stored(
            String id,
            String name,
            String version,
            String document,
            String embeddingJson,
            boolean published,
            String kind,
            String cuisine,
            String preferTags,
            String suitable,
            String unsuitable) {
    }

    public record Report(int vectorized, int textOnly, int pending, List<String> pendingNames) {
    }

    public static Report store(
            String csv,
            Set<String> publishedIds,
            TextEmbedding embedding,
            java.util.function.Consumer<Stored> save) {
        List<RecipeSheet.Row> rows = RecipeSheet.parse(csv);
        int vectorized = 0;
        int textOnly = 0;
        int pending = 0;
        List<String> pendingNames = new ArrayList<>();
        for (RecipeSheet.Row row : rows) {
            boolean published = publishedIds != null && publishedIds.contains(row.id());
            float[] vector = embedding == null ? null : embedding.embed(row.document());
            String json = toJson(vector);
            if (json == null) {
                textOnly++;
            } else {
                vectorized++;
            }
            if (!published) {
                pending++;
                pendingNames.add(row.name());
            }
            save.accept(new Stored(
                    row.id(),
                    row.name(),
                    "1",
                    row.document(),
                    json,
                    published,
                    row.kind(),
                    row.cuisine(),
                    row.tagsNormalized(),
                    row.suitable(),
                    row.unsuitable()));
        }
        return new Report(vectorized, textOnly, pending, List.copyOf(pendingNames));
    }

    public static String toJson(float[] vector) {
        if (vector == null || vector.length == 0) {
            return null;
        }
        StringBuilder json = new StringBuilder("[");
        for (int index = 0; index < vector.length; index++) {
            if (index > 0) {
                json.append(',');
            }
            json.append(vector[index]);
        }
        json.append(']');
        return json.toString();
    }

    public static float[] fromJson(String json) {
        if (json == null || json.isBlank()) {
            return null;
        }
        String body = json.trim();
        if (body.startsWith("[")) {
            body = body.substring(1);
        }
        if (body.endsWith("]")) {
            body = body.substring(0, body.length() - 1);
        }
        if (body.isBlank()) {
            return null;
        }
        String[] parts = body.split(",");
        float[] vector = new float[parts.length];
        for (int index = 0; index < parts.length; index++) {
            vector[index] = Float.parseFloat(parts[index].trim());
        }
        return vector;
    }

    /** 一行文本变成一个向量。没有密钥或调用失败时返回 null，表仍可按关键词查找。 */
    public interface TextEmbedding {
        float[] embed(String text);
    }
}
