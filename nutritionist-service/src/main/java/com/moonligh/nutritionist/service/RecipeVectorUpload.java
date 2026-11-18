package com.moonligh.nutritionist.service;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;
import com.moonligh.nutritionist.infrastructure.persistence.SearchChunkMapper;
import com.moonligh.nutritionist.infrastructure.vector.MilvusRecipeIndex;

/**
 * 产品上传填好的表。菜号须为已入库的 {@code recipe.id}（数字字符串）；
 * 同一菜号再次上传会覆盖向量，已有的主料规则不变。未先落库的行只会进 MySQL 检索表、不进 Milvus。
 */
@Service
public class RecipeVectorUpload {

    private final CatalogBrowse catalog;
    private final SearchChunkMapper chunks;
    private final RecipeVectorizer.TextEmbedding embedding;
    private final MilvusRecipeIndex milvus;
    private final SearchChunkIndex chunkIndex;
    private final PublishedCatalogIndex catalogIndex;

    public RecipeVectorUpload(
            CatalogBrowse catalog,
            SearchChunkMapper chunks,
            RecipeVectorizer.TextEmbedding embedding,
            MilvusRecipeIndex milvus,
            SearchChunkIndex chunkIndex,
            PublishedCatalogIndex catalogIndex) {
        this.catalog = catalog;
        this.chunks = chunks;
        this.embedding = embedding;
        this.milvus = milvus;
        this.chunkIndex = chunkIndex;
        this.catalogIndex = catalogIndex;
    }

    public RecipeVectorizer.Report importCsv(String csv) {
        Set<String> published = catalog.coreSnapshot().recipes().stream()
                .map(CatalogBrowse.RecipeView::id)
                .collect(Collectors.toSet());
        RecipeVectorizer.Report report = RecipeVectorizer.store(csv, published, embedding, stored -> {
            chunks.upsert(stored.id(), stored.version(), stored.document(), stored.embeddingJson());
            if (stored.published()) {
                milvus.upsert(stored);
            }
        });
        chunkIndex.invalidate();
        catalogIndex.invalidate();
        return report;
    }
}
