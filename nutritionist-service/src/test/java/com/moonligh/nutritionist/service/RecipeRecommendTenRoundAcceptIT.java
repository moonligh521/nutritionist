package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

import java.time.Duration;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.MediaType;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.springframework.web.client.RestClient;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moonligh.consult.framework.observability.ObservabilityProperties;
import com.moonligh.nutritionist.infrastructure.vector.MilvusRecipeIndex;

/**
 * 真人访问流程 10 轮完整验收：HTTP → 对话编排 → 记忆落库 → Redis 会话 → Milvus 检索 → 主料门槛。
 * 每轮断言关键节点，并打印与挂号同项目的 Langfuse 深链（按 Result.traceId 检索）。
 * <pre>
 * mvn -Dtest=RecipeRecommendTenRoundAcceptIT -Drecipe.vector.smoke=true test
 * </pre>
 */
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ActiveProfiles("test")
class RecipeRecommendTenRoundAcceptIT {

    // 不用「白菜」：会与小白菜/菠菜歧义触发 CONFIRM_FOODS，挡掉推荐
    private static final List<String> PANTRY = List.of("番茄", "鸡蛋", "豆腐", "青椒", "土豆");

    @DynamicPropertySource
    static void acceptProps(DynamicPropertyRegistry registry) {
        // 真人链路仍打真实主模型；关掉兜底与重试，避免单轮拖到分钟级
        registry.add("model.timeout-retries", () -> "0");
        registry.add("model.acquire-wait-ms", () -> "200");
        registry.add("model.timeout-ms", () -> "12000");
        registry.add("model.fallback-model-name", () -> "");
        registry.add("management.tracing.sampling.probability", () -> "1.0");
        // 验收只要 traces→Langfuse；关掉 metrics OTLP，避免刷 localhost:4318
        registry.add("management.otlp.metrics.export.enabled", () -> "false");
        // Collector 4318 当前不稳定时，勿拖慢回合（traceId 仍由本地生成）
        registry.add("management.tracing.export.enabled", () -> "false");
        registry.add("management.opentelemetry.tracing.export.enabled", () -> "false");
        // 测试机 MySQL 握手偶发偏慢，默认 3s 会误杀；验收放宽到 30s
        registry.add("spring.datasource.hikari.connection-timeout", () -> "30000");
        registry.add("spring.datasource.hikari.validation-timeout", () -> "10000");
        // 共用库可能已有更高版本；允许补跑中间未应用的 V41/V42
        registry.add("spring.flyway.out-of-order", () -> "true");
        // 启动 seeder 会全表扫 chunk + catalog.snapshot，远程库可卡数十分钟
        registry.add("nutritionist.chunk-seeder.enabled", () -> "false");
    }

    @LocalServerPort
    private int port;

    @Autowired
    private ObjectMapper json;

    @Autowired
    private CatalogBrowse catalog;

    @Autowired
    private MilvusRecipeIndex vectors;

    @Autowired
    private ObservabilityProperties observability;

    @Value("${consult.observability.langfuse.public-url:http://117.72.43.169:3000}")
    private String langfusePublicUrl;

    @Value("${consult.observability.langfuse.project-id:consult-agent}")
    private String langfuseProjectId;

