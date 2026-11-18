package com.moonligh.nutritionist.infrastructure.vector;

import java.util.List;

import org.springframework.stereotype.Component;

import com.moonligh.consult.framework.vector.VectorDocument;
import com.moonligh.consult.framework.vector.VectorStore;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorFilter;
import com.moonligh.nutritionist.domain.recommend.RecipeVectorizer;
import com.moonligh.nutritionist.infrastructure.vector.NamedField.FieldDescription;
import com.moonligh.nutritionist.infrastructure.vector.NamedField.NamedStringList;

/** 菜谱集合。切分是一行一道菜。向量化和查询交给公共模块。 */
@Component
public class MilvusRecipeIndex {

    /** 企业命名：{域}_{对象}。旧名 recipe_chunk 不再写入。 */
    public static final String COLLECTION = "nutrition_recipe";

    public static final String COLLECTION_DESCRIPTION = "营养服务已发布菜谱；一行一道菜，1024 维余弦检索";

    private static final List<FieldDescription> FIELD_DESCRIPTIONS = List.of(
            new FieldDescription("id", "菜谱主键，对应 MySQL recipe.id 的数字字符串"),
            new FieldDescription("name", "菜名，对应 recipe.display_name"),
            new FieldDescription("version", "已发布版本号"),
            new FieldDescription("kind", "种类，精确过滤，如汤/主食/菜"),
            new FieldDescription("cuisine", "菜系，精确过滤，如川菜"),
            new FieldDescription("prefer_tags", "偏好标签数组，array_contains 匹配"),
            new FieldDescription("suitable", "适合的病情标签数组"),
            new FieldDescription("unsuitable", "不适合的病情标签数组"),
            new FieldDescription("embedding", "百炼 qwen3-vl-embedding，1024 维，余弦"));

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
        List<NamedField> fields = NamedField.of(
                new NamedField("name", stored.name() == null ? "" : stored.name()),
                new NamedField("version", stored.version() == null ? "" : stored.version()),
                new NamedField("kind", stored.kind() == null ? "" : stored.kind()),
                new NamedField("cuisine", stored.cuisine() == null ? "" : stored.cuisine()));
        List<NamedStringList> listFields = List.of(
                new NamedStringList("prefer_tags", RecipeVectorFilter.tags(stored.preferTags())),
                new NamedStringList("suitable", RecipeVectorFilter.tags(stored.suitable())),
                new NamedStringList("unsuitable", RecipeVectorFilter.tags(stored.unsuitable())));
        vectors.save(new VectorDocument(
                COLLECTION,
                stored.id(),
                NamedField.toMap(fields),
                stored.document(),
                vector,
                COLLECTION_DESCRIPTION,
                NamedField.descriptionsToMap(FIELD_DESCRIPTIONS),
                NamedStringList.toMap(listFields)));
    }

    public List<String> search(float[] vector, String filter, int limit) {
        return vectors.search(COLLECTION, vector, filter, limit);
    }

    public List<String> query(String filter, int limit) {
        return vectors.query(COLLECTION, filter, limit);
    }
}
