CREATE TABLE user_profile (
  id                   BIGINT         NOT NULL AUTO_INCREMENT,
  profile_id           VARCHAR(64)    NOT NULL,
  account_id           VARCHAR(64)    NOT NULL,
  patient_id           VARCHAR(64)    NOT NULL,
  patient_version      VARCHAR(64)    NOT NULL,
  version              BIGINT         NOT NULL,
  sex_code             INT            NOT NULL,
  birth_date           DATE           NOT NULL,
  height_cm            DECIMAL(7,2)   NOT NULL,
  timezone             VARCHAR(64)    NOT NULL,
  activity_level_code  INT            NULL,
  goal_type_code       INT            NOT NULL,
  updated_at           TIMESTAMP(3)   NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_profile_id (profile_id),
  UNIQUE KEY uk_profile_patient (patient_id)
);

CREATE TABLE profile_snapshot (
  id                   BIGINT         NOT NULL AUTO_INCREMENT,
  profile_id           VARCHAR(64)    NOT NULL,
  version              BIGINT         NOT NULL,
  snapshot_json        JSON           NOT NULL,
  created_at           TIMESTAMP(3)   NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id),
  UNIQUE KEY uk_profile_snapshot (profile_id, version)
);
