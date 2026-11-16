package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.math.BigDecimal;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.infrastructure.persistence.SearchChunkMapper;
import com.moonligh.nutritionist.infrastructure.vector.MilvusRecipeIndex;

class DishRecommendServiceNarrowTest {

    @Test
    void namedFilterMissReturnsNoDishes() {
        CatalogBrowse catalog = mock(CatalogBrowse.class);
        SearchChunkMapper chunks = mock(SearchChunkMapper.class);
        MilvusRecipeIndex vectors = mock(MilvusRecipeIndex.class);
        DishCardCache cards = mock(DishCardCache.class);
        when(catalog.snapshot("")).thenReturn(snapshot());
        when(chunks.all()).thenReturn(List.of());
        when(vectors.query(anyString(), anyInt())).thenReturn(List.of());
        DishRecommendService service = new DishRecommendService(
                catalog, cards, chunks, text -> null, vectors);
        DishRecommendService.MatchReport report = service.matchIds(
                List.of("138", "580"), List.of(), "", "川菜", List.of());
        assertTrue(report.dishes().isEmpty());
    }

    @Test
    void namedFilterUsesQueryNotBlankFilter() {
        CatalogBrowse catalog = mock(CatalogBrowse.class);
        SearchChunkMapper chunks = mock(SearchChunkMapper.class);
        MilvusRecipeIndex vectors = mock(MilvusRecipeIndex.class);
        DishCardCache cards = mock(DishCardCache.class);
        when(catalog.snapshot("")).thenReturn(snapshot());
        when(chunks.all()).thenReturn(List.of());
        when(vectors.query(eq("cuisine == \"川菜\""), anyInt())).thenReturn(List.of("sichuan"));
        DishRecommendService service = new DishRecommendService(
                catalog, cards, chunks, text -> null, vectors);
        DishRecommendService.MatchReport report = service.matchIds(
                List.of("138", "580"), List.of(), "", "川菜", List.of());
        assertTrue(report.dishes().stream().map(DishRecommendService.Suggestion::id).toList().contains("sichuan")
                || report.dishes().size() == 1 && "sichuan".equals(report.dishes().getFirst().id()));
    }

    private static CatalogBrowse.CatalogSnapshot snapshot() {
        return new CatalogBrowse.CatalogSnapshot(
                List.of(
                        new CatalogBrowse.FoodView("138", "番茄", "", false),
                        new CatalogBrowse.FoodView("580", "鸡蛋", "", false)),
                List.of(
                        recipe("sichuan", "川菜番茄蛋"),
                        recipe("cantonese", "粤菜番茄蛋")));
    }

    private static CatalogBrowse.RecipeView recipe(String id, String name) {
        return new CatalogBrowse.RecipeView(
                id,
                name,
                "1",
                "菜",
                "锅",
                "炒",
                List.of(
                        new CatalogBrowse.IngredientView("138", "番茄", new BigDecimal("100"), ""),
                        new CatalogBrowse.IngredientView("580", "鸡蛋", new BigDecimal("50"), "")),
                new CatalogBrowse.NutritionView(null, null, null, null, null, null));
    }
}
