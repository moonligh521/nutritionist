-- 已有库在建表时还没有注释。这里按建表语句里的同一套说明补上。
-- 新建库会在各自的初始化语句里直接写上注释，本脚本再写一遍，结果相同。
-- flyway_schema_history 由迁移工具自己创建，只补充注释，不改变它的列。

-- 敏感健康数据的读取要留下痕迹，不能只靠应用日志。
ALTER TABLE access_audit
  COMMENT = '健康数据访问审计。记录谁在什么时候读过哪些数据。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN account_id varchar(64) NOT NULL COMMENT '访问者账号。',
  MODIFY COLUMN action varchar(64) NOT NULL COMMENT '访问动作。',
  MODIFY COLUMN detail json NULL COMMENT '访问范围。没有额外内容时为空。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '访问时间。';

-- 停用推荐必须立刻生效。这里只留当前状态，变更过程写在事件表。
ALTER TABLE capability_switch
  COMMENT = '自动推荐开关的当前状态。按范围关闭后，该范围不再自动配餐。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN scope_type varchar(64) NOT NULL COMMENT '开关范围类型，例如全局、规则或食材数据。',
  MODIFY COLUMN scope_key varchar(128) NOT NULL COMMENT '范围标识。同一类型下每个标识只有一行当前状态。',
  MODIFY COLUMN enabled tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许自动推荐。1 允许，0 关闭。',
  MODIFY COLUMN updated_at timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) on update CURRENT_TIMESTAMP(3) COMMENT '当前状态的最后变更时间。';

-- 开关当前行会被更新。谁在什么时候打开或关闭，必须另记一行。
ALTER TABLE capability_switch_event
  COMMENT = '推荐开关的变更事件。当前状态被覆盖后，仍能追溯是谁关闭的。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN scope_type varchar(64) NOT NULL COMMENT '开关范围类型，与当前状态表一致。',
  MODIFY COLUMN scope_key varchar(128) NOT NULL COMMENT '范围标识。',
  MODIFY COLUMN action varchar(32) NOT NULL COMMENT '本次动作，打开或关闭。',
  MODIFY COLUMN actor_account_id varchar(64) NOT NULL COMMENT '操作人账号。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '动作时间。';

-- 过敏是硬约束。未确认的可疑过敏不能当成已经排除，也不能当成已经禁止。
ALTER TABLE clinical_allergy
  COMMENT = '已经确认的过敏或不耐受。命中后不能计算所谓安全的一口。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN allergy_id varchar(64) NOT NULL COMMENT '过敏记录标识。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN allergen_code varchar(64) NOT NULL COMMENT '过敏原编码。',
  MODIFY COLUMN severity_code int NOT NULL COMMENT '严重程度。',
  MODIFY COLUMN confirmed tinyint(1) NOT NULL COMMENT '是否已经确认。未确认的记录不能单独放行或禁止。',
  MODIFY COLUMN version varchar(32) NOT NULL COMMENT '记录版本。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '写入时间。';

-- 病情决定能不能自动配餐，以及使用哪套指南上限。未记录的病不能靠对话临时加上。
ALTER TABLE clinical_condition
  COMMENT = '患者已经记录的疾病或状况。自动配餐只读这些事实，对话不能改写。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN condition_id varchar(64) NOT NULL COMMENT '病情记录标识。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN condition_code varchar(64) NOT NULL COMMENT '状况编码，例如高血压、糖尿病或需要停止自动配餐的情况。',
  MODIFY COLUMN onset_date date NULL COMMENT '开始日期。不知道时为空。',
  MODIFY COLUMN source_code int NOT NULL COMMENT '这条记录的来源。',
  MODIFY COLUMN note varchar(500) NULL COMMENT '补充说明。不能用说明文字代替编码。',
  MODIFY COLUMN version varchar(32) NOT NULL COMMENT '记录版本。',
  MODIFY COLUMN status_code int NOT NULL COMMENT '记录状态。停用后不再参与新的自动配餐。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '写入时间。';

-- 测量值本身和由此作出的许可分开保存。后续非紧急测量可以解除之前的停止。
ALTER TABLE clinical_measurement
  COMMENT = '一次测量及其安全处置。最新一次若要求停止，则不再自动配餐。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN measurement_id varchar(64) NOT NULL COMMENT '测量标识。',
  MODIFY COLUMN event_id varchar(64) NOT NULL COMMENT '事件标识。同一测量事件只记一次。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN type_code int NOT NULL COMMENT '测量类型。',
  MODIFY COLUMN measurement_value decimal(18,6) NOT NULL COMMENT '测量数值。单位见 unit_code，不能跨单位直接比较。',
  MODIFY COLUMN unit_code int NOT NULL COMMENT '测量值的单位。',
  MODIFY COLUMN observed_at timestamp(3) NOT NULL COMMENT '测量发生时间。判断最新测量时按这个时间，不按写入时间。',
  MODIFY COLUMN decision_code int NOT NULL COMMENT '测量处置，与 MeasurementDecision 一致：1 仅记录，2 保持方案，3 调整未来餐，4 人工复核，5 停止。',
  MODIFY COLUMN safety_permission_code int NOT NULL COMMENT '安全许可，与 SafetyPermission 一致：1 允许，2 补充数据，3 人工复核，4 停止。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '写入时间。';

-- 胰岛素、磺脲类等药物会改变能不能使用自动能量。用药事实只能由临床记录写入。
ALTER TABLE clinical_medication
  COMMENT = '患者已经记录的用药。药名不完整或属于高风险类别时，不能自动推算能量。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN medication_id varchar(64) NOT NULL COMMENT '用药记录标识。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN medication_name varchar(200) NOT NULL COMMENT '药物名称。无法标准化时不能进入自动能量计算。',
  MODIFY COLUMN category_code int NULL COMMENT '药物类别。1 胰岛素，2 磺脲类，3 列净类。无法归类时为空。',
  MODIFY COLUMN dose_text varchar(200) NULL COMMENT '剂量说明。剂量不参与自动换算。',
  MODIFY COLUMN frequency_text varchar(200) NULL COMMENT '用药频次说明。',
  MODIFY COLUMN complete_confirmed tinyint(1) NOT NULL COMMENT '用药信息是否已经确认完整。未确认时不能自动配餐。',
  MODIFY COLUMN version varchar(32) NOT NULL COMMENT '记录版本。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '写入时间。';

