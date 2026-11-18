package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.nutritionist.domain.dialogue.MemoryEvent;
import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.domain.dialogue.MemoryOp;
import com.moonligh.nutritionist.domain.dialogue.MemoryQuery;
import com.moonligh.nutritionist.domain.dialogue.MemoryQueryType;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceScope;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.domain.dialogue.SubjectType;
import com.moonligh.nutritionist.domain.recognition.ModelCompletion;

/**
 * 旁路记忆抽取：优先模型 JSON；失败时用极薄规则兜底常见句式。
 */
@Component
public class MemoryExtractor {

    /** 非贪婪主体 + 边界前瞻，避免「海带帮推荐」吞成「海带帮」。 */
    private static final Pattern AVOID = Pattern.compile(
            "(?:不喜欢|不想吃|不要|别放|不能吃|不吃)\\s*([\\u4e00-\\u9fa5A-Za-z0-9]{1,8}?)"
                    + "(?=(?:帮我|帮推荐|帮|推荐|做|一下|吧|啊|了|呢|$|，|。|！|？|\\s))");
    /** (?<!不) 防止「不喜欢」被 LIKE 模板二次吃掉并覆盖 AVOID。 */
    private static final Pattern LIKE = Pattern.compile(
            "(?<!不)(?:最喜欢|喜欢|爱吃)\\s*([\\u4e00-\\u9fa5A-Za-z0-9]{1,8}?)"
                    + "(?=(?:帮我|帮|推荐|做|一下|吧|啊|了|呢|$|，|。|！|？|\\s))");
    /** 改口/撤销：不算了 / 可以吃了 / 不再忌口 / 无所谓了 / 可以吃X了。 */
    private static final Pattern RETRACT = Pattern.compile(
            "(?:不再不喜欢|无所谓了|不忌口了|不算了|可以吃了|不再忌口)"
                    + "\\s*([\\u4e00-\\u9fa5A-Za-z0-9]{0,8})?"
                    + "|(?:可以吃)\\s*([\\u4e00-\\u9fa5A-Za-z0-9]{1,8}?)"
                    + "(?=(?:了|吧|啊|呢|$|，|。|！|？|\\s))");
    private static final Pattern ABSOLUTE = Pattern.compile("绝对不|千万别|过敏");
    /** 「我对虾过敏」无「不吃」触发词，单独抽主体并标 ABSOLUTE。 */
    private static final Pattern ALLERGY = Pattern.compile(
            "对\\s*([\\u4e00-\\u9fa5A-Za-z0-9]{1,8}?)\\s*过敏");

    private final ModelCompletion model;
    private final ObjectMapper json = new ObjectMapper();

    public MemoryExtractor(ModelCompletion model) {
        this.model = model;
    }

    public MemoryExtraction extract(String text) {
        String utter = text == null ? "" : text.trim();
        if (utter.isBlank()) {
            return MemoryExtraction.empty();
        }
        // 强模板（绝对不能吃等）规则优先，避免模型超时/漏抽导致忌口权威空洞
        MemoryExtraction rules = extractRulesOnly(utter);
        if (hasAbsoluteAvoid(rules)) {
            return rules;
        }
        if (model != null) {
            Optional<String> raw = model.complete(prompt(utter));
            if (raw.isPresent() && !raw.get().isBlank()) {
                MemoryExtraction parsed = parse(raw.get());
                if (parsed.hasWork()) {
                    return mergePreferRules(rules, parsed);
                }
            }
        }
        return rules;
    }

    /** 同步问餐链用：仅规则、不调模型。 */
    public MemoryExtraction extractRulesOnly(String text) {
        String utter = text == null ? "" : text.trim();
        if (utter.isBlank()) {
            return MemoryExtraction.empty();
        }
        return thinFallback(utter);
    }

    private static boolean hasAbsoluteAvoid(MemoryExtraction extraction) {
        if (extraction == null || extraction.events().isEmpty()) {
            return false;
        }
        return extraction.events().stream()
                .anyMatch(event -> event.polarity() == PreferencePolarity.AVOID
                        && event.strength() == PreferenceStrength.ABSOLUTE
                        && event.subjectType() == SubjectType.FOOD);
    }

    private static MemoryExtraction mergePreferRules(MemoryExtraction rules, MemoryExtraction model) {
        if (rules == null || !rules.hasWork()) {
            return model;
        }
        if (model == null || !model.hasWork()) {
            return rules;
        }
        List<MemoryEvent> events = new ArrayList<>(rules.events());
        for (MemoryEvent event : model.events()) {
            boolean covered = events.stream()
                    .anyMatch(existing -> existing.subject().equals(event.subject())
                            && existing.subjectType() == event.subjectType());
            if (!covered) {
                events.add(event);
            }
        }
        List<MemoryQuery> queries = new ArrayList<>(rules.queries());
        for (MemoryQuery query : model.queries()) {
            queries.add(query);
        }
        List<String> hints = new ArrayList<>(rules.turnOnlyHints());
        for (String hint : model.turnOnlyHints()) {
            if (!hints.contains(hint)) {
                hints.add(hint);
            }
        }
        List<String> allergy = new ArrayList<>(rules.allergySuspects());
        for (String item : model.allergySuspects()) {
            if (!allergy.contains(item)) {
                allergy.add(item);
            }
        }
        String eventId = !model.eventId().isBlank() ? model.eventId() : rules.eventId();
        return new MemoryExtraction(events, queries, hints, allergy, model.needsDisambiguation(), eventId);
    }

