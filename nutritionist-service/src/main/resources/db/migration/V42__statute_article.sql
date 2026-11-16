-- 法条检索。一条一块，和菜谱向量分开。废止条文留档，默认不参与当前查询。
CREATE TABLE IF NOT EXISTS statute_article (
    id VARCHAR(64) NOT NULL PRIMARY KEY,
    law_name VARCHAR(200) NOT NULL,
    status_name VARCHAR(16) NOT NULL,
    part_name VARCHAR(200) NOT NULL,
    subpart_name VARCHAR(200) NOT NULL,
    chapter_name VARCHAR(200) NOT NULL,
    section_name VARCHAR(200) NOT NULL,
    article_no VARCHAR(40) NOT NULL,
    article_number INT NULL,
    path_name VARCHAR(500) NOT NULL,
    body_text TEXT NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_statute_article (law_name, article_no)
);
