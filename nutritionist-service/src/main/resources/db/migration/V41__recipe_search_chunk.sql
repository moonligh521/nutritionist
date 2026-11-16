-- 产品上传的菜谱表。一行一道菜，供关键词和向量召回。不替代已发布菜的主料门槛。
CREATE TABLE IF NOT EXISTS recipe_search_chunk (
    recipe_id VARCHAR(64) NOT NULL PRIMARY KEY,
    version VARCHAR(32) NOT NULL,
    document_text TEXT NOT NULL,
    embedding_json TEXT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
