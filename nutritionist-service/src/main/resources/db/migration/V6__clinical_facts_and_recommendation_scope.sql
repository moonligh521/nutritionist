-- 同一范围只保留一个进行中的任务。请求正文和冲突约束单独保存，方便失败后复现。
ALTER TABLE recommendation_task
  ADD COLUMN active_scope_key VARCHAR(191) NULL COMMENT '进行中的范围键。同一范围不能同时有两个有效任务。结束后清空。',
  ADD COLUMN request_json JSON NULL COMMENT '发起时的请求快照。';

CREATE UNIQUE INDEX uk_recommendation_active_scope ON recommendation_task (active_scope_key);

-- 病情决定能不能自动配餐，以及使用哪套指南上限。未记录的病不能靠对话临时加上。
CREATE TABLE clinical_condition (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  condition_id VARCHAR(64) NOT NULL COMMENT '病情记录标识。',
  patient_id VARCHAR(64) NOT NULL COMMENT '患者标识。',
  condition_code VARCHAR(64) NOT NULL COMMENT '状况编码，例如高血压、糖尿病或需要停止自动配餐的情况。',
  onset_date DATE NULL COMMENT '开始日期。不知道时为空。',
  source_code INT NOT NULL COMMENT '这条记录的来源。',
  note VARCHAR(500) NULL COMMENT '补充说明。不能用说明文字代替编码。',
  version VARCHAR(32) NOT NULL COMMENT '记录版本。',
  status_code INT NOT NULL COMMENT '记录状态。停用后不再参与新的自动配餐。',
  created_at TIMESTAMP(3) NOT NULL COMMENT '写入时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_condition_id (condition_id)
) COMMENT='患者已经记录的疾病或状况。自动配餐只读这些事实，对话不能改写。';

-- 胰岛素、磺脲类等药物会改变能不能使用自动能量。用药事实只能由临床记录写入。
CREATE TABLE clinical_medication (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  medication_id VARCHAR(64) NOT NULL COMMENT '用药记录标识。',
  patient_id VARCHAR(64) NOT NULL COMMENT '患者标识。',
  medication_name VARCHAR(200) NOT NULL COMMENT '药物名称。无法标准化时不能进入自动能量计算。',
  category_code INT NULL COMMENT '药物类别。1 胰岛素，2 磺脲类，3 列净类。无法归类时为空。',
  dose_text VARCHAR(200) NULL COMMENT '剂量说明。剂量不参与自动换算。',
  frequency_text VARCHAR(200) NULL COMMENT '用药频次说明。',
  complete_confirmed TINYINT(1) NOT NULL COMMENT '用药信息是否已经确认完整。未确认时不能自动配餐。',
  version VARCHAR(32) NOT NULL COMMENT '记录版本。',
  created_at TIMESTAMP(3) NOT NULL COMMENT '写入时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_medication_id (medication_id)
) COMMENT='患者已经记录的用药。药名不完整或属于高风险类别时，不能自动推算能量。';

-- 过敏是硬约束。未确认的可疑过敏不能当成已经排除，也不能当成已经禁止。
CREATE TABLE clinical_allergy (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  allergy_id VARCHAR(64) NOT NULL COMMENT '过敏记录标识。',
  patient_id VARCHAR(64) NOT NULL COMMENT '患者标识。',
  allergen_code VARCHAR(64) NOT NULL COMMENT '过敏原编码。',
  severity_code INT NOT NULL COMMENT '严重程度。',
  confirmed TINYINT(1) NOT NULL COMMENT '是否已经确认。未确认的记录不能单独放行或禁止。',
  version VARCHAR(32) NOT NULL COMMENT '记录版本。',
  created_at TIMESTAMP(3) NOT NULL COMMENT '写入时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_allergy_id (allergy_id)
) COMMENT='已经确认的过敏或不耐受。命中后不能计算所谓安全的一口。';

-- 测量值本身和由此作出的许可分开保存。后续非紧急测量可以解除之前的停止。
CREATE TABLE clinical_measurement (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  measurement_id VARCHAR(64) NOT NULL COMMENT '测量标识。',
  event_id VARCHAR(64) NOT NULL COMMENT '事件标识。同一测量事件只记一次。',
  patient_id VARCHAR(64) NOT NULL COMMENT '患者标识。',
  type_code INT NOT NULL COMMENT '测量类型。',
  measurement_value DECIMAL(18,6) NOT NULL COMMENT '测量数值。单位见 unit_code，不能跨单位直接比较。',
  unit_code INT NOT NULL COMMENT '测量值的单位。',
  observed_at TIMESTAMP(3) NOT NULL COMMENT '测量发生时间。判断最新测量时按这个时间，不按写入时间。',
  decision_code INT NOT NULL COMMENT '测量处置，与 MeasurementDecision 一致：1 仅记录，2 保持方案，3 调整未来餐，4 人工复核，5 停止。',
  safety_permission_code INT NOT NULL COMMENT '安全许可，与 SafetyPermission 一致：1 允许，2 补充数据，3 人工复核，4 停止。',
  created_at TIMESTAMP(3) NOT NULL COMMENT '写入时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_measurement_event (event_id)
) COMMENT='一次测量及其安全处置。最新一次若要求停止，则不再自动配餐。';
