-- 菜谱对外主键统一为 recipe.id（BIGINT 自增）。子表 recipe_id 改为引用该数字，并删除字符串业务菜号。

-- recipe_version
ALTER TABLE recipe_version ADD COLUMN recipe_ref BIGINT NULL COMMENT '菜谱主键，对应 recipe.id' AFTER id;
UPDATE recipe_version child
    INNER JOIN recipe r ON r.recipe_id = child.recipe_id
SET child.recipe_ref = r.id;
DELETE FROM recipe_version WHERE recipe_ref IS NULL;
ALTER TABLE recipe_version DROP INDEX uk_recipe_version;
ALTER TABLE recipe_version DROP COLUMN recipe_id;
ALTER TABLE recipe_version CHANGE COLUMN recipe_ref recipe_id BIGINT NOT NULL COMMENT '菜谱主键，对应 recipe.id';
ALTER TABLE recipe_version ADD UNIQUE KEY uk_recipe_version (recipe_id, version);

-- recipe_ingredient
ALTER TABLE recipe_ingredient ADD COLUMN recipe_ref BIGINT NULL COMMENT '菜谱主键，对应 recipe.id' AFTER id;
UPDATE recipe_ingredient child
    INNER JOIN recipe r ON r.recipe_id = child.recipe_id
SET child.recipe_ref = r.id;
DELETE FROM recipe_ingredient WHERE recipe_ref IS NULL;
ALTER TABLE recipe_ingredient DROP COLUMN recipe_id;
ALTER TABLE recipe_ingredient CHANGE COLUMN recipe_ref recipe_id BIGINT NOT NULL COMMENT '菜谱主键，对应 recipe.id';

-- recipe_step
ALTER TABLE recipe_step ADD COLUMN recipe_ref BIGINT NULL COMMENT '菜谱主键，对应 recipe.id' AFTER id;
UPDATE recipe_step child
    INNER JOIN recipe r ON r.recipe_id = child.recipe_id
SET child.recipe_ref = r.id;
DELETE FROM recipe_step WHERE recipe_ref IS NULL;
ALTER TABLE recipe_step DROP INDEX uk_recipe_step;
ALTER TABLE recipe_step DROP COLUMN recipe_id;
ALTER TABLE recipe_step CHANGE COLUMN recipe_ref recipe_id BIGINT NOT NULL COMMENT '菜谱主键，对应 recipe.id';
ALTER TABLE recipe_step ADD UNIQUE KEY uk_recipe_step (recipe_id, recipe_version, step_no);