-- 多放油盐、换料或改份数都不能继续按原计划扣库存。实际量单独保存。
ALTER TABLE cooking_actual_ingredient
  COMMENT = '烹饪时的计划用量和实际投入。两者不一致时要留下实际量。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN execution_id varchar(64) NOT NULL COMMENT '所属烹饪会话。',
  MODIFY COLUMN food_item_id varchar(64) NOT NULL COMMENT '实际涉及的食材。',
  MODIFY COLUMN planned_quantity decimal(18,6) NOT NULL COMMENT '计划用量。',
  MODIFY COLUMN actual_quantity decimal(18,6) NOT NULL COMMENT '实际投入量。',
  MODIFY COLUMN unit_code int NOT NULL COMMENT '用量单位。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '记录时间。';

-- 开始烹饪不等于吃完，完成烹饪也不等于全部摄入。用户报告偏差后不能继续按原计划记账。
ALTER TABLE cooking_execution
  COMMENT = '一次实际烹饪。计划用料和实际投入分开记录。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN execution_id varchar(64) NOT NULL COMMENT '烹饪会话标识。',
  MODIFY COLUMN plan_id varchar(64) NOT NULL COMMENT '所属方案。',
  MODIFY COLUMN plan_version varchar(32) NOT NULL COMMENT '烹饪所依据的方案版本。',
  MODIFY COLUMN meal_id varchar(64) NOT NULL COMMENT '所属餐次。',
  MODIFY COLUMN recipe_version varchar(32) NOT NULL COMMENT '实际采用的菜谱版本。',
  MODIFY COLUMN status_code int NOT NULL COMMENT '烹饪状态：1 已开始，2 进行中，3 已完成，4 已中止，5 等待修订。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '开始时间。',
  MODIFY COLUMN updated_at timestamp(3) NOT NULL COMMENT '最后更新时间。';

-- 只有用户确认的步骤才能按计划投放量扣减预留。跳过的步骤不能记成已完成。
ALTER TABLE cooking_execution_step
  COMMENT = '烹饪会话中已经确认完成的步骤。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN execution_id varchar(64) NOT NULL COMMENT '所属烹饪会话。',
  MODIFY COLUMN step_no int NOT NULL COMMENT '步骤序号。同一次烹饪里不重复。',
  MODIFY COLUMN completed_at timestamp(3) NOT NULL COMMENT '用户确认完成的时间。';

-- 生重不能直接乘成熟重。转换参数换版后，旧方案仍引用旧版本。
ALTER TABLE cooking_transform
  COMMENT = '食材在某种烹饪方式下的转换版本。没有已发布参数时不能套用统一损耗率。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN transform_id varchar(64) NOT NULL COMMENT '转换标识。',
  MODIFY COLUMN food_item_id varchar(64) NOT NULL COMMENT '适用食材。',
  MODIFY COLUMN method_code int NOT NULL COMMENT '烹饪方式。',
  MODIFY COLUMN version varchar(64) NOT NULL COMMENT '转换参数版本。';

-- 自动配餐的许可结果必须能回放。后来的新测量不能改写已经作出的决定。
ALTER TABLE decision_audit
  COMMENT = '安全许可和处置决定的追加记录。写入后不修改。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN decision_type varchar(64) NOT NULL COMMENT '决定类型，区分安全许可、测量处置等不同记录。',
  MODIFY COLUMN payload json NOT NULL COMMENT '当时的许可、原因和处置。只追加，不覆盖。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '写入时间。';

-- 同一输入应得到同一结果。这里保存画像、规则、约束和求解器的摘要，不保存可以事后改写的正文。
ALTER TABLE decision_replay
  COMMENT = '方案版本的决策回放摘要。用来复现当时为什么得到这个结果。',
  MODIFY COLUMN plan_version varchar(64) NOT NULL COMMENT '方案版本。一份版本只有一条回放。',
  MODIFY COLUMN profile_hash char(64) NOT NULL COMMENT '当时画像输入的摘要。',
  MODIFY COLUMN rules_hash char(64) NOT NULL COMMENT '当时规则集的摘要。',
  MODIFY COLUMN constraint_ids_json json NOT NULL COMMENT '当时生效的约束标识。',
  MODIFY COLUMN solver_version varchar(64) NOT NULL COMMENT '求解器版本。',
  MODIFY COLUMN solver_layer_hash char(64) NOT NULL COMMENT '求解分层结果的摘要。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '回放写入时间。';

-- 第二天或一个月后再问，要能读到上次的方案说明。病情、用药和测量仍以临床记录为准。
ALTER TABLE dialogue_turn
  COMMENT = '家常对话的一轮结果。保存目标和当时的说明，不把聊天原文当成医疗事实。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。同一患者按写入顺序读取最近一轮。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN turn_date date NOT NULL COMMENT '这一轮对话所属日期。',
  MODIFY COLUMN goal_code varchar(32) NULL COMMENT '从这句话识别出的目标。没有识别到时为空。减肥字样只记目标，不自动收紧热量。',
  MODIFY COLUMN food_names varchar(500) NOT NULL COMMENT '这句话里提到的食材名称。',
  MODIFY COLUMN missing_names varchar(500) NOT NULL COMMENT '其中还没有成分数据的食材。',
  MODIFY COLUMN explanation varchar(2000) NOT NULL COMMENT '当时返回给用户的说明。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '写入时间。';

