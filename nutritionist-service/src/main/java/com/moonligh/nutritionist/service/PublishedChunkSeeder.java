package com.moonligh.nutritionist.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import com.moonligh.nutritionist.domain.recommend.RecipeDocument;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;
import com.moonligh.nutritionist.infrastructure.persistence.SearchChunkMapper;
import com.moonligh.nutritionist.infrastructure.vector.MilvusRecipeIndex;

/**
 * 启动时把还没有向量的已发布菜写成一条文档。
 * 产品之后上传的表会按菜号覆盖。已有记录不重写，避免冲掉种类、菜系和标签。
 */
@Component
public class PublishedChunkSeeder implements ApplicationRunner {

    private final CatalogBrowse catalog;
    private final SearchChunkMapper chunks;
    private final RecipeVectorizer.TextEmbedding embedding;
    private final MilvusRecipeIndex milvus;

    public PublishedChunkSeeder(
            CatalogBrowse catalog,
            SearchChunkMapper chunks,
            RecipeVectorizer.TextEmbedding embedding,
            MilvusRecipeIndex milvus) {
        this.catalog = catalog;
        this.chunks = chunks;
        this.embedding = embedding;
        this.milvus = milvus;
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
                String json = RecipeVectorizer.toJson(vector);
                chunks.upsert(recipe.id(), version, document, json);
                milvus.upsert(new RecipeVectorizer.Stored(
                        recipe.id(), version, document, json, true, "", "", "", "", ""));
            }
        } catch (RuntimeException error) {
            // 向量表还没建好或模型暂时失败时，推荐仍按原来的主料规则走。
        }
    }
}