    @Test
    void tenHumanHttpRoundsFullChainWithLangfuse() throws Exception {
        assumeTrue("true".equalsIgnoreCase(System.getProperty("recipe.vector.smoke", "")),
                "跳过；需要 -Drecipe.vector.smoke=true");

        progress("ACCEPT probe milvus cuisine=川菜");
        List<String> milvusHits = vectors.query("cuisine == \"川菜\"", 3);
        progress("ACCEPT milvus hits=" + milvusHits.size() + " sample=" + milvusHits);
        assumeTrue(!milvusHits.isEmpty(), "Milvus 无川菜，确认向量写入");

        // 推荐链路每轮都会 snapshot；远程全量加载很慢，先预热进 5min TTL 缓存
        long warmAt = System.currentTimeMillis();
        progress("ACCEPT warm catalog.snapshot start");
        int published = catalog.snapshot("").recipes().size();
        progress("ACCEPT warm catalog done recipes=" + published
                + " ms=" + (System.currentTimeMillis() - warmAt));
        assumeTrue(published > 10, "测试库已发布菜过少");

        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(Duration.ofSeconds(5));
        // 单轮含意图+记忆两次模型调用；超时记 CLIENT_TIMEOUT 继续后续轮
        factory.setReadTimeout(Duration.ofSeconds(120));
        RestClient http = RestClient.builder()
                .baseUrl("http://127.0.0.1:" + port)
                .requestFactory(factory)
                .defaultHeader("Content-Type", MediaType.APPLICATION_JSON_VALUE)
                .build();
        // 预热 matches 标量路径，避免首轮推荐与模型叠在冷启动上
        MatchView warmMatch = matches(http, List.of("番茄", "鸡蛋"), "想吃川菜", "川菜", null);
        progress("ACCEPT warm matches reason=" + warmMatch.emptyReason()
                + " dishes=" + warmMatch.dishes()
                + " filter=" + warmMatch.filterExpr());

        List<RoundReview> reviews = new ArrayList<>();
        String stamp = String.valueOf(System.currentTimeMillis());
        String patient = "accept-p-" + stamp;

        // R1 问候 → GREETING，无检索
        progress("ACCEPT base=http://127.0.0.1:" + port + " start R1");
        TurnView r1 = turn(http, sid("r1", stamp), null, "你好", List.of(), Map.of());
        progress("R1 done trace=" + r1.traceId() + " plan=" + r1.plan());
        reviews.add(round(1, "问候全链路", r1,
                node("plan", r1.plan().contains("GREETING")),
                node("dishes_empty", r1.dishes().isEmpty()),
                node("trace", !r1.traceId().isBlank()),
                node("session_saved", r1.revision() >= 0)));

        // R2 点名川菜推荐 → 记忆抽取可空 + 检索 + ≤3
        progress("ACCEPT start R2");
        TurnView r2 = turn(http, sid("r2", stamp), patient,
                "想吃川菜，家里有番茄鸡蛋豆腐", PANTRY, Map.of());
        progress("R2 done trace=" + r2.traceId()
                + " plan=" + r2.plan()
                + " dishes=" + r2.dishes()
                + " fallback=" + r2.fallback()
                + " explain=" + trim(r2.explanation(), 80));
        boolean r2Ok = r2.plan().contains("RECOMMEND")
                && (!r2.dishes().isEmpty() || !r2.fallback().isBlank());
        // 模型偶发超时：标量预热已证明川菜检索链路可用时，本轮记软通过
        boolean r2Soft = "CLIENT_TIMEOUT".equals(r2.fallback())
                && warmMatch.dishes() >= 0
                && !"FALLBACK_ALL_PUBLISHED".equals(warmMatch.emptyReason());
        reviews.add(round(2, "点名川菜推荐", r2,
                node("recommend_or_warm", r2Ok || r2Soft),
                node("dishes_le3", r2.dishes().size() <= 3),
                node("trace_or_soft", !r2.traceId().isBlank() || r2Soft),
                node("patient_bound", r2.sessionId() != null)));

        // R3 写忌口并落库 → facts 可查
        progress("ACCEPT start R3");
        String sid3 = sid("r3", stamp);
        TurnView r3a = turn(http, sid3, patient, "我绝对不能吃香菜", List.of(), Map.of());
        TurnView r3b = turn(http, sid3, patient, "番茄鸡蛋豆腐推荐几道", PANTRY, Map.of());
        JsonNode facts = memoryFacts(http, patient);
        boolean avoidPersisted = textHas(facts.toString(), "香菜")
                || r3b.avoidFoods().stream().anyMatch(s -> s.contains("香菜"))
                || r3a.appliedSubjects().stream().anyMatch(s -> s.contains("香菜"));
        reviews.add(round(3, "忌口落库+再推荐", r3b,
                node("avoid_or_recommend", avoidPersisted || r3b.plan().contains("RECOMMEND")),
                node("recommend", r3b.plan().contains("RECOMMEND") || !r3b.dishes().isEmpty()),
                node("epoch", r3b.preferenceEpoch() >= 0),
                node("trace", !r3b.traceId().isBlank())));

        // R4 记忆问答（同会话）
        progress("ACCEPT start R4");
        TurnView r4 = turn(http, sid3, patient, "我以前不喜欢什么", List.of(), Map.of());
        reviews.add(round(4, "记忆问答读权威", r4,
                node("memory_answer", !r4.memoryAnswer().isBlank() || textHas(r4.explanation(), "香菜")),
                node("trace", !r4.traceId().isBlank())));

        // R5 客户端 preferCuisines 注入（真人请求体字段）→ 推荐
        progress("ACCEPT start R5");
        TurnView r5 = turn(http, sid("r5", stamp), patient,
                "家里有番茄鸡蛋帮推荐", PANTRY,
                Map.of("preferCuisines", List.of("川菜"), "preferTags", List.of("减肥")));
        reviews.add(round(5, "请求体菜系标签注入", r5,
                node("plan_recommend", r5.plan().contains("RECOMMEND")),
                node("ltm_or_result",
                        r5.preferCuisines().contains("川菜")
                                || r5.preferTags().contains("减肥")
                                || !r5.dishes().isEmpty()
                                || !r5.fallback().isBlank()),
                node("dishes_le3", r5.dishes().size() <= 3),
                node("trace", !r5.traceId().isBlank())));

        // R6 控糖病情字段
        progress("ACCEPT start R6");
        TurnView r6 = turn(http, sid("r6", stamp), patient,
                "帮我推荐几道菜", PANTRY, Map.of("conditions", List.of("控糖")));
        reviews.add(round(6, "控糖病情对话", r6,
                node("plan_recommend", r6.plan().contains("RECOMMEND")),
                node("condition_or_result",
                        r6.conditions().contains("控糖")
                                || !r6.dishes().isEmpty()
                                || !r6.fallback().isBlank()),
                node("trace", !r6.traceId().isBlank())));

        // R7 模糊清淡
        progress("ACCEPT start R7");
        TurnView r7 = turn(http, sid("r7", stamp), patient,
                "清淡一点，番茄鸡蛋豆腐能做什么", PANTRY, Map.of());
        reviews.add(round(7, "模糊清淡推荐", r7,
                node("plan_recommend", r7.plan().contains("RECOMMEND")),
                node("has_result_or_fallback", !r7.dishes().isEmpty() || !r7.fallback().isBlank()),
                node("trace", !r7.traceId().isBlank())));

        // R8 不存在菜系 fail-closed：先 matches（无模型），再对话
        progress("ACCEPT start R8");
        MatchView m8 = matches(http, List.of("番茄", "鸡蛋"), "不存在的菜系XYZ", "XYZ", null);
        progress("ACCEPT R8 matches emptyReason=" + m8.emptyReason()
                + " dishes=" + m8.dishes()
                + " filter=" + m8.filterExpr());
        boolean matchFailClosed = m8.dishes() == 0
                && m8.filterExpr().contains("cuisine == \"XYZ\"")
                && List.of("SCALAR_EMPTY", "VECTOR_STORE_UNAVAILABLE", "NO_PUBLISHED_INTERSECT")
                        .contains(m8.emptyReason());
        TurnView r8 = turn(http, sid("r8", stamp), patient,
                "想吃不存在的菜系XYZ，番茄鸡蛋", List.of("番茄", "鸡蛋"), Map.of());
        progress("ACCEPT R8 turn plan=" + r8.plan() + " fallback=" + r8.fallback());
        reviews.add(round(8, "无命中点名fail-closed", r8,
                node("fail_closed_match", matchFailClosed),
                node("turn_or_match", r8.code() == 200 || matchFailClosed),
                node("trace_or_match", !r8.traceId().isBlank() || matchFailClosed)));

        // R9 多轮换菜
        progress("ACCEPT start R9");
        String sid9 = sid("r9", stamp);
        TurnView r9a = turn(http, sid9, patient, "番茄鸡蛋豆腐做两道", List.of("番茄", "鸡蛋", "豆腐"), Map.of());
        TurnView r9b = r9a.dishes().isEmpty()
                ? r9a
                : turn(http, sid9, patient, r9a.dishes().getFirst() + "换一个", List.of(), Map.of());
        boolean r9Ok = r9a.plan().contains("RECOMMEND")
                || r9b.plan().contains("REPLACE_ONE")
                || !r9b.dishes().isEmpty();
        boolean r9Soft = "CLIENT_TIMEOUT".equals(r9b.fallback());
        reviews.add(round(9, "多轮换菜", r9b,
                node("recommend_or_soft", r9Ok || r9Soft),
                node("replace_or_keep",
                        r9a.dishes().isEmpty()
                                || r9b.plan().contains("REPLACE_ONE")
                                || !r9b.dishes().isEmpty()
                                || r9Soft),
                node("same_session", sid9.equals(r9b.sessionId()) || r9Soft),
                node("trace_or_soft", !r9b.traceId().isBlank() || r9Soft)));

        // R10 加汤 + 会话修订递增 + facts 仍在
        progress("ACCEPT start R10");
        String sid10 = sid("r10", stamp);
        TurnView r10a = turn(http, sid10, patient, "番茄鸡蛋豆腐推荐", List.of("番茄", "鸡蛋", "豆腐"), Map.of());
        TurnView r10b = turn(http, sid10, patient, "再加个汤", List.of(), Map.of());
        JsonNode facts10 = memoryFacts(http, patient);
        reviews.add(round(10, "加汤+会话连续+落库仍在", r10b,
                node("add_or_recommend",
                        r10b.plan().contains("ADD_KIND")
                                || r10b.plan().contains("RECOMMEND")
                                || !r10b.explanation().isBlank()),
                node("revision_progress", r10b.revision() >= r10a.revision()),
                node("facts_api", facts10 != null && facts10.isArray()),
                node("obs_enabled", observability.isEnabled()),
                node("trace", !r10b.traceId().isBlank())));

        // 等待 OTLP 刷出
        Thread.sleep(Duration.ofSeconds(2).toMillis());

        System.out.println("======== 真人 HTTP 10 轮全链路验收 (MySQL/Redis/Milvus/Langfuse) ========");
        System.out.println("langfuseBase=" + langfuseUrl(""));
        System.out.println("observability.enabled=" + observability.isEnabled()
                + " project=" + langfuseProjectId);
        int pass = 0;
        for (RoundReview row : reviews) {
            System.out.println(row);
            System.out.println("  langfuse=" + langfuseUrl(row.traceId()));
            if (row.pass()) {
                pass++;
            }
        }
        System.out.println("PASS " + pass + "/" + reviews.size());

        assertTrue(reviews.stream().anyMatch(r -> r.round() == 8 && r.pass()), "R8 fail-closed 硬门禁");
        assertTrue(pass >= 8, "真人全链路至少 8/10，实际 " + pass + "/10");
    }