-- 这张表由迁移工具维护。这里只补充注释，不改变它的列和执行规则。
ALTER TABLE flyway_schema_history
  COMMENT = 'Flyway 的迁移记录。业务数据不写在这里。',
  MODIFY COLUMN installed_rank int NOT NULL COMMENT '执行顺序。',
  MODIFY COLUMN version varchar(50) NULL COMMENT '迁移版本。可重复脚本没有版本号。',
  MODIFY COLUMN description varchar(200) NOT NULL COMMENT '脚本说明。',
  MODIFY COLUMN type varchar(20) NOT NULL COMMENT '脚本类型。',
  MODIFY COLUMN script varchar(1000) NOT NULL COMMENT '脚本文件名。',
  MODIFY COLUMN checksum int NULL COMMENT '脚本内容校验。已执行的脚本被改写而这里不更新时，启动会拒绝继续迁移。',
  MODIFY COLUMN installed_by varchar(100) NOT NULL COMMENT '执行迁移的数据库账号。',
  MODIFY COLUMN installed_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '执行时间。',
  MODIFY COLUMN execution_time int NOT NULL COMMENT '执行耗时，单位毫秒。',
  MODIFY COLUMN success tinyint(1) NOT NULL COMMENT '是否成功。失败的迁移不能当作已经完成。';

-- 食材换版时新增一行。没有出处的食材不能参与自动计算。
ALTER TABLE food_item
  COMMENT = '食材主数据。同一食材标识可以保留多个数据集版本，已经生成的方案继续引用旧版本。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。业务上用食材标识和数据版本识别，不把自增号写进方案。',
  MODIFY COLUMN food_item_id varchar(64) NOT NULL COMMENT '稳定食材标识。USDA 食材写作 usda- 加 FDC 编号，更换数据集时标识不变。',
  MODIFY COLUMN display_name varchar(200) NOT NULL COMMENT '来源文献里的原始名称。家常叫法不写在这里，避免一个短名对上多种食材。',
  MODIFY COLUMN source_ref varchar(200) NOT NULL COMMENT '这一版成分的出处。没有出处的食材不能参与自动计算。',
  MODIFY COLUMN data_version varchar(32) NOT NULL COMMENT '数据集版本。修正或换版时新增一行，不覆盖已经引用的旧行。',
  MODIFY COLUMN status_code int NOT NULL COMMENT '数据生命周期：1草稿，2已复核，3已发布，4暂停，5停用。只有 3 可以进入自动求解。';

-- 未知营养素不能写成 0。关键限制指标缺失时，该食材不能进入依赖这项指标的自动计算。
ALTER TABLE food_nutrient
  COMMENT = '食材每 100 克的成分。来源没有给出的营养素不插行，读取时不能把缺失当成 0。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。业务上用食材、版本和营养素编码唯一确定一项成分。',
  MODIFY COLUMN food_item_id varchar(64) NOT NULL COMMENT '对应 food_item.food_item_id。必须和 data_version 一起指向同一个食材版本。',
  MODIFY COLUMN data_version varchar(32) NOT NULL COMMENT '与食材行相同的数据集版本，避免新版数值被旧方案读到。',
  MODIFY COLUMN nutrient_code int NOT NULL COMMENT '营养素编码，与 NutrientType 一致：1能量，2蛋白质，3碳水化合物，4脂肪，5膳食纤维，6钠，7钾，8磷，9胆固醇，10饱和脂肪，11烹调油。',
  MODIFY COLUMN value_per_100g decimal(18,7) NULL COMMENT '每 100 克含量，保留到小数点后 7 位。USDA 公布值最多 7 位小数，少一位会把原值四舍五入。空值表示来源未发表该项，不能当成 0。',
  MODIFY COLUMN unit_code int NOT NULL COMMENT '单位，与 NutrientUnit 一致：1千卡，2克，3毫克。能量用千卡，钠、钾、磷和胆固醇用毫克，其余用克。',
  MODIFY COLUMN quality_code int NOT NULL COMMENT '数据状态，与 NutrientQuality 一致：1已知，2估算，3未知，4不适用。未知不能同时写下数值。',
  MODIFY COLUMN source_ref varchar(200) NOT NULL COMMENT '这一项数值的出处，与同一食材版本的来源保持一致。';

-- 指南里的上限写在参数名和数值上。unit_code 尚未区分毫克时，以 parameter_code 的单位后缀为准。
ALTER TABLE formula_parameter
  COMMENT = '公式参数。参数名自己带单位，避免单位枚举还没覆盖时把毫克写成别的单位。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN formula_id varchar(64) NOT NULL COMMENT '公式标识。',
  MODIFY COLUMN formula_version varchar(32) NOT NULL COMMENT '公式版本。参数属于某一版，不跨版本共用。',
  MODIFY COLUMN parameter_code varchar(64) NOT NULL COMMENT '参数编码。编码里写明单位，例如 SODIUM_MAXIMUM_MG。',
  MODIFY COLUMN parameter_value decimal(18,6) NOT NULL COMMENT '参数数值。',
  MODIFY COLUMN unit_code int NOT NULL COMMENT '单位代码。毫克枚举尚未单列时固定写 1，实际单位看参数编码。';

-- 重复提交不能生成两套方案。命中已有键时直接返回第一次的结果。
ALTER TABLE idempotency_record
  COMMENT = '接口幂等记录。同一账号、同一接口、同一幂等键只保留第一次结果。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。对外用账号、接口范围和幂等键识别，不使用自增号。',
  MODIFY COLUMN account_id varchar(64) NOT NULL COMMENT '发起请求的账号。',
  MODIFY COLUMN endpoint_scope varchar(64) NOT NULL COMMENT '接口范围。不同接口的相同幂等键互不占用。',
  MODIFY COLUMN idempotency_key varchar(64) NOT NULL COMMENT '调用方传入的幂等键。',
  MODIFY COLUMN request_hash char(64) NOT NULL COMMENT '第一次请求正文的摘要。同一键携带不同正文时不能当成同一次请求。',
  MODIFY COLUMN response_code int NOT NULL COMMENT '第一次处理返回的业务码。',
  MODIFY COLUMN response_body json NOT NULL COMMENT '第一次处理返回的正文。重复请求原样返回，不再执行。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '第一次处理完成的时间。';

