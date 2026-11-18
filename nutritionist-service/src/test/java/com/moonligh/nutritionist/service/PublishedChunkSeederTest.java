package com.moonligh.nutritionist.service;

import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.math.BigDecimal;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;
import com.moonligh.nutritionist.infrastructure.persistence.SearchChunkMapper;

class PublishedChunkSeederTest {

    @Test
    void seedsMysqlOnly() {
        CatalogBrowse catalog = mock(CatalogBrowse.class);
        SearchChunkMapper chunks = mock(SearchChunkMapper.class);
        SearchChunkIndex chunkIndex = mock(SearchChunkIndex.class);
        PublishedCatalogIndex catalogIndex = mock(PublishedCatalogIndex.class);
        when(chunks.all()).thenReturn(List.of());
        when(catalog.coreSnapshot()).thenReturn(new CatalogBrowse.CatalogSnapshot(
                List.of(),
                List.of(new CatalogBrowse.RecipeView(
                        "r1",
                        "番茄炒蛋",
                        "1",
                        "菜",
                        "锅",
                        "step",
                        List.of(new CatalogBrowse.IngredientView("138", "番茄", new BigDecimal("100"), "")),
                        new CatalogBrowse.NutritionView(null, null, null, null, null, null)))));
        RecipeVectorizer.TextEmbedding embedding = text -> new float[] {0.1f, 0.2f};
        PublishedChunkSeeder seeder = new PublishedChunkSeeder(
                catalog, chunks, embedding, chunkIndex, catalogIndex);
        seeder.sync();
        verify(chunks).upsert(anyString(), anyString(), anyString(), anyString());
        verify(chunkIndex).invalidate();
        verify(catalogIndex).invalidate();
    }
}
