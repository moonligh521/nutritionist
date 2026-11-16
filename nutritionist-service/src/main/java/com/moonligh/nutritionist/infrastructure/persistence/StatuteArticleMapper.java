package com.moonligh.nutritionist.infrastructure.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/** 法条按法律名和条号保存。重新导入同一条会覆盖正文和时效。 */
@Mapper
public interface StatuteArticleMapper {

    int upsert(ArticleRow row);

    ArticleRow findExact(
            @Param("lawName") String lawName,
            @Param("articleNo") String articleNo,
            @Param("articleNumber") Integer articleNumber);

    List<ArticleRow> searchKeyword(@Param("query") String query, @Param("limit") int limit);

    List<ArticleRow> findByIds(@Param("ids") List<String> ids);

    record ArticleRow(
            String id,
            String lawName,
            String statusName,
            String partName,
            String subpartName,
            String chapterName,
            String sectionName,
            String articleNo,
            Integer articleNumber,
            String pathName,
            String bodyText) {
    }
}
