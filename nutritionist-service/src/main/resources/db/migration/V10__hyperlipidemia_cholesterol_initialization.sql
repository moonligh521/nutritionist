-- 成人高脂血症食养指南（2023年版）：
-- 高脂血症人群胆固醇每日少于 300mg；高胆固醇血症者每日少于 200mg。
-- 食盐每日不宜超过 5g，钠上限与高血压指南相同，为 2000mg。
-- unit_code 暂无毫克枚举，固定写 1，数值含义以 parameter_code 为准。

INSERT INTO rule_set (rule_set_id, version, status_code, effective_at, expires_at)
VALUES ('nhc-adult-hyperlipidemia-diet', '2023', 2, '2023-01-18 00:00:00.000', NULL);

INSERT INTO nutrition_formula (
  formula_id, version, status_code, expression_text, input_unit, output_unit, effective_at, expires_at)
VALUES (
  'nhc-hyperlipidemia-cholesterol-ceiling',
  '2023',
  2,
  'hyperlipidemia cholesterol < 300 mg; hypercholesterolemia cholesterol < 200 mg; sodium <= 2000 mg',
  'day',
  'mg',
  '2023-01-18 00:00:00.000',
  NULL);

INSERT INTO formula_parameter (formula_id, formula_version, parameter_code, parameter_value, unit_code)
VALUES
  ('nhc-hyperlipidemia-cholesterol-ceiling', '2023', 'CHOLESTEROL_MAXIMUM_MG', 300, 1),
  ('nhc-hyperlipidemia-cholesterol-ceiling', '2023', 'HYPERCHOLESTEROLEMIA_MAXIMUM_MG', 200, 1),
  ('nhc-hyperlipidemia-cholesterol-ceiling', '2023', 'SODIUM_MAXIMUM_MG', 2000, 1);
