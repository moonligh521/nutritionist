-- 重复提交不能生成两套方案。命中已有键时直接返回第一次的结果。
CREATE TABLE idempotency_record (
  id               BIGINT       NOT NULL AUTO_INCREMENT COMMENT '行号。对外用账号、接口范围和幂等键识别，不使用自增号。',
  account_id       VARCHAR(64)  NOT NULL COMMENT '发起请求的账号。',
  endpoint_scope   VARCHAR(64)  NOT NULL COMMENT '接口范围。不同接口的相同幂等键互不占用。',
  idempotency_key  VARCHAR(64)  NOT NULL COMMENT '调用方传入的幂等键。',
  request_hash     CHAR(64)     NOT NULL COMMENT '第一次请求正文的摘要。同一键携带不同正文时不能当成同一次请求。',
  response_code    INT          NOT NULL COMMENT '第一次处理返回的业务码。',
  response_body    JSON         NOT NULL COMMENT '第一次处理返回的正文。重复请求原样返回，不再执行。',
  created_at       TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '第一次处理完成的时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_idem (account_id, endpoint_scope, idempotency_key)
) COMMENT='接口幂等记录。同一账号、同一接口、同一幂等键只保留第一次结果。';

-- 一个账号可以绑定患者。营养计算只认患者标识，不复制挂号里的主数据。
CREATE TABLE patient_binding (
  id               BIGINT       NOT NULL AUTO_INCREMENT COMMENT '行号。',
  account_id       VARCHAR(64)  NOT NULL COMMENT '账号标识。',
  patient_id       VARCHAR(64)  NOT NULL COMMENT '患者标识。',
  patient_version  VARCHAR(64)  NOT NULL COMMENT '绑定时的患者主数据版本。主数据后来变更不能悄悄改掉这次绑定。',
  bound_at         TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '绑定时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_account_patient (account_id, patient_id)
) COMMENT='账号和患者的绑定。营养服务不保存姓名，只保留挂号侧的患者标识。';

-- 自动配餐的许可结果必须能回放。后来的新测量不能改写已经作出的决定。
CREATE TABLE decision_audit (
  id               BIGINT       NOT NULL AUTO_INCREMENT COMMENT '行号。',
  patient_id       VARCHAR(64)  NOT NULL COMMENT '患者标识。',
  decision_type    VARCHAR(64)  NOT NULL COMMENT '决定类型，区分安全许可、测量处置等不同记录。',
  payload          JSON         NOT NULL COMMENT '当时的许可、原因和处置。只追加，不覆盖。',
  created_at       TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '写入时间。',
  PRIMARY KEY (id),
  KEY idx_patient_created (patient_id, created_at)
) COMMENT='安全许可和处置决定的追加记录。写入后不修改。';

-- 敏感健康数据的读取要留下痕迹，不能只靠应用日志。
CREATE TABLE access_audit (
  id               BIGINT       NOT NULL AUTO_INCREMENT COMMENT '行号。',
  account_id       VARCHAR(64)  NOT NULL COMMENT '访问者账号。',
  action           VARCHAR(64)  NOT NULL COMMENT '访问动作。',
  detail           JSON         NULL COMMENT '访问范围。没有额外内容时为空。',
  created_at       TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '访问时间。',
  PRIMARY KEY (id),
  KEY idx_account_created (account_id, created_at)
) COMMENT='健康数据访问审计。记录谁在什么时候读过哪些数据。';

-- 停用推荐必须立刻生效。这里只留当前状态，变更过程写在事件表。
CREATE TABLE capability_switch (
  id               BIGINT       NOT NULL AUTO_INCREMENT COMMENT '行号。',
  scope_type       VARCHAR(64)  NOT NULL COMMENT '开关范围类型，例如全局、规则或食材数据。',
  scope_key        VARCHAR(128) NOT NULL COMMENT '范围标识。同一类型下每个标识只有一行当前状态。',
  enabled          TINYINT(1)   NOT NULL DEFAULT 1 COMMENT '是否允许自动推荐。1 允许，0 关闭。',
  updated_at       TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '当前状态的最后变更时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_scope (scope_type, scope_key)
) COMMENT='自动推荐开关的当前状态。按范围关闭后，该范围不再自动配餐。';

-- 开关当前行会被更新。谁在什么时候打开或关闭，必须另记一行。
CREATE TABLE capability_switch_event (
  id               BIGINT       NOT NULL AUTO_INCREMENT COMMENT '行号。',
  scope_type       VARCHAR(64)  NOT NULL COMMENT '开关范围类型，与当前状态表一致。',
  scope_key        VARCHAR(128) NOT NULL COMMENT '范围标识。',
  action           VARCHAR(32)  NOT NULL COMMENT '本次动作，打开或关闭。',
  actor_account_id VARCHAR(64)  NOT NULL COMMENT '操作人账号。',
  created_at       TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '动作时间。',
  PRIMARY KEY (id),
  KEY idx_scope_created (scope_type, scope_key, created_at)
) COMMENT='推荐开关的变更事件。当前状态被覆盖后，仍能追溯是谁关闭的。';
