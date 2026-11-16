package com.moonligh.nutritionist.domain.recommend;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/** 从用户这句话里拆出点名字段和模糊词。过滤靠字段，模糊词才走向量。 */
public record RecipeIntent(
        String cuisine,
        String kind,
        List<String> preferTags,
        List<String> conditions,
        String fuzzyText,
        boolean named,
        boolean fuzzy) {

    private static final List<String> CUISINES = List.of(
            "家常", "川菜", "粤菜", "鲁菜", "苏菜", "浙菜", "闽菜", "湘菜", "徽菜", "西餐", "东北");
    private static final List<String> KINDS = List.of("汤", "主食", "菜", "小吃", "饮品", "粥", "凉菜");
    private static final List<String> PREFER = List.of("减肥", "减脂", "快手");
    private static final List<String> CONDITIONS = List.of("控糖", "控盐", "低盐", "低嘌呤");

    public static RecipeIntent parse(String text) {
        return parse(text, List.of());
    }

    public static RecipeIntent parse(String text, List<String> conditions) {
        String remaining = text == null ? "" : text;
        String cuisine = "";
        String kind = "";
        Set<String> tags = new LinkedHashSet<>();
        Set<String> disease = new LinkedHashSet<>();
        if (conditions != null) {
            for (String item : conditions) {
                if (item != null && !item.isBlank()) {
                    disease.add(item.trim());
                }
            }
        }
        for (String word : sortedByLength(CUISINES)) {
            if (remaining.contains(word)) {
                cuisine = word;
                remaining = remaining.replace(word, " ");
                break;
            }
        }
        for (String word : sortedByLength(KINDS)) {
            if (remaining.contains(word)) {
                kind = word;
                remaining = remaining.replace(word, " ");
                break;
            }
        }
        for (String word : sortedByLength(PREFER)) {
            if (remaining.contains(word)) {
                tags.add(word);
                remaining = remaining.replace(word, " ");
            }
        }
        if (remaining.contains("家常")) {
            tags.add("家常");
            remaining = remaining.replace("家常", " ");
        }
        for (String word : sortedByLength(CONDITIONS)) {
            if (remaining.contains(word)) {
                disease.add(word);
                remaining = remaining.replace(word, " ");
            }
        }
        String fuzzy = remaining
                .replaceAll("[，。、；;,.!?！？\\s]+", " ")
                .replace("想吃", " ")
                .replace("我想", " ")
                .trim()
                .replaceAll("\\s+", "");
        boolean named = !cuisine.isBlank() || !kind.isBlank() || !tags.isEmpty();
        boolean hasFuzzy = !fuzzy.isBlank();
        return new RecipeIntent(
                cuisine,
                kind,
                List.copyOf(tags),
                List.copyOf(disease),
                hasFuzzy ? fuzzy : "",
                named,
                hasFuzzy);
    }

    private static List<String> sortedByLength(List<String> words) {
        List<String> copy = new ArrayList<>(words);
        copy.sort((left, right) -> Integer.compare(right.length(), left.length()));
        return copy;
    }
}