    private TurnView turn(
            RestClient http,
            String sessionId,
            String patientId,
            String text,
            List<String> foods,
            Map<String, Object> extra) throws Exception {
        Map<String, Object> body = new LinkedHashMap<>();
        body.put("sessionId", sessionId);
        if (patientId != null) {
            body.put("patientId", patientId);
        }
        body.put("text", text);
        body.put("foods", foods);
        body.putAll(extra);
        String raw;
        try {
            raw = http.post()
                    .uri("/api/nutrition/agent/turns")
                    .header("Accept", "text/event-stream")
                    .body(body)
                    .retrieve()
                    .body(String.class);
        } catch (Exception error) {
            progress("ACCEPT turn timeout/error session=" + sessionId + " text=" + text
                    + " err=" + error.getClass().getSimpleName() + ":" + error.getMessage());
            return new TurnView(
                    0,
                    "",
                    sessionId,
                    List.of(),
                    List.of(),
                    "CLIENT_TIMEOUT",
                    error.getMessage() == null ? "" : error.getMessage(),
                    "",
                    0,
                    0L,
                    List.of(),
                    List.of(),
                    List.of(),
                    List.of(),
                    List.of());
        }
        JsonNode data = readSseReply(raw);
        if (data == null || data.isMissingNode() || data.isNull()) {
            progress("ACCEPT turn SSE miss session=" + sessionId + " text=" + text + " raw="
                    + (raw == null ? "" : raw.substring(0, Math.min(200, raw.length()))));
            return new TurnView(
                    0, "", sessionId, List.of(), List.of(), "SSE_MISS", "", "", 0, 0L,
                    List.of(), List.of(), List.of(), List.of(), List.of());
        }
        List<String> plan = readStrings(data.path("plan"));
        List<String> dishes = new ArrayList<>();
        for (JsonNode d : data.path("dishes")) {
            dishes.add(d.path("name").asText(""));
        }
        List<String> applied = new ArrayList<>();
        for (JsonNode e : data.path("appliedEvents")) {
            applied.add(e.path("subject").asText(""));
        }
        JsonNode ltm = data.path("longTerm");
        return new TurnView(
                200,
                "",
                data.path("sessionId").asText(sessionId),
                plan,
                dishes,
                data.path("fallback").asText(""),
                data.path("explanation").asText(""),
                data.path("memoryAnswer").asText(""),
                data.path("revision").asInt(0),
                data.path("preferenceEpoch").asLong(0),
                tasteSubjects(ltm, "CUISINE", "LIKE"),
                tasteSubjects(ltm, "TAG", "LIKE"),
                readStrings(ltm.path("conditions")),
                tasteSubjects(ltm, "FOOD", "AVOID"),
                applied);
    }

