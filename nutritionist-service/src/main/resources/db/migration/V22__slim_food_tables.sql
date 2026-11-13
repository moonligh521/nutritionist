-- 食材表按现在的用法收束。
-- 分类只留中文名。成分只留营养素和每 100 克数值。
-- 状态都是已发布，数据质量都是已知，单位由营养素编码决定，这些列没有区分作用。
-- 出处留在食材上，不在每一条成分上重复。

CREATE TABLE food_category_v (
  category_code INT NOT NULL COMMENT '中国配餐分类编号。',
  zh_name VARCHAR(32) NOT NULL COMMENT '中文分类名。',
  PRIMARY KEY (category_code)
) COMMENT='食材分类。';

INSERT INTO food_category_v (category_code, zh_name)
SELECT category_code, zh_name FROM food_category;

CREATE TABLE food_item_v (
  food_item_id VARCHAR(64) NOT NULL COMMENT '食材标识。',
  display_name VARCHAR(200) NOT NULL COMMENT '食材名称。目前是英文原名，用来确认是哪一种。',
  category_code INT NOT NULL COMMENT '中国配餐分类编号，名称见 food_category。',
  source_ref VARCHAR(200) NOT NULL COMMENT '营养数值的出处。没有出处不能参与自动计算。',
  PRIMARY KEY (food_item_id),
  KEY idx_food_item_category (category_code)
) COMMENT='食材。一条食材一个分类。';

INSERT INTO food_item_v (food_item_id, display_name, category_code, source_ref)
SELECT food_item_id, display_name, category_code, source_ref FROM food_item;

CREATE TABLE food_nutrient_v (
  food_item_id VARCHAR(64) NOT NULL COMMENT '食材标识。',
  nutrient_code INT NOT NULL COMMENT '营养素。1能量，2蛋白质，3碳水化合物，4脂肪，5膳食纤维，6钠，7钾，8磷，9胆固醇，10饱和脂肪，11烹调油。',
  value_per_100g DECIMAL(18,7) NOT NULL COMMENT '每 100 克含量。能量用千卡，钠、钾、磷、胆固醇用毫克，其余用克。没有这一行表示来源未给出，不能当成 0。',
  PRIMARY KEY (food_item_id, nutrient_code)
) COMMENT='食材每 100 克的成分。';

INSERT INTO food_nutrient_v (food_item_id, nutrient_code, value_per_100g)
SELECT food_item_id, nutrient_code, value_per_100g FROM food_nutrient;

CREATE TABLE food_alias_v (
  alias_name VARCHAR(64) NOT NULL COMMENT '中文家常叫法。一个叫法只对应一种食材。',
  food_item_id VARCHAR(64) NOT NULL COMMENT '食材标识。',
  PRIMARY KEY (alias_name),
  KEY idx_food_alias_item (food_item_id)
) COMMENT='食材的中文叫法。';

INSERT INTO food_alias_v (alias_name, food_item_id)
SELECT alias_name, food_item_id FROM food_alias;

DROP TABLE food_alias;
DROP TABLE food_nutrient;
DROP TABLE food_item;
DROP TABLE food_category;

RENAME TABLE food_category_v TO food_category;
RENAME TABLE food_item_v TO food_item;
RENAME TABLE food_nutrient_v TO food_nutrient;
RENAME TABLE food_alias_v TO food_alias;
