-- 规则换版时新增一行，不能覆盖旧版本。状态未发布时不能拿来自动计算。
CREATE TABLE rule_set (
  id             BIGINT        NOT NULL AUTO_INCREMENT COMMENT '行号。',
  rule_set_id    VARCHAR(64)   NOT NULL COMMENT '规则集标识。',
  version        VARCHAR(32)   NOT NULL COMMENT '规则版本。同一规则集的不同版本可以并存。',
  status_code    INT           NOT NULL COMMENT '规则状态，与 FormulaStatus 一致：1 草稿，2 临床复核，3 已测试，4 已发布，5 停用。',
  effective_at   TIMESTAMP(3)  NULL COMMENT '生效时间。未到生效时间不能使用。',
  expires_at     TIMESTAMP(3)  NULL COMMENT '失效时间。空值表示这一版还没有失效日期。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_rule_set_version (rule_set_id, version)
) COMMENT='规则集版本。过期版本保留，已经生成的方案继续引用旧版本。';

-- 安全模块要收敛成唯一许可。原因和处置必须是稳定编码，不能靠临时文字。
CREATE TABLE rule_entry (
  id             BIGINT        NOT NULL AUTO_INCREMENT COMMENT '行号。',
  rule_set_id    VARCHAR(64)   NOT NULL COMMENT '所属规则集标识。',
  rule_code      VARCHAR(64)   NOT NULL COMMENT '规则编码。同一规则集里不重复。',
  permission_code INT          NOT NULL COMMENT '安全许可，与 SafetyPermission 一致：1 允许，2 补充数据，3 人工复核，4 停止。',
  reason_codes   JSON          NOT NULL COMMENT '原因编码列表。可以有多个原因。',
  action_codes   JSON          NOT NULL COMMENT '处置动作编码列表。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_rule_entry (rule_set_id, rule_code)
) COMMENT='一条规则的许可、原因和处置。不能只留一段说明文字。';

-- 公式正文、输入单位和输出单位必须一起版本化。单位不一致时不能直接套用参数。
CREATE TABLE nutrition_formula (
  id             BIGINT        NOT NULL AUTO_INCREMENT COMMENT '行号。',
  formula_id     VARCHAR(64)   NOT NULL COMMENT '公式标识。',
  version        VARCHAR(32)   NOT NULL COMMENT '公式版本。',
  status_code    INT           NOT NULL COMMENT '公式状态，与 FormulaStatus 一致：1 草稿，2 临床复核，3 已测试，4 已发布，5 停用。',
  expression_text VARCHAR(1000) NOT NULL COMMENT '公式含义。计算仍以参数表里的已发布数值为准，不解析这段文字。',
  input_unit     VARCHAR(32)   NOT NULL COMMENT '输入单位。',
  output_unit    VARCHAR(32)   NOT NULL COMMENT '输出单位。',
  effective_at   TIMESTAMP(3)  NULL COMMENT '生效时间。',
  expires_at     TIMESTAMP(3)  NULL COMMENT '失效时间。空值表示这一版还没有失效日期。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_formula_version (formula_id, version)
) COMMENT='营养公式版本。没有已发布公式时，不能用代码里的默认数代替。';

-- 指南里的上限写在参数名和数值上。unit_code 尚未区分毫克时，以 parameter_code 的单位后缀为准。
CREATE TABLE formula_parameter (
  id             BIGINT        NOT NULL AUTO_INCREMENT COMMENT '行号。',
  formula_id     VARCHAR(64)   NOT NULL COMMENT '公式标识。',
  formula_version VARCHAR(32)  NOT NULL COMMENT '公式版本。参数属于某一版，不跨版本共用。',
  parameter_code VARCHAR(64)   NOT NULL COMMENT '参数编码。编码里写明单位，例如 SODIUM_MAXIMUM_MG。',
  parameter_value DECIMAL(18,6) NOT NULL COMMENT '参数数值。',
  unit_code      INT           NOT NULL COMMENT '单位代码。毫克枚举尚未单列时固定写 1，实际单位看参数编码。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_formula_parameter (formula_id, formula_version, parameter_code)
) COMMENT='公式参数。参数名自己带单位，避免单位枚举还没覆盖时把毫克写成别的单位。';

-- 食材换版时新增一行。没有出处的食材不能参与自动计算。
CREATE TABLE food_item (
  id             BIGINT        NOT NULL AUTO_INCREMENT COMMENT '行号。业务上用食材标识和数据版本识别，不把自增号写进方案。',
  food_item_id   VARCHAR(64)   NOT NULL COMMENT '稳定食材标识。USDA 食材写作 usda- 加 FDC 编号，更换数据集时标识不变。',
  display_name   VARCHAR(200)  NOT NULL COMMENT '来源文献里的原始名称。家常叫法不写在这里，避免一个短名对上多种食材。',
  source_ref     VARCHAR(200)  NOT NULL COMMENT '这一版成分的出处。没有出处的食材不能参与自动计算。',
  data_version   VARCHAR(32)   NOT NULL COMMENT '数据集版本。修正或换版时新增一行，不覆盖已经引用的旧行。',
  status_code    INT           NOT NULL COMMENT '数据生命周期：1草稿，2已复核，3已发布，4暂停，5停用。只有 3 可以进入自动求解。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_food_item_version (food_item_id, data_version)
) COMMENT='食材主数据。同一食材标识可以保留多个数据集版本，已经生成的方案继续引用旧版本。';

-- 未知营养素不能写成 0。关键限制指标缺失时，该食材不能进入依赖这项指标的自动计算。
CREATE TABLE food_nutrient (
  id             BIGINT        NOT NULL AUTO_INCREMENT COMMENT '行号。业务上用食材、版本和营养素编码唯一确定一项成分。',
  food_item_id   VARCHAR(64)   NOT NULL COMMENT '对应 food_item.food_item_id。必须和 data_version 一起指向同一个食材版本。',
  data_version   VARCHAR(32)   NOT NULL COMMENT '与食材行相同的数据集版本，避免新版数值被旧方案读到。',
  nutrient_code  INT           NOT NULL COMMENT '营养素编码，与 NutrientType 一致：1能量，2蛋白质，3碳水化合物，4脂肪，5膳食纤维，6钠，7钾，8磷，9胆固醇，10饱和脂肪，11烹调油。',
  value_per_100g DECIMAL(18,6) NULL COMMENT '每 100 克含量。空值表示来源未发表该项，不能当成 0。小数位数随后加到 7 位，避免 USDA 原值被四舍五入。',
  unit_code      INT           NOT NULL COMMENT '单位，与 NutrientUnit 一致：1千卡，2克，3毫克。能量用千卡，钠、钾、磷和胆固醇用毫克，其余用克。',
  quality_code   INT           NOT NULL COMMENT '数据状态，与 NutrientQuality 一致：1已知，2估算，3未知，4不适用。未知不能同时写下数值。',
  source_ref     VARCHAR(200)  NOT NULL COMMENT '这一项数值的出处，与同一食材版本的来源保持一致。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_food_nutrient (food_item_id, data_version, nutrient_code)
) COMMENT='食材每 100 克的成分。来源没有给出的营养素不插行，读取时不能把缺失当成 0。';
