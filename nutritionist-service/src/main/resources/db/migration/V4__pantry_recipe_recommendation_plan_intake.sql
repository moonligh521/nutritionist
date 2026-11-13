-- 库存分成目录、批次、预留和变更事件。直接覆盖数量会丢掉临期批次和预留。
CREATE TABLE pantry_item (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  pantry_item_id    VARCHAR(64) NOT NULL COMMENT '家中食材标识。',
  account_id        VARCHAR(64) NOT NULL COMMENT '账号标识。',
  patient_id        VARCHAR(64) NOT NULL COMMENT '患者标识。',
  food_item_id      VARCHAR(64) NOT NULL COMMENT '食材标识。',
  state_code        INT NOT NULL COMMENT '食材状态，例如生或熟。生重不能直接当成熟重使用。',
  unit_code         INT NOT NULL COMMENT '数量单位。',
  created_at        TIMESTAMP(3) NOT NULL COMMENT '建档时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_pantry_item_id (pantry_item_id)
) COMMENT='家中食材目录。数量记在批次上，这一行不直接改数量。';

-- 同一食材可能分多次购入。求解优先用临期批次，但不能为了减少浪费突破健康约束。
CREATE TABLE pantry_lot (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  lot_id            VARCHAR(64) NOT NULL COMMENT '批次标识。',
  pantry_item_id    VARCHAR(64) NOT NULL COMMENT '所属家中食材。',
  lot_code          VARCHAR(64) NULL COMMENT '批次号。没有批次号时为空。',
  on_hand_quantity  DECIMAL(18,6) NOT NULL COMMENT '账面数量。',
  reserved_quantity DECIMAL(18,6) NOT NULL COMMENT '已被方案预留、尚未实际消耗的数量。',
  expire_at         TIMESTAMP(3) NULL COMMENT '保质时间。空值表示没有记录保质期。',
  version           BIGINT NOT NULL COMMENT '批次版本。并发扣减时用版本比较，避免互相覆盖。',
  updated_at        TIMESTAMP(3) NOT NULL COMMENT '最后更新时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_pantry_lot_id (lot_id)
) COMMENT='家中食材批次。账面量和预留量分开，预留不表示已经吃掉。';

-- 生成方案只减少可用量。预留状态 1 表示仍占用，2 表示已释放。
CREATE TABLE pantry_reservation (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  reservation_id    VARCHAR(64) NOT NULL COMMENT '预留标识。',
  plan_version_id   VARCHAR(64) NOT NULL COMMENT '占用这批库存的方案版本。',
  lot_id            VARCHAR(64) NOT NULL COMMENT '被预留的批次。同一方案版本对同一批次只预留一次。',
  quantity          DECIMAL(18,6) NOT NULL COMMENT '预留数量。',
  status_code       INT NOT NULL COMMENT '预留状态。1 仍占用，2 已释放。',
  created_at        TIMESTAMP(3) NOT NULL COMMENT '预留时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_plan_lot_reservation (plan_version_id, lot_id)
) COMMENT='方案版本对库存批次的预留。取消或过期后释放，确认实际使用后才消耗。';

-- 批次上的当前数量必须能由事件追溯。多个流程不能各自覆盖同一个数量字段。
CREATE TABLE pantry_change_event (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  event_id          VARCHAR(64) NOT NULL COMMENT '事件标识。同一事件只记一次。',
  patient_id        VARCHAR(64) NOT NULL COMMENT '患者标识。',
  lot_id            VARCHAR(64) NOT NULL COMMENT '发生变化的批次。',
  change_type_code  INT NOT NULL COMMENT '变更类型，区分入库、修改、预留、消耗和作废。',
  quantity          DECIMAL(18,6) NOT NULL COMMENT '本次变更数量。',
  created_at        TIMESTAMP(3) NOT NULL COMMENT '事件时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_pantry_change_event (event_id)
) COMMENT='库存变更事件。入库、预留、消耗和作废都追加一行，不直接改掉历史数量。';

