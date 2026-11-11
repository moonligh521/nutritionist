CREATE TABLE recognition_draft (
  id BIGINT NOT NULL AUTO_INCREMENT,
  draft_id VARCHAR(64) NOT NULL,
  patient_id VARCHAR(64) NOT NULL,
  source_type_code INT NOT NULL,
  source_reference VARCHAR(500) NOT NULL,
  candidates_json JSON NOT NULL,
  created_at TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_recognition_draft (draft_id)
);

CREATE TABLE cooking_execution (
  id BIGINT NOT NULL AUTO_INCREMENT,
  execution_id VARCHAR(64) NOT NULL,
  plan_id VARCHAR(64) NOT NULL,
  plan_version VARCHAR(32) NOT NULL,
  meal_id VARCHAR(64) NOT NULL,
  recipe_version VARCHAR(32) NOT NULL,
  status_code INT NOT NULL,
  created_at TIMESTAMP(3) NOT NULL,
  updated_at TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_cooking_execution (execution_id)
);

CREATE TABLE cooking_execution_step (
  id BIGINT NOT NULL AUTO_INCREMENT,
  execution_id VARCHAR(64) NOT NULL,
  step_no INT NOT NULL,
  completed_at TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_cooking_step (execution_id, step_no)
);

CREATE TABLE cooking_actual_ingredient (
  id BIGINT NOT NULL AUTO_INCREMENT,
  execution_id VARCHAR(64) NOT NULL,
  food_item_id VARCHAR(64) NOT NULL,
  planned_quantity DECIMAL(18,6) NOT NULL,
  actual_quantity DECIMAL(18,6) NOT NULL,
  unit_code INT NOT NULL,
  created_at TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE outcome_evaluation (
  id BIGINT NOT NULL AUTO_INCREMENT,
  evaluation_id VARCHAR(64) NOT NULL,
  patient_id VARCHAR(64) NOT NULL,
  category_code INT NOT NULL,
  decision_code INT NOT NULL,
  reason_code VARCHAR(64) NOT NULL,
  observed_at TIMESTAMP(3) NOT NULL,
  created_at TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_outcome_evaluation (evaluation_id, category_code)
);

CREATE TABLE professional_target (
  id BIGINT NOT NULL AUTO_INCREMENT,
  target_id VARCHAR(64) NOT NULL,
  patient_id VARCHAR(64) NOT NULL,
  current_version VARCHAR(32) NOT NULL,
  created_at TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_professional_target (target_id)
);

CREATE TABLE professional_target_version (
  id BIGINT NOT NULL AUTO_INCREMENT,
  target_id VARCHAR(64) NOT NULL,
  version VARCHAR(32) NOT NULL,
  nutrient_code VARCHAR(64) NOT NULL,
  minimum_value DECIMAL(18,6) NOT NULL,
  maximum_value DECIMAL(18,6) NOT NULL,
  effective_at TIMESTAMP(3) NOT NULL,
  expires_at TIMESTAMP(3) NOT NULL,
  created_at TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_professional_target_version (target_id, version)
);
