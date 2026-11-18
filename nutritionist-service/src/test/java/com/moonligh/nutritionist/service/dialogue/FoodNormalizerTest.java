package com.moonligh.nutritionist.service.dialogue;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.dialogue.SessionMemory;
import com.moonligh.nutritionist.service.CatalogBrowse;
import com.moonligh.nutritionist.service.DishRecommendService;
import com.moonligh.nutritionist.service.DishRecommendService.Normalized;

class FoodNormalizerTest {

    @Test
    void highConfidenceTypoAutoCorrects() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        when(dishes.normalize(eq(List.of("白蔡")), anyString())).thenReturn(new Normalized(List.of(), List.of("白蔡")));
        when(dishes.normalize(eq(List.of("白菜")), anyString())).thenReturn(new Normalized(List.of("12"), List.of()));
        CatalogBrowse catalog = mock(CatalogBrowse.class);
        when(catalog.coreSnapshot()).thenReturn(new CatalogBrowse.CatalogSnapshot(
                List.of(new CatalogBrowse.FoodView("12", "白菜", "", false)), List.of()));
        FoodNormalizer normalizer = new FoodNormalizer(dishes, catalog);

        FoodNormalizer.Result result = normalizer.normalize(List.of("白蔡"), new SessionMemory("s"));

        assertEquals(List.of("12"), result.ids());
        assertTrue(result.autoCorrections().contains("白蔡→白菜"));
        assertFalse(result.needsConfirm());
    }

    @Test
    void ambiguousTypoNeedsConfirm() {
        DishRecommendService dishes = mock(DishRecommendService.class);
        when(dishes.normalize(anyList(), anyString())).thenReturn(new Normalized(List.of(), List.of("土地")));
        CatalogBrowse catalog = mock(CatalogBrowse.class);
        when(catalog.coreSnapshot()).thenReturn(new CatalogBrowse.CatalogSnapshot(
                List.of(
                        new CatalogBrowse.FoodView("1", "土豆", "", false),
                        new CatalogBrowse.FoodView("2", "土鸡", "", false)),
                List.of()));
        FoodNormalizer normalizer = new FoodNormalizer(dishes, catalog);

        FoodNormalizer.Result result = normalizer.normalize(List.of("土地"), new SessionMemory("s"));

        assertTrue(result.needsConfirm());
        assertEquals("土地", result.lowConfidence().getFirst().raw());
        assertTrue(result.lowConfidence().getFirst().options().size() >= 2);
    }
}
