package com.moonligh.nutritionist.domain.recommend;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

class RecipeVectorFilterTest {

    @Test
    void cuisineIsExactAndDiseaseUsesArrayContains() {
        String expr = RecipeVectorFilter.expr("川菜", "", List.of("减肥"), List.of("控糖", "低嘌呤"));
        assertTrue(expr.contains("cuisine == \"川菜\""));
        assertTrue(expr.contains("array_contains(prefer_tags, \"减肥\")"));
        assertTrue(expr.contains("array_contains(suitable, \"控糖\")"));
        assertTrue(expr.contains("not array_contains(unsuitable, \"控糖\")"));
        assertTrue(expr.contains("array_contains(suitable, \"低嘌呤\")"));
        assertEquals(List.of("减肥", "减脂"), RecipeVectorFilter.tags("减肥;减脂"));
    }
}
