package com.moonligh.nutritionist.service.dialogue;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.observability.AgentSpan;
import com.moonligh.consult.framework.observability.AgentTrace;
import com.moonligh.consult.framework.observability.AgentTraceContext;
import com.moonligh.nutritionist.domain.dialogue.AppliedMemoryWrite;
import com.moonligh.nutritionist.domain.dialogue.DialoguePhase;
import com.moonligh.nutritionist.domain.dialogue.DialogueReply;
import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.MemoryEvent;
import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.domain.dialogue.MemoryOp;
import com.moonligh.nutritionist.domain.dialogue.MemoryQuery;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.domain.dialogue.SessionMemory;
import com.moonligh.nutritionist.domain.dialogue.SubjectType;
import com.moonligh.nutritionist.domain.dialogue.TaskType;
import com.moonligh.nutritionist.domain.dialogue.IntentAmbiguity;
import com.moonligh.nutritionist.domain.dialogue.TurnConstraints;
import com.moonligh.nutritionist.domain.dialogue.TurnIntent;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext;
import com.moonligh.nutritionist.observability.NutritionTraceNames;
import com.moonligh.nutritionist.service.IngredientAgent.Profile;
import com.moonligh.nutritionist.service.dialogue.AllergySuspectStore.Suspect;

/**
 * 问餐同步链：偏好投影 → 规则同步写 → 理解（唯一同步文本模型）→ 规划执行。
 * 记忆模型抽取走 {@link AsyncMemoryWriter}，失败不影响荐菜。
 */
@Service
public class DialogueOrchestrator {

    private final SessionMemoryStore sessions;
    private final IntentUnderstander understander;
    private final DialoguePlanner planner;
    private final FoodNormalizer normalizer;
    private final DialogueExecutor executor;
    private final LongTermMemoryLoader longTermLoader;
    private final PreferenceStore preferences;
    private final MemoryExtractor memoryExtractor;
    private final MemoryAnswerer memoryAnswerer;
    private final MemoryWriteValidator memoryWriteValidator;
    private final AllergySuspectStore allergySuspects;
    private final AsyncMemoryWriter asyncMemoryWriter;
    private final UnderstandContextPacker contextPacker;
    private final MemoryMetrics metrics;
    private final AgentTrace agentTrace;

    @Autowired
    public DialogueOrchestrator(
            SessionMemoryStore sessions,
            IntentUnderstander understander,
            DialoguePlanner planner,
            FoodNormalizer normalizer,
            DialogueExecutor executor,
            LongTermMemoryLoader longTermLoader,
            PreferenceStore preferences,
            MemoryExtractor memoryExtractor,
            MemoryAnswerer memoryAnswerer,
            MemoryWriteValidator memoryWriteValidator,
            AllergySuspectStore allergySuspects,
            AsyncMemoryWriter asyncMemoryWriter,
            UnderstandContextPacker contextPacker,
            MemoryMetrics metrics,
            ObjectProvider<AgentTrace> agentTrace) {
        this.sessions = sessions;
        this.understander = understander;
        this.planner = planner;
        this.normalizer = normalizer;
        this.executor = executor;
        this.longTermLoader = longTermLoader;
        this.preferences = preferences;
        this.memoryExtractor = memoryExtractor;
        this.memoryAnswerer = memoryAnswerer;
        this.memoryWriteValidator = memoryWriteValidator;
        this.allergySuspects = allergySuspects;
        this.asyncMemoryWriter = asyncMemoryWriter;
        this.contextPacker = contextPacker == null ? new UnderstandContextPacker() : contextPacker;
        this.metrics = metrics == null ? new MemoryMetrics() : metrics;
        this.agentTrace = agentTrace == null ? AgentTrace.NOOP : agentTrace.getIfAvailable(() -> AgentTrace.NOOP);
    }