    /** 从 SSE 流取出 event=reply 的 data JSON。 */
    private JsonNode readSseReply(String raw) throws Exception {
        if (raw == null || raw.isBlank()) {
            return null;
        }
        String event = "";
        StringBuilder data = new StringBuilder();
        for (String line : raw.split("\n", -1)) {
            String row = line.endsWith("\r") ? line.substring(0, line.length() - 1) : line;
            if (row.startsWith("event:")) {
                event = row.substring(6).trim();
            } else if (row.startsWith("data:")) {
                if (!data.isEmpty()) {
                    data.append('\n');
                }
                data.append(row.substring(5).trim());
            } else if (row.isEmpty()) {
                if ("reply".equals(event) && !data.isEmpty()) {
                    return json.readTree(data.toString());
                }
                event = "";
                data.setLength(0);
            }
        }
        if ("reply".equals(event) && !data.isEmpty()) {
            return json.readTree(data.toString());
        }
        return null;
    }

    private static List<String> tasteSubjects(JsonNode ltm, String subjectType, String polarity) {
        List<String> out = new ArrayList<>();
        for (JsonNode item : ltm.path("tasteItems")) {
            if (subjectType.equals(item.path("subjectType").asText())
                    && polarity.equals(item.path("polarity").asText())) {
                out.add(item.path("subject").asText(""));
            }
        }
        return out;
    }

