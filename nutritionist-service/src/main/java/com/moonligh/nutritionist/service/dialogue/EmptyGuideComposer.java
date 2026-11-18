package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.recommend.RecallEmptyReason;

/**
 * 空结果 → 结构化引导文案与建议动作（不编菜）。
 */
@Component
public class EmptyGuideComposer {

    public record Guide(String text, List<String> actions, RecallEmptyReason reason) {
        public Guide {
            text = text == null ? "" : text;
            actions = actions == null ? List.of() : List.copyOf(actions);
            reason = reason == null ? RecallEmptyReason.NONE : reason;
        }

        public boolean empty() {
            return reason == RecallEmptyReason.NONE || text.isBlank();
        }
    }

    public Guide compose(RecallEmptyReason reason, boolean hasCuisineFilter, boolean hasTagFilter) {
        RecallEmptyReason code = reason == null ? RecallEmptyReason.NONE : reason;
        List<String> actions = new ArrayList<>();
        String text;
        switch (code) {
            case SCALAR_EMPTY, FILTER_FAIL_CLOSED -> {
                if (hasCuisineFilter) {
                    actions.add("DROP_CUISINE");
                }
                if (hasTagFilter) {
                    actions.add("DROP_TAGS");
                }
                actions.add("ADD_FOODS");
                text = "按当前条件没有可做的已发布菜。可以补几种家里有的食材"
                        + (hasCuisineFilter ? "，或说「不限菜系」" : "")
                        + (hasTagFilter ? "，或放宽口味标签" : "")
                        + "。";
            }
            case NO_FEASIBLE_MAINS -> {
                if (hasCuisineFilter) {
                    actions.add("DROP_CUISINE");
                }
                if (hasTagFilter) {
                    actions.add("DROP_TAGS");
                }
                actions.add("ADD_FOODS");
                text = "现有食材撑不起主料齐全的菜。请再告诉我家里还有什么，或换几种主料"
                        + (hasCuisineFilter ? "；也可以说「不限菜系」先看能做的" : "")
                        + (hasTagFilter ? "，或放宽口味标签" : "")
                        + "。";
            }
            case ANN_EMPTY, EMBED_FAILED, VECTOR_STORE_UNAVAILABLE -> {
                actions.add("ADD_FOODS");
                actions.add("KEEP_WAITING");
                text = "暂时没检索到合适菜谱。请补充食材名称后再试，或稍后再问。";
            }
            case NO_PUBLISHED_INTERSECT -> {
                actions.add("ADD_FOODS");
                text = "检索结果与已发布目录对不上，不会另外编菜。请换一组更常见的食材再试。";
            }
            case FALLBACK_ALL_PUBLISHED -> {
                actions.add("ADD_FOODS");
                text = "点名条件过严，没有可展示的安全结果。请放宽条件或补充食材。";
            }
            default -> {
                return new Guide("", List.of(), RecallEmptyReason.NONE);
            }
        }
        return new Guide(text, actions, code);
    }

    /** 无召回空因时：完全没识别到食材。 */
    public Guide noFoodsRecognized() {
        return new Guide(
                "没有识别到可用食材，请再告诉我家里有什么。",
                List.of("ADD_FOODS"),
                RecallEmptyReason.NO_FEASIBLE_MAINS);
    }
}
