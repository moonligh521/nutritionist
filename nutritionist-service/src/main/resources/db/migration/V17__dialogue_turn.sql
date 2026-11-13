-- 第二天或一个月后再问，要能读到上次的方案说明。病情、用药和测量仍以临床记录为准。
CREATE TABLE dialogue_turn (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。同一患者按写入顺序读取最近一轮。',
  patient_id VARCHAR(64) NOT NULL COMMENT '患者标识。',
  turn_date DATE NOT NULL COMMENT '这一轮对话所属日期。',
  goal_code VARCHAR(32) NULL COMMENT '从这句话识别出的目标。没有识别到时为空。减肥字样只记目标，不自动收紧热量。',
  food_names VARCHAR(500) NOT NULL COMMENT '这句话里提到的食材名称。',
  missing_names VARCHAR(500) NOT NULL COMMENT '其中还没有成分数据的食材。',
  explanation VARCHAR(2000) NOT NULL COMMENT '当时返回给用户的说明。',
  created_at TIMESTAMP(3) NOT NULL COMMENT '写入时间。',
  PRIMARY KEY (id),
  KEY idx_dialogue_patient (patient_id, id)
) COMMENT='家常对话的一轮结果。保存目标和当时的说明，不把聊天原文当成医疗事实。';
