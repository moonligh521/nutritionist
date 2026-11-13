-- 痛风指南（2024）：食盐每天不超过 5g，即钠 2000mg。没有全天嘌呤毫克上限。
-- 慢性肾脏病指南（2024）：钠 2000mg；水肿 1200mg；严重水肿 1000mg；磷 1000mg；高钾血症钾 3000mg。
-- 3～5 期蛋白质按身高现算，不写入固定克数。

INSERT INTO rule_set (rule_set_id, version, status_code, effective_at, expires_at)
VALUES
  ('nhc-adult-gout-diet', '2024', 2, '2024-02-08 00:00:00.000', NULL),
  ('nhc-adult-ckd-diet', '2024', 2, '2024-02-08 00:00:00.000', NULL);

INSERT INTO nutrition_formula (
  formula_id, version, status_code, expression_text, input_unit, output_unit, effective_at, expires_at)
VALUES
  ('nhc-gout-sodium-ceiling', '2024', 2, 'gout sodium <= 2000 mg', 'day', 'mg', '2024-02-08 00:00:00.000', NULL),
  ('nhc-ckd-mineral-ceiling', '2024', 2, 'ckd sodium, phosphorus, potassium ceilings', 'day', 'mg', '2024-02-08 00:00:00.000', NULL);

INSERT INTO formula_parameter (formula_id, formula_version, parameter_code, parameter_value, unit_code)
VALUES
  ('nhc-gout-sodium-ceiling', '2024', 'SODIUM_MAXIMUM_MG', 2000, 1),
  ('nhc-ckd-mineral-ceiling', '2024', 'SODIUM_MAXIMUM_MG', 2000, 1),
  ('nhc-ckd-mineral-ceiling', '2024', 'EDEMA_SODIUM_MAXIMUM_MG', 1200, 1),
  ('nhc-ckd-mineral-ceiling', '2024', 'SEVERE_EDEMA_SODIUM_MAXIMUM_MG', 1000, 1),
  ('nhc-ckd-mineral-ceiling', '2024', 'PHOSPHORUS_MAXIMUM_MG', 1000, 1),
  ('nhc-ckd-mineral-ceiling', '2024', 'HYPERKALEMIA_POTASSIUM_MAXIMUM_MG', 3000, 1);
