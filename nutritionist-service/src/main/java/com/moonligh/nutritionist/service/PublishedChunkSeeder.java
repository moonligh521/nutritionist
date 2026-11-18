package com.moonligh.nutritionist.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.recommend.RecipeDocument;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;
import com.moonligh.nutritionist.infrastructure.persistence.SearchChunkMapper;

/**
 * 异步补齐/刷新已发布菜的 MySQL 检索正文。不阻塞启动；按 version upsert。
 */
@Component
@ConditionalOnProperty(name = "nutritionist.chunk-seeder.enabled", havingValue = "true", matchIfMissing = false)
public class PublishedChunkSeeder implements ApplicationRunner {

    private static final Logger log = LoggerFactory.getLogger(PublishedChunkSeeder.class);

    private final CatalogBrowse catalog;
    private final SearchChunkMapper chunks;
    private final RecipeVectorizer.TextEmbedding embedding;
    private final SearchChunkIndex chunkIndex;
    private final PublishedCatalogIndex catalogIndex;

    public PublishedChunkSeeder(
            CatalogBrowse catalog,
            SearchChunkMapper chunks,
            RecipeVectorizer.TextEmbedding embedding,
            SearchChunkIndex chunkIndex,
            PublishedCatalogIndex catalogIndex) {
        this.catalog = catalog;
        this.chunks = chunks;
        this.embedding = embedding;
        this.chunkIndex = chunkIndex;
        this.catalogIndex = catalogIndex;
    }

    @Override
    public void run(ApplicationArguments args) {
        Thread.startVirtualThread(this::syncQuietly);
    }

    public void syncQuietly() {
        try {
            sync();
        } catch (RuntimeException error) {
            log.warn("chunk seeder skipped: {}", error.toString());
        }
    }

    public void sync() {
        Map<String, String> existingVersion = new HashMap<>();
        for (SearchChunkMapper.ChunkRow row : chunks.all()) {
            // ChunkRow 无 version 字段时用空串占位，一律允许 upsert 刷新正文
            existingVersion.put(row.recipeId(), "");
        }
        int written = 0;
        for (CatalogBrowse.RecipeView recipe : catalog.coreSnapshot().recipes()) {
            String version = recipe.version() == null || recipe.version().isBlank() ? "1" : recipe.version();
            String document = RecipeDocument.text(
                    recipe.name(),
                    recipe.ingredients().stream().map(CatalogBrowse.IngredientView::name).toList(),
                    recipe.step());
            float[] vector = embedding == null ? null : embedding.embed(document);
            chunks.upsert(recipe.id(), version, document, RecipeVectorizer.toJson(vector));
            written++;
            existingVersion.remove(recipe.id());
        }
        chunkIndex.invalidate();
        catalogIndex.invalidate();
        log.info("chunk seeder upserted={}", written);
    }
}
