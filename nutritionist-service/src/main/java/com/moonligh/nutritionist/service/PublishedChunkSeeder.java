package com.moonligh.nutritionist.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.recommend.RecipeDocument;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;
import com.moonligh.nutritionist.infrastructure.persistence.SearchChunkMapper;

/**
 * 启动时把还没有正文的已发布菜写入 MySQL 检索表。
 * 完整标量字段以产品 CSV 上传为准，这里不往 Milvus 写空的种类/菜系/标签。
 */
@Component
public class PublishedChunkSeeder implements ApplicationRunner {

    private final CatalogBrowse catalog;
    private final SearchChunkMapper chunks;
    private final RecipeVectorizer.TextEmbedding embedding;

    public PublishedChunkSeeder(
            CatalogBrowse catalog,
            SearchChunkMapper chunks,
            RecipeVectorizer.TextEmbedding embedding) {
        this.catalog = catalog;
        this.chunks = chunks;
        this.embedding = embedding;
    }

    @Override
    public void run(ApplicationArguments args) {
        try {
            Set<String> existing = new HashSet<>();
            for (SearchChunkMapper.ChunkRow row : chunks.all()) {
                existing.add(row.recipeId());
            }
            for (CatalogBrowse.RecipeView recipe : catalog.snapshot("").recipes()) {
                if (existing.contains(recipe.id())) {
                    continue;
                }
                String document = RecipeDocument.text(
                        recipe.name(),
                        recipe.ingredients().stream().map(CatalogBrowse.IngredientView::name).toList(),
                        recipe.step());
                float[] vector = embedding == null ? null : embedding.embed(document);
                String version = recipe.version() == null || recipe.version().isBlank() ? "1" : recipe.version();
                chunks.upsert(recipe.id(), version, document, RecipeVectorizer.toJson(vector));
            }
        } catch (RuntimeException error) {
            // 向量表还没建好或模型暂时失败时，推荐仍按原来的主料规则走。
        }
    }
}
