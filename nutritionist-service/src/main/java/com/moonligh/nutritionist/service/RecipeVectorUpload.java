package com.moonligh.nutritionist.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.moonligh.nutritionist.domain.recommend.RecipeDocument;
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

    /**
     * 重建 Milvus 集合（含 content+BM25）并从 MySQL chunk / 已发布目录重灌。
     * @return 成功写入条数
     */
    public int reseedMilvus() {
        milvus.dropCollection();
        Map<String, SearchChunkMapper.ChunkRow> byId = new HashMap<>();
        for (SearchChunkMapper.ChunkRow row : chunks.all()) {
            byId.put(row.recipeId(), row);
        }
        int written = 0;
        for (CatalogBrowse.RecipeView recipe : catalog.coreSnapshot().recipes()) {
            SearchChunkMapper.ChunkRow row = byId.get(recipe.id());
            String version = recipe.version() == null || recipe.version().isBlank() ? "1" : recipe.version();
            String document = row != null && row.documentText() != null && !row.documentText().isBlank()
                    ? row.documentText()
                    : RecipeDocument.text(
                            recipe.name(),
                            recipe.ingredients().stream().map(CatalogBrowse.IngredientView::name).toList(),
                            recipe.step());
            String embeddingJson = row == null ? null : row.embeddingJson();
            if (embeddingJson == null || embeddingJson.isBlank()) {
                float[] vector = embedding == null ? null : embedding.embed(document);
                embeddingJson = RecipeVectorizer.toJson(vector);
            }
            if (embeddingJson == null) {
                continue;
            }
            String kind = recipe.category() == null ? "" : recipe.category();
            milvus.upsert(new RecipeVectorizer.Stored(
                    recipe.id(),
                    recipe.name(),
                    version,
                    document,
                    embeddingJson,
                    true,
                    kind,
                    "",
                    "",
                    "",
                    ""));
            written++;
        }
        chunkIndex.invalidate();
        catalogIndex.invalidate();
        return written;
    }
}
