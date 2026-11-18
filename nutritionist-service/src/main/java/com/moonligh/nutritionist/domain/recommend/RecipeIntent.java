package com.moonligh.nutritionist.domain.recommend;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 检索侧字段过滤：只从话术里抠已发布标量词（菜系/种类/偏好/适合）。
 * 不是对话意图理解；换菜、代替、多任务由 IntentUnderstander（模型）负责。
 */
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
    /** 「菜系XYZ」点名未知菜系，走标量 fail-closed，不进 fuzzy embed。 */
    private static final Pattern NAMED_CUISINE = Pattern.compile("菜系([\\w\\u4e00-\\u9fff]+)");

    public static RecipeIntent parse(String text) {
        return parse(text, List.of());
    }

    public static RecipeIntent parse(String text, List<String> conditions) {
        String remaining = text == null ? "" : text;
        String cuisine = "";
        String kind = "";
        boolean pointedCuisine = false;
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
        if (cuisine.isBlank()) {
            Matcher namedCuisine = NAMED_CUISINE.matcher(remaining);
            if (namedCuisine.find()) {
                cuisine = namedCuisine.group(1);
                remaining = remaining.replace(namedCuisine.group(0), " ");
                // 「菜系XYZ」点名优先：剩余「不存在的」等碎词不得再进 fuzzy embed
                pointedCuisine = true;
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
        String fuzzy = "";
        if (!pointedCuisine) {
            fuzzy = remaining
                    .replaceAll("[，。、；;,.!?！？\\s]+", " ")
                    .replace("想吃", " ")
                    .replace("我想", " ")
                    .trim()
                    .replaceAll("\\s+", "");
        }
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