    /** 单测：最小依赖。 */
    public DialogueOrchestrator(
            SessionMemoryStore sessions,
            IntentUnderstander understander,
            DialoguePlanner planner,
            FoodNormalizer normalizer,
            DialogueExecutor executor,
            LongTermMemoryLoader longTermLoader,
            PreferenceStore preferences) {
        this(
                sessions,
                understander,
                planner,
                normalizer,
                executor,
                longTermLoader,
                preferences,
                new MemoryExtractor(null),
                new MemoryAnswerer(preferences),
                new MemoryWriteValidator(),
                new AllergySuspectStore(),
                new AsyncMemoryWriter(new MemoryExtractor(null), preferences, new AllergySuspectStore()),
                new UnderstandContextPacker(),
                new MemoryMetrics(),
                null);
    }

    public DialogueReply handle(TurnCommand command) {
        SessionMemory memory = sessions.getOrCreate(command.sessionId());
        agentTrace.bind(new AgentTraceContext(
                memory.sessionId(),
                null,
                memory.revision(),
                null,
                null,
                null,
                memory.memoryOwnerId()));
        try (AgentSpan turn = agentTrace.span(NutritionTraceNames.TURN);
                AgentSpan askMeal = agentTrace.span(NutritionTraceNames.ASK_MEAL)) {
            turn.attr("session_id", memory.sessionId())
                    .attr("owner_id", memory.memoryOwnerId())
                    .attr("has_text", command.text() != null && !command.text().isBlank())
                    .attr("food_count", command.foods() == null ? 0 : command.foods().size());
            askMeal.attr("session_id", memory.sessionId());

            int expired = preferences.expireDue(null);
            if (expired > 0) {
                metrics.markExpiry(expired);
                turn.attr("expired_prefs", expired);
            }

            if (command.profile() != null) {
                memory.setProfile(command.profile());
            }
            applyConfirmations(memory, command.confirmations());
            bindOwner(memory, command);
            applyRequestTaste(memory, command);
            memory.clearTurnConstraints();

            // 1) 同步只读偏好投影（无 LLM）
            try (AgentSpan refresh = agentTrace.span(NutritionTraceNames.MEMORY_REFRESH)) {
                boolean force = hasRequestTaste(command);
                refreshLongTerm(memory, command, force);
                refresh.attr("force", force)
                        .attr("ltm_version", memory.longTerm().version())
                        .attr("prefer_cuisines", String.join(",", memory.longTerm().preferCuisines()))
                        .attr("prefer_tags", String.join(",", memory.longTerm().preferTags()))
                        .attr("conditions", String.join(",", memory.longTerm().conditions()));
            }

            // 2) 同步规则写（无 LLM）；模型抽取异步
            AppliedMemoryWrite write = AppliedMemoryWrite.none();
            MemoryExtraction rules = memoryWriteValidator.validate(memoryExtractor.extractRulesOnly(command.text()));
            if (!rules.events().isEmpty()) {
                try (AgentSpan commit = agentTrace.span(NutritionTraceNames.MEMORY_COMMIT)) {
                    write = preferences.commit(memory.memoryOwnerId(), rules);
                    commit.attr("rules_only", true)
                            .attr("committed", write.committed())
                            .attr("applied_count", write.appliedEvents().size())
                            .attr("preference_epoch", write.preferenceEpoch());
                    if (write.committed()) {
                        metrics.markCommit();
                        if (rules.events().stream().anyMatch(e -> e.op() == com.moonligh.nutritionist.domain.dialogue.MemoryOp.RETRACT)) {
                            metrics.markRetract();
                        }
                        refreshLongTerm(memory, command, true);
                    }
                }
            }
            if (!rules.allergySuspects().isEmpty()) {
                allergySuspects.addAll(
                        memory.memoryOwnerId(),
                        rules.allergySuspects(),
                        command.text() == null ? "" : command.text());
            }
            if (!rules.turnOnlyHints().isEmpty()) {
                memory.setTurnHints(String.join(" ", rules.turnOnlyHints()));
            }
            applyRuleTurnAvoids(memory, rules);
            asyncMemoryWriter.submit(memory.memoryOwnerId(), command.text());

            // 3) 同步语义理解（唯一文本模型）
            TurnIntent intent;
            try (AgentSpan understand = agentTrace.span(NutritionTraceNames.UNDERSTAND)) {
                UnderstandContext pack = contextPacker.pack(memory, command);
                intent = understander.interpret(pack);
                understand.attr("task_count", intent.tasks().size())
                        .attr("has_constraints", !intent.constraints().isEmpty())
                        .attr("query_count", intent.memoryQueries().size())
                        .attr("clarify", intent.needsClarify())
                        .attr("degraded", intent.degraded())
                        .attr("current_dishes", pack.currentDishes().stream()
                                .map(d -> d.name())
                                .reduce((a, b) -> a + "," + b)
                                .orElse(""));
            }
            applyTurnConstraints(memory, intent.constraints());

            String memoryAnswer = "";
            List<MemoryQuery> queries = intent.memoryQueries().isEmpty() ? rules.queries() : intent.memoryQueries();
            if (!queries.isEmpty()) {
                metrics.markQuery();
                try (AgentSpan answer = agentTrace.span(NutritionTraceNames.MEMORY_ANSWER)) {
                    memoryAnswer = memoryAnswerer.answer(memory.memoryOwnerId(), queries);
                    answer.attr("answered", !memoryAnswer.isBlank());
                }
            }

            if (intent.needsClarify()) {
                String clarify = clarifyText(intent.ambiguities());
                if (!memoryAnswer.isBlank()) {
                    clarify = memoryAnswer + "\n" + clarify;
                }
                try (AgentSpan save = agentTrace.span(NutritionTraceNames.SESSION_SAVE)) {
                    sessions.save(memory);
                }
                return new DialogueReply(
                        memory.sessionId(),
                        List.of("CLARIFY"),
                        memory.currentDishes(),
                        List.of(),
                        List.of(),
                        List.of(),
                        "",
                        null,
                        clarify,
                        List.of(),
                        memory.longTerm(),
                        memory.revision(),
                        memoryAnswer,
                        write.appliedEvents(),
                        memory.preferenceEpoch(),
                        memory.dishSlots(),
                        allergySuspects.pending(memory.memoryOwnerId()),
                        memory.phase().name(),
                        memory.lastEmptyReason(),
                        memory.guideActions(),
                        0,
                        rememberedHint(write));
            }

            List<DialogueTask> understood = suppressOutOfScopeWhenMemoryHandled(
                    intent.tasks(), write, memoryAnswer);
            List<String> rawForNormalize = collectRawFoods(understood, command.foods());
            FoodNormalizer.Result preNorm = rawForNormalize.isEmpty()
                    ? new FoodNormalizer.Result(List.of(), List.of(), List.of(), List.of())
                    : normalizer.normalize(rawForNormalize, memory);

            List<DialogueTask> plan;
            try (AgentSpan planSpan = agentTrace.span(NutritionTraceNames.PLAN)) {
                plan = planner.plan(
                        understood,
                        preNorm,
                        DialoguePlanner.PlanContext.of(
                                memory.phase(),
                                !memory.currentDishes().isEmpty(),
                                command.text(),
                                memory.longTerm().measurementStopsPlanning()));
                planSpan.attr("phase", memory.phase().name())
                        .attr("plan", plan.stream().map(t -> t.type().name()).reduce((a, b) -> a + "," + b).orElse(""));
            }
            if (memory.turnHints().isBlank()) {
                memory.setTurnHints(command.text() == null ? "" : command.text());
            }
            DialogueExecutor.RunState state = new DialogueExecutor.RunState(
                    memory, normalizer, command.foods(), command.text());
            if (!preNorm.autoCorrections().isEmpty()) {
                state.corrections.addAll(preNorm.autoCorrections());
            }
            try (AgentSpan execute = agentTrace.span(NutritionTraceNames.EXECUTE)) {
                for (DialogueTask task : plan) {
                    executor.run(task, state);
                    if (task.type() == TaskType.CONFIRM_FOODS
                            && plan.stream().noneMatch(item -> item.type() != TaskType.CONFIRM_FOODS
                                    && item.type() != TaskType.GREETING
                                    && item.type() != TaskType.OUT_OF_SCOPE)) {
                        break;
                    }
                }
                execute.attr("executed", String.join(",", state.plan))
                        .attr("dish_count", memory.currentDishes().size())
                        .attr("fallback", state.fallback);
            }

            if (write.committed() && hasAbsoluteAvoid(write.appliedEvents()) && !memory.dishSlots().isEmpty()) {
                executor.autoReplaceHitByAbsoluteAvoid(state);
                metrics.markAutoReplace();
                turn.attr("auto_replace", true);
            }

            List<Suspect> pendingAllergy = allergySuspects.pending(memory.memoryOwnerId());
            String explanation = state.explanation.toString();
            if (!memoryAnswer.isBlank()) {
                explanation = memoryAnswer + (explanation.isBlank() ? "" : "\n" + explanation);
            }
            if (!pendingAllergy.isEmpty()) {
                String names = pendingAllergy.stream().map(Suspect::subject).reduce((a, b) -> a + "、" + b).orElse("");
                explanation = (explanation.isBlank() ? "" : explanation + "\n")
                        + "疑似过敏「" + names + "」仅作待确认，不会自动当成临床过敏过滤。";
            }
            advancePhase(memory, state);
            try (AgentSpan save = agentTrace.span(NutritionTraceNames.SESSION_SAVE)) {
                sessions.save(memory);
                save.attr("revision", memory.revision())
                        .attr("preference_epoch", memory.preferenceEpoch())
                        .attr("phase", memory.phase().name());
            }

            turn.attr("plan", String.join(",", state.plan))
                    .attr("dish_count", memory.currentDishes().size())
                    .attr("memory_committed", write.committed())
                    .attr("phase", memory.phase().name())
                    .attr("trace_id", agentTrace.currentTraceId());

            return new DialogueReply(
                    memory.sessionId(),
                    List.copyOf(state.plan),
                    memory.currentDishes(),
                    List.copyOf(state.needConfirm),
                    List.copyOf(state.corrections),
                    distinct(state.unrecognized),
                    state.fallback,
                    state.day,
                    explanation,
                    List.of(),
                    memory.longTerm(),
                    memory.revision(),
                    memoryAnswer,
                    write.appliedEvents(),
                    memory.preferenceEpoch(),
                    memory.dishSlots(),
                    pendingAllergy,
                    memory.phase().name(),
                    state.emptyReason.isBlank() ? memory.lastEmptyReason() : state.emptyReason,
                    memory.guideActions(),
                    state.degradeStep,
                    rememberedHint(write));
        } finally {
            agentTrace.clear();
        }
    }