    private MemoryExtraction parse(String raw) {
        try {
            JsonNode root = json.readTree(extractJson(raw));
            List<MemoryEvent> events = new ArrayList<>();
            if (root.has("events") && root.get("events").isArray()) {
                for (JsonNode node : root.get("events")) {
                    MemoryEvent event = oneEvent(node);
                    if (event != null && event.usable()) {
                        events.add(event);
                    }
                }
            }
            List<MemoryQuery> queries = new ArrayList<>();
            if (root.has("queries") && root.get("queries").isArray()) {
                for (JsonNode node : root.get("queries")) {
                    MemoryQuery query = oneQuery(node);
                    if (query != null) {
                        queries.add(query);
                    }
                }
            }
            List<String> hints = strings(root, "turnOnlyHints");
            List<String> allergy = strings(root, "allergySuspects");
            String disambiguation = text(root, "needsDisambiguation");
            String eventId = text(root, "eventId");
            if (eventId.isBlank() && (!events.isEmpty() || !queries.isEmpty())) {
                eventId = UUID.randomUUID().toString();
            }
            return new MemoryExtraction(events, queries, hints, allergy, disambiguation, eventId);
        } catch (Exception error) {
            return MemoryExtraction.empty();
        }
    }

    private static MemoryEvent oneEvent(JsonNode node) {
        if (node == null || !node.hasNonNull("subject")) {
            return null;
        }
        MemoryOp op = enumOr(MemoryOp.class, text(node, "op"), MemoryOp.ASSERT);
        SubjectType type = enumOr(SubjectType.class, text(node, "subjectType"), SubjectType.FOOD);
        PreferencePolarity polarity = enumOr(PreferencePolarity.class, text(node, "polarity"), PreferencePolarity.AVOID);
        PreferenceStrength strength = enumOr(PreferenceStrength.class, text(node, "strength"), PreferenceStrength.MODERATE);
        PreferenceScope scope = enumOr(PreferenceScope.class, text(node, "scope"), PreferenceScope.PERMANENT);
        return new MemoryEvent(
                op,
                text(node, "subject"),
                type,
                polarity,
                strength,
                scope,
                null,
                null,
                text(node, "condition"),
                text(node, "targetOwner"),
                node.has("confidence") ? node.get("confidence").asDouble(0.8) : 0.8,
                text(node, "evidence"));
    }

    private static MemoryQuery oneQuery(JsonNode node) {
        if (node == null) {
            return null;
        }
        MemoryQueryType type = enumOr(MemoryQueryType.class, text(node, "type"), null);
        if (type == null) {
            return null;
        }
        return new MemoryQuery(type, text(node, "subject"));
    }

    private static MemoryExtraction thinFallback(String utter) {
        List<MemoryEvent> events = new ArrayList<>();
        List<MemoryQuery> queries = new ArrayList<>();
        List<String> hints = new ArrayList<>();

        if (utter.contains("以前不喜欢现在喜欢") || utter.contains("以前讨厌现在喜欢")) {
            queries.add(new MemoryQuery(MemoryQueryType.AVOID_THEN_LIKE, ""));
        } else if (utter.contains("以前喜欢现在不喜欢")) {
            queries.add(new MemoryQuery(MemoryQueryType.LIKE_THEN_AVOID, ""));
        } else if (utter.contains("以前不喜欢") || utter.contains("曾经不喜欢")) {
            queries.add(new MemoryQuery(MemoryQueryType.PAST_AVOID, ""));
        } else if (utter.contains("现在不喜欢") || utter.contains("现在讨厌什么")) {
            queries.add(new MemoryQuery(MemoryQueryType.CURRENT_AVOID, ""));
        }

        Matcher retract = RETRACT.matcher(utter);
        if (retract.find()) {
            String subject = firstNonBlank(retract.group(1), retract.group(2));
            if (subject != null && !subject.isBlank()) {
                events.add(MemoryEvent.retractFood(cleanSubject(subject), retract.group()));
            } else if (utter.contains("不忌口") || utter.contains("无所谓了") || utter.contains("不算了")
                    || utter.contains("可以吃了")) {
                // 无主语：本轮不瞎猜主体，仅作 turn hint；治理 API 可显式 retract
                hints.add("RETRACT_PENDING");
            }
        }

        Matcher avoid = AVOID.matcher(utter);
        while (avoid.find()) {
            String subject = cleanSubject(avoid.group(1));
            if (subject.isBlank() || looksLikeNoise(subject)) {
                continue;
            }
            PreferenceStrength strength = ABSOLUTE.matcher(utter).find()
                    ? PreferenceStrength.ABSOLUTE
                    : PreferenceStrength.MODERATE;
            if (utter.contains("绝对不") || utter.contains("别放") || utter.contains("不要给我")) {
                strength = PreferenceStrength.ABSOLUTE;
            }
            events.add(MemoryEvent.assertFood(PreferencePolarity.AVOID, strength, subject, avoid.group()));
        }

        Matcher allergy = ALLERGY.matcher(utter);
        while (allergy.find()) {
            String subject = cleanSubject(allergy.group(1));
            if (subject.isBlank() || looksLikeNoise(subject)) {
                continue;
            }
            final String food = subject;
            events.removeIf(e -> e.subject().equals(food) && e.subjectType() == SubjectType.FOOD);
            events.add(MemoryEvent.assertFood(
                    PreferencePolarity.AVOID, PreferenceStrength.ABSOLUTE, food, allergy.group()));
        }

        Matcher like = LIKE.matcher(utter);
        while (like.find()) {
            String subject = cleanSubject(like.group(1));
            if (subject.isBlank() || looksLikeNoise(subject)) {
                continue;
            }
            // 若同句已抽到该食材的 AVOID，后面的 LIKE 覆盖（改口）
            events.removeIf(e -> e.subject().equals(subject) && e.subjectType() == SubjectType.FOOD);
            events.add(MemoryEvent.assertFood(PreferencePolarity.LIKE, PreferenceStrength.STRONG, subject, like.group()));
        }

        if (utter.contains("清淡")) {
            hints.add("清淡");
        }

        if (events.isEmpty() && queries.isEmpty() && hints.isEmpty()) {
            return MemoryExtraction.empty();
        }
        return new MemoryExtraction(events, queries, hints, List.of(), "", UUID.randomUUID().toString());
    }

