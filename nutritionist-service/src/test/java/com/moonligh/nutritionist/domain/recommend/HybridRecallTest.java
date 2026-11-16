package com.moonligh.nutritionist.domain.recommend;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Dish;
import com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Ingredient;

class HybridRecallTest {

    @Test
    void poolReturnsEmptyWhenRecallMissesPublished() {
        Dish a = dish("a");
        List<Dish> kept = HybridRecall.pool(List.of(a), List.of("missing"));
        assertTrue(kept.isEmpty());
    }

    @Test
    void poolKeepsIntersection() {
        Dish a = dish("a");
        Dish b = dish("b");
        List<Dish> kept = HybridRecall.pool(List.of(a, b), List.of("b", "x"));
        assertEquals(List.of("b"), kept.stream().map(Dish::id).toList());
    }

    @Test
    void emptyRecallKeepsAll() {
        Dish a = dish("a");
        assertEquals(1, HybridRecall.pool(List.of(a), List.of()).size());
    }

    private static Dish dish(String id) {
        return new Dish(id, "n", null, "", List.of(new Ingredient("1", "主料", true)), List.of());
    }
}