    /**
     * 偏好旁路已处理时，去掉唯一/掺杂的 OUT_OF_SCOPE，避免域外自我介绍盖住忌口确认与记忆问答。
     * 仍保留真正的选菜任务（若同句既忌口又荐菜）。
     */
    static List<DialogueTask> suppressOutOfScopeWhenMemoryHandled(
            List<DialogueTask> tasks, AppliedMemoryWrite write, String memoryAnswer) {
        List<DialogueTask> source = tasks == null ? List.of() : tasks;
        boolean memoryHandled = (write != null && write.committed() && !write.appliedEvents().isEmpty())
                || (memoryAnswer != null && !memoryAnswer.isBlank());
        if (!memoryHandled) {
            return source;
        }
        List<DialogueTask> kept = new ArrayList<>();
        for (DialogueTask task : source) {
            if (task != null && task.type() != TaskType.OUT_OF_SCOPE) {
                kept.add(task);
            }
        }
        return kept;
    }

    private static String rememberedHint(AppliedMemoryWrite write) {
        if (write == null || !write.committed() || write.appliedEvents().isEmpty()) {
            return "";
        }
        String avoids = write.appliedEvents().stream()
                .filter(e -> e.op() != MemoryOp.RETRACT)
                .filter(e -> e.subjectType() == SubjectType.FOOD && e.polarity() == PreferencePolarity.AVOID)
                .map(MemoryEvent::subject)
                .distinct()
                .reduce((a, b) -> a + "、" + b)
                .orElse("");
        if (!avoids.isBlank()) {
            return "已记住忌口「" + avoids + "」，下一轮起生效过滤。";
        }
        String retracted = write.appliedEvents().stream()
                .filter(e -> e.op() == MemoryOp.RETRACT && e.subjectType() == SubjectType.FOOD)
                .map(MemoryEvent::subject)
                .filter(s -> s != null && !s.isBlank())
                .distinct()
                .reduce((a, b) -> a + "、" + b)
                .orElse("");
        if (retracted.isBlank()) {
            return "";
        }
        return "已按你的改口撤销「" + retracted + "」的忌口。";
    }

