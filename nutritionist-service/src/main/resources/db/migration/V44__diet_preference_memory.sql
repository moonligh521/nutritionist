-- 饮食偏好记忆三表：事实 / 事件 / 审核。与临床过敏表分离。

CREATE TABLE diet_preference_fact (
  fact_id VARCHAR(64) NOT NULL COMMENT '事实主键',
  owner_id VARCHAR(64) NOT NULL COMMENT '归属：patientId 或 session:xxx',
  subject VARCHAR(128) NOT NULL COMMENT '主体，如食材名/菜系/标签',
  subject_type VARCHAR(16) NOT NULL COMMENT 'FOOD|CUISINE|TAG',
  polarity VARCHAR(16) NOT NULL COMMENT 'LIKE|AVOID|NEUTRAL',
  strength VARCHAR(16) NOT NULL COMMENT 'ABSOLUTE|STRONG|MODERATE|WEAK',
  scope_type VARCHAR(16) NOT NULL COMMENT 'PERMANENT|TEMPORARY|CONDITIONAL|TURN',
  condition_json VARCHAR(500) NULL COMMENT 'CONDITIONAL 条件，首版可空',
  valid_from TIMESTAMP(3) NOT NULL COMMENT '生效起点',
  valid_to TIMESTAMP(3) NULL COMMENT '失效时刻；空表示现行',
  source_text VARCHAR(200) NOT NULL COMMENT '来源摘要',
  event_id VARCHAR(64) NOT NULL COMMENT '写入该事实的事件',
  version_no BIGINT NOT NULL COMMENT 'owner 级版本',
  created_at TIMESTAMP(3) NOT NULL COMMENT '创建时间',
  updated_at TIMESTAMP(3) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (fact_id),
  KEY idx_pref_owner_subject (owner_id, subject, subject_type),
  KEY idx_pref_owner_current (owner_id, valid_to),
  KEY idx_pref_event (event_id)
) COMMENT='饮食偏好事实链。valid_to 为空表示现行。';

CREATE TABLE diet_memory_event (
  event_id VARCHAR(64) NOT NULL COMMENT '幂等键',
  owner_id VARCHAR(64) NOT NULL COMMENT '归属',
  operation VARCHAR(16) NOT NULL COMMENT 'ASSERT|REPLACE|RETRACT|CONFIRM|CORRECT',
  subject VARCHAR(128) NOT NULL COMMENT '主体',
  subject_type VARCHAR(16) NOT NULL COMMENT 'FOOD|CUISINE|TAG',
  polarity VARCHAR(16) NOT NULL COMMENT '极性',
  strength VARCHAR(16) NOT NULL COMMENT '强度',
  scope_type VARCHAR(16) NOT NULL COMMENT '范围',
  evidence_text VARCHAR(500) NOT NULL COMMENT '短证据',
  evidence_hash VARCHAR(64) NULL COMMENT '证据哈希',
  extractor_version VARCHAR(32) NOT NULL COMMENT '抽取器版本',
  status_code VARCHAR(16) NOT NULL COMMENT 'PENDING|APPLIED|REJECTED|FAILED',
  before_json VARCHAR(2000) NULL COMMENT '变更前快照',
  after_json VARCHAR(2000) NULL COMMENT '变更后快照',
  applied_at TIMESTAMP(3) NULL COMMENT '应用时间',
  created_at TIMESTAMP(3) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (event_id),
  KEY idx_mem_event_owner (owner_id, created_at)
) COMMENT='记忆变更事件。event_id 幂等防重试双写。';

CREATE TABLE diet_memory_review (
  review_id VARCHAR(64) NOT NULL COMMENT '审核主键',
  event_id VARCHAR(64) NOT NULL COMMENT '关联事件',
  owner_id VARCHAR(64) NOT NULL COMMENT '归属',
  review_type VARCHAR(16) NOT NULL COMMENT 'CONFIRM|REJECT|CORRECT|DELETE',
  reviewer_type VARCHAR(16) NOT NULL COMMENT 'USER|STAFF|SYSTEM',
  corrected_value VARCHAR(500) NULL COMMENT '纠错后的值摘要',
  note_text VARCHAR(500) NULL COMMENT '说明',
  reviewed_at TIMESTAMP(3) NOT NULL COMMENT '审核时间',
  PRIMARY KEY (review_id),
  KEY idx_mem_review_owner (owner_id, reviewed_at),
  KEY idx_mem_review_event (event_id)
) COMMENT='记忆确认/拒绝/纠错审计。';