-- 餐次额度依赖当时的目标版本。不能用后来的目标改写已经分配的额度。
CREATE TABLE meal_budget (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  budget_id         VARCHAR(64) NOT NULL COMMENT '额度标识。',
  patient_id        VARCHAR(64) NOT NULL COMMENT '患者标识。',
  budget_date       DATE NOT NULL COMMENT '额度所属日期。',
  meal_type_code    INT NOT NULL COMMENT '餐次。1 早餐，2 午餐，3 晚餐。',
  target_version    VARCHAR(64) NOT NULL COMMENT '计算这份额度时使用的目标版本。',
  budget_json       JSON NOT NULL COMMENT '该餐额度的结构化内容。',
  created_at        TIMESTAMP(3) NOT NULL COMMENT '写入时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_meal_budget (patient_id, budget_date, meal_type_code, target_version)
) COMMENT='某一天某一餐的额度快照。目标版本变化时另起一行。';

-- 同一范围只保留一个进行中的任务。请求正文和冲突约束单独保存，方便失败后复现。
CREATE TABLE recommendation_task (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  recommendation_id VARCHAR(64) NOT NULL COMMENT '推荐任务标识。',
  account_id        VARCHAR(64) NOT NULL COMMENT '发起账号。',
  patient_id        VARCHAR(64) NOT NULL COMMENT '患者标识。',
  request_hash      CHAR(64) NOT NULL COMMENT '请求摘要。相同输入应得到可复现的任务。',
  status_code       INT NOT NULL COMMENT '任务状态：1 待处理，2 进行中，3 成功，4 失败，5 已取消，6 超时。',
  failure_code      INT NULL COMMENT '失败原因。成功时为空。',
  profile_version   VARCHAR(64) NOT NULL COMMENT '任务使用的画像版本。',
  pantry_version    VARCHAR(64) NOT NULL COMMENT '任务使用的库存版本。',
  created_at        TIMESTAMP(3) NOT NULL COMMENT '创建时间。',
  updated_at        TIMESTAMP(3) NOT NULL COMMENT '最后更新时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_recommendation_id (recommendation_id)
) COMMENT='一次推荐任务。无解或失败时留下原因，不能把失败记成成功。';

-- 任务当前状态会被更新。每一步何时发生，要留在事件里。
CREATE TABLE recommendation_event (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  recommendation_id VARCHAR(64) NOT NULL COMMENT '所属推荐任务。',
  event_id          VARCHAR(64) NOT NULL COMMENT '事件标识。同一任务里不重复。',
  event_type_code   INT NOT NULL COMMENT '事件类型。',
  stage_code        INT NOT NULL COMMENT '当时所处阶段。',
  message           VARCHAR(500) NOT NULL COMMENT '给调用方看的阶段说明。',
  occurred_at       TIMESTAMP(3) NOT NULL COMMENT '事件发生时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_recommendation_event (recommendation_id, event_id)
) COMMENT='推荐任务的推进事件。只追加，不回改已经发生的阶段。';

-- 方案可以有多版。当前版本指针和历史版本分开，旧版本不能被新计算覆盖。
CREATE TABLE plan (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  plan_id           VARCHAR(64) NOT NULL COMMENT '方案标识。',
  account_id        VARCHAR(64) NOT NULL COMMENT '账号标识。',
  patient_id        VARCHAR(64) NOT NULL COMMENT '患者标识。',
  status_code       INT NOT NULL COMMENT '方案状态：1 草稿，2 已校验，3 已确认，4 已完成，5 已取消，6 已过期，7 已中断。',
  current_version   VARCHAR(64) NOT NULL COMMENT '当前方案版本。历史版本仍保留。',
  created_at        TIMESTAMP(3) NOT NULL COMMENT '创建时间。',
  updated_at        TIMESTAMP(3) NOT NULL COMMENT '最后更新时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_plan_id (plan_id)
) COMMENT='膳食方案头。具体内容在不可变的方案版本里。';

