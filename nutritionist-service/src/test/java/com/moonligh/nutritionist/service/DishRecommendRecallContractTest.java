package com.moonligh.nutritionist.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.math.BigDecimal;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.LongTermMemory;
import com.moonligh.nutritionist.domain.dialogue.PreferenceItem;
import com.moonligh.nutritionist.domain.dialogue.PreferencePolarity;
import com.moonligh.nutritionist.domain.dialogue.PreferenceScope;
import com.moonligh.nutritionist.domain.dialogue.PreferenceStrength;
import com.moonligh.nutritionist.domain.dialogue.SubjectType;
import com.moonligh.nutritionist.domain.recommend.RecallContext;
import com.moonligh.nutritionist.domain.recommend.RecallEmptyReason;
import com.moonligh.nutritionist.infrastructure.persistence.SearchChunkMapper;
import com.moonligh.nutritionist.infrastructure.vector.MilvusRecipeIndex;

/** 企业级检索契约 T1–T8。 */
class DishRecommendRecallContractTest {

    @Test
    void t1_memoryCuisineInjectsFilterWithoutUtteranceCuisine() {
        MilvusRecipeIndex vectors = mock(MilvusRecipeIndex.class);
        when(vectors.query(eq("cuisine == \"川菜\""), anyInt())).thenReturn(List.of("sichuan"));
        DishRecommendService service = service(vectors, text -> null);

        LongTermMemory memory = taste(
                new PreferenceItem(
                        "川菜",
                        SubjectType.CUISINE,
                        PreferencePolarity.LIKE,
                        PreferenceStrength.STRONG,
                        PreferenceScope.PERMANENT));
        RecallContext ctx = RecallContext.from("", memory, "");
        assertEquals("川菜", ctx.cuisine());
        assertTrue(!ctx.fuzzy());
        assertTrue(ctx.filterExpr().contains("cuisine == \"川菜\""));

        DishRecommendService.MatchReport report = service.matchIds(
                List.of("138", "580"), List.of(), "", ctx);
        verify(vectors).query(eq("cuisine == \"川菜\""), anyInt());
        assertEquals(1, report.dishes().size());
        assertEquals("sichuan", report.dishes().getFirst().id());
        assertEquals(RecallEmptyReason.NONE, report.emptyReason());
    }

    @Test
    void t2_filterEmptyIsScalarEmptyNotAllPublished() {
        MilvusRecipeIndex vectors = mock(MilvusRecipeIndex.class);
        when(vectors.query(anyString(), anyInt())).thenReturn(List.of());
        DishRecommendService service = service(vectors, text -> null);

        DishRecommendService.MatchReport report = service.matchIds(
                List.of("138", "580"), List.of(), "", RecallContext.fromText("川菜", List.of()));
        assertTrue(report.dishes().isEmpty());
        assertEquals(RecallEmptyReason.SCALAR_EMPTY, report.emptyReason());
        assertTrue(report.filterExpr().contains("川菜"));
    }

    @Test
    void t3_filterStoreErrorIsUnavailable() {
        MilvusRecipeIndex vectors = mock(MilvusRecipeIndex.class);
        when(vectors.query(anyString(), anyInt())).thenThrow(new RuntimeException("milvus down"));
        DishRecommendService service = service(vectors, text -> null);

        DishRecommendService.MatchReport report = service.matchIds(
                List.of("138", "580"), List.of(), "", RecallContext.fromText("川菜", List.of()));
        assertTrue(report.dishes().isEmpty());
        assertEquals(RecallEmptyReason.VECTOR_STORE_UNAVAILABLE, report.emptyReason());
    }

    @Test
    void t4_fuzzyEmbedFailWithoutFilterFallsBackAllPublished() {
        MilvusRecipeIndex vectors = mock(MilvusRecipeIndex.class);
        DishRecommendService service = service(vectors, text -> {
            throw new RuntimeException("embed fail");
        });

        DishRecommendService.MatchReport report = service.matchIds(
                List.of("138", "580"), List.of(), "", RecallContext.fromText("清淡一点", List.of()));
        assertEquals(2, report.dishes().size());
        assertEquals(RecallEmptyReason.FALLBACK_ALL_PUBLISHED, report.emptyReason());
        verify(vectors, never()).search(any(), any(), anyInt());
    }

    @Test
    void t5_noPublishedIntersect() {
        MilvusRecipeIndex vectors = mock(MilvusRecipeIndex.class);
        when(vectors.query(anyString(), anyInt())).thenReturn(List.of("ghost-only"));
        DishRecommendService service = service(vectors, text -> null);

        DishRecommendService.MatchReport report = service.matchIds(
                List.of("138", "580"), List.of(), "", RecallContext.fromText("川菜", List.of()));
        assertTrue(report.dishes().isEmpty());
        assertEquals(RecallEmptyReason.NO_PUBLISHED_INTERSECT, report.emptyReason());
        assertEquals(1, report.recalledCount());
    }

