package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.IntentAmbiguity;
import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.TaskType;
import com.moonligh.nutritionist.domain.dialogue.TurnConstraints;
import com.moonligh.nutritionist.domain.dialogue.TurnIntent;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext;

/** 合法化理解结果：低置信降级、去重、剥掉未提及的历史抄袭约束。 */
@Component
public class IntentNormalizer {

    public static final double MIN_CONFIDENCE = 0.55;

    public TurnIntent normalize(TurnIntent raw, UnderstandContext context, List<Double> confidences) {
        if (raw == null) {
            return TurnIntent.ofTasks(List.of());
        }
        UnderstandContext ctx = context == null
                ? UnderstandContext.of("", List.of(), LongTermMemory.empty())
                : context;
        List<DialogueTask> kept = new ArrayList<>();
        List<IntentAmbiguity> ambiguities = new ArrayList<>(raw.ambiguities());
        List<Double> conf = confidences == null ? List.of() : confidences;
        Set<String> seen = new LinkedHashSet<>();
        for (int i = 0; i < raw.tasks().size(); i++) {
            DialogueTask task = raw.tasks().get(i);
            if (task == null || task.type() == null) {
                continue;
            }
            double score = i < conf.size() ? conf.get(i) : 0.8;
            if (score < MIN_CONFIDENCE && isCriticalSlotTask(task.type())) {
                ambiguities.add(new IntentAmbiguity(
                        "LOW_CONFIDENCE",
                        List.of(),
                        "我不太确定你的意思，请再说具体一点（例如换哪一道、加汤还是推荐）。"));
                continue;
            }
            String key = dedupeKey(task);
            if (!seen.add(key)) {
                continue;
            }
            kept.add(task);
        }
        TurnConstraints constraints = stripUnmentionedHistory(raw.constraints(), ctx);
        return new TurnIntent(kept, constraints, raw.memoryQueries(), ambiguities, raw.degraded());
    }

    private static boolean isCriticalSlotTask(TaskType type) {
        return type == TaskType.REPLACE_ONE
                || type == TaskType.ADD_KIND
                || type == TaskType.SUBSTITUTE
                || type == TaskType.MISSING;
    }

    private static String dedupeKey(DialogueTask task) {
        return task.type() + "|" + task.dishHint() + "|" + task.kind() + "|" + task.missingFood()
                + "|" + task.fromFood() + "|" + task.toFood() + "|" + String.join(",", task.rawFoods());
    }

    private static TurnConstraints stripUnmentionedHistory(TurnConstraints constraints, UnderstandContext ctx) {
        if (constraints == null || constraints.isEmpty()) {
            return TurnConstraints.empty();
        }
        String utter = ctx.utterance().toLowerCase(Locale.ROOT);
        LongTermMemory prefs = ctx.preference();
        List<String> avoid = filterMentionedOrNovel(constraints.avoidFoods(), utter, prefs.avoidFoods());
        List<String> absolute = filterMentionedOrNovel(constraints.absoluteAvoidFoods(), utter, prefs.absoluteAvoidFoods());
        return new TurnConstraints(
                avoid,
                absolute,
                mentionedOrBlank(constraints.cuisine(), utter),
                mentionedOrBlank(constraints.kind(), utter),
                filterMentionedOrNovel(constraints.preferTags(), utter, prefs.preferTags()),
                constraints.turnHints());
    }

    private static List<String> filterMentionedOrNovel(List<String> values, String utter, List<String> history) {
        if (values == null || values.isEmpty()) {
            return List.of();
        }
        Set<String> hist = new LinkedHashSet<>();
        for (String h : history) {
            if (h != null) {
                hist.add(h.trim());
            }
        }
        List<String> out = new ArrayList<>();
        for (String value : values) {
            if (value == null || value.isBlank()) {
                continue;
            }
            String v = value.trim();
            boolean inHistory = hist.contains(v);
            boolean mentioned = utter.contains(v.toLowerCase(Locale.ROOT)) || utter.contains(v);
            if (!inHistory || mentioned) {
                out.add(v);
            }
        }
        return List.copyOf(out);
    }

    private static String mentionedOrBlank(String value, String utter) {
        if (value == null || value.isBlank()) {
            return "";
        }
        return utter.contains(value) || utter.contains(value.toLowerCase(Locale.ROOT)) ? value.trim() : value.trim();
    }
}
