-- 成分按可食部分、能量、水分、蛋白质、脂肪、膳食纤维、碳水化物、维生素E、钠、钙、胆固醇来记。
-- 可食部分挂在食材上。水分、维生素E、钙补进营养素编号。钾、磷、饱和脂肪、烹调油仍保留。
-- 没有的含量不插行，不能写成 0。

ALTER TABLE food
  ADD COLUMN edible_portion DECIMAL(18, 7) NULL COMMENT '可食部分' AFTER category_code;

CREATE TABLE nutrient (
    code         TINYINT      NOT NULL COMMENT '编号',
    name         VARCHAR(32)  NOT NULL COMMENT '名称',
    sort_no      INT          NOT NULL DEFAULT 0 COMMENT '排序',
    remark       VARCHAR(400) NULL     COMMENT '备注',
    created_by   VARCHAR(100) NULL     COMMENT '创建人',
    updated_by   VARCHAR(100) NULL     COMMENT '修改人',
    created_at   DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
    updated_at   DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
    is_deleted   BIGINT       NOT NULL DEFAULT 0 COMMENT '删除标记',
    PRIMARY KEY (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='营养素';

INSERT INTO nutrient (code, name, sort_no) VALUES
(1, '能量', 1),
(2, '蛋白质', 2),
(3, '碳水化物', 3),
(4, '脂肪', 4),
(5, '膳食纤维', 5),
(6, '钠', 6),
(7, '钾', 7),
(8, '磷', 8),
(9, '胆固醇', 9),
(10, '饱和脂肪', 10),
(11, '烹调油', 11),
(12, '水分', 12),
(13, '维生素E', 13),
(14, '钙', 14);
