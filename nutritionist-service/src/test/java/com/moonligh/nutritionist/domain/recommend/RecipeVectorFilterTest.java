package com.moonligh.nutritionist.domain.recommend;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;

class RecipeVectorFilterTest {

    @Test
    void cuisineIsExactAndDiseaseMustBeMarkedSuitable() {
        String expr = RecipeVectorFilter.expr("川菜", "", List.of("减肥"), List.of("控糖", "低嘌呤"));
        assertTrue(expr.contains("cuisine == \"川菜\""));
        assertTrue(expr.contains("prefer_tags like \"%,减肥,%\""));
        assertTrue(expr.contains("suitable like \"%,控糖,%\""));
        assertTrue(expr.contains("unsuitable not like \"%,控糖,%\""));
        assertTrue(expr.contains("suitable like \"%,低嘌呤,%\""));
        assertEquals(",减肥,减脂,", RecipeVectorFilter.wrap("减肥;减脂"));
    }
}
