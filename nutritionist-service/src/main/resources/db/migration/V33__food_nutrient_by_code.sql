-- 成分主数据改回一行一个营养素。没有的含量不插行，不能当成 0。
-- 并排查看用 food_nutrient_panel，不作为录入主表。

CREATE TABLE food_nutrient_row (
    food_id        BIGINT         NOT NULL COMMENT '食材编号',
    nutrient_code  TINYINT        NOT NULL COMMENT '营养素',
    amount         DECIMAL(18, 7) NOT NULL COMMENT '含量',
    remark         VARCHAR(400)   NULL     COMMENT '备注',
    created_by     VARCHAR(100)   NULL     COMMENT '创建人',
    updated_by     VARCHAR(100)   NULL     COMMENT '修改人',
    created_at     DATETIME(3)    NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
    updated_at     DATETIME(3)    NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
    is_deleted     BIGINT         NOT NULL DEFAULT 0 COMMENT '删除标记',
    PRIMARY KEY (food_id, nutrient_code, is_deleted)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='食材成分';

INSERT INTO food_nutrient_row (food_id, nutrient_code, amount)
SELECT food_id, 1, energy FROM food_nutrient WHERE is_deleted = 0 AND energy IS NOT NULL
UNION ALL
SELECT food_id, 2, protein FROM food_nutrient WHERE is_deleted = 0 AND protein IS NOT NULL
UNION ALL
SELECT food_id, 3, carbohydrate FROM food_nutrient WHERE is_deleted = 0 AND carbohydrate IS NOT NULL
UNION ALL
SELECT food_id, 4, fat FROM food_nutrient WHERE is_deleted = 0 AND fat IS NOT NULL
UNION ALL
SELECT food_id, 5, dietary_fiber FROM food_nutrient WHERE is_deleted = 0 AND dietary_fiber IS NOT NULL
UNION ALL
SELECT food_id, 6, sodium FROM food_nutrient WHERE is_deleted = 0 AND sodium IS NOT NULL
UNION ALL
SELECT food_id, 7, potassium FROM food_nutrient WHERE is_deleted = 0 AND potassium IS NOT NULL
UNION ALL
SELECT food_id, 8, phosphorus FROM food_nutrient WHERE is_deleted = 0 AND phosphorus IS NOT NULL
UNION ALL
SELECT food_id, 9, cholesterol FROM food_nutrient WHERE is_deleted = 0 AND cholesterol IS NOT NULL
UNION ALL
SELECT food_id, 10, saturated_fat FROM food_nutrient WHERE is_deleted = 0 AND saturated_fat IS NOT NULL
UNION ALL
SELECT food_id, 11, cooking_oil FROM food_nutrient WHERE is_deleted = 0 AND cooking_oil IS NOT NULL
UNION ALL
SELECT food_id, 12, water FROM food_nutrient WHERE is_deleted = 0 AND water IS NOT NULL
UNION ALL
SELECT food_id, 13, vitamin_e FROM food_nutrient WHERE is_deleted = 0 AND vitamin_e IS NOT NULL
UNION ALL
SELECT food_id, 14, calcium FROM food_nutrient WHERE is_deleted = 0 AND calcium IS NOT NULL;

DROP TABLE food_nutrient;
RENAME TABLE food_nutrient_row TO food_nutrient;

CREATE VIEW food_nutrient_panel AS
SELECT food_id,
       MAX(CASE WHEN nutrient_code = 1 THEN amount END) AS energy,
       MAX(CASE WHEN nutrient_code = 12 THEN amount END) AS water,
       MAX(CASE WHEN nutrient_code = 2 THEN amount END) AS protein,
       MAX(CASE WHEN nutrient_code = 4 THEN amount END) AS fat,
       MAX(CASE WHEN nutrient_code = 5 THEN amount END) AS dietary_fiber,
       MAX(CASE WHEN nutrient_code = 3 THEN amount END) AS carbohydrate,
       MAX(CASE WHEN nutrient_code = 13 THEN amount END) AS vitamin_e,
       MAX(CASE WHEN nutrient_code = 6 THEN amount END) AS sodium,
       MAX(CASE WHEN nutrient_code = 7 THEN amount END) AS potassium,
       MAX(CASE WHEN nutrient_code = 8 THEN amount END) AS phosphorus,
       MAX(CASE WHEN nutrient_code = 14 THEN amount END) AS calcium,
       MAX(CASE WHEN nutrient_code = 9 THEN amount END) AS cholesterol,
       MAX(CASE WHEN nutrient_code = 10 THEN amount END) AS saturated_fat,
       MAX(CASE WHEN nutrient_code = 11 THEN amount END) AS cooking_oil
FROM food_nutrient
WHERE is_deleted = 0
GROUP BY food_id;