-- 吃过的记录不能直接改掉。更正必须指向原来的摄入，并单独保存更正后的明细。
ALTER TABLE intake_correction
  COMMENT = '对已记录摄入的更正。原摄入保留，更正另记一行。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN correction_id varchar(64) NOT NULL COMMENT '更正标识。',
  MODIFY COLUMN event_id varchar(64) NOT NULL COMMENT '更正事件标识。同一事件只更正一次。',
  MODIFY COLUMN original_intake_id varchar(64) NOT NULL COMMENT '被更正的原摄入。',
  MODIFY COLUMN account_id varchar(64) NOT NULL COMMENT '更正人账号。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN patient_version varchar(64) NOT NULL COMMENT '更正时的患者主数据版本。',
  MODIFY COLUMN note varchar(2000) NULL COMMENT '更正说明。空值表示没有额外说明。',
  MODIFY COLUMN recorded_at timestamp(3) NOT NULL COMMENT '更正时间。';

-- 更正后的食物、成品、数量和重量基准要单独保存，避免和原摄入混在一起。
ALTER TABLE intake_correction_item
  COMMENT = '更正后的摄入明细。原明细不删除。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN correction_id varchar(64) NOT NULL COMMENT '所属更正。',
  MODIFY COLUMN item_type_code int NOT NULL COMMENT '项目类型，区分简单食物和熟制成品。',
  MODIFY COLUMN food_item_id varchar(64) NULL COMMENT '简单食物的食材标识。熟制成品可以为空。',
  MODIFY COLUMN cooking_execution_id varchar(64) NULL COMMENT '熟制成品对应的烹饪会话。简单食物可以为空。',
  MODIFY COLUMN quantity decimal(18,6) NOT NULL COMMENT '更正后的数量。',
  MODIFY COLUMN unit_code int NOT NULL COMMENT '数量单位。',
  MODIFY COLUMN weight_basis_code int NOT NULL COMMENT '重量基准。不同基准不能直接相加。';

-- 吃下去的量不是计划量。记录时钉住当时的患者主数据版本，更正时保留原事件，另写更正记录。
ALTER TABLE intake_event
  COMMENT = '一次实际摄入。和方案、烹饪会话分开记录。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN intake_id varchar(64) NOT NULL COMMENT '摄入标识。',
  MODIFY COLUMN event_id varchar(64) NOT NULL COMMENT '事件标识。同一事件只记一次。',
  MODIFY COLUMN account_id varchar(64) NOT NULL COMMENT '记录人账号。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN patient_version varchar(64) NOT NULL DEFAULT '' COMMENT '记录时的患者主数据版本。不能用后来的患者版本解释这次摄入。',
  MODIFY COLUMN meal_id varchar(64) NULL COMMENT '对应的计划餐次。没有对应餐次时为空。',
  MODIFY COLUMN recorded_at timestamp(3) NOT NULL COMMENT '记录时间。';

-- 简单食物在确认摄入时扣库存。熟制成品的原料已在烹饪投入时扣除，这里不能再扣一次。
ALTER TABLE intake_item
  COMMENT = '一次摄入中的具体食物或熟制成品。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN intake_id varchar(64) NOT NULL COMMENT '所属摄入。',
  MODIFY COLUMN item_type_code int NOT NULL COMMENT '项目类型，区分简单食物和熟制成品。',
  MODIFY COLUMN food_item_id varchar(64) NULL COMMENT '简单食物的食材标识。熟制成品可以为空。',
  MODIFY COLUMN cooking_execution_id varchar(64) NULL COMMENT '熟制成品对应的烹饪会话。简单食物可以为空。',
  MODIFY COLUMN quantity decimal(18,6) NOT NULL COMMENT '实际食用量。',
  MODIFY COLUMN unit_code int NOT NULL COMMENT '食用量单位。',
  MODIFY COLUMN weight_basis_code int NOT NULL COMMENT '重量基准，区分生重、熟重和可食部。不能把不同基准直接相加。';

-- 餐次属于方案版本。重算产生新版本时，旧餐次保留给已经确认的记录。
ALTER TABLE meal
  COMMENT = '某个方案版本中的一餐。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN meal_id varchar(64) NOT NULL COMMENT '餐次标识。',
  MODIFY COLUMN plan_version_id varchar(64) NOT NULL COMMENT '所属方案版本。',
  MODIFY COLUMN meal_type_code int NOT NULL COMMENT '餐次。1 早餐，2 午餐，3 晚餐。',
  MODIFY COLUMN status_code int NOT NULL COMMENT '这一餐的执行状态。';

-- 餐次额度依赖当时的目标版本。不能用后来的目标改写已经分配的额度。
ALTER TABLE meal_budget
  COMMENT = '某一天某一餐的额度快照。目标版本变化时另起一行。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN budget_id varchar(64) NOT NULL COMMENT '额度标识。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN budget_date date NOT NULL COMMENT '额度所属日期。',
  MODIFY COLUMN meal_type_code int NOT NULL COMMENT '餐次。1 早餐，2 午餐，3 晚餐。',
  MODIFY COLUMN target_version varchar(64) NOT NULL COMMENT '计算这份额度时使用的目标版本。',
  MODIFY COLUMN budget_json json NOT NULL COMMENT '该餐额度的结构化内容。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '写入时间。';

-- 份数不能代替克数。没有克数时不能把份数换算成营养。
ALTER TABLE meal_item
  COMMENT = '一餐中的一项食物或菜谱。份数和克数分开保存。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN meal_item_id varchar(64) NOT NULL COMMENT '餐次项目标识。',
  MODIFY COLUMN meal_id varchar(64) NOT NULL COMMENT '所属餐次。',
  MODIFY COLUMN item_type_code int NOT NULL COMMENT '项目类型，区分菜谱份量和简单食物。',
  MODIFY COLUMN item_ref varchar(64) NOT NULL COMMENT '菜谱或食材标识。',
  MODIFY COLUMN quantity decimal(18,6) NOT NULL COMMENT '按 unit_code 计的数量。它不是克数。',
  MODIFY COLUMN unit_code int NOT NULL COMMENT 'quantity 的单位。',
  MODIFY COLUMN grams decimal(18,6) NULL COMMENT '计划克数。空值表示这一项还没有换成克，不能当成 0 克。';

