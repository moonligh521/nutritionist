package com.moonligh.nutritionist.domain.recommend;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;

/**
 * 结构化检索上下文：话术点名 + 档案病情 + 长期菜系/标签。
 * 禁止把记忆列表拼进字符串再抠词作为唯一路径。
 */
public record RecallContext(
        String cuisine,
        String kind,
        List<String> preferTags,
        List<String> conditions,
        String fuzzyText) {

    public RecallContext {
        cuisine = cuisine == null ? "" : cuisine.trim();
        kind = kind == null ? "" : kind.trim();
        preferTags = preferTags == null ? List.of() : List.copyOf(preferTags);
        conditions = conditions == null ? List.of() : List.copyOf(conditions);
        fuzzyText = fuzzyText == null ? "" : fuzzyText.trim();
    }

    public static RecallContext empty() {
        return new RecallContext("", "", List.of(), List.of(), "");
    }

    public static RecallContext fromText(String text, List<String> conditions) {
        return from(text, LongTermMemory.empty(), "", conditions);
    }

    /**
     * @param text 本轮用户原文
     * @param memory 已提交长期快照（可 empty）
     * @param turnHints 当次 TURN 提示（如清淡），并入话术解析
     */
    public static RecallContext from(String text, LongTermMemory memory, String turnHints) {
        return from(text, memory, turnHints, memory == null ? List.of() : memory.conditions());
    }

    public static RecallContext from(
            String text, LongTermMemory memory, String turnHints, List<String> conditions) {
        LongTermMemory longTerm = memory == null ? LongTermMemory.empty() : memory;
        StringBuilder utterance = new StringBuilder(text == null ? "" : text.trim());
        if (turnHints != null && !turnHints.isBlank()) {
            if (!utterance.isEmpty()) {
                utterance.append(' ');
            }
            utterance.append(turnHints.trim());
        }
        List<String> clinical = new ArrayList<>();
        if (conditions != null) {
            for (String item : conditions) {
                if (item != null && !item.isBlank()) {
                    clinical.add(item.trim());
                }
            }
        }
        for (String item : longTerm.conditions()) {
            if (!clinical.contains(item)) {
                clinical.add(item);
            }
        }
        RecipeIntent intent = RecipeIntent.parse(utterance.toString(), clinical);

        String cuisine = intent.cuisine();
        if (cuisine.isBlank() && !longTerm.preferCuisines().isEmpty()) {
            cuisine = longTerm.preferCuisines().getFirst();
        }

        Set<String> tags = new LinkedHashSet<>(intent.preferTags());
        for (String tag : longTerm.preferTags()) {
            if (tag != null && !tag.isBlank()) {
                tags.add(tag.trim());
            }
        }

        // LIKE 食材不进 filter；fuzzy 仅话术残留
        return new RecallContext(
                cuisine,
                intent.kind(),
                List.copyOf(tags),
                List.copyOf(clinical),
                intent.fuzzyText());
    }

    public boolean named() {
        return !cuisine.isBlank() || !kind.isBlank() || !preferTags.isEmpty();
    }

    public boolean hasClinical() {
        return !conditions.isEmpty();
    }

    public boolean hasFilter() {
        return named() || hasClinical();
    }

    public boolean fuzzy() {
        return !fuzzyText.isBlank();
    }

    public String filterExpr() {
        return RecipeVectorFilter.expr(cuisine, kind, preferTags, conditions);
    }
}