-- 同一方案后来重算会生成新版本。已经确认或已经吃过的版本不能被改写。
CREATE TABLE plan_version (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  plan_version_id   VARCHAR(64) NOT NULL COMMENT '方案版本标识。',
  plan_id           VARCHAR(64) NOT NULL COMMENT '所属方案。',
  profile_version   VARCHAR(64) NOT NULL COMMENT '生成这一版时的画像版本。',
  pantry_version    VARCHAR(64) NOT NULL COMMENT '生成这一版时的库存版本。',
  status_code       INT NOT NULL COMMENT '这一版的状态，编码与方案头相同。',
  created_at        TIMESTAMP(3) NOT NULL COMMENT '这一版的生成时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_plan_version_id (plan_version_id)
) COMMENT='方案的一份不可变版本，钉住当时的画像和库存版本。';

-- 餐次属于方案版本。重算产生新版本时，旧餐次保留给已经确认的记录。
CREATE TABLE meal (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  meal_id           VARCHAR(64) NOT NULL COMMENT '餐次标识。',
  plan_version_id   VARCHAR(64) NOT NULL COMMENT '所属方案版本。',
  meal_type_code    INT NOT NULL COMMENT '餐次。1 早餐，2 午餐，3 晚餐。',
  status_code       INT NOT NULL COMMENT '这一餐的执行状态。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_meal_id (meal_id)
) COMMENT='某个方案版本中的一餐。';

-- 份数不能代替克数。没有克数时不能把份数换算成营养。
CREATE TABLE meal_item (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  meal_item_id      VARCHAR(64) NOT NULL COMMENT '餐次项目标识。',
  meal_id           VARCHAR(64) NOT NULL COMMENT '所属餐次。',
  item_type_code    INT NOT NULL COMMENT '项目类型，区分菜谱份量和简单食物。',
  item_ref          VARCHAR(64) NOT NULL COMMENT '菜谱或食材标识。',
  quantity          DECIMAL(18,6) NOT NULL COMMENT '按 unit_code 计的数量。它不是克数。',
  unit_code         INT NOT NULL COMMENT 'quantity 的单位。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_meal_item_id (meal_item_id)
) COMMENT='一餐中的一项食物或菜谱。份数和克数分开保存。';

-- 确认的是一个版本。之后的新版本需要重新确认，不能沿用旧确认。
CREATE TABLE plan_confirmation (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  confirmation_id   VARCHAR(64) NOT NULL COMMENT '确认标识。',
  plan_id           VARCHAR(64) NOT NULL COMMENT '方案标识。',
  plan_version_id   VARCHAR(64) NOT NULL COMMENT '被确认的方案版本。',
  confirmed_at      TIMESTAMP(3) NOT NULL COMMENT '确认时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_plan_confirmation (confirmation_id)
) COMMENT='用户对某一方案版本的确认。确认不等于开始烹饪，也不等于已经吃完。';

-- 吃下去的量不是计划量。记录时钉住当时的患者主数据版本，更正时保留原事件，另写更正记录。
CREATE TABLE intake_event (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  intake_id         VARCHAR(64) NOT NULL COMMENT '摄入标识。',
  event_id          VARCHAR(64) NOT NULL COMMENT '事件标识。同一事件只记一次。',
  account_id        VARCHAR(64) NOT NULL COMMENT '记录人账号。',
  patient_id        VARCHAR(64) NOT NULL COMMENT '患者标识。',
  meal_id           VARCHAR(64) NULL COMMENT '对应的计划餐次。没有对应餐次时为空。',
  recorded_at       TIMESTAMP(3) NOT NULL COMMENT '记录时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_intake_event_id (event_id)
) COMMENT='一次实际摄入。和方案、烹饪会话分开记录。';

