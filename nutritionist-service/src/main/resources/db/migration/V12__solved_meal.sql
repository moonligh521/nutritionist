-- 推荐展示可以换说法，但不能改食材标识和克数。单餐在没有已发布餐次比例时，不能把这一餐记成全天剩余额度。
CREATE TABLE solved_meal_dish (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  patient_id VARCHAR(64) NOT NULL COMMENT '患者标识。',
  meal_date DATE NOT NULL COMMENT '这一餐所属日期。',
  recipe_id VARCHAR(64) NOT NULL COMMENT '入选的菜谱。',
  portions DECIMAL(18,6) NOT NULL COMMENT '份数。1 表示菜谱上的整份。',
  food_item_id VARCHAR(64) NOT NULL COMMENT '该份菜谱中的食材。',
  grams DECIMAL(18,6) NOT NULL COMMENT '求解锁定的克数。',
  step_text VARCHAR(2000) NOT NULL COMMENT '已发布菜谱上的步骤原文。',
  PRIMARY KEY (id),
  KEY idx_solved_meal (patient_id, meal_date)
) COMMENT='求解器锁定的一餐结果。克数和步骤来自已发布菜谱，不由模型改写。';
