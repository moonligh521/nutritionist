package com.moonligh.nutritionist.infrastructure.vector;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.moonligh.consult.framework.vector.VectorDocument;
import com.moonligh.consult.framework.vector.VectorStore;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorFilter;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;

/** 菜谱集合。切分是一行一道菜。向量化和查询交给公共模块。 */
@Component
public class MilvusRecipeIndex {

    public static final String COLLECTION = "recipe_chunk";

    private final VectorStore vectors;

    public MilvusRecipeIndex(VectorStore vectors) {
        this.vectors = vectors;
    }

    public void upsert(RecipeVectorizer.Stored stored) {
        if (stored == null || !stored.published()) {
            return;
        }
        float[] vector = RecipeVectorizer.fromJson(stored.embeddingJson());
        if (vector == null) {
            return;
        }
        Map<String, String> fields = new LinkedHashMap<>();
        fields.put("version", stored.version() == null ? "" : stored.version());
        fields.put("kind", stored.kind() == null ? "" : stored.kind());
        fields.put("cuisine", stored.cuisine() == null ? "" : stored.cuisine());
        fields.put("prefer_tags", RecipeVectorFilter.wrap(stored.preferTags()));
        fields.put("suitable", RecipeVectorFilter.wrap(stored.suitable()));
        fields.put("unsuitable", RecipeVectorFilter.wrap(stored.unsuitable()));
        vectors.save(new VectorDocument(COLLECTION, stored.id(), fields, stored.document(), vector));
    }

    public List<String> search(float[] vector, String filter, int limit) {
        return vectors.search(COLLECTION, vector, filter, limit);
    }

    public List<String> query(String filter, int limit) {
        return vectors.query(COLLECTION, filter, limit);
    }
}
