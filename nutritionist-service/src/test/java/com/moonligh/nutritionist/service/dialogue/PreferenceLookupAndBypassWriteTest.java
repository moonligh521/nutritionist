package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.MemoryExtraction;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.domain.dialogue.UnderstandContext;
import com.moonligh.nutritionist.domain.recommend.RecallContext;
import com.moonligh.nutritionist.domain.recognition.ModelCompletion;
import com.moonligh.nutritionist.service.CatalogBrowse;
import com.moonligh.nutritionist.service.DayMenuService;
import com.moonligh.nutritionist.service.DishRecommendService;
import com.moonligh.nutritionist.service.DishRecommendService.MatchReport;
import com.moonligh.nutritionist.service.DishRecommendService.Normalized;
import com.moonligh.nutritionist.service.DishRecommendService.Suggestion;
import com.moonligh.nutritionist.service.dialogue.DialogueOrchestrator.TurnCommand;

/** 查偏好投影 + 规则同步落库 + 旁路异步落库。 */
class PreferenceLookupAndBypassWriteTest {

    @Test
    void preferenceLookupHydratesLongTermForAskMeal() {
        PreferenceStore preferences = new PreferenceStore();
        preferences.merge("p-lookup", List.of("海带"), List.of(), List.of("清淡"), List.of("川菜"));
        SessionMemoryStore sessions = new SessionMemoryStore();
        DialogueOrchestrator orchestrator = orchestrator(sessions, preferences, prompt -> Optional.of(
                "{\"tasks\":[{\"type\":\"GREETING\",\"confidence\":0.99}]}"));

        var reply = orchestrator.handle(command("s-lookup", "p-lookup", "你好", List.of()));

        assertEquals(List.of("海带"), reply.longTerm().avoidFoods());
        assertEquals(List.of("川菜"), reply.longTerm().preferCuisines());
        assertEquals(List.of("清淡"), reply.longTerm().preferTags());

        UnderstandContext pack = new UnderstandContextPacker().pack(sessions.getOrCreate("s-lookup"), command(
                "s-lookup", "p-lookup", "推荐点菜", List.of("番茄")));
        assertEquals(List.of("海带"), pack.preference().avoidFoods());
        assertTrue(IntentUnderstander.prompt(pack).contains("海带"));
        assertTrue(IntentUnderstander.prompt(pack).contains("川菜"));
    }

    @Test
    void syncRulesCommitAvoidBeforeUnderstand() {
        PreferenceStore preferences = new PreferenceStore();
        SessionMemoryStore sessions = new SessionMemoryStore();
        DishRecommendService dishes = mockDishes();
        DialogueOrchestrator orchestrator = new DialogueOrchestrator(
                sessions,
                new IntentUnderstander(prompt -> Optional.of(
                        "{\"tasks\":[{\"type\":\"RECOMMEND\",\"rawFoods\":[\"番茄\"],\"confidence\":0.9}]}")),
                new DialoguePlanner(),
                new FoodNormalizer(dishes, catalog()),
                new DialogueExecutor(dishes, mock(DayMenuService.class), catalog()),
                new LongTermMemoryLoader(null, preferences),
                preferences);

        var reply = orchestrator.handle(command("s-sync", "p-sync", "我不吃海带帮推荐番茄", List.of("番茄")));

        assertTrue(reply.plan().contains("RECOMMEND") || !reply.dishes().isEmpty() || reply.plan().contains("CLARIFY")
                || reply.plan().contains("RECOMMEND"));
        assertEquals(List.of("海带"), preferences.snapshot("p-sync").avoidFoods());
        assertEquals(List.of("海带"), reply.longTerm().avoidFoods());
        assertFalse(reply.appliedEvents().isEmpty());
        assertEquals(PreferencePolarity.AVOID, reply.appliedEvents().getFirst().polarity());
    }

    @Test
    void bypassAsyncWriteCommitsRulesOnlyWhenNoModel() {
        PreferenceStore preferences = new PreferenceStore();
        MemoryExtraction extracted = new MemoryExtractor(null).extract("我不吃海带帮推荐");
        assertFalse(extracted.events().isEmpty(), "extractor should see 海带");
        AsyncMemoryWriter writer = new AsyncMemoryWriter(
                new MemoryExtractor(null), preferences, new AllergySuspectStore());
        writer.writeQuietly("p-rules", "我不吃海带帮推荐");
        assertEquals(List.of("海带"), preferences.snapshot("p-rules").avoidFoods());
    }