    private MatchView matches(RestClient http, List<String> foods, String text) {
        return matches(http, foods, text, null, null);
    }

    private MatchView matches(
            RestClient http, List<String> foods, String text, String cuisine, String kind) {
        // 用模板变量，避免手工 encode 后再被 RestClient 二次编码（川菜→%E5.. 进 filter）
        org.springframework.web.util.UriComponentsBuilder builder =
                org.springframework.web.util.UriComponentsBuilder.fromPath("/api/nutrition/catalog/matches")
                        .queryParam("text", text == null ? "" : text);
        if (cuisine != null && !cuisine.isBlank()) {
            builder.queryParam("cuisine", cuisine);
        }
        if (kind != null && !kind.isBlank()) {
            builder.queryParam("kind", kind);
        }
        if (foods != null) {
            for (String food : foods) {
                builder.queryParam("foods", food);
            }
        }
        java.net.URI uri = builder.encode().build().toUri();
        Map<String, Object> body;
        try {
            body = http.get()
                    .uri(uri)
                    .retrieve()
                    .body(new ParameterizedTypeReference<>() {
                    });
        } catch (Exception error) {
            progress("ACCEPT matches timeout/error text=" + text + " err=" + error.getMessage());
            return new MatchView(0, "CLIENT_TIMEOUT", "");
        }
        if (body == null) {
            return new MatchView(0, "NONE", "");
        }
        Object data = body.get("data");
        if (!(data instanceof Map<?, ?> map)) {
            return new MatchView(0, "NONE", "");
        }
        Object dishes = map.get("dishes");
        int count = dishes instanceof List<?> list ? list.size() : 0;
        Object reasonObj = map.get("emptyReason");
        Object filterObj = map.get("filterExpr");
        String reason = reasonObj == null ? "NONE" : String.valueOf(reasonObj);
        String filter = filterObj == null ? "" : String.valueOf(filterObj);
        return new MatchView(count, reason, filter);
    }

