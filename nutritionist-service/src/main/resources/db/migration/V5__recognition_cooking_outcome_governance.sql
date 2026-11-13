-- 识别结果可能认错。未确认的草稿不能写入库存，也不能进入求解。
CREATE TABLE recognition_draft (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  draft_id VARCHAR(64) NOT NULL COMMENT '草稿标识。',
  patient_id VARCHAR(64) NOT NULL COMMENT '患者标识。',
  source_type_code INT NOT NULL COMMENT '来源类型，区分文字、照片和小票。',
  source_reference VARCHAR(500) NOT NULL COMMENT '原始输入的位置或引用。',
  candidates_json JSON NOT NULL COMMENT '待确认的候选食材、数量和置信度。',
  created_at TIMESTAMP(3) NOT NULL COMMENT '识别时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_recognition_draft (draft_id)
) COMMENT='文字或图片识别出的食材草稿。用户确认前不能参与配餐。';

-- 开始烹饪不等于吃完，完成烹饪也不等于全部摄入。用户报告偏差后不能继续按原计划记账。
CREATE TABLE cooking_execution (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  execution_id VARCHAR(64) NOT NULL COMMENT '烹饪会话标识。',
  plan_id VARCHAR(64) NOT NULL COMMENT '所属方案。',
  plan_version VARCHAR(32) NOT NULL COMMENT '烹饪所依据的方案版本。',
  meal_id VARCHAR(64) NOT NULL COMMENT '所属餐次。',
  recipe_version VARCHAR(32) NOT NULL COMMENT '实际采用的菜谱版本。',
  status_code INT NOT NULL COMMENT '烹饪状态：1 已开始，2 进行中，3 已完成，4 已中止，5 等待修订。',
  created_at TIMESTAMP(3) NOT NULL COMMENT '开始时间。',
  updated_at TIMESTAMP(3) NOT NULL COMMENT '最后更新时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_cooking_execution (execution_id)
) COMMENT='一次实际烹饪。计划用料和实际投入分开记录。';

-- 只有用户确认的步骤才能按计划投放量扣减预留。跳过的步骤不能记成已完成。
CREATE TABLE cooking_execution_step (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  execution_id VARCHAR(64) NOT NULL COMMENT '所属烹饪会话。',
  step_no INT NOT NULL COMMENT '步骤序号。同一次烹饪里不重复。',
  completed_at TIMESTAMP(3) NOT NULL COMMENT '用户确认完成的时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_cooking_step (execution_id, step_no)
) COMMENT='烹饪会话中已经确认完成的步骤。';

-- 多放油盐、换料或改份数都不能继续按原计划扣库存。实际量单独保存。
CREATE TABLE cooking_actual_ingredient (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  execution_id VARCHAR(64) NOT NULL COMMENT '所属烹饪会话。',
  food_item_id VARCHAR(64) NOT NULL COMMENT '实际涉及的食材。',
  planned_quantity DECIMAL(18,6) NOT NULL COMMENT '计划用量。',
  actual_quantity DECIMAL(18,6) NOT NULL COMMENT '实际投入量。',
  unit_code INT NOT NULL COMMENT '用量单位。',
  created_at TIMESTAMP(3) NOT NULL COMMENT '记录时间。',
  PRIMARY KEY (id)
) COMMENT='烹饪时的计划用量和实际投入。两者不一致时要留下实际量。';

-- 体重变化不能据此加大热量缺口。评价只决定是否保持、调整未来餐或转人工。
CREATE TABLE outcome_evaluation (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  evaluation_id VARCHAR(64) NOT NULL COMMENT '评价标识。同一评价可以有多个类别。',
  patient_id VARCHAR(64) NOT NULL COMMENT '患者标识。',
  category_code INT NOT NULL COMMENT '评价类别，例如安全、依从、饱腹、体重、代谢反应和可执行性。',
  decision_code INT NOT NULL COMMENT '处置决定，例如保持方案、调整未来餐、人工复核或停止。',
  reason_code VARCHAR(64) NOT NULL COMMENT '原因编码。',
  observed_at TIMESTAMP(3) NOT NULL COMMENT '用户观察到该情况的时间。',
  created_at TIMESTAMP(3) NOT NULL COMMENT '记录写入时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_outcome_evaluation (evaluation_id, category_code)
) COMMENT='用餐后的结构化评价。评价不能改写已经吃过的记录。';

-- 专业目标是当前有效版本的指针。历史版本保留，过期后不能继续当作当前目标。
CREATE TABLE professional_target (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  target_id VARCHAR(64) NOT NULL COMMENT '专业目标标识。',
  patient_id VARCHAR(64) NOT NULL COMMENT '患者标识。',
  current_version VARCHAR(32) NOT NULL COMMENT '当前有效版本。',
  created_at TIMESTAMP(3) NOT NULL COMMENT '创建时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_professional_target (target_id)
) COMMENT='专业人员为患者设定的营养目标。有专业目标时，自动能量公式让路。';

-- 专业人员给出的能量或营养素上下限优先于推算值。换目标时新增版本，不覆盖旧版。
CREATE TABLE professional_target_version (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  target_id VARCHAR(64) NOT NULL COMMENT '专业目标标识。',
  version VARCHAR(32) NOT NULL COMMENT '版本号。',
  nutrient_code VARCHAR(64) NOT NULL COMMENT '这条上下限约束的营养素。',
  minimum_value DECIMAL(18,6) NOT NULL COMMENT '下限。',
  maximum_value DECIMAL(18,6) NOT NULL COMMENT '上限。',
  effective_at TIMESTAMP(3) NOT NULL COMMENT '生效时间。',
  expires_at TIMESTAMP(3) NOT NULL COMMENT '失效时间。过期后这次配餐不能再使用这一版。',
  created_at TIMESTAMP(3) NOT NULL COMMENT '写入时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_professional_target_version (target_id, version)
) COMMENT='专业营养目标的一版上下限。有效期过了就不能再用于新的自动配餐。';
