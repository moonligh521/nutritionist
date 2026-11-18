package com.moonligh.nutritionist.domain.recommend;

import java.util.ArrayList;
import java.util.List;

/** 把菜系、种类、偏好和病情写成向量库的过滤条件。过滤不靠向量相似度。 */
public final class RecipeVectorFilter {

    private RecipeVectorFilter() {
    }

    /** 分号/逗号标签拆成数组元素，供 ARRAY 字段写入。 */
    public static List<String> tags(String raw) {
        if (raw == null || raw.isBlank()) {
            return List.of();
        }
        String normalized = raw.replace('；', ';').replace(';', ',').replace(" ", "");
        List<String> values = new ArrayList<>();
        for (String part : normalized.split(",")) {
            if (!part.isBlank()) {
                values.add(part.trim());
            }
        }
        return List.copyOf(values);
    }

    /**
     * 兼容旧调用：逗号包裹字符串。新写入请用 {@link #tags(String)} + ARRAY。
     * @deprecated 当前 Milvus 不支持 like "%x%"，保留给单测与过渡期。
     */
    @Deprecated
    public static String wrap(String tags) {
        if (tags == null || tags.isBlank()) {
            return ",";
        }
        String normalized = tags.replace('；', ';').replace(';', ',').replace(" ", "");
        return "," + normalized + ",";
    }

    public static String expr(String cuisine, String kind, List<String> preferTags, List<String> conditions) {
        List<String> parts = new ArrayList<>();
        addEquals(parts, "cuisine", cuisine);
        addEquals(parts, "kind", kind);
        if (preferTags != null) {
            for (String tag : preferTags) {
                addContains(parts, "prefer_tags", tag);
            }
        }
        if (conditions != null) {
            for (String condition : conditions) {
                addContains(parts, "suitable", condition);
                addExcludes(parts, "unsuitable", condition);
            }
        }
        return String.join(" and ", parts);
    }

    private static void addEquals(List<String> parts, String field, String value) {
        if (value == null || value.isBlank()) {
            return;
        }
        parts.add(field + " == \"" + escape(value.trim()) + "\"");
    }

    private static void addContains(List<String> parts, String field, String value) {
        if (value == null || value.isBlank()) {
            return;
        }
        parts.add("array_contains(" + field + ", \"" + escape(value.trim()) + "\")");
    }

    private static void addExcludes(List<String> parts, String field, String value) {
        if (value == null || value.isBlank()) {
            return;
        }
        parts.add("not array_contains(" + field + ", \"" + escape(value.trim()) + "\")");
    }

    private static String escape(String value) {
        return value.replace("\\", "\\\\").replace("\"", "\\\"");
    }
}
