package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.math.BigDecimal;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.ObjectProvider;

import com.moonligh.consult.framework.vector.TextReranker;
import com.moonligh.nutritionist.domain.recommend.HybridRecall;
import com.moonligh.nutritionist.domain.recommend.RecallContext;
import com.moonligh.nutritionist.infrastructure.persistence.SearchChunkMapper;
import com.moonligh.nutritionist.infrastructure.vector.MilvusRecipeIndex;

class DishRecommendBm25RerankTest {

    @Test
    void milvusBm25MergesWithDenseAndRerankReorders() {
        CatalogBrowse catalog = mock(CatalogBrowse.class);
        SearchChunkMapper chunks = mock(SearchChunkMapper.class);
        MilvusRecipeIndex milvus = mock(MilvusRecipeIndex.class);
        DishCardCache cards = mock(DishCardCache.class);
        when(catalog.coreSnapshot()).thenReturn(snapshot());
        when(catalog.snapshot("")).thenReturn(snapshot());
        when(chunks.all()).thenReturn(List.of());
        when(milvus.searchBm25(anyString(), any(), eq(HybridRecall.CANDIDATE_LIMIT)))
                .thenReturn(List.of("1", "2"));
        when(milvus.search(any(), any(), anyInt())).thenReturn(List.of("1", "2"));

        TextReranker reranker = (query, ids, texts, topN) -> List.of("2", "1");
        @SuppressWarnings("unchecked")
        ObjectProvider<TextReranker> provider = mock(ObjectProvider.class);
        when(provider.getIfAvailable(any())).thenReturn(reranker);

        DishRecommendService service = new DishRecommendService(
                new PublishedCatalogIndex(catalog),
                cards,
                new SearchChunkIndex(chunks),
                text -> new float[1024],
                milvus,
                new RecallMetrics(),
                null,
                null,
                provider,
                true);

        var report = service.matchIds(
                List.of("580", "138"), List.of(), "", RecallContext.fromText("清淡家常", List.of()));
        assertEquals(List.of("2", "1"), report.dishes().stream().map(DishRecommendService.Suggestion::id).toList());
    }

    @Test
    void emptyMilvusBm25FallsBackWithoutThrowing() {
        CatalogBrowse catalog = mock(CatalogBrowse.class);
        SearchChunkMapper chunks = mock(SearchChunkMapper.class);
        MilvusRecipeIndex milvus = mock(MilvusRecipeIndex.class);
        DishCardCache cards = mock(DishCardCache.class);
        when(catalog.coreSnapshot()).thenReturn(snapshot());
        when(catalog.snapshot("")).thenReturn(snapshot());
        when(chunks.all()).thenReturn(List.of());
        when(milvus.searchBm25(anyString(), any(), anyInt())).thenReturn(List.of());
        when(milvus.search(any(), any(), anyInt())).thenReturn(List.of("1"));

        DishRecommendService service = new DishRecommendService(
                catalog, cards, chunks, text -> new float[1024], milvus);

        var report = service.matchIds(List.of("580"), List.of(), "", RecallContext.fromText("清淡", List.of()));
        assertEquals(1, report.dishes().size());
        assertEquals("1", report.dishes().getFirst().id());
    }

    private static CatalogBrowse.CatalogSnapshot snapshot() {
        return new CatalogBrowse.CatalogSnapshot(
                List.of(
                        new CatalogBrowse.FoodView("138", "番茄", "", false),
                        new CatalogBrowse.FoodView("580", "鸡蛋", "", false)),
                List.of(
                        recipe("1", "水煮蛋", List.of(ing("580", "鸡蛋"))),
                        recipe(
                                "2",
                                "番茄炒蛋",
                                List.of(ing("580", "鸡蛋"), ing("138", "番茄")))));
    }

    private static CatalogBrowse.IngredientView ing(String id, String name) {
        return new CatalogBrowse.IngredientView(id, name, new BigDecimal("50"), "");
    }

    private static CatalogBrowse.RecipeView recipe(String id, String name, List<CatalogBrowse.IngredientView> ingredients) {
        return new CatalogBrowse.RecipeView(
                id,
                name,
                "1",
                "菜",
                "锅",
                "炒",
                ingredients,
                new CatalogBrowse.NutritionView(null, null, null, null, null, null));
    }
}
