-- 吃下去的量不是计划量。记录时钉住当时的患者主数据版本，更正时保留原事件，另写更正记录。
ALTER TABLE intake_event
  ADD COLUMN patient_version VARCHAR(64) NOT NULL DEFAULT '' COMMENT '记录时的患者主数据版本。不能用后来的患者版本解释这次摄入。' AFTER patient_id;

-- 同一输入应得到同一结果。这里保存画像、规则、约束和求解器的摘要，不保存可以事后改写的正文。
CREATE TABLE decision_replay (
  plan_version VARCHAR(64) NOT NULL COMMENT '方案版本。一份版本只有一条回放。',
  profile_hash CHAR(64) NOT NULL COMMENT '当时画像输入的摘要。',
  rules_hash CHAR(64) NOT NULL COMMENT '当时规则集的摘要。',
  constraint_ids_json JSON NOT NULL COMMENT '当时生效的约束标识。',
  solver_version VARCHAR(64) NOT NULL COMMENT '求解器版本。',
  solver_layer_hash CHAR(64) NOT NULL COMMENT '求解分层结果的摘要。',
  created_at TIMESTAMP(3) NOT NULL COMMENT '回放写入时间。',
  PRIMARY KEY (plan_version)
) COMMENT='方案版本的决策回放摘要。用来复现当时为什么得到这个结果。';
