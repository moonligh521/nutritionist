package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.DialogueReply;
import com.moonligh.nutritionist.domain.dialogue.TaskType;
import com.moonligh.nutritionist.domain.recommend.RecallContext;
import com.moonligh.nutritionist.domain.recognition.ModelCompletion;
import com.moonligh.nutritionist.service.CatalogBrowse;
import com.moonligh.nutritionist.service.ClinicalRecordService;
import com.moonligh.nutritionist.service.DayMenuService;
import com.moonligh.nutritionist.service.DishRecommendService;
import com.moonligh.nutritionist.service.DishRecommendService.MatchReport;
import com.moonligh.nutritionist.service.DishRecommendService.Normalized;
import com.moonligh.nutritionist.service.DishRecommendService.Suggestion;
import com.moonligh.nutritionist.service.dialogue.DialogueOrchestrator.TurnCommand;

class DialogueOrchestratorTest {

    @Test
    void greetingDoesNotSearch() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        DialogueOrchestrator orchestrator = orchestrator(dishes, prompt -> Optional.empty(), null);

        DialogueReply reply = orchestrator.handle(command("s1", null, "你好", List.of()));

        assertEquals(List.of(TaskType.GREETING.name()), reply.plan());
        assertTrue(reply.dishes().isEmpty());
        assertTrue(reply.explanation().contains("营养食材推荐助手"));
    }

    @Test
    void recommendUsesFoodsAndKeepsSession() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        when(dishes.normalize(anyList(), anyString())).thenReturn(new Normalized(List.of("138", "580"), List.of()));
        Suggestion tomato = suggestion("7", "番茄炒蛋");
        Suggestion tofu = suggestion("8", "豆腐汤");
        when(dishes.matchIds(anyList(), anyList(), anyString(), any(RecallContext.class)))
                .thenReturn(new MatchReport(List.of(tomato, tofu), List.of(), ""));
        ModelCompletion model = prompt -> Optional.of(
                "{\"tasks\":[{\"type\":\"RECOMMEND\",\"rawFoods\":[\"番茄\",\"鸡蛋\"]}]}");
        DialogueOrchestrator orchestrator = orchestrator(dishes, model, null);

        DialogueReply first = orchestrator.handle(command("s2", null, "番茄鸡蛋做两道", List.of("番茄", "鸡蛋")));

        assertEquals(List.of("RECOMMEND"), first.plan());
        assertEquals(2, first.dishes().size());

        when(dishes.matchIds(anyList(), anyList(), anyString(), any(RecallContext.class)))
                .thenReturn(new MatchReport(List.of(suggestion("9", "青椒炒蛋"), tomato, tofu), List.of(), ""));
        ModelCompletion replaceModel = prompt -> Optional.of(
                "{\"tasks\":[{\"type\":\"REPLACE_ONE\",\"dishHint\":\"番茄炒蛋\"}]}");
        SessionMemoryStore store = new SessionMemoryStore();
        store.getOrCreate("s2").setCurrentDishes(first.dishes());
        store.getOrCreate("s2").setFoodIds(List.of("138", "580"));
        PreferenceStore preferences = new PreferenceStore();
        DialogueOrchestrator withSession = new DialogueOrchestrator(
                store,
                new IntentUnderstander(replaceModel),
                new DialoguePlanner(),
                new FoodNormalizer(dishes, catalog()),
                new DialogueExecutor(dishes, mock(DayMenuService.class), catalog()),
                new LongTermMemoryLoader(null, preferences),
                preferences);

        DialogueReply second = withSession.handle(command("s2", null, "番茄炒蛋不想吃换一个", List.of()));

        assertEquals(List.of("REPLACE_ONE"), second.plan());
        assertEquals(2, second.dishes().size());
        assertEquals("青椒炒蛋", second.dishes().getFirst().name());
        assertEquals("豆腐汤", second.dishes().get(1).name());
    }

    @Test
    void longTermLoadsConditionsAllergiesAndTasteOnce() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        ClinicalRecordService records = mock(ClinicalRecordService.class);
        when(records.conditionCodes("p1")).thenReturn(List.of("糖尿病"));
        when(records.confirmedAllergenCodes("p1")).thenReturn(List.of("虾"));
        when(records.medicationNames("p1")).thenReturn(List.of("二甲双胍"));
        when(records.latestMeasurementStopsPlanning("p1")).thenReturn(false);
        SessionMemoryStore store = new SessionMemoryStore();
        PreferenceStore preferences = new PreferenceStore();
        preferences.merge("p1", List.of("香菜"), List.of(), List.of("减肥"), List.of("川菜"));
        DialogueOrchestrator orchestrator = new DialogueOrchestrator(
                store,
                new IntentUnderstander(prompt -> Optional.of("{\"tasks\":[{\"type\":\"GREETING\"}]}")),
                new DialoguePlanner(),
                new FoodNormalizer(dishes, catalog()),
                new DialogueExecutor(dishes, mock(DayMenuService.class), catalog()),
                new LongTermMemoryLoader(records, preferences),
                preferences);

        DialogueReply reply = orchestrator.handle(command("s3", "p1", "你好", List.of()));
        assertEquals(List.of("糖尿病", "控糖"), reply.longTerm().conditions());
        assertEquals(List.of("虾"), reply.longTerm().allergens());
        assertEquals(List.of("香菜"), reply.longTerm().avoidFoods());
        assertEquals(List.of("川菜"), reply.longTerm().preferCuisines());
        assertEquals(List.of("二甲双胍"), reply.longTerm().medications());

        when(records.conditionCodes("p1")).thenReturn(List.of("应被忽略"));
        orchestrator.handle(command("s3", "p1", "你好", List.of()));
        assertEquals(List.of("糖尿病", "控糖"), store.getOrCreate("s3").longTerm().conditions());
    }

    @Test
    void absoluteAvoidAloneDoesNotEmitOutOfScopeBoilerplate() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        PreferenceStore preferences = new PreferenceStore();
        // 模型误判域外；规则旁路应写忌口并压制 OOS 话术
        DialogueOrchestrator orchestrator = new DialogueOrchestrator(
                new SessionMemoryStore(),
                new IntentUnderstander(prompt -> Optional.of(
                        "{\"tasks\":[{\"type\":\"OUT_OF_SCOPE\",\"topic\":\"闲聊\"}]}")),
                new DialoguePlanner(),
                new FoodNormalizer(dishes, catalog()),
                new DialogueExecutor(dishes, mock(DayMenuService.class), catalog()),
                new LongTermMemoryLoader(null, preferences),
                preferences);

        DialogueReply reply = orchestrator.handle(command("s-avoid", "p-avoid", "我绝对不能吃香菜", List.of()));

        assertTrue(reply.appliedEvents().stream().anyMatch(e -> e.subject().equals("香菜")));
        assertTrue(reply.preferenceEpoch() >= 1);
        assertTrue(reply.rememberedHint().contains("香菜"));
        assertTrue(reply.plan().stream().noneMatch(TaskType.OUT_OF_SCOPE.name()::equals));
        assertTrue(reply.explanation().isBlank() || !reply.explanation().contains("不能回答其他问题"));
    }

    @Test
    void memoryQueryAloneDoesNotAppendOutOfScopeBoilerplate() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        PreferenceStore preferences = new PreferenceStore();
        preferences.commit(
                "p-ask",
                new com.moonligh.nutritionist.domain.dialogue.MemoryExtraction(
                        List.of(com.moonligh.nutritionist.domain.dialogue.MemoryEvent.assertFood(
                                com.moonligh.nutritionist.domain.dialogue.PreferencePolarity.AVOID,
                                com.moonligh.nutritionist.domain.dialogue.PreferenceStrength.ABSOLUTE,
                                "香菜",
                                "绝对不")),
                        List.of(),
                        List.of(),
                        List.of(),
                        "",
                        "seed-avoid"));
        DialogueOrchestrator orchestrator = new DialogueOrchestrator(
                new SessionMemoryStore(),
                new IntentUnderstander(prompt -> Optional.of(
                        "{\"tasks\":[{\"type\":\"OUT_OF_SCOPE\",\"topic\":\"闲聊\"}]}")),
                new DialoguePlanner(),
                new FoodNormalizer(dishes, catalog()),
                new DialogueExecutor(dishes, mock(DayMenuService.class), catalog()),
                new LongTermMemoryLoader(null, preferences),
                preferences);

        DialogueReply reply = orchestrator.handle(command("s-ask", "p-ask", "我现在不喜欢什么", List.of()));

        assertTrue(reply.memoryAnswer().contains("香菜"));
        assertTrue(reply.plan().stream().noneMatch(TaskType.OUT_OF_SCOPE.name()::equals));
        assertTrue(!reply.explanation().contains("不能回答其他问题"));
    }

    @Test
    void utteranceAvoidWritesBeforeRecommendAndAnswersPast() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        when(dishes.normalize(anyList(), anyString())).thenReturn(new Normalized(List.of("1"), List.of()));
        when(dishes.matchIds(anyList(), anyList(), anyString(), any(RecallContext.class)))
                .thenReturn(new MatchReport(List.of(suggestion("1", "番茄炒蛋")), List.of(), ""));
        PreferenceStore preferences = new PreferenceStore();
        DialogueOrchestrator orchestrator = new DialogueOrchestrator(
                new SessionMemoryStore(),
                new IntentUnderstander(prompt -> Optional.of(
                        "{\"tasks\":[{\"type\":\"RECOMMEND\",\"rawFoods\":[\"番茄\"]}]}")),
                new DialoguePlanner(),
                new FoodNormalizer(dishes, catalog()),
                new DialogueExecutor(dishes, mock(DayMenuService.class), catalog()),
                new LongTermMemoryLoader(null, preferences),
                preferences);

        DialogueReply first = orchestrator.handle(command("s4", "p9", "我不吃海带帮推荐番茄", List.of("番茄")));
        assertEquals(List.of("海带"), first.longTerm().avoidFoods());
        assertTrue(first.appliedEvents().stream().anyMatch(e -> e.subject().equals("海带")));

        DialogueReply ask = orchestrator.handle(command("s4", "p9", "我以前不喜欢什么", List.of()));
        assertTrue(ask.memoryAnswer().contains("海带"));
    }

    private static TurnCommand command(String sessionId, String patientId, String text, List<String> foods) {
        return new TurnCommand(
                sessionId, patientId, text, foods, List.of(), List.of(), List.of(), List.of(), List.of(), null, List.of());
    }

    private static DialogueOrchestrator orchestrator(
            DishRecommendService dishes, ModelCompletion model, ClinicalRecordService records) {
        PreferenceStore preferences = new PreferenceStore();
        return new DialogueOrchestrator(
                new SessionMemoryStore(),
                new IntentUnderstander(model),
                new DialoguePlanner(),
                new FoodNormalizer(dishes, catalog()),
                new DialogueExecutor(dishes, mock(DayMenuService.class), catalog()),
                new LongTermMemoryLoader(records, preferences),
                preferences);
    }

    private static CatalogBrowse catalog() {
        CatalogBrowse catalog = mock(CatalogBrowse.class);
        when(catalog.snapshot(anyString())).thenReturn(new CatalogBrowse.CatalogSnapshot(List.of(), List.of()));
        return catalog;
    }

    private static Suggestion suggestion(String id, String name) {
        return new Suggestion(id, name, 100, 100, "主料都有。", "", "步骤");
    }
}