-- 公式正文、输入单位和输出单位必须一起版本化。单位不一致时不能直接套用参数。
ALTER TABLE nutrition_formula
  COMMENT = '营养公式版本。没有已发布公式时，不能用代码里的默认数代替。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN formula_id varchar(64) NOT NULL COMMENT '公式标识。',
  MODIFY COLUMN version varchar(32) NOT NULL COMMENT '公式版本。',
  MODIFY COLUMN status_code int NOT NULL COMMENT '公式状态，与 FormulaStatus 一致：1 草稿，2 临床复核，3 已测试，4 已发布，5 停用。',
  MODIFY COLUMN expression_text varchar(1000) NOT NULL COMMENT '公式含义。计算仍以参数表里的已发布数值为准，不解析这段文字。',
  MODIFY COLUMN input_unit varchar(32) NOT NULL COMMENT '输入单位。',
  MODIFY COLUMN output_unit varchar(32) NOT NULL COMMENT '输出单位。',
  MODIFY COLUMN effective_at timestamp(3) NULL COMMENT '生效时间。',
  MODIFY COLUMN expires_at timestamp(3) NULL COMMENT '失效时间。空值表示这一版还没有失效日期。';

-- 不同营养素的保留率不同。不能用一个系数套到能量、钠和维生素上。
ALTER TABLE nutrition_retention_factor
  COMMENT = '某种烹饪转换下，单一营养素的保留系数。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN transform_id varchar(64) NOT NULL COMMENT '转换标识。',
  MODIFY COLUMN transform_version varchar(64) NOT NULL COMMENT '转换版本。',
  MODIFY COLUMN nutrient_code int NOT NULL COMMENT '营养素编码，与 NutrientType 一致。',
  MODIFY COLUMN factor_value decimal(18,6) NOT NULL COMMENT '该营养素的保留系数。';

-- 体重变化不能据此加大热量缺口。评价只决定是否保持、调整未来餐或转人工。
ALTER TABLE outcome_evaluation
  COMMENT = '用餐后的结构化评价。评价不能改写已经吃过的记录。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN evaluation_id varchar(64) NOT NULL COMMENT '评价标识。同一评价可以有多个类别。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN category_code int NOT NULL COMMENT '评价类别，例如安全、依从、饱腹、体重、代谢反应和可执行性。',
  MODIFY COLUMN decision_code int NOT NULL COMMENT '处置决定，例如保持方案、调整未来餐、人工复核或停止。',
  MODIFY COLUMN reason_code varchar(64) NOT NULL COMMENT '原因编码。',
  MODIFY COLUMN observed_at timestamp(3) NOT NULL COMMENT '用户观察到该情况的时间。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '记录写入时间。';

-- 批次上的当前数量必须能由事件追溯。多个流程不能各自覆盖同一个数量字段。
ALTER TABLE pantry_change_event
  COMMENT = '库存变更事件。入库、预留、消耗和作废都追加一行，不直接改掉历史数量。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN event_id varchar(64) NOT NULL COMMENT '事件标识。同一事件只记一次。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN lot_id varchar(64) NOT NULL COMMENT '发生变化的批次。',
  MODIFY COLUMN change_type_code int NOT NULL COMMENT '变更类型，区分入库、修改、预留、消耗和作废。',
  MODIFY COLUMN quantity decimal(18,6) NOT NULL COMMENT '本次变更数量。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '事件时间。';

-- 库存分成目录、批次、预留和变更事件。直接覆盖数量会丢掉临期批次和预留。
ALTER TABLE pantry_item
  COMMENT = '家中食材目录。数量记在批次上，这一行不直接改数量。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN pantry_item_id varchar(64) NOT NULL COMMENT '家中食材标识。',
  MODIFY COLUMN account_id varchar(64) NOT NULL COMMENT '账号标识。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN food_item_id varchar(64) NOT NULL COMMENT '食材标识。',
  MODIFY COLUMN state_code int NOT NULL COMMENT '食材状态，例如生或熟。生重不能直接当成熟重使用。',
  MODIFY COLUMN unit_code int NOT NULL COMMENT '数量单位。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '建档时间。';

-- 同一食材可能分多次购入。求解优先用临期批次，但不能为了减少浪费突破健康约束。
ALTER TABLE pantry_lot
  COMMENT = '家中食材批次。账面量和预留量分开，预留不表示已经吃掉。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN lot_id varchar(64) NOT NULL COMMENT '批次标识。',
  MODIFY COLUMN pantry_item_id varchar(64) NOT NULL COMMENT '所属家中食材。',
  MODIFY COLUMN lot_code varchar(64) NULL COMMENT '批次号。没有批次号时为空。',
  MODIFY COLUMN on_hand_quantity decimal(18,6) NOT NULL COMMENT '账面数量。',
  MODIFY COLUMN reserved_quantity decimal(18,6) NOT NULL COMMENT '已被方案预留、尚未实际消耗的数量。',
  MODIFY COLUMN expire_at timestamp(3) NULL COMMENT '保质时间。空值表示没有记录保质期。',
  MODIFY COLUMN version bigint NOT NULL COMMENT '批次版本。并发扣减时用版本比较，避免互相覆盖。',
  MODIFY COLUMN updated_at timestamp(3) NOT NULL COMMENT '最后更新时间。';

-- 生成方案只减少可用量。预留状态 1 表示仍占用，2 表示已释放。
ALTER TABLE pantry_reservation
  COMMENT = '方案版本对库存批次的预留。取消或过期后释放，确认实际使用后才消耗。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN reservation_id varchar(64) NOT NULL COMMENT '预留标识。',
  MODIFY COLUMN plan_version_id varchar(64) NOT NULL COMMENT '占用这批库存的方案版本。',
  MODIFY COLUMN lot_id varchar(64) NOT NULL COMMENT '被预留的批次。同一方案版本对同一批次只预留一次。',
  MODIFY COLUMN quantity decimal(18,6) NOT NULL COMMENT '预留数量。',
  MODIFY COLUMN status_code int NOT NULL COMMENT '预留状态。1 仍占用，2 已释放。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '预留时间。';

