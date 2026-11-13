-- 库存不够时可以列出缺口。用户明确只要家中食材时，不能把缺口食材悄悄算进方案。
CREATE TABLE solved_meal_shortage (
  patient_id VARCHAR(64) NOT NULL COMMENT '患者标识。',
  meal_date DATE NOT NULL COMMENT '缺货所属日期。',
  food_item_id VARCHAR(64) NOT NULL COMMENT '仍然缺少的食材。',
  PRIMARY KEY (patient_id, meal_date, food_item_id)
) COMMENT='优先使用库存时，这一餐仍然缺少的食材。缺货不等于已经购买。';