-- recipe_step_dependency：部分环境已在 V40 删除，存在才迁
SET @dep_exists := (
  SELECT COUNT(*) FROM information_schema.TABLES
  WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'recipe_step_dependency'
);
SET @sql := IF(@dep_exists = 0, 'SELECT 1',
  'ALTER TABLE recipe_step_dependency ADD COLUMN recipe_ref BIGINT NULL COMMENT ''菜谱主键，对应 recipe.id'' AFTER id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
SET @sql := IF(@dep_exists = 0, 'SELECT 1',
  'UPDATE recipe_step_dependency child INNER JOIN recipe r ON r.recipe_id = child.recipe_id SET child.recipe_ref = r.id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
SET @sql := IF(@dep_exists = 0, 'SELECT 1', 'DELETE FROM recipe_step_dependency WHERE recipe_ref IS NULL');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
SET @sql := IF(@dep_exists = 0, 'SELECT 1', 'ALTER TABLE recipe_step_dependency DROP INDEX uk_recipe_step_dependency');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
SET @sql := IF(@dep_exists = 0, 'SELECT 1', 'ALTER TABLE recipe_step_dependency DROP COLUMN recipe_id');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
SET @sql := IF(@dep_exists = 0, 'SELECT 1',
  'ALTER TABLE recipe_step_dependency CHANGE COLUMN recipe_ref recipe_id BIGINT NOT NULL COMMENT ''菜谱主键，对应 recipe.id''');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
SET @sql := IF(@dep_exists = 0, 'SELECT 1',
  'ALTER TABLE recipe_step_dependency ADD UNIQUE KEY uk_recipe_step_dependency (recipe_id, recipe_version, step_no, depends_on_step_no)');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- recipe_equipment_variant
ALTER TABLE recipe_equipment_variant ADD COLUMN recipe_ref BIGINT NULL COMMENT '菜谱主键，对应 recipe.id' AFTER id;
UPDATE recipe_equipment_variant child
    INNER JOIN recipe r ON r.recipe_id = child.recipe_id
SET child.recipe_ref = r.id;
DELETE FROM recipe_equipment_variant WHERE recipe_ref IS NULL;
ALTER TABLE recipe_equipment_variant DROP INDEX uk_recipe_equipment;
ALTER TABLE recipe_equipment_variant DROP COLUMN recipe_id;
ALTER TABLE recipe_equipment_variant CHANGE COLUMN recipe_ref recipe_id BIGINT NOT NULL COMMENT '菜谱主键，对应 recipe.id';
ALTER TABLE recipe_equipment_variant ADD UNIQUE KEY uk_recipe_equipment (recipe_id, recipe_version, equipment_code);

-- recipe_nutrition_result
ALTER TABLE recipe_nutrition_result ADD COLUMN recipe_ref BIGINT NULL COMMENT '菜谱主键，对应 recipe.id' AFTER id;
UPDATE recipe_nutrition_result child
    INNER JOIN recipe r ON r.recipe_id = child.recipe_id
SET child.recipe_ref = r.id;
DELETE FROM recipe_nutrition_result WHERE recipe_ref IS NULL;
ALTER TABLE recipe_nutrition_result DROP INDEX uk_recipe_nutrition;
ALTER TABLE recipe_nutrition_result DROP COLUMN recipe_id;
ALTER TABLE recipe_nutrition_result CHANGE COLUMN recipe_ref recipe_id BIGINT NOT NULL COMMENT '菜谱主键，对应 recipe.id';
ALTER TABLE recipe_nutrition_result ADD UNIQUE KEY uk_recipe_nutrition (recipe_id, recipe_version, nutrient_code);

-- solved_meal_dish
ALTER TABLE solved_meal_dish ADD COLUMN recipe_ref BIGINT NULL COMMENT '菜谱主键，对应 recipe.id' AFTER meal_date;
UPDATE solved_meal_dish child
    INNER JOIN recipe r ON r.recipe_id = child.recipe_id
SET child.recipe_ref = r.id;
DELETE FROM solved_meal_dish WHERE recipe_ref IS NULL;
ALTER TABLE solved_meal_dish DROP COLUMN recipe_id;
ALTER TABLE solved_meal_dish CHANGE COLUMN recipe_ref recipe_id BIGINT NOT NULL COMMENT '菜谱主键，对应 recipe.id';

-- recipe_search_chunk
ALTER TABLE recipe_search_chunk ADD COLUMN recipe_ref BIGINT NULL COMMENT '菜谱主键，对应 recipe.id' FIRST;
UPDATE recipe_search_chunk child
    INNER JOIN recipe r ON r.recipe_id = child.recipe_id
SET child.recipe_ref = r.id;
DELETE FROM recipe_search_chunk WHERE recipe_ref IS NULL;
ALTER TABLE recipe_search_chunk DROP PRIMARY KEY;
ALTER TABLE recipe_search_chunk DROP COLUMN recipe_id;
ALTER TABLE recipe_search_chunk CHANGE COLUMN recipe_ref recipe_id BIGINT NOT NULL COMMENT '菜谱主键，对应 recipe.id';
ALTER TABLE recipe_search_chunk ADD PRIMARY KEY (recipe_id);

-- 最后去掉 recipe 上的字符串业务菜号
ALTER TABLE recipe DROP INDEX uk_recipe_id;
ALTER TABLE recipe DROP COLUMN recipe_id;
