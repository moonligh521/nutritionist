package com.moonligh.nutritionist.infrastructure.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/** 菜谱向量表。上传覆盖同一菜号，不删除别的菜。 */
@Mapper
public interface SearchChunkMapper {

    int upsert(
            @Param("recipeId") String recipeId,
            @Param("version") String version,
            @Param("documentText") String documentText,
            @Param("embeddingJson") String embeddingJson);

    List<ChunkRow> all();

    record ChunkRow(String recipeId, String documentText, String embeddingJson) {
    }
}
