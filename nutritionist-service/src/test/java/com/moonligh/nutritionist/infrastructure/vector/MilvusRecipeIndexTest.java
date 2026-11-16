package com.moonligh.nutritionist.infrastructure.vector;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

import org.junit.jupiter.api.Test;

import com.moonligh.consult.framework.vector.VectorDocument;
import com.moonligh.consult.framework.vector.VectorStore;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;

class MilvusRecipeIndexTest {

    @Test
    void upsertPassesPrecomputedVectorAndSkipsUnpublished() {
        AtomicInteger embeds = new AtomicInteger();
        AtomicReference<VectorDocument> saved = new AtomicReference<>();
        VectorStore store = new VectorStore() {
            @Override
            public float[] embed(String text) {
                embeds.incrementAndGet();
                return new float[] {1f};
            }

            @Override
            public void save(VectorDocument document) {
                saved.set(document);
            }

            @Override
            public List<String> search(String collection, float[] vector, String filter, int limit) {
                return List.of();
            }

            @Override
            public List<String> query(String collection, String filter, int limit) {
                return List.of();
            }
        };
        MilvusRecipeIndex index = new MilvusRecipeIndex(store);
        float[] vector = new float[1024];
        vector[0] = 0.5f;
        index.upsert(new RecipeVectorizer.Stored(
                "r1", "3", "doc", RecipeVectorizer.toJson(vector), true,
                "汤", "川菜", "减肥", "控糖", ""));
        assertEquals(0, embeds.get());
        assertNotNull(saved.get());
        assertNotNull(saved.get().vector());
        assertEquals("川菜", saved.get().fields().get("cuisine"));

        saved.set(null);
        index.upsert(new RecipeVectorizer.Stored(
                "r2", "1", "doc", RecipeVectorizer.toJson(vector), false,
                "汤", "川菜", "", "", ""));
        assertNull(saved.get());
    }
}