-- 一个账号可以绑定患者。营养计算只认患者标识，不复制挂号里的主数据。
ALTER TABLE patient_binding
  COMMENT = '账号和患者的绑定。营养服务不保存姓名，只保留挂号侧的患者标识。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN account_id varchar(64) NOT NULL COMMENT '账号标识。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN patient_version varchar(64) NOT NULL COMMENT '绑定时的患者主数据版本。主数据后来变更不能悄悄改掉这次绑定。',
  MODIFY COLUMN bound_at timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '绑定时间。';

-- 方案可以有多版。当前版本指针和历史版本分开，旧版本不能被新计算覆盖。
ALTER TABLE plan
  COMMENT = '膳食方案头。具体内容在不可变的方案版本里。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN plan_id varchar(64) NOT NULL COMMENT '方案标识。',
  MODIFY COLUMN account_id varchar(64) NOT NULL COMMENT '账号标识。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN status_code int NOT NULL COMMENT '方案状态：1 草稿，2 已校验，3 已确认，4 已完成，5 已取消，6 已过期，7 已中断。',
  MODIFY COLUMN current_version varchar(64) NOT NULL COMMENT '当前方案版本。历史版本仍保留。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '创建时间。',
  MODIFY COLUMN updated_at timestamp(3) NOT NULL COMMENT '最后更新时间。';

-- 确认的是一个版本。之后的新版本需要重新确认，不能沿用旧确认。
ALTER TABLE plan_confirmation
  COMMENT = '用户对某一方案版本的确认。确认不等于开始烹饪，也不等于已经吃完。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN confirmation_id varchar(64) NOT NULL COMMENT '确认标识。',
  MODIFY COLUMN plan_id varchar(64) NOT NULL COMMENT '方案标识。',
  MODIFY COLUMN plan_version_id varchar(64) NOT NULL COMMENT '被确认的方案版本。',
  MODIFY COLUMN confirmed_at timestamp(3) NOT NULL COMMENT '确认时间。';

-- 同一方案后来重算会生成新版本。已经确认或已经吃过的版本不能被改写。
ALTER TABLE plan_version
  COMMENT = '方案的一份不可变版本，钉住当时的画像和库存版本。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN plan_version_id varchar(64) NOT NULL COMMENT '方案版本标识。',
  MODIFY COLUMN plan_id varchar(64) NOT NULL COMMENT '所属方案。',
  MODIFY COLUMN profile_version varchar(64) NOT NULL COMMENT '生成这一版时的画像版本。',
  MODIFY COLUMN pantry_version varchar(64) NOT NULL COMMENT '生成这一版时的库存版本。',
  MODIFY COLUMN status_code int NOT NULL COMMENT '这一版的状态，编码与方案头相同。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '这一版的生成时间。';

-- 专业目标是当前有效版本的指针。历史版本保留，过期后不能继续当作当前目标。
ALTER TABLE professional_target
  COMMENT = '专业人员为患者设定的营养目标。有专业目标时，自动能量公式让路。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN target_id varchar(64) NOT NULL COMMENT '专业目标标识。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN current_version varchar(32) NOT NULL COMMENT '当前有效版本。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '创建时间。';

-- 专业人员给出的能量或营养素上下限优先于推算值。换目标时新增版本，不覆盖旧版。
ALTER TABLE professional_target_version
  COMMENT = '专业营养目标的一版上下限。有效期过了就不能再用于新的自动配餐。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN target_id varchar(64) NOT NULL COMMENT '专业目标标识。',
  MODIFY COLUMN version varchar(32) NOT NULL COMMENT '版本号。',
  MODIFY COLUMN nutrient_code varchar(64) NOT NULL COMMENT '这条上下限约束的营养素。',
  MODIFY COLUMN minimum_value decimal(18,6) NOT NULL COMMENT '下限。',
  MODIFY COLUMN maximum_value decimal(18,6) NOT NULL COMMENT '上限。',
  MODIFY COLUMN effective_at timestamp(3) NOT NULL COMMENT '生效时间。',
  MODIFY COLUMN expires_at timestamp(3) NOT NULL COMMENT '失效时间。过期后这次配餐不能再使用这一版。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '写入时间。';

-- 画像当前行会被更新。已经生成的方案必须还能看到当时的输入。
ALTER TABLE profile_snapshot
  COMMENT = '画像的不可变快照。方案引用版本，不跟随后来的修改。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN profile_id varchar(64) NOT NULL COMMENT '画像标识。',
  MODIFY COLUMN version bigint NOT NULL COMMENT '快照对应的画像版本。同一画像的同一版本只留一份。',
  MODIFY COLUMN snapshot_json json NOT NULL COMMENT '该版本的完整画像。写入后不修改。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '快照写入时间。';

-- 菜谱改版不能覆盖旧版本。未发布版本不能进入推荐。
ALTER TABLE recipe
  COMMENT = '菜谱头。配料、步骤和营养以已发布版本为准。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN recipe_id varchar(64) NOT NULL COMMENT '菜谱标识。',
  MODIFY COLUMN display_name varchar(200) NOT NULL COMMENT '菜谱名称。',
  MODIFY COLUMN current_version varchar(64) NOT NULL COMMENT '当前版本。历史版本仍可用于已经生成的方案。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '创建时间。';

-- 模型不能根据厨具名称猜测温度和时间。只有写明的变体才能使用。
ALTER TABLE recipe_equipment_variant
  COMMENT = '菜谱在某种厨具上的已审核步骤。没有对应变体时，这道菜不能进入候选。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN recipe_id varchar(64) NOT NULL COMMENT '菜谱标识。',
  MODIFY COLUMN recipe_version varchar(64) NOT NULL COMMENT '菜谱版本。',
  MODIFY COLUMN equipment_code varchar(64) NOT NULL COMMENT '厨具编码。同一版本的同一厨具只有一种变体。',
  MODIFY COLUMN variant_text varchar(2000) NOT NULL COMMENT '该厨具上的已审核步骤说明。';