    @Test
    void t6_absoluteAvoidNotInFilterExpr() {
        LongTermMemory memory = taste(
                new PreferenceItem(
                        "海带",
                        SubjectType.FOOD,
                        PreferencePolarity.AVOID,
                        PreferenceStrength.ABSOLUTE,
                        PreferenceScope.PERMANENT),
                new PreferenceItem(
                        "川菜",
                        SubjectType.CUISINE,
                        PreferencePolarity.LIKE,
                        PreferenceStrength.STRONG,
                        PreferenceScope.PERMANENT));
        RecallContext ctx = RecallContext.from("推荐一下", memory, "");
        assertEquals("川菜", ctx.cuisine());
        assertTrue(ctx.filterExpr().contains("川菜"));
        assertTrue(!ctx.filterExpr().contains("海带"));
    }

    @Test
    void t7_clientModerateAvoidNotAbsoluteInContext() {
        // 客户端 avoid 已在记忆侧降为 ≤MODERATE；检索 Context 不含 FOOD AVOID
        LongTermMemory memory = taste(
                new PreferenceItem(
                        "香菜",
                        SubjectType.FOOD,
                        PreferencePolarity.AVOID,
                        PreferenceStrength.MODERATE,
                        PreferenceScope.PERMANENT));
        RecallContext ctx = RecallContext.from("推荐", memory, "");
        assertTrue(ctx.filterExpr().isBlank());
        assertTrue(!ctx.hasFilter());
    }

    @Test
    void t8_poolEmptyIdsReturnsEmpty() {
        assertTrue(com.moonligh.nutritionist.domain.recommend.HybridRecall.pool(
                List.of(dish("a")), List.of()).isEmpty());
        assertTrue(com.moonligh.nutritionist.domain.recommend.HybridRecall.pool(
                List.of(dish("a")), null).isEmpty());
    }

    @Test
    void filterPlusFuzzyEmbedFailIsEmbedFailedNotFallback() {
        MilvusRecipeIndex vectors = mock(MilvusRecipeIndex.class);
        DishRecommendService service = service(vectors, text -> null);

        DishRecommendService.MatchReport report = service.matchIds(
                List.of("138", "580"),
                List.of(),
                "",
                new RecallContext("川菜", "", List.of(), List.of(), "清淡一点"));
        assertTrue(report.dishes().isEmpty());
        assertEquals(RecallEmptyReason.EMBED_FAILED, report.emptyReason());
        verify(vectors, never()).search(any(), anyString(), anyInt());
    }

    private static DishRecommendService service(
            MilvusRecipeIndex vectors, com.moonligh.nutritionist.domain.recommend.RecipeVectorizer.TextEmbedding embed) {
        CatalogBrowse catalog = mock(CatalogBrowse.class);
        SearchChunkMapper chunks = mock(SearchChunkMapper.class);
        DishCardCache cards = mock(DishCardCache.class);
        when(catalog.coreSnapshot()).thenReturn(snapshot());
        when(catalog.snapshot("")).thenReturn(snapshot());
        when(chunks.all()).thenReturn(List.of());
        return new DishRecommendService(catalog, cards, chunks, embed, vectors);
    }

    @Test
    void pointedUnknownCuisineIsScalarEmptyWithFilter() {
        MilvusRecipeIndex vectors = mock(MilvusRecipeIndex.class);
        when(vectors.query(eq("cuisine == \"XYZ\""), anyInt())).thenReturn(List.of());
        DishRecommendService service = service(vectors, text -> null);

        DishRecommendService.MatchReport report = service.match(
                List.of("番茄", "鸡蛋"), "不存在的菜系XYZ", "XYZ", null, List.of());
        assertTrue(report.dishes().isEmpty());
        assertEquals(RecallEmptyReason.SCALAR_EMPTY, report.emptyReason());
        assertTrue(report.filterExpr().contains("cuisine == \"XYZ\""));
    }

    @Test
    void filterPlusFuzzyKeepsOnlyVectorHits() {
        MilvusRecipeIndex vectors = mock(MilvusRecipeIndex.class);
        when(vectors.search(any(), eq("cuisine == \"川菜\""), anyInt())).thenReturn(List.of("sichuan"));
        SearchChunkMapper chunks = mock(SearchChunkMapper.class);
        when(chunks.all()).thenReturn(List.of(
                new SearchChunkMapper.ChunkRow("cantonese", "粤菜清淡", "[]"),
                new SearchChunkMapper.ChunkRow("sichuan", "川菜清淡", "[]")));
        CatalogBrowse catalog = mock(CatalogBrowse.class);
        when(catalog.coreSnapshot()).thenReturn(snapshot());
        when(catalog.snapshot("")).thenReturn(snapshot());
        DishRecommendService service = new DishRecommendService(
                catalog,
                mock(DishCardCache.class),
                chunks,
                text -> new float[] {0.1f},
                vectors);

        DishRecommendService.MatchReport report = service.matchIds(
                List.of("138", "580"),
                List.of(),
                "",
                new RecallContext("川菜", "", List.of(), List.of(), "清淡一点"));
        assertEquals(1, report.dishes().size());
        assertEquals("sichuan", report.dishes().getFirst().id());
        assertEquals(RecallEmptyReason.NONE, report.emptyReason());
    }

    private static LongTermMemory taste(PreferenceItem... items) {
        return new LongTermMemory("t", List.of(), List.of(), List.of(), false, List.of(items), 1L);
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

    private static com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Dish dish(String id) {
        return new com.moonligh.nutritionist.domain.recommend.IngredientDishRanker.Dish(
                id, id, 100, "", List.of(), List.of());
    }
}
