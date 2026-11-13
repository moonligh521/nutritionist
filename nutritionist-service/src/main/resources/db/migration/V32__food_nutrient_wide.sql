-- 食材成分改成宽表：一种食材一行，营养素并排。
-- 空着表示不知道，不能当成 0。食物名仍在食材表，这里只挂食材编号。

CREATE TABLE food_nutrient_v (
    food_id        BIGINT         NOT NULL COMMENT '食材编号',
    energy         DECIMAL(18, 7) NULL     COMMENT '能量',
    water          DECIMAL(18, 7) NULL     COMMENT '水分',
    protein        DECIMAL(18, 7) NULL     COMMENT '蛋白质',
    fat            DECIMAL(18, 7) NULL     COMMENT '脂肪',
    dietary_fiber  DECIMAL(18, 7) NULL     COMMENT '膳食纤维',
    carbohydrate   DECIMAL(18, 7) NULL     COMMENT '碳水化物',
    vitamin_e      DECIMAL(18, 7) NULL     COMMENT '维生素E',
    sodium         DECIMAL(18, 7) NULL     COMMENT '钠',
    potassium      DECIMAL(18, 7) NULL     COMMENT '钾',
    phosphorus     DECIMAL(18, 7) NULL     COMMENT '磷',
    calcium        DECIMAL(18, 7) NULL     COMMENT '钙',
    cholesterol    DECIMAL(18, 7) NULL     COMMENT '胆固醇',
    saturated_fat  DECIMAL(18, 7) NULL     COMMENT '饱和脂肪',
    cooking_oil    DECIMAL(18, 7) NULL     COMMENT '烹调油',
    remark         VARCHAR(400)   NULL     COMMENT '备注',
    created_by     VARCHAR(100)   NULL     COMMENT '创建人',
    updated_by     VARCHAR(100)   NULL     COMMENT '修改人',
    created_at     DATETIME(3)    NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
    updated_at     DATETIME(3)    NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
    is_deleted     BIGINT         NOT NULL DEFAULT 0 COMMENT '删除标记',
    PRIMARY KEY (food_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='食材成分';

INSERT INTO food_nutrient_v (
    food_id, energy, water, protein, fat, dietary_fiber, carbohydrate, vitamin_e,
    sodium, potassium, phosphorus, calcium, cholesterol, saturated_fat, cooking_oil
)
SELECT food_id,
       MAX(CASE WHEN nutrient_code = 1 THEN amount END),
       MAX(CASE WHEN nutrient_code = 12 THEN amount END),
       MAX(CASE WHEN nutrient_code = 2 THEN amount END),
       MAX(CASE WHEN nutrient_code = 4 THEN amount END),
       MAX(CASE WHEN nutrient_code = 5 THEN amount END),
       MAX(CASE WHEN nutrient_code = 3 THEN amount END),
       MAX(CASE WHEN nutrient_code = 13 THEN amount END),
       MAX(CASE WHEN nutrient_code = 6 THEN amount END),
       MAX(CASE WHEN nutrient_code = 7 THEN amount END),
       MAX(CASE WHEN nutrient_code = 8 THEN amount END),
       MAX(CASE WHEN nutrient_code = 14 THEN amount END),
       MAX(CASE WHEN nutrient_code = 9 THEN amount END),
       MAX(CASE WHEN nutrient_code = 10 THEN amount END),
       MAX(CASE WHEN nutrient_code = 11 THEN amount END)
FROM food_nutrient
WHERE is_deleted = 0
GROUP BY food_id;

DROP TABLE food_nutrient;
RENAME TABLE food_nutrient_v TO food_nutrient;