-- 步骤文字不能偷偷带上没有计量的油盐。用量变更必须产生新版本。
ALTER TABLE recipe_ingredient
  COMMENT = '某一菜谱版本的配料和用量。油、盐、酱料也要写在这里。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN recipe_id varchar(64) NOT NULL COMMENT '菜谱标识。',
  MODIFY COLUMN recipe_version varchar(64) NOT NULL COMMENT '菜谱版本。',
  MODIFY COLUMN food_item_id varchar(64) NOT NULL COMMENT '配料食材。',
  MODIFY COLUMN quantity decimal(18,6) NOT NULL COMMENT '这一版规定的用量。',
  MODIFY COLUMN unit_code int NOT NULL COMMENT '用量单位。';

-- 菜谱营养由原料和已发布转换复算。关键营养素未知时，这道菜不能进入依赖该指标的求解。
ALTER TABLE recipe_nutrition_result
  COMMENT = '按菜谱版本复算的营养结果。缺失值留空，不能写成 0。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN recipe_id varchar(64) NOT NULL COMMENT '菜谱标识。',
  MODIFY COLUMN recipe_version varchar(64) NOT NULL COMMENT '菜谱版本。',
  MODIFY COLUMN nutrient_code int NOT NULL COMMENT '营养素编码，与 NutrientType 一致。',
  MODIFY COLUMN nutrient_value decimal(18,6) NULL COMMENT '复算结果。空值表示未知，不能当成 0。',
  MODIFY COLUMN unit_code int NOT NULL COMMENT '单位，与 NutrientUnit 一致：1千卡，2克，3毫克。',
  MODIFY COLUMN quality_code int NOT NULL COMMENT '数据状态，与 NutrientQuality 一致：1已知，2估算，3未知，4不适用。',
  MODIFY COLUMN source_ref varchar(200) NOT NULL COMMENT '这次复算所依据的来源。';

-- 模型只能把这些步骤说得更容易懂，不能改写投放量和食品安全条件。
ALTER TABLE recipe_step
  COMMENT = '某一菜谱版本的步骤。关键用量、顺序和完成条件来自已发布步骤。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN recipe_id varchar(64) NOT NULL COMMENT '菜谱标识。',
  MODIFY COLUMN recipe_version varchar(64) NOT NULL COMMENT '菜谱版本。',
  MODIFY COLUMN step_no int NOT NULL COMMENT '步骤序号。同一版本里不重复。',
  MODIFY COLUMN instruction_text varchar(2000) NOT NULL COMMENT '该步的操作说明。';

-- 食品安全关键步骤不能跳过。前置没有完成时不能进入下一步。
ALTER TABLE recipe_step_dependency
  COMMENT = '步骤之间的前置依赖。依赖必须无环。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN recipe_id varchar(64) NOT NULL COMMENT '菜谱标识。',
  MODIFY COLUMN recipe_version varchar(64) NOT NULL COMMENT '菜谱版本。',
  MODIFY COLUMN step_no int NOT NULL COMMENT '当前步骤。',
  MODIFY COLUMN depends_on_step_no int NOT NULL COMMENT '必须先完成的步骤。';

-- 模型生成的菜谱只能停留在草稿。审核通过并发布后才能用来计算克数和步骤。
ALTER TABLE recipe_version
  COMMENT = '菜谱版本。只有已发布版本可以进入正式推荐。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN recipe_id varchar(64) NOT NULL COMMENT '菜谱标识。',
  MODIFY COLUMN version varchar(64) NOT NULL COMMENT '版本号。同一菜谱的版本不重复。',
  MODIFY COLUMN status_code int NOT NULL COMMENT '版本状态：1 草稿，2 已发布，3 停用。',
  MODIFY COLUMN approved_at timestamp(3) NULL COMMENT '发布或审核通过的时间。草稿为空。';

-- 识别结果可能认错。未确认的草稿不能写入库存，也不能进入求解。
ALTER TABLE recognition_draft
  COMMENT = '文字或图片识别出的食材草稿。用户确认前不能参与配餐。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN draft_id varchar(64) NOT NULL COMMENT '草稿标识。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN source_type_code int NOT NULL COMMENT '来源类型，区分文字、照片和小票。',
  MODIFY COLUMN source_reference varchar(500) NOT NULL COMMENT '原始输入的位置或引用。',
  MODIFY COLUMN candidates_json json NOT NULL COMMENT '待确认的候选食材、数量和置信度。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '识别时间。';

-- 任务当前状态会被更新。每一步何时发生，要留在事件里。
ALTER TABLE recommendation_event
  COMMENT = '推荐任务的推进事件。只追加，不回改已经发生的阶段。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN recommendation_id varchar(64) NOT NULL COMMENT '所属推荐任务。',
  MODIFY COLUMN event_id varchar(64) NOT NULL COMMENT '事件标识。同一任务里不重复。',
  MODIFY COLUMN event_type_code int NOT NULL COMMENT '事件类型。',
  MODIFY COLUMN stage_code int NOT NULL COMMENT '当时所处阶段。',
  MODIFY COLUMN message varchar(500) NOT NULL COMMENT '给调用方看的阶段说明。',
  MODIFY COLUMN occurred_at timestamp(3) NOT NULL COMMENT '事件发生时间。';

-- 同一范围只保留一个进行中的任务。请求正文和冲突约束单独保存，方便失败后复现。
ALTER TABLE recommendation_task
  COMMENT = '一次推荐任务。无解或失败时留下原因，不能把失败记成成功。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN recommendation_id varchar(64) NOT NULL COMMENT '推荐任务标识。',
  MODIFY COLUMN account_id varchar(64) NOT NULL COMMENT '发起账号。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN request_hash char(64) NOT NULL COMMENT '请求摘要。相同输入应得到可复现的任务。',
  MODIFY COLUMN status_code int NOT NULL COMMENT '任务状态：1 待处理，2 进行中，3 成功，4 失败，5 已取消，6 超时。',
  MODIFY COLUMN failure_code int NULL COMMENT '失败原因。成功时为空。',
  MODIFY COLUMN profile_version varchar(64) NOT NULL COMMENT '任务使用的画像版本。',
  MODIFY COLUMN pantry_version varchar(64) NOT NULL COMMENT '任务使用的库存版本。',
  MODIFY COLUMN created_at timestamp(3) NOT NULL COMMENT '创建时间。',
  MODIFY COLUMN updated_at timestamp(3) NOT NULL COMMENT '最后更新时间。',
  MODIFY COLUMN active_scope_key varchar(191) NULL COMMENT '进行中的范围键。同一范围不能同时有两个有效任务。结束后清空。',
  MODIFY COLUMN request_json json NULL COMMENT '发起时的请求快照。',
  MODIFY COLUMN conflict_json json NULL COMMENT '求解无解时的冲突约束。有可行解时为空，不能另编一餐。';

