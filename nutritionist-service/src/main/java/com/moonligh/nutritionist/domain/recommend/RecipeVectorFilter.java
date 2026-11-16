package com.moonligh.nutritionist.domain.recommend;

import java.util.ArrayList;
import java.util.List;

/** 把菜系、种类、偏好和病情写成向量库的过滤条件。过滤不靠向量相似度。 */
public final class RecipeVectorFilter {

    private RecipeVectorFilter() {
    }

    /** 存进向量库前，标签两侧加逗号，方便按整词匹配。 */
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
        parts.add(field + " like \"%," + escape(value.trim()) + ",%\"");
    }

    private static void addExcludes(List<String> parts, String field, String value) {
        if (value == null || value.isBlank()) {
            return;
        }
        parts.add(field + " not like \"%," + escape(value.trim()) + ",%\"");
    }

    private static String escape(String value) {
        return value.replace("\\", "\\\\").replace("\"", "\\\"");
    }
}
