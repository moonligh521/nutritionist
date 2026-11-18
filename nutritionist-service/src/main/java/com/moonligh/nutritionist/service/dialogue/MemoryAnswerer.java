package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.dialogue.MemoryQuery;

/** 记忆问答：模板拼接，禁止模型猜历史。 */
@Component
public class MemoryAnswerer {

    private final PreferenceStore store;

    public MemoryAnswerer(PreferenceStore store) {
        this.store = store;
    }

    public String answer(String ownerId, List<MemoryQuery> queries) {
        if (ownerId == null || ownerId.isBlank() || queries == null || queries.isEmpty()) {
            return "";
        }
        List<String> parts = new ArrayList<>();
        for (MemoryQuery query : queries) {
            String line = one(ownerId, query);
            if (!line.isBlank()) {
                parts.add(line);
            }
        }
        return String.join(" ", parts);
    }

    private String one(String ownerId, MemoryQuery query) {
        List<String> subjects = store.answer(ownerId, query);
        String joined = subjects.isEmpty() ? "没有记录" : String.join("、", subjects);
        return switch (query.type()) {
            case CURRENT_AVOID -> "你现在不喜欢：" + joined + "。";
            case PAST_AVOID -> "你以前不喜欢过：" + joined + "。";
            case AVOID_THEN_LIKE -> "以前不喜欢、现在喜欢：" + joined + "。";
            case LIKE_THEN_AVOID -> "以前喜欢、现在不喜欢：" + joined + "。";
            case WHEN_CHANGED -> query.subject().isBlank()
                    ? ""
                    : (subjects.isEmpty()
                            ? "没有找到「" + query.subject() + "」的改口时间。"
                            : "「" + query.subject() + "」最近一次变更时间：" + subjects.getFirst() + "。");
        };
    }
}
