-- 当前方案不读取这些表：规则公式、生熟转换、步骤依赖、审计流水、用餐评价、计划确认、餐次额度、实际投料、厨房对话、营养素字典。
DROP TABLE IF EXISTS nutrition_retention_factor;
DROP TABLE IF EXISTS cooking_transform;
DROP TABLE IF EXISTS recipe_step_dependency;
DROP TABLE IF EXISTS outcome_evaluation;
DROP TABLE IF EXISTS access_audit;
DROP TABLE IF EXISTS decision_audit;
DROP TABLE IF EXISTS meal_budget;
DROP TABLE IF EXISTS plan_confirmation;
DROP TABLE IF EXISTS cooking_actual_ingredient;
DROP TABLE IF EXISTS formula_parameter;
DROP TABLE IF EXISTS nutrition_formula;
DROP TABLE IF EXISTS rule_entry;
DROP TABLE IF EXISTS rule_set;
DROP TABLE IF EXISTS dialogue_turn;
DROP TABLE IF EXISTS nutrient;
