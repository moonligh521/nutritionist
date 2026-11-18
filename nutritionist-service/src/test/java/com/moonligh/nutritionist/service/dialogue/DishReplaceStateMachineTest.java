package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.DialogueTask;
import com.moonligh.nutritionist.domain.dialogue.DishSlotStatus;
import com.moonligh.nutritionist.domain.dialogue.SessionMemory;
import com.moonligh.nutritionist.domain.recommend.RecallContext;
import com.moonligh.nutritionist.service.CatalogBrowse;
import com.moonligh.nutritionist.service.DayMenuService;
import com.moonligh.nutritionist.service.DishRecommendService;
import com.moonligh.nutritionist.service.DishRecommendService.MatchReport;
import com.moonligh.nutritionist.service.DishRecommendService.Suggestion;

class DishReplaceStateMachineTest {

    @Test
    void replaceOneMarksReplacedAndKeepsOthersValid() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        when(dishes.matchIds(anyList(), anyList(), anyString(), any(RecallContext.class)))
                .thenReturn(new MatchReport(List.of(dish("9", "青椒炒蛋")), List.of(), ""));
        when(dishes.normalize(anyList(), anyString()))
                .thenReturn(new DishRecommendService.Normalized(List.of(), List.of()));
        DialogueExecutor executor = executor(dishes);

        SessionMemory memory = new SessionMemory("s");
        memory.setFoodIds(List.of("138"));
        memory.setCurrentDishes(List.of(dish("7", "番茄炒蛋"), dish("8", "豆腐汤")));
        DialogueExecutor.RunState state = new DialogueExecutor.RunState(memory, mock(FoodNormalizer.class), List.of(), "");

        executor.run(DialogueTask.replaceOne("番茄炒蛋"), state);

        assertEquals(2, memory.currentDishes().size());
        assertEquals("青椒炒蛋", memory.currentDishes().getFirst().name());
        assertEquals(DishSlotStatus.REPLACED, memory.dishSlots().getFirst().status());
        assertEquals(DishSlotStatus.VALID, memory.dishSlots().get(1).status());
        assertTrue(state.explanation.toString().contains("换为"));
    }

    @Test
    void replaceOneNoFeasibleKeepsInvalidatedSlotAndDoesNotInventDish() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        when(dishes.matchIds(anyList(), anyList(), anyString(), any(RecallContext.class)))
                .thenReturn(new MatchReport(List.of(dish("7", "番茄炒蛋")), List.of(), ""));
        when(dishes.normalize(anyList(), anyString()))
                .thenReturn(new DishRecommendService.Normalized(List.of(), List.of()));
        DialogueExecutor executor = executor(dishes);

        SessionMemory memory = new SessionMemory("s");
        memory.setFoodIds(List.of("138"));
        memory.setCurrentDishes(List.of(dish("7", "番茄炒蛋"), dish("8", "豆腐汤")));
        DialogueExecutor.RunState state = new DialogueExecutor.RunState(memory, mock(FoodNormalizer.class), List.of(), "");

        executor.run(DialogueTask.replaceOne("番茄炒蛋"), state);

        assertEquals(DishSlotStatus.NO_FEASIBLE_REPLACEMENT, memory.dishSlots().getFirst().status());
        assertEquals(1, memory.currentDishes().size());
        assertEquals("豆腐汤", memory.currentDishes().getFirst().name());
        assertTrue(state.explanation.toString().contains("没有可替换"));
    }

    private static DialogueExecutor executor(DishRecommendService dishes) {
        CatalogBrowse catalog = mock(CatalogBrowse.class);
        when(catalog.snapshot(anyString())).thenReturn(new CatalogBrowse.CatalogSnapshot(List.of(), List.of()));
        return new DialogueExecutor(dishes, mock(DayMenuService.class), catalog);
    }

    private static Suggestion dish(String id, String name) {
        return new Suggestion(id, name, 100, 100, "ok", "", "step");
    }
}