-- 安全模块要收敛成唯一许可。原因和处置必须是稳定编码，不能靠临时文字。
ALTER TABLE rule_entry
  COMMENT = '一条规则的许可、原因和处置。不能只留一段说明文字。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN rule_set_id varchar(64) NOT NULL COMMENT '所属规则集标识。',
  MODIFY COLUMN rule_code varchar(64) NOT NULL COMMENT '规则编码。同一规则集里不重复。',
  MODIFY COLUMN permission_code int NOT NULL COMMENT '安全许可，与 SafetyPermission 一致：1 允许，2 补充数据，3 人工复核，4 停止。',
  MODIFY COLUMN reason_codes json NOT NULL COMMENT '原因编码列表。可以有多个原因。',
  MODIFY COLUMN action_codes json NOT NULL COMMENT '处置动作编码列表。';

-- 规则换版时新增一行，不能覆盖旧版本。状态未发布时不能拿来自动计算。
ALTER TABLE rule_set
  COMMENT = '规则集版本。过期版本保留，已经生成的方案继续引用旧版本。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN rule_set_id varchar(64) NOT NULL COMMENT '规则集标识。',
  MODIFY COLUMN version varchar(32) NOT NULL COMMENT '规则版本。同一规则集的不同版本可以并存。',
  MODIFY COLUMN status_code int NOT NULL COMMENT '规则状态，与 FormulaStatus 一致：1 草稿，2 临床复核，3 已测试，4 已发布，5 停用。',
  MODIFY COLUMN effective_at timestamp(3) NULL COMMENT '生效时间。未到生效时间不能使用。',
  MODIFY COLUMN expires_at timestamp(3) NULL COMMENT '失效时间。空值表示这一版还没有失效日期。';

-- 推荐展示可以换说法，但不能改食材标识和克数。单餐在没有已发布餐次比例时，不能把这一餐记成全天剩余额度。
ALTER TABLE solved_meal_dish
  COMMENT = '求解器锁定的一餐结果。克数和步骤来自已发布菜谱，不由模型改写。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN meal_date date NOT NULL COMMENT '这一餐所属日期。',
  MODIFY COLUMN recipe_id varchar(64) NOT NULL COMMENT '入选的菜谱。',
  MODIFY COLUMN portions decimal(18,6) NOT NULL COMMENT '份数。1 表示菜谱上的整份。',
  MODIFY COLUMN food_item_id varchar(64) NOT NULL COMMENT '该份菜谱中的食材。',
  MODIFY COLUMN grams decimal(18,6) NOT NULL COMMENT '求解锁定的克数。',
  MODIFY COLUMN step_text varchar(2000) NOT NULL COMMENT '已发布菜谱上的步骤原文。',
  MODIFY COLUMN represents_daily_remainder tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否代表当天剩余全部额度。单餐且没有已发布餐次比例时为 0，避免把一餐当成全天。';

-- 库存不够时可以列出缺口。用户明确只要家中食材时，不能把缺口食材悄悄算进方案。
ALTER TABLE solved_meal_shortage
  COMMENT = '优先使用库存时，这一餐仍然缺少的食材。缺货不等于已经购买。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。',
  MODIFY COLUMN meal_date date NOT NULL COMMENT '缺货所属日期。',
  MODIFY COLUMN food_item_id varchar(64) NOT NULL COMMENT '仍然缺少的食材。';

-- 能量和营养目标只依赖这里的性别、年龄、身高和活动水平。画像更新后版本递增，旧方案仍引用旧版本。
ALTER TABLE user_profile
  COMMENT = '营养计算用的患者画像。姓名等主数据留在挂号系统。',
  MODIFY COLUMN id bigint NOT NULL AUTO_INCREMENT COMMENT '行号。业务上用画像标识。',
  MODIFY COLUMN profile_id varchar(64) NOT NULL COMMENT '画像标识。',
  MODIFY COLUMN account_id varchar(64) NOT NULL COMMENT '账号标识。',
  MODIFY COLUMN patient_id varchar(64) NOT NULL COMMENT '患者标识。一名患者只有一份当前画像。',
  MODIFY COLUMN patient_version varchar(64) NOT NULL COMMENT '写入时的患者主数据版本。',
  MODIFY COLUMN version bigint NOT NULL COMMENT '画像版本。每次更新递增，方案引用的是当时的版本。',
  MODIFY COLUMN sex_code int NOT NULL COMMENT '性别代码。1 男，2 女。其他值不进入成年能量表。',
  MODIFY COLUMN birth_date date NOT NULL COMMENT '出生日期。未满 18 岁不使用成年能量表。',
  MODIFY COLUMN height_cm decimal(7,2) NOT NULL COMMENT '身高，单位厘米。',
  MODIFY COLUMN timezone varchar(64) NOT NULL COMMENT '患者时区。用餐日期按这个时区计算。',
  MODIFY COLUMN activity_level_code int NULL COMMENT '活动水平。1、2、3 对应膳食营养素参考摄入量里的 PALⅠ、PALⅡ、PALⅢ。空值表示还不能计算能量。',
  MODIFY COLUMN goal_type_code int NOT NULL COMMENT '目标类型代码。对话里说减肥不会自动写成这个字段。',
  MODIFY COLUMN updated_at timestamp(3) NOT NULL COMMENT '最后更新时间。';

