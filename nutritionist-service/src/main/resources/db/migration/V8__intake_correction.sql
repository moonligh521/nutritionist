-- 吃过的记录不能直接改掉。更正必须指向原来的摄入，并单独保存更正后的明细。
CREATE TABLE intake_correction (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  correction_id VARCHAR(64) NOT NULL COMMENT '更正标识。',
  event_id VARCHAR(64) NOT NULL COMMENT '更正事件标识。同一事件只更正一次。',
  original_intake_id VARCHAR(64) NOT NULL COMMENT '被更正的原摄入。',
  account_id VARCHAR(64) NOT NULL COMMENT '更正人账号。',
  patient_id VARCHAR(64) NOT NULL COMMENT '患者标识。',
  patient_version VARCHAR(64) NOT NULL COMMENT '更正时的患者主数据版本。',
  note VARCHAR(2000) NULL COMMENT '更正说明。空值表示没有额外说明。',
  recorded_at TIMESTAMP(3) NOT NULL COMMENT '更正时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_intake_correction (correction_id),
  UNIQUE KEY uk_intake_correction_event (event_id)
) COMMENT='对已记录摄入的更正。原摄入保留，更正另记一行。';

-- 更正后的食物、成品、数量和重量基准要单独保存，避免和原摄入混在一起。
CREATE TABLE intake_correction_item (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  correction_id VARCHAR(64) NOT NULL COMMENT '所属更正。',
  item_type_code INT NOT NULL COMMENT '项目类型，区分简单食物和熟制成品。',
  food_item_id VARCHAR(64) NULL COMMENT '简单食物的食材标识。熟制成品可以为空。',
  cooking_execution_id VARCHAR(64) NULL COMMENT '熟制成品对应的烹饪会话。简单食物可以为空。',
  quantity DECIMAL(18,6) NOT NULL COMMENT '更正后的数量。',
  unit_code INT NOT NULL COMMENT '数量单位。',
  weight_basis_code INT NOT NULL COMMENT '重量基准。不同基准不能直接相加。',
  PRIMARY KEY (id)
) COMMENT='更正后的摄入明细。原明细不删除。';
