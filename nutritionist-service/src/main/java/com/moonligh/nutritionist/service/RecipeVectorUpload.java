package com.moonligh.nutritionist.service;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;
import com.moonligh.nutritionist.infrastructure.persistence.SearchChunkMapper;
import com.moonligh.nutritionist.infrastructure.vector.MilvusRecipeIndex;

/** 产品上传填好的表。同一菜号再次上传会覆盖向量，已有的主料规则不变。 */
@Service
public class RecipeVectorUpload {

    private final CatalogBrowse catalog;
    private final SearchChunkMapper chunks;
    private final RecipeVectorizer.TextEmbedding embedding;
    private final MilvusRecipeIndex milvus;

    public RecipeVectorUpload(
            CatalogBrowse catalog,
            SearchChunkMapper chunks,
            RecipeVectorizer.TextEmbedding embedding,
            MilvusRecipeIndex milvus) {
        this.catalog = catalog;
        this.chunks = chunks;
        this.embedding = embedding;
        this.milvus = milvus;
    }

    public RecipeVectorizer.Report importCsv(String csv) {
        Set<String> published = catalog.snapshot("").recipes().stream()
                .map(CatalogBrowse.RecipeView::id)
                .collect(Collectors.toSet());
        return RecipeVectorizer.store(csv, published, embedding, stored -> {
            chunks.upsert(stored.id(), stored.version(), stored.document(), stored.embeddingJson());
            if (stored.published()) {
                milvus.upsert(stored);
            }
        });
    }
}