-- 简单食物在确认摄入时扣库存。熟制成品的原料已在烹饪投入时扣除，这里不能再扣一次。
CREATE TABLE intake_item (
  id                   BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  intake_id            VARCHAR(64) NOT NULL COMMENT '所属摄入。',
  item_type_code       INT NOT NULL COMMENT '项目类型，区分简单食物和熟制成品。',
  food_item_id         VARCHAR(64) NULL COMMENT '简单食物的食材标识。熟制成品可以为空。',
  cooking_execution_id VARCHAR(64) NULL COMMENT '熟制成品对应的烹饪会话。简单食物可以为空。',
  quantity             DECIMAL(18,6) NOT NULL COMMENT '实际食用量。',
  unit_code            INT NOT NULL COMMENT '食用量单位。',
  weight_basis_code    INT NOT NULL COMMENT '重量基准，区分生重、熟重和可食部。不能把不同基准直接相加。',
  PRIMARY KEY (id)
) COMMENT='一次摄入中的具体食物或熟制成品。';

-- 菜谱改版不能覆盖旧版本。未发布版本不能进入推荐。
CREATE TABLE recipe (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  recipe_id         VARCHAR(64) NOT NULL COMMENT '菜谱标识。',
  display_name      VARCHAR(200) NOT NULL COMMENT '菜谱名称。',
  current_version   VARCHAR(64) NOT NULL COMMENT '当前版本。历史版本仍可用于已经生成的方案。',
  created_at        TIMESTAMP(3) NOT NULL COMMENT '创建时间。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_recipe_id (recipe_id)
) COMMENT='菜谱头。配料、步骤和营养以已发布版本为准。';

-- 模型生成的菜谱只能停留在草稿。审核通过并发布后才能用来计算克数和步骤。
CREATE TABLE recipe_version (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  recipe_id         VARCHAR(64) NOT NULL COMMENT '菜谱标识。',
  version           VARCHAR(64) NOT NULL COMMENT '版本号。同一菜谱的版本不重复。',
  status_code       INT NOT NULL COMMENT '版本状态：1 草稿，2 已发布，3 停用。',
  approved_at       TIMESTAMP(3) NULL COMMENT '发布或审核通过的时间。草稿为空。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_recipe_version (recipe_id, version)
) COMMENT='菜谱版本。只有已发布版本可以进入正式推荐。';

-- 步骤文字不能偷偷带上没有计量的油盐。用量变更必须产生新版本。
CREATE TABLE recipe_ingredient (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  recipe_id         VARCHAR(64) NOT NULL COMMENT '菜谱标识。',
  recipe_version    VARCHAR(64) NOT NULL COMMENT '菜谱版本。',
  food_item_id      VARCHAR(64) NOT NULL COMMENT '配料食材。',
  quantity          DECIMAL(18,6) NOT NULL COMMENT '这一版规定的用量。',
  unit_code         INT NOT NULL COMMENT '用量单位。',
  PRIMARY KEY (id)
) COMMENT='某一菜谱版本的配料和用量。油、盐、酱料也要写在这里。';

-- 模型只能把这些步骤说得更容易懂，不能改写投放量和食品安全条件。
CREATE TABLE recipe_step (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  recipe_id         VARCHAR(64) NOT NULL COMMENT '菜谱标识。',
  recipe_version    VARCHAR(64) NOT NULL COMMENT '菜谱版本。',
  step_no           INT NOT NULL COMMENT '步骤序号。同一版本里不重复。',
  instruction_text  VARCHAR(2000) NOT NULL COMMENT '该步的操作说明。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_recipe_step (recipe_id, recipe_version, step_no)
) COMMENT='某一菜谱版本的步骤。关键用量、顺序和完成条件来自已发布步骤。';

