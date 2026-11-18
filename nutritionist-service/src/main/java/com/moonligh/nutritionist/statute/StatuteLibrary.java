package com.moonligh.nutritionist.statute;

import java.util.List;

import org.springframework.stereotype.Service;

import com.moonligh.consult.framework.vector.StatuteChunker;
import com.moonligh.consult.framework.vector.VectorDocument;
import com.moonligh.consult.framework.vector.VectorStore;
import com.moonligh.nutritionist.infrastructure.persistence.StatuteArticleMapper;
import com.moonligh.nutritionist.infrastructure.persistence.StatuteArticleMapper.ArticleRow;
import com.moonligh.nutritionist.infrastructure.vector.NamedField;
import com.moonligh.nutritionist.infrastructure.vector.NamedField.FieldDescription;

/** 法条入库和查询。先按条号，再按关键词，最后才用向量。废止条文不参与当前查询。 */
@Service
public class StatuteLibrary {

    /** 企业命名：{域}_{对象}。旧名 statute_article 不再写入。 */
    public static final String COLLECTION = "law_article";

    public static final String COLLECTION_DESCRIPTION = "现行有效法条；按条切分，1024 维余弦检索";

    private static final List<FieldDescription> FIELD_DESCRIPTIONS = List.of(
            new FieldDescription("id", "法条主键，法规名+条号"),
            new FieldDescription("law_name", "法规正式名称"),
            new FieldDescription("status", "时效：有效/尚未生效/已废止"),
            new FieldDescription("article_no", "条号原文"),
            new FieldDescription("embedding", "百炼 qwen3-vl-embedding，1024 维，余弦"));

    private static final List<LawAlias> ALIASES = List.of(
            new LawAlias("民法典", "中华人民共和国民法典"),
            new LawAlias("刑法", "中华人民共和国刑法"),
            new LawAlias("公司法", "中华人民共和国公司法"));

    private final StatuteArticleMapper articles;
    private final VectorStore vectors;

    public StatuteLibrary(StatuteArticleMapper articles, VectorStore vectors) {
        this.articles = articles;
        this.vectors = vectors;
    }

    public ImportResult importText(String lawName, String status, String text) {
        String name = officialName(lawName);
        String validity = status == null || status.isBlank() ? "有效" : status.trim();
        if (!validity.equals("有效") && !validity.equals("尚未生效") && !validity.equals("已废止")) {
            throw new IllegalArgumentException("时效只能是有效、尚未生效或已废止");
        }
        List<StatuteChunker.Article> chunks = StatuteChunker.split(name, text);
        for (StatuteChunker.Article article : chunks) {
            String id = id(name, article.articleNo());
            ArticleRow row = new ArticleRow(
                    id, name, validity, article.part(), article.subpart(), article.chapter(), article.section(),
                    article.articleNo(), StatuteNumbers.parse(article.articleNo()), article.path(), article.text());
            articles.upsert(row);
            if ("有效".equals(validity)) {
                List<NamedField> fields = NamedField.of(
                        new NamedField("law_name", name),
                        new NamedField("status", validity),
                        new NamedField("article_no", article.articleNo()));
                vectors.save(new VectorDocument(
                        COLLECTION,
                        id,
                        NamedField.toMap(fields),
                        article.text(),
                        null,
                        COLLECTION_DESCRIPTION,
                        NamedField.descriptionsToMap(FIELD_DESCRIPTIONS)));
            }
        }
        return new ImportResult(name, validity, chunks.size());
    }

    public ArticleRow article(String lawName, String articleNo) {
        Integer number = StatuteNumbers.parse(articleNo);
        String label = articleNo == null ? "" : articleNo.trim();
        return articles.findExact(officialName(lawName), label, number);
    }

    public List<ArticleRow> search(String query) {
        if (query == null || query.isBlank()) {
            return List.of();
        }
        String text = query.trim();
        int articleAt = text.indexOf("第");
        int articleEnd = text.indexOf("条");
        if (articleAt > 0 && articleEnd > articleAt) {
            ArticleRow exact = article(text.substring(0, articleAt), text.substring(articleAt, articleEnd + 1));
            if (exact != null) {
                return List.of(exact);
            }
        }
        List<ArticleRow> found = articles.searchKeyword(text, 20);
        if (!found.isEmpty()) {
            return found;
        }
        float[] vector = vectors.embed(text);
        List<String> ids = vectors.search(COLLECTION, vector, "status == \"有效\"", 20);
        if (ids.isEmpty()) {
            return List.of();
        }
        return articles.findByIds(ids);
    }

    private static String officialName(String lawName) {
        if (lawName == null) {
            return "";
        }
        String name = lawName.trim().replace("《", "").replace("》", "");
        for (LawAlias alias : ALIASES) {
            if (alias.shortName().equals(name)) {
                return alias.officialName();
            }
        }
        return name;
    }

    private static String id(String lawName, String articleNo) {
        return "st-" + Integer.toUnsignedString((lawName + "#" + articleNo).hashCode());
    }

    public record ImportResult(String lawName, String status, int articles) {
    }
}
