package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.SessionMemory;
import com.moonligh.nutritionist.domain.recommend.RecallContext;
import com.moonligh.nutritionist.service.CatalogBrowse;
import com.moonligh.nutritionist.service.DayMenuService;
import com.moonligh.nutritionist.service.DishRecommendService;
import com.moonligh.nutritionist.service.DishRecommendService.MatchReport;
import com.moonligh.nutritionist.service.DishRecommendService.Suggestion;

class DialogueExecutorDedupTest {

    @Test
    void uniqueByIdKeepsFirst() {
        Suggestion a = dish("1", "A");
        Suggestion dup = dish("1", "A2");
        Suggestion b = dish("2", "B");
        assertEquals(List.of("1", "2"), DialogueExecutor.uniqueById(List.of(a, dup, b)).stream().map(Suggestion::id).toList());
    }

    @Test
    void recommendWithNoFoodsClearsPriorDishesAndSetsEmptyGuide() {
        FoodNormalizer normalizer = mock(FoodNormalizer.class);
        when(normalizer.normalize(anyList(), any()))
                .thenReturn(new FoodNormalizer.Result(List.of(), List.of(), List.of(), List.of()));
        DialogueExecutor executor = new DialogueExecutor(
                mock(DishRecommendService.class), mock(DayMenuService.class), mock(CatalogBrowse.class));

        SessionMemory memory = new SessionMemory("s");
        memory.setCurrentDishes(List.of(dish("1", "水煮蛋"), dish("2", "番茄炒蛋")));
        DialogueExecutor.RunState state =
                new DialogueExecutor.RunState(memory, normalizer, List.of(), "帮我推荐");

        executor.run(DialogueTask.recommend(List.of()), state);

        assertEquals(com.moonligh.nutritionist.domain.dialogue.DialoguePhase.EMPTY_GUIDE, memory.phase());
        assertEquals(List.of(), memory.currentDishes());
        assertEquals(List.of("ADD_FOODS"), memory.guideActions());
        assertEquals(true, state.explanation.toString().contains("没有识别到可用食材"));
    }

    @Test
    void addKindDoesNotDropExistingWhenAlreadyThree() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        when(dishes.matchIds(anyList(), anyList(), anyString(), any(RecallContext.class)))
                .thenReturn(new MatchReport(List.of(dish("4", "紫菜汤")), List.of(), ""));
        CatalogBrowse catalog = mock(CatalogBrowse.class);
        when(catalog.snapshot(anyString())).thenReturn(new CatalogBrowse.CatalogSnapshot(List.of(), List.of()));
        DialogueExecutor executor = new DialogueExecutor(dishes, mock(DayMenuService.class), catalog);

        SessionMemory memory = new SessionMemory("s");
        memory.setFoodIds(List.of("138"));
        memory.setCurrentDishes(List.of(dish("1", "菜一"), dish("2", "菜二"), dish("3", "菜三")));
        DialogueExecutor.RunState state = new DialogueExecutor.RunState(memory, mock(FoodNormalizer.class), List.of(), "");

        executor.run(DialogueTask.addKind("汤"), state);

        assertEquals(4, memory.currentDishes().size());
        assertEquals(List.of("1", "2", "3", "4"), memory.currentDishes().stream().map(Suggestion::id).toList());
        assertEquals(true, state.explanation.toString().contains("原有菜保留"));
    }

    private static Suggestion dish(String id, String name) {
        return new Suggestion(id, name, 100, 100, "ok", "", "step");
    }
}
