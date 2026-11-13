package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import com.moonligh.nutritionist.domain.meal.MealPlan;

import java.time.LocalDate;
import java.util.List;

import org.junit.jupiter.api.Test;

class KitchenDialogueServiceTest {

    private final KitchenDialogueService dialogue = new KitchenDialogueService(new DialogueMemory(), null);

    @Test
    void homeVegetablesAreRememberedWithoutAnInventedDiet() {
        String text = "我家里有娃娃菜  油麦菜  挂面  木耳  红薯  玉米  土豆   我想做成减肥餐 我应该咋做";

        KitchenDialogueService.Reply first = dialogue.handle("pat-1", text, LocalDate.parse("2026-11-11"));
        KitchenDialogueService.Reply later = dialogue.handle("pat-1", "一个月后之前推荐的怎么样", LocalDate.parse("2026-12-11"));

        assertEquals("WEIGHT_LOSS", first.goalCode());
        assertEquals(List.of("油麦菜", "挂面"), first.missingComposition());
        assertNull(first.meal());
        assertTrue(first.explanation().contains("油麦菜"));
        assertTrue(first.explanation().contains("挂面"));
        assertTrue(first.explanation().contains("没有已发布菜谱"));
        assertTrue(first.explanation().contains("红薯"));
        assertTrue(later.recall());
        assertTrue(later.explanation().contains("红薯"));
        assertTrue(later.explanation().contains("2026-11-11"));
        assertTrue(later.explanation().contains("还没有确认吃过"));
    }

    @Test
    void knownFoodWithAPublishedRecipeReturnsSteps() {
        KitchenDialogueService.Reply reply = dialogue.handle(
                "pat-2", "家里有熟白米饭，半斤", LocalDate.parse("2026-11-11"));

        assertTrue(reply.missingComposition().isEmpty());
        assertEquals("staple-rice", reply.meal().dishes().getFirst().recipeId());
        assertTrue(reply.explanation().contains("把米饭盛入碗中，不再加盐。"));
    }

    @Test
    void knownFoodsBecomeAFewDishesAndUnknownFoodsStayOut() {
        String text = "我家里有熟白米饭、烤鸡胸肉、水煮菠菜、北豆腐、全蛋、苹果、油麦菜，我想做成减肥餐";

        KitchenDialogueService.Reply reply = dialogue.handle("pat-3", text, LocalDate.parse("2026-11-11"));

        assertEquals("WEIGHT_LOSS", reply.goalCode());
        assertEquals(List.of("油麦菜"), reply.missingComposition());
        assertEquals(List.of("staple-rice", "staple-chicken", "staple-spinach"), recipeIds(reply));
        assertTrue(reply.explanation().contains("把米饭盛入碗中，不再加盐。"));
        assertTrue(reply.explanation().contains("鸡胸肉烤熟后切块，不再加盐。"));
        assertTrue(reply.explanation().contains("菠菜煮熟沥干，不再加盐。"));
        assertTrue(reply.explanation().contains("油麦菜"));
        assertTrue(reply.explanation().contains("北豆腐"));
        assertTrue(reply.explanation().contains("没有用上"));
    }

    private static List<String> recipeIds(KitchenDialogueService.Reply reply) {
        return reply.meal().dishes().stream().map(MealPlan.Dish::recipeId).toList();
    }
}