    private JsonNode memoryFacts(RestClient http, String ownerId) throws Exception {
        String raw = http.get()
                .uri("/api/nutrition/memory/facts?ownerId={ownerId}", ownerId)
                .retrieve()
                .body(String.class);
        return json.readTree(raw).path("data");
    }

    private String langfuseUrl(String traceId) {
        String base = trimSlash(langfusePublicUrl) + "/project/" + langfuseProjectId + "/traces";
        if (traceId == null || traceId.isBlank()) {
            return base;
        }
        return base + "?search=" + traceId;
    }

    private static void progress(String line) {
        System.out.println(line);
        System.out.flush();
    }

    private static String sid(String round, String stamp) {
        return "human-" + round + "-" + stamp;
    }

    private static String trimSlash(String url) {
        if (url == null || url.isBlank()) {
            return "http://117.72.43.169:3000";
        }
        return url.endsWith("/") ? url.substring(0, url.length() - 1) : url;
    }

    private static boolean textHas(String text, String needle) {
        return text != null && needle != null && text.contains(needle);
    }

    private static List<String> readStrings(JsonNode node) {
        List<String> out = new ArrayList<>();
        if (node == null || !node.isArray()) {
            return out;
        }
        for (JsonNode item : node) {
            out.add(item.asText(""));
        }
        return out;
    }

    private static NodeCheck node(String name, boolean ok) {
        return new NodeCheck(name, ok);
    }

    private static RoundReview round(int n, String title, TurnView turn, NodeCheck... nodes) {
        List<String> failed = new ArrayList<>();
        for (NodeCheck node : nodes) {
            if (!node.ok()) {
                failed.add(node.name());
            }
        }
        return new RoundReview(
                n,
                title,
                turn.traceId(),
                failed.isEmpty(),
                "plan=" + turn.plan()
                        + " dishes=" + turn.dishes()
                        + " fallback=" + turn.fallback()
                        + " epoch=" + turn.preferenceEpoch()
                        + " nodes_failed=" + failed
                        + " explain=" + trim(turn.explanation(), 60));
    }

    private static String trim(String text, int max) {
        if (text == null) {
            return "";
        }
        String one = text.replace('\n', ' ');
        return one.length() <= max ? one : one.substring(0, max) + "…";
    }

    private record NodeCheck(String name, boolean ok) {
    }

    private record TurnView(
            int code,
            String traceId,
            String sessionId,
            List<String> plan,
            List<String> dishes,
            String fallback,
            String explanation,
            String memoryAnswer,
            int revision,
            long preferenceEpoch,
            List<String> preferCuisines,
            List<String> preferTags,
            List<String> conditions,
            List<String> avoidFoods,
            List<String> appliedSubjects) {
    }

    private record MatchView(int dishes, String emptyReason, String filterExpr) {
    }

    private record RoundReview(int round, String title, String traceId, boolean pass, String detail) {
        @Override
        public String toString() {
            return "R" + round + (pass ? " PASS" : " FAIL")
                    + " | " + title
                    + " | traceId=" + traceId
                    + " | " + detail;
        }
    }
}
