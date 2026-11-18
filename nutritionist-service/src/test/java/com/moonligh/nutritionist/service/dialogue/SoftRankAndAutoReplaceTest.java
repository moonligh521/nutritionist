package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.math.BigDecimal;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.DishSlotStatus;
import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.PreferenceItem;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceScope;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.domain.dialogue.SessionMemory;
import com.moonligh.nutritionist.domain.dialogue.SubjectType;
import com.moonligh.nutritionist.domain.recommend.RecallContext;
import com.moonligh.nutritionist.service.CatalogBrowse;
import com.moonligh.nutritionist.service.CatalogBrowse.IngredientView;
import com.moonligh.nutritionist.service.CatalogBrowse.NutritionView;
import com.moonligh.nutritionist.service.CatalogBrowse.RecipeView;
import com.moonligh.nutritionist.service.DayMenuService;
import com.moonligh.nutritionist.service.DishRecommendService;
import com.moonligh.nutritionist.service.DishRecommendService.MatchReport;
import com.moonligh.nutritionist.service.DishRecommendService.Suggestion;

class SoftRankAndAutoReplaceTest {

    @Test
    void softRankPutsLikedDishFirstWithoutDroppingAvoidModerate() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        when(dishes.normalize(anyList(), anyString()))
                .thenReturn(new DishRecommendService.Normalized(List.of(), List.of()));
        when(dishes.matchIds(anyList(), anyList(), anyString(), any(RecallContext.class)))
                .thenReturn(new MatchReport(List.of(dish("1", "海带汤"), dish("2", "娃娃菜")), List.of(), ""));

        CatalogBrowse catalog = mock(CatalogBrowse.class);
        when(catalog.snapshot(anyString())).thenReturn(new CatalogBrowse.CatalogSnapshot(
                List.of(),
                List.of(
                        recipe("1", "海带汤", "海带"),
                        recipe("2", "娃娃菜", "娃娃菜"))));

        DialogueExecutor executor = new DialogueExecutor(dishes, mock(DayMenuService.class), catalog);
        SessionMemory memory = new SessionMemory("s");
        memory.setFoodIds(List.of("1", "2"));
        memory.setLongTerm(new LongTermMemory(
                "t",
                List.of(),
                List.of(),
                List.of(),
                false,
                List.of(
                        new PreferenceItem("海带", SubjectType.FOOD, PreferencePolarity.AVOID, PreferenceStrength.MODERATE, PreferenceScope.PERMANENT),
                        new PreferenceItem("娃娃菜", SubjectType.FOOD, PreferencePolarity.LIKE, PreferenceStrength.STRONG, PreferenceScope.PERMANENT)),
                1L));

        FoodNormalizer normalizer = mock(FoodNormalizer.class);
        when(normalizer.normalize(anyList(), org.mockito.ArgumentMatchers.any()))
                .thenReturn(new FoodNormalizer.Result(List.of("1", "2"), List.of(), List.of(), List.of()));
        DialogueExecutor.RunState state = new DialogueExecutor.RunState(memory, normalizer, List.of("海带", "娃娃菜"), "");
        executor.run(com.moonligh.nutritionist.domain.dialogue.DialogueTask.recommend(List.of("海带", "娃娃菜")), state);

        assertEquals(2, memory.currentDishes().size());
        assertEquals("娃娃菜", memory.currentDishes().getFirst().name());
    }

    @Test
    void autoReplaceMarksNoFeasibleWhenAbsoluteAvoidHitsAndNoAlternative() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        when(dishes.normalize(anyList(), anyString()))
                .thenReturn(new DishRecommendService.Normalized(List.of("x"), List.of()));
        when(dishes.matchIds(anyList(), anyList(), anyString(), any(RecallContext.class)))
                .thenReturn(new MatchReport(List.of(dish("7", "海带炒肉")), List.of(), ""));

        CatalogBrowse catalog = mock(CatalogBrowse.class);
        when(catalog.snapshot(anyString())).thenReturn(new CatalogBrowse.CatalogSnapshot(
                List.of(),
                List.of(recipe("7", "海带炒肉", "海带"))));

        DialogueExecutor executor = new DialogueExecutor(dishes, mock(DayMenuService.class), catalog);
        SessionMemory memory = new SessionMemory("s");
        memory.setFoodIds(List.of("x"));
        memory.setCurrentDishes(List.of(dish("7", "海带炒肉")));
        memory.setLongTerm(new LongTermMemory(
                "t",
                List.of(),
                List.of(),
                List.of(),
                false,
                List.of(new PreferenceItem(
                        "海带", SubjectType.FOOD, PreferencePolarity.AVOID, PreferenceStrength.ABSOLUTE, PreferenceScope.PERMANENT)),
                1L));

        DialogueExecutor.RunState state = new DialogueExecutor.RunState(memory, mock(FoodNormalizer.class), List.of(), "");
        executor.autoReplaceHitByAbsoluteAvoid(state);

        assertEquals(DishSlotStatus.NO_FEASIBLE_REPLACEMENT, memory.dishSlots().getFirst().status());
        assertTrue(state.explanation.toString().contains("不可替换"));
    }

    private static Suggestion dish(String id, String name) {
        return new Suggestion(id, name, 100, 100, "ok", "", "step");
    }

    private static RecipeView recipe(String id, String name, String ingredient) {
        return new RecipeView(
                id,
                name,
                "1",
                "weight",
                "锅",
                "step",
                List.of(new IngredientView("f-" + id, ingredient, BigDecimal.ONE, "")),
                new NutritionView(BigDecimal.TEN, null, null, null, null, null));
    }
}
