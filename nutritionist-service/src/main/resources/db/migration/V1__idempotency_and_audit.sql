CREATE TABLE idempotency_record (
  id               BIGINT       NOT NULL AUTO_INCREMENT,
  account_id       VARCHAR(64)  NOT NULL,
  endpoint_scope   VARCHAR(64)  NOT NULL,
  idempotency_key  VARCHAR(64)  NOT NULL,
  request_hash     CHAR(64)     NOT NULL,
  response_code    INT          NOT NULL,
  response_body    JSON         NOT NULL,
  created_at       TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id),
  UNIQUE KEY uk_idem (account_id, endpoint_scope, idempotency_key)
);

CREATE TABLE patient_binding (
  id               BIGINT       NOT NULL AUTO_INCREMENT,
  account_id       VARCHAR(64)  NOT NULL,
  patient_id       VARCHAR(64)  NOT NULL,
  patient_version  VARCHAR(64)  NOT NULL,
  bound_at         TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id),
  UNIQUE KEY uk_account_patient (account_id, patient_id)
);

CREATE TABLE decision_audit (
  id               BIGINT       NOT NULL AUTO_INCREMENT,
  patient_id       VARCHAR(64)  NOT NULL,
  decision_type    VARCHAR(64)  NOT NULL,
  payload          JSON         NOT NULL,
  created_at       TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id),
  KEY idx_patient_created (patient_id, created_at)
);

CREATE TABLE access_audit (
  id               BIGINT       NOT NULL AUTO_INCREMENT,
  account_id       VARCHAR(64)  NOT NULL,
  action           VARCHAR(64)  NOT NULL,
  detail           JSON         NULL,
  created_at       TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id),
  KEY idx_account_created (account_id, created_at)
);

CREATE TABLE capability_switch (
  id               BIGINT       NOT NULL AUTO_INCREMENT,
  scope_type       VARCHAR(64)  NOT NULL,
  scope_key        VARCHAR(128) NOT NULL,
  enabled          TINYINT(1)   NOT NULL DEFAULT 1,
  updated_at       TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id),
  UNIQUE KEY uk_scope (scope_type, scope_key)
);

CREATE TABLE capability_switch_event (
  id               BIGINT       NOT NULL AUTO_INCREMENT,
  scope_type       VARCHAR(64)  NOT NULL,
  scope_key        VARCHAR(128) NOT NULL,
  action           VARCHAR(32)  NOT NULL,
  actor_account_id VARCHAR(64)  NOT NULL,
  created_at       TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id),
  KEY idx_scope_created (scope_type, scope_key, created_at)
);
