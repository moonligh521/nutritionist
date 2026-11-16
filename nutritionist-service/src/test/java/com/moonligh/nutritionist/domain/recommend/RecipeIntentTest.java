package com.moonligh.nutritionist.domain.recommend;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

class RecipeIntentTest {

    @Test
    void parsesCuisinePreferAndLeavesFuzzy() {
        RecipeIntent intent = RecipeIntent.parse("想吃川菜，清淡一点", List.of());
        assertEquals("川菜", intent.cuisine());
        assertTrue(intent.named());
        assertTrue(intent.fuzzy());
        assertTrue(intent.fuzzyText().contains("清淡"));
    }

    @Test
    void weightLossIsPreferTag() {
        RecipeIntent intent = RecipeIntent.parse("减肥", List.of("控糖"));
        assertEquals(List.of("减肥"), intent.preferTags());
        assertEquals(List.of("控糖"), intent.conditions());
        assertTrue(intent.named());
        assertFalse(intent.fuzzy());
    }
}