    @Test
    void bypassAsyncWriteCommitsAbsoluteAvoidFromRules() {
        PreferenceStore preferences = new PreferenceStore();
        AsyncMemoryWriter writer = new AsyncMemoryWriter(
                new MemoryExtractor(null), preferences, new AllergySuspectStore());
        writer.writeQuietly("p-abs", "我绝对不能吃香菜");
        assertEquals(List.of("香菜"), preferences.snapshot("p-abs").absoluteAvoidFoods());
        assertEquals(PreferenceStrength.ABSOLUTE, preferences.snapshot("p-abs").current().getFirst().strength());
    }

    @Test
    void bypassAsyncWriteWithModelEnrichmentCommits() {
        PreferenceStore preferences = new PreferenceStore();
        AtomicInteger modelCalls = new AtomicInteger();
        ModelCompletion model = prompt -> {
            modelCalls.incrementAndGet();
            return Optional.of("""
                    {"events":[{"op":"ASSERT","subject":"洋葱","subjectType":"FOOD",
                    "polarity":"AVOID","strength":"MODERATE","scope":"PERMANENT",
                    "evidence":"不喜欢洋葱","confidence":0.9}],
                    "queries":[],"turnOnlyHints":[],"allergySuspects":[],
                    "needsDisambiguation":"","eventId":"async-onion"}
                    """);
        };
        AsyncMemoryWriter writer = new AsyncMemoryWriter(
                new MemoryExtractor(model), preferences, new AllergySuspectStore());
        // 「讨厌」不在规则模板 → 走模型
        writer.writeQuietly("p-model", "我讨厌洋葱");
        assertEquals(1, modelCalls.get());
        assertEquals(List.of("洋葱"), preferences.snapshot("p-model").avoidFoods());
    }

    @Test
    void bypassAsyncWriteFailureDoesNotThrowAndDoesNotCorruptStore() {
        PreferenceStore preferences = new PreferenceStore();
        preferences.merge("p-keep", List.of("海带"), List.of(), List.of(), List.of());
        ModelCompletion boom = prompt -> {
            throw new RuntimeException("model down");
        };
        AsyncMemoryWriter writer = new AsyncMemoryWriter(
                new MemoryExtractor(boom), preferences, new AllergySuspectStore());

        writer.writeQuietly("p-keep", "随便说点偏好");
        writer.submit("p-keep", "再来一句");

        assertEquals(List.of("海带"), preferences.snapshot("p-keep").avoidFoods());
    }

    @Test
    void loaderOwnerAndPatientSharePreferenceStore() {
        PreferenceStore preferences = new PreferenceStore();
        preferences.merge("p1", List.of("香菜"), List.of(), List.of(), List.of("粤菜"));
        LongTermMemoryLoader loader = new LongTermMemoryLoader(null, preferences);

        LongTermMemory patient = loader.loadPatient("p1");
        LongTermMemory owner = loader.loadOwner("p1");
        LongTermMemory sessionOwner = loader.loadOwner("session:s1");

        assertEquals(List.of("香菜"), patient.avoidFoods());
        assertEquals(List.of("粤菜"), patient.preferCuisines());
        assertEquals(List.of("香菜"), owner.avoidFoods());
        assertTrue(sessionOwner.isEmpty() || sessionOwner.avoidFoods().isEmpty());
    }

    private static DialogueOrchestrator orchestrator(
            SessionMemoryStore sessions, PreferenceStore preferences, ModelCompletion model) {
        DishRecommendService dishes = mockDishes();
        return new DialogueOrchestrator(
                sessions,
                new IntentUnderstander(model),
                new DialoguePlanner(),
                new FoodNormalizer(dishes, catalog()),
                new DialogueExecutor(dishes, mock(DayMenuService.class), catalog()),
                new LongTermMemoryLoader(null, preferences),
                preferences);
    }

    private static DishRecommendService mockDishes() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        when(dishes.normalize(anyList(), anyString())).thenReturn(new Normalized(List.of("138"), List.of()));
        when(dishes.matchIds(anyList(), anyList(), anyString(), any(RecallContext.class)))
                .thenReturn(new MatchReport(List.of(new Suggestion("7", "番茄炒蛋", 100, 100, "有。", "", "步")), List.of(), ""));
        return dishes;
    }

    private static CatalogBrowse catalog() {
        CatalogBrowse catalog = mock(CatalogBrowse.class);
        when(catalog.snapshot(anyString())).thenReturn(new CatalogBrowse.CatalogSnapshot(List.of(), List.of()));
        return catalog;
    }

    private static TurnCommand command(String sessionId, String patientId, String text, List<String> foods) {
        return new TurnCommand(
                sessionId, patientId, text, foods, List.of(), List.of(), List.of(), List.of(), List.of(), null, List.of());
    }
}