    private static String firstNonBlank(String a, String b) {
        if (a != null && !a.isBlank()) {
            return a;
        }
        if (b != null && !b.isBlank()) {
            return b;
        }
        return "";
    }

    private static String cleanSubject(String raw) {
        if (raw == null) {
            return "";
        }
        String subject = raw.trim();
        subject = subject.replaceAll("^(?:吃|点)", "");
        // 循环剥尾缀：先剥「帮推荐」再剥残留「帮/推荐」
        String prev;
        do {
            prev = subject;
            subject = subject.replaceAll("(?:帮我|帮推荐|帮|推荐|一下|了|啊|吧|呢|的|什么)$", "");
        } while (!subject.equals(prev));
        return subject.trim();
    }

    private static boolean looksLikeNoise(String subject) {
        return subject.length() > 8
                || subject.length() < 2
                || subject.contains("推荐")
                || subject.contains("什么")
                || subject.contains("现在")
                || subject.contains("以前")
                || subject.contains("换一")
                || subject.equals("这个")
                || subject.equals("那个")
                || subject.equals("一个");
    }

    private static String prompt(String text) {
        return """
                你是饮食记忆抽取器。只抽偏好事件与记忆问答，不要推荐菜、不要理解换菜/加汤任务、不要编病情。
                「不喜欢/不吃」= AVOID 偏好，不是过敏；过敏嫌疑放 allergySuspects。
                「绝对不能吃」strength=ABSOLUTE；普通不吃用 MODERATE。
                「无所谓了/不再不喜欢」op=RETRACT、polarity=NEUTRAL。
                样例：我不吃海带 → events AVOID 海带；我绝对不能吃虾 → ABSOLUTE；以前不喜欢什么 → queries PAST_AVOID。
                只返回 JSON：
                {"events":[{"op":"ASSERT|REPLACE|RETRACT","subject":"海带","subjectType":"FOOD|CUISINE|TAG",
                "polarity":"AVOID|LIKE|NEUTRAL","strength":"ABSOLUTE|STRONG|MODERATE|WEAK",
                "scope":"PERMANENT|TEMPORARY|TURN","evidence":"...","confidence":0.9}],
                "queries":[{"type":"CURRENT_AVOID|PAST_AVOID|AVOID_THEN_LIKE|LIKE_THEN_AVOID|WHEN_CHANGED","subject":""}],
                "turnOnlyHints":[],"allergySuspects":[],"needsDisambiguation":"","eventId":"uuid"}
                用户原文：%s
                """.formatted(text);
    }

    private static String extractJson(String raw) {
        int start = raw.indexOf('{');
        int end = raw.lastIndexOf('}');
        if (start >= 0 && end > start) {
            return raw.substring(start, end + 1);
        }
        return raw;
    }

    private static String text(JsonNode node, String key) {
        return node != null && node.hasNonNull(key) ? node.get(key).asText("").trim() : "";
    }

    private static List<String> strings(JsonNode node, String key) {
        if (node == null || !node.has(key) || !node.get(key).isArray()) {
            return List.of();
        }
        List<String> values = new ArrayList<>();
        node.get(key).forEach(item -> {
            if (item != null && !item.asText("").isBlank()) {
                values.add(item.asText().trim());
            }
        });
        return values;
    }

    private static <E extends Enum<E>> E enumOr(Class<E> type, String raw, E fallback) {
        if (raw == null || raw.isBlank()) {
            return fallback;
        }
        try {
            return Enum.valueOf(type, raw.trim().toUpperCase());
        } catch (Exception error) {
            return fallback;
        }
    }
}
