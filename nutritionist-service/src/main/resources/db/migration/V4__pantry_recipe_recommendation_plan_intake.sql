CREATE TABLE pantry_item (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  pantry_item_id    VARCHAR(64) NOT NULL,
  account_id        VARCHAR(64) NOT NULL,
  patient_id        VARCHAR(64) NOT NULL,
  food_item_id      VARCHAR(64) NOT NULL,
  state_code        INT NOT NULL,
  unit_code         INT NOT NULL,
  created_at        TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_pantry_item_id (pantry_item_id)
);

CREATE TABLE pantry_lot (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  lot_id            VARCHAR(64) NOT NULL,
  pantry_item_id    VARCHAR(64) NOT NULL,
  lot_code          VARCHAR(64) NULL,
  on_hand_quantity  DECIMAL(18,6) NOT NULL,
  reserved_quantity DECIMAL(18,6) NOT NULL,
  expire_at         TIMESTAMP(3) NULL,
  version           BIGINT NOT NULL,
  updated_at        TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_pantry_lot_id (lot_id)
);

CREATE TABLE pantry_reservation (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  reservation_id    VARCHAR(64) NOT NULL,
  plan_version_id   VARCHAR(64) NOT NULL,
  lot_id            VARCHAR(64) NOT NULL,
  quantity          DECIMAL(18,6) NOT NULL,
  status_code       INT NOT NULL,
  created_at        TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_plan_lot_reservation (plan_version_id, lot_id)
);

CREATE TABLE pantry_change_event (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  event_id          VARCHAR(64) NOT NULL,
  patient_id        VARCHAR(64) NOT NULL,
  lot_id            VARCHAR(64) NOT NULL,
  change_type_code  INT NOT NULL,
  quantity          DECIMAL(18,6) NOT NULL,
  created_at        TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_pantry_change_event (event_id)
);

CREATE TABLE meal_budget (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  budget_id         VARCHAR(64) NOT NULL,
  patient_id        VARCHAR(64) NOT NULL,
  budget_date       DATE NOT NULL,
  meal_type_code    INT NOT NULL,
  target_version    VARCHAR(64) NOT NULL,
  budget_json       JSON NOT NULL,
  created_at        TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_meal_budget (patient_id, budget_date, meal_type_code, target_version)
);

CREATE TABLE recommendation_task (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  recommendation_id VARCHAR(64) NOT NULL,
  account_id        VARCHAR(64) NOT NULL,
  patient_id        VARCHAR(64) NOT NULL,
  request_hash      CHAR(64) NOT NULL,
  status_code       INT NOT NULL,
  failure_code      INT NULL,
  profile_version   VARCHAR(64) NOT NULL,
  pantry_version    VARCHAR(64) NOT NULL,
  created_at        TIMESTAMP(3) NOT NULL,
  updated_at        TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_recommendation_id (recommendation_id)
);

CREATE TABLE recommendation_event (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  recommendation_id VARCHAR(64) NOT NULL,
  event_id          VARCHAR(64) NOT NULL,
  event_type_code   INT NOT NULL,
  stage_code        INT NOT NULL,
  message           VARCHAR(500) NOT NULL,
  occurred_at       TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_recommendation_event (recommendation_id, event_id)
);

CREATE TABLE plan (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  plan_id           VARCHAR(64) NOT NULL,
  account_id        VARCHAR(64) NOT NULL,
  patient_id        VARCHAR(64) NOT NULL,
  status_code       INT NOT NULL,
  current_version   VARCHAR(64) NOT NULL,
  created_at        TIMESTAMP(3) NOT NULL,
  updated_at        TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_plan_id (plan_id)
);

CREATE TABLE plan_version (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  plan_version_id   VARCHAR(64) NOT NULL,
  plan_id           VARCHAR(64) NOT NULL,
  profile_version   VARCHAR(64) NOT NULL,
  pantry_version    VARCHAR(64) NOT NULL,
  status_code       INT NOT NULL,
  created_at        TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_plan_version_id (plan_version_id)
);

CREATE TABLE meal (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  meal_id           VARCHAR(64) NOT NULL,
  plan_version_id   VARCHAR(64) NOT NULL,
  meal_type_code    INT NOT NULL,
  status_code       INT NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_meal_id (meal_id)
);