    private static void advancePhase(SessionMemory memory, DialogueExecutor.RunState state) {
        if (memory.longTerm().measurementStopsPlanning()) {
            memory.setPhase(DialoguePhase.BLOCKED);
            return;
        }
        if (!state.needConfirm.isEmpty()) {
            memory.setPhase(DialoguePhase.CONFIRMING);
            return;
        }
        // EMPTY_GUIDE 优先：即使仍有残留菜也不回 RECOMMENDED（applyEmptyGuide 会清菜）。
        if (memory.phase() == DialoguePhase.EMPTY_GUIDE) {
            return;
        }
        if (!memory.currentDishes().isEmpty()) {
            boolean adjusting = state.plan.contains("REPLACE_ONE")
                    || state.plan.contains("ADD_KIND")
                    || state.plan.contains("MISSING")
                    || state.plan.contains("SUBSTITUTE");
            memory.setPhase(adjusting ? DialoguePhase.ADJUSTING : DialoguePhase.RECOMMENDED);
            memory.clearEmptyGuide();
            return;
        }
        if (memory.phase() != DialoguePhase.EMPTY_GUIDE) {
            memory.setPhase(DialoguePhase.IDLE);
        }
    }

    private static void applyRuleTurnAvoids(SessionMemory memory, MemoryExtraction rules) {
        if (rules == null || rules.events().isEmpty()) {
            return;
        }
        List<String> absolute = new ArrayList<>(memory.turnAbsoluteAvoidFoods());
        List<String> soft = new ArrayList<>(memory.turnAvoidFoods());
        for (MemoryEvent event : rules.events()) {
            if (event.subjectType() != SubjectType.FOOD || event.polarity() != PreferencePolarity.AVOID) {
                continue;
            }
            if (event.strength() == PreferenceStrength.ABSOLUTE) {
                absolute.add(event.subject());
            } else {
                soft.add(event.subject());
            }
        }
        memory.setTurnConstraints(absolute, soft);
    }