-- 食品安全关键步骤不能跳过。前置没有完成时不能进入下一步。
CREATE TABLE recipe_step_dependency (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  recipe_id         VARCHAR(64) NOT NULL COMMENT '菜谱标识。',
  recipe_version    VARCHAR(64) NOT NULL COMMENT '菜谱版本。',
  step_no           INT NOT NULL COMMENT '当前步骤。',
  depends_on_step_no INT NOT NULL COMMENT '必须先完成的步骤。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_recipe_step_dependency (recipe_id, recipe_version, step_no, depends_on_step_no)
) COMMENT='步骤之间的前置依赖。依赖必须无环。';

-- 模型不能根据厨具名称猜测温度和时间。只有写明的变体才能使用。
CREATE TABLE recipe_equipment_variant (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  recipe_id         VARCHAR(64) NOT NULL COMMENT '菜谱标识。',
  recipe_version    VARCHAR(64) NOT NULL COMMENT '菜谱版本。',
  equipment_code    VARCHAR(64) NOT NULL COMMENT '厨具编码。同一版本的同一厨具只有一种变体。',
  variant_text      VARCHAR(2000) NOT NULL COMMENT '该厨具上的已审核步骤说明。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_recipe_equipment (recipe_id, recipe_version, equipment_code)
) COMMENT='菜谱在某种厨具上的已审核步骤。没有对应变体时，这道菜不能进入候选。';

-- 生重不能直接乘成熟重。转换参数换版后，旧方案仍引用旧版本。
CREATE TABLE cooking_transform (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  transform_id      VARCHAR(64) NOT NULL COMMENT '转换标识。',
  food_item_id      VARCHAR(64) NOT NULL COMMENT '适用食材。',
  method_code       INT NOT NULL COMMENT '烹饪方式。',
  version           VARCHAR(64) NOT NULL COMMENT '转换参数版本。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_cooking_transform (transform_id, version)
) COMMENT='食材在某种烹饪方式下的转换版本。没有已发布参数时不能套用统一损耗率。';

-- 不同营养素的保留率不同。不能用一个系数套到能量、钠和维生素上。
CREATE TABLE nutrition_retention_factor (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  transform_id      VARCHAR(64) NOT NULL COMMENT '转换标识。',
  transform_version VARCHAR(64) NOT NULL COMMENT '转换版本。',
  nutrient_code     INT NOT NULL COMMENT '营养素编码，与 NutrientType 一致。',
  factor_value      DECIMAL(18,6) NOT NULL COMMENT '该营养素的保留系数。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_retention_factor (transform_id, transform_version, nutrient_code)
) COMMENT='某种烹饪转换下，单一营养素的保留系数。';

-- 菜谱营养由原料和已发布转换复算。关键营养素未知时，这道菜不能进入依赖该指标的求解。
CREATE TABLE recipe_nutrition_result (
  id                BIGINT NOT NULL AUTO_INCREMENT COMMENT '行号。',
  recipe_id         VARCHAR(64) NOT NULL COMMENT '菜谱标识。',
  recipe_version    VARCHAR(64) NOT NULL COMMENT '菜谱版本。',
  nutrient_code     INT NOT NULL COMMENT '营养素编码，与 NutrientType 一致。',
  nutrient_value    DECIMAL(18,6) NULL COMMENT '复算结果。空值表示未知，不能当成 0。',
  unit_code         INT NOT NULL COMMENT '单位，与 NutrientUnit 一致：1千卡，2克，3毫克。',
  quality_code      INT NOT NULL COMMENT '数据状态，与 NutrientQuality 一致：1已知，2估算，3未知，4不适用。',
  source_ref        VARCHAR(200) NOT NULL COMMENT '这次复算所依据的来源。',
  PRIMARY KEY (id),
  UNIQUE KEY uk_recipe_nutrition (recipe_id, recipe_version, nutrient_code)
) COMMENT='按菜谱版本复算的营养结果。缺失值留空，不能写成 0。';