CREATE TABLE meal_item (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  meal_item_id      VARCHAR(64) NOT NULL,
  meal_id           VARCHAR(64) NOT NULL,
  item_type_code    INT NOT NULL,
  item_ref          VARCHAR(64) NOT NULL,
  quantity          DECIMAL(18,6) NOT NULL,
  unit_code         INT NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_meal_item_id (meal_item_id)
);

CREATE TABLE plan_confirmation (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  confirmation_id   VARCHAR(64) NOT NULL,
  plan_id           VARCHAR(64) NOT NULL,
  plan_version_id   VARCHAR(64) NOT NULL,
  confirmed_at      TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_plan_confirmation (confirmation_id)
);

CREATE TABLE intake_event (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  intake_id         VARCHAR(64) NOT NULL,
  event_id          VARCHAR(64) NOT NULL,
  account_id        VARCHAR(64) NOT NULL,
  patient_id        VARCHAR(64) NOT NULL,
  meal_id           VARCHAR(64) NULL,
  recorded_at       TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_intake_event_id (event_id)
);

CREATE TABLE intake_item (
  id                   BIGINT NOT NULL AUTO_INCREMENT,
  intake_id            VARCHAR(64) NOT NULL,
  item_type_code       INT NOT NULL,
  food_item_id         VARCHAR(64) NULL,
  cooking_execution_id VARCHAR(64) NULL,
  quantity             DECIMAL(18,6) NOT NULL,
  unit_code            INT NOT NULL,
  weight_basis_code    INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE recipe (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  recipe_id         VARCHAR(64) NOT NULL,
  display_name      VARCHAR(200) NOT NULL,
  current_version   VARCHAR(64) NOT NULL,
  created_at        TIMESTAMP(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_recipe_id (recipe_id)
);

CREATE TABLE recipe_version (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  recipe_id         VARCHAR(64) NOT NULL,
  version           VARCHAR(64) NOT NULL,
  status_code       INT NOT NULL,
  approved_at       TIMESTAMP(3) NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_recipe_version (recipe_id, version)
);

CREATE TABLE recipe_ingredient (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  recipe_id         VARCHAR(64) NOT NULL,
  recipe_version    VARCHAR(64) NOT NULL,
  food_item_id      VARCHAR(64) NOT NULL,
  quantity          DECIMAL(18,6) NOT NULL,
  unit_code         INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE recipe_step (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  recipe_id         VARCHAR(64) NOT NULL,
  recipe_version    VARCHAR(64) NOT NULL,
  step_no           INT NOT NULL,
  instruction_text  VARCHAR(2000) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_recipe_step (recipe_id, recipe_version, step_no)
);

CREATE TABLE recipe_step_dependency (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  recipe_id         VARCHAR(64) NOT NULL,
  recipe_version    VARCHAR(64) NOT NULL,
  step_no           INT NOT NULL,
  depends_on_step_no INT NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_recipe_step_dependency (recipe_id, recipe_version, step_no, depends_on_step_no)
);

CREATE TABLE recipe_equipment_variant (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  recipe_id         VARCHAR(64) NOT NULL,
  recipe_version    VARCHAR(64) NOT NULL,
  equipment_code    VARCHAR(64) NOT NULL,
  variant_text      VARCHAR(2000) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_recipe_equipment (recipe_id, recipe_version, equipment_code)
);

CREATE TABLE cooking_transform (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  transform_id      VARCHAR(64) NOT NULL,
  food_item_id      VARCHAR(64) NOT NULL,
  method_code       INT NOT NULL,
  version           VARCHAR(64) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_cooking_transform (transform_id, version)
);

CREATE TABLE nutrition_retention_factor (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  transform_id      VARCHAR(64) NOT NULL,
  transform_version VARCHAR(64) NOT NULL,
  nutrient_code     INT NOT NULL,
  factor_value      DECIMAL(18,6) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_retention_factor (transform_id, transform_version, nutrient_code)
);

CREATE TABLE recipe_nutrition_result (
  id                BIGINT NOT NULL AUTO_INCREMENT,
  recipe_id         VARCHAR(64) NOT NULL,
  recipe_version    VARCHAR(64) NOT NULL,
  nutrient_code     INT NOT NULL,
  nutrient_value    DECIMAL(18,6) NULL,
  unit_code         INT NOT NULL,
  quality_code      INT NOT NULL,
  source_ref        VARCHAR(200) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_recipe_nutrition (recipe_id, recipe_version, nutrient_code)
);
