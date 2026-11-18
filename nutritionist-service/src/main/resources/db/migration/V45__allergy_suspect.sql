-- 对话抽取的过敏嫌疑：不自动升临床，需显式确认。

CREATE TABLE diet_allergy_suspect (
  suspect_id VARCHAR(64) NOT NULL COMMENT '主键',
  owner_id VARCHAR(64) NOT NULL COMMENT 'patientId 或 session:xxx',
  subject VARCHAR(128) NOT NULL COMMENT '嫌疑过敏原名称/编码',
  evidence_text VARCHAR(500) NOT NULL COMMENT '短证据',
  pending_flag TINYINT NOT NULL DEFAULT 1 COMMENT '1=待确认 0=已处理',
  created_at TIMESTAMP(3) NOT NULL COMMENT '创建时间',
  updated_at TIMESTAMP(3) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (suspect_id),
  UNIQUE KEY uk_allergy_suspect_owner_subject (owner_id, subject),
  KEY idx_allergy_suspect_pending (owner_id, pending_flag)
) COMMENT='过敏嫌疑待确认；确认后写入临床过敏表。';