    private static void applyTurnConstraints(SessionMemory memory, TurnConstraints constraints) {
        if (constraints == null || constraints.isEmpty()) {
            return;
        }
        List<String> absolute = new ArrayList<>(memory.turnAbsoluteAvoidFoods());
        absolute.addAll(constraints.absoluteAvoidFoods());
        List<String> soft = new ArrayList<>(memory.turnAvoidFoods());
        soft.addAll(constraints.avoidFoods());
        memory.setTurnConstraints(absolute, soft);

        StringBuilder hints = new StringBuilder(memory.turnHints());
        if (!constraints.cuisine().isBlank()) {
            appendHint(hints, constraints.cuisine());
        }
        if (!constraints.kind().isBlank()) {
            appendHint(hints, constraints.kind());
        }
        for (String tag : constraints.preferTags()) {
            appendHint(hints, tag);
        }
        for (String hint : constraints.turnHints()) {
            appendHint(hints, hint);
        }
        if (!hints.isEmpty()) {
            memory.setTurnHints(hints.toString());
        }
    }

    private static void appendHint(StringBuilder hints, String value) {
        if (value == null || value.isBlank()) {
            return;
        }
        if (!hints.isEmpty()) {
            hints.append(' ');
        }
        hints.append(value.trim());
    }

    private static boolean hasAbsoluteAvoid(List<MemoryEvent> events) {
        if (events == null) {
            return false;
        }
        for (MemoryEvent event : events) {
            if (event.subjectType() == SubjectType.FOOD
                    && event.polarity() == PreferencePolarity.AVOID
                    && event.strength() == PreferenceStrength.ABSOLUTE) {
                return true;
            }
        }
        return false;
    }

    private void bindOwner(SessionMemory memory, TurnCommand command) {
        if (command.patientId() != null && !command.patientId().isBlank()) {
            memory.setPatientId(command.patientId());
        }
    }

