-- 成人高血压食养指南（2023年版）：每日钠不超过 2000mg，相当于食盐 5g。
-- 参数名带单位。unit_code 暂无毫克枚举，固定写 1，数值含义以 parameter_code 为准。

INSERT INTO rule_set (rule_set_id, version, status_code, effective_at, expires_at)
VALUES ('nhc-adult-hypertension-diet', '2023', 2, '2023-01-18 00:00:00.000', NULL);

INSERT INTO nutrition_formula (
  formula_id, version, status_code, expression_text, input_unit, output_unit, effective_at, expires_at)
VALUES (
  'nhc-hypertension-sodium-ceiling',
  '2023',
  2,
  'daily sodium maximum 2000 mg, equivalent to 5 g salt',
  'day',
  'mg',
  '2023-01-18 00:00:00.000',
  NULL);

INSERT INTO formula_parameter (formula_id, formula_version, parameter_code, parameter_value, unit_code)
VALUES
  ('nhc-hypertension-sodium-ceiling', '2023', 'SODIUM_MAXIMUM_MG', 2000, 1),
  ('nhc-hypertension-sodium-ceiling', '2023', 'SALT_EQUIVALENT_G', 5, 1);
