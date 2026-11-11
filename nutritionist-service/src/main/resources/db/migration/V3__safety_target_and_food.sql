CREATE TABLE rule_set (
  id             BIGINT        NOT NULL AUTO_INCREMENT,
  rule_set_id    VARCHAR(64)   NOT NULL,
  version        VARCHAR(32)   NOT NULL,
  status_code    INT           NOT NULL,
  effective_at   TIMESTAMP(3)  NULL,
  expires_at     TIMESTAMP(3)  NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_rule_set_version (rule_set_id, version)
);

CREATE TABLE rule_entry (
  id             BIGINT        NOT NULL AUTO_INCREMENT,
  rule_set_id    VARCHAR(64)   NOT NULL,
  rule_code      VARCHAR(64)   NOT NULL,
  permission_code INT          NOT NULL,
  reason_codes   JSON          NOT NULL,
  action_codes   JSON          NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_rule_entry (rule_set_id, rule_code)
);

CREATE TABLE nutrition_formula (
  id             BIGINT        NOT NULL AUTO_INCREMENT,
  formula_id     VARCHAR(64)   NOT NULL,
  version        VARCHAR(32)   NOT NULL,
  status_code    INT           NOT NULL,
  expression_text VARCHAR(1000) NOT NULL,
  input_unit     VARCHAR(32)   NOT NULL,
  output_unit    VARCHAR(32)   NOT NULL,
  effective_at   TIMESTAMP(3)  NULL,
  expires_at     TIMESTAMP(3)  NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_formula_version (formula_id, version)
);

CREATE TABLE formula_parameter (
  id             BIGINT        NOT NULL AUTO_INCREMENT,
  formula_id     VARCHAR(64)   NOT NULL,
  formula_version VARCHAR(32)  NOT NULL,
  parameter_code VARCHAR(64)   NOT NULL,
  parameter_value DECIMAL(18,6) NOT NULL,
  unit_code      INT           NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_formula_parameter (formula_id, formula_version, parameter_code)
);

CREATE TABLE food_item (
  id             BIGINT        NOT NULL AUTO_INCREMENT,
  food_item_id   VARCHAR(64)   NOT NULL,
  display_name   VARCHAR(200)  NOT NULL,
  source_ref     VARCHAR(200)  NOT NULL,
  data_version   VARCHAR(32)   NOT NULL,
  status_code    INT           NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_food_item_version (food_item_id, data_version)
);

CREATE TABLE food_nutrient (
  id             BIGINT        NOT NULL AUTO_INCREMENT,
  food_item_id   VARCHAR(64)   NOT NULL,
  data_version   VARCHAR(32)   NOT NULL,
  nutrient_code  INT           NOT NULL,
  value_per_100g DECIMAL(18,6) NULL,
  unit_code      INT           NOT NULL,
  quality_code   INT           NOT NULL,
  source_ref     VARCHAR(200)  NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_food_nutrient (food_item_id, data_version, nutrient_code)
);