    /** 请求体口味字段兼容入口；正文抽取走 commit。 */
    private void applyRequestTaste(SessionMemory memory, TurnCommand command) {
        if (!hasRequestTaste(command)) {
            return;
        }
        preferences.merge(
                memory.memoryOwnerId(),
                command.avoidFoods(),
                List.of(),
                command.preferTags(),
                command.preferCuisines());
    }

    /**
     * writeBarrier：仅当 force（commit 成功或客户端口味字段）时重载权威投影。
     * 否则沿用会话快照；但 preferenceEpoch 落后时仍强制重载。
     */
    private void refreshLongTerm(SessionMemory memory, TurnCommand command, boolean force) {
        String owner = memory.memoryOwnerId();
        if (command.patientId() != null && !command.patientId().isBlank()) {
            LongTermMemory loaded = longTermLoader.loadPatient(command.patientId());
            boolean epochBehind = loaded.preferenceEpoch() > memory.preferenceEpoch();
            String version = "patient:" + command.patientId().trim();
            if (!memory.hasLongTerm(version) || force || epochBehind) {
                memory.setLongTerm(loaded);
            }
            return;
        }
        if (force || memory.longTerm().isEmpty() || "request".equals(memory.longTerm().version())) {
            LongTermMemory fromOwner = longTermLoader.loadOwner(owner);
            if (!fromOwner.isEmpty() || force) {
                memory.setLongTerm(fromOwner);
                return;
            }
            LongTermMemory fromRequest = longTermLoader.fromRequest(
                    command.conditions(),
                    command.allergens(),
                    command.avoidFoods(),
                    command.preferTags(),
                    command.preferCuisines());
            if (!fromRequest.isEmpty()) {
                memory.setLongTerm(fromRequest);
            }
        }
    }

    private static boolean hasRequestTaste(TurnCommand command) {
        return hasItems(command.avoidFoods())
                || hasItems(command.preferTags())
                || hasItems(command.preferCuisines());
    }

    private static boolean hasItems(List<String> values) {
        return values != null && values.stream().anyMatch(v -> v != null && !v.isBlank());
    }

    private static void applyConfirmations(SessionMemory memory, List<FoodConfirmation> confirmations) {
        if (confirmations == null) {
            return;
        }
        for (FoodConfirmation item : confirmations) {
            if (item != null && item.raw() != null && item.chosen() != null) {
                memory.rememberCorrection(item.raw(), item.chosen());
            }
        }
    }

    private static List<String> collectRawFoods(List<DialogueTask> tasks, List<String> requestFoods) {
        LinkedHashSet<String> raw = new LinkedHashSet<>();
        if (requestFoods != null) {
            requestFoods.stream().filter(f -> f != null && !f.isBlank()).forEach(raw::add);
        }
        for (DialogueTask task : tasks) {
            if (task.type() == TaskType.RECOMMEND) {
                raw.addAll(task.rawFoods());
            }
        }
        return List.copyOf(raw);
    }

    private static List<String> distinct(List<String> values) {
        return List.copyOf(new LinkedHashSet<>(values));
    }

    private static String clarifyText(List<IntentAmbiguity> ambiguities) {
        if (ambiguities == null || ambiguities.isEmpty()) {
            return "请再具体说一下你的选菜需求。";
        }
        StringBuilder text = new StringBuilder();
        for (IntentAmbiguity item : ambiguities) {
            if (item == null) {
                continue;
            }
            if (!text.isEmpty()) {
                text.append('\n');
            }
            if (!item.ask().isBlank()) {
                text.append(item.ask());
            } else {
                text.append("请确认一下。");
            }
            if (!item.options().isEmpty()) {
                text.append(' ').append(String.join(" / ", item.options()));
            }
        }
        return text.toString();
    }

    public record FoodConfirmation(String raw, String chosen) {
    }

    public record TurnCommand(
            String sessionId,
            String patientId,
            String text,
            List<String> foods,
            List<String> conditions,
            List<String> allergens,
            List<String> avoidFoods,
            List<String> preferTags,
            List<String> preferCuisines,
            Profile profile,
            List<FoodConfirmation> confirmations) {
    }
}
