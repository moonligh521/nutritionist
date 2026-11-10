# 慢病与减重食材推荐系统设计

日期：2026-11-10

状态：待审。

本设计替代早期方案中的自动推荐边界和计算链路。早期竞品与开源项目调研保留在
`2026-11-10-ingredient-recommendation-design.md`，本文件作为后续实现的产品和技术基线。

## 1. 定位

系统给需要控制摄入的成人提供可计算、可复核的食材推荐：

- 可以只问一餐，例如「今晚吃什么」。
- 可以排一天的早、中、晚餐和加餐。
- 可以拍照或打字告诉系统家里现有的食材。
- 可以明确要求「只能用这些食材」，系统基于实际库存定制。
- 可以表达「我知道不适合，但特别想少吃一点」，系统先判断能否进入风险受控的小份满足。
- 先扣除当天已经吃过的食物，再安排尚未吃的餐。
- 长期保存疾病、用药、过敏、忌口、家中食材、测量、实际摄入和已确认方案。
- 新测量上报后，系统可以维持、局部调整、重新评估或停止推荐。

系统不是自动诊疗工具，不诊断疾病，不修改药物和剂量，不替代医生或营养师。

核心原则是：

> 规则和确定性求解器决定食材及克数；Java 重新计算并校验；模型只负责做法、说明和固定格式表达。

## 2. 支持边界

不使用「覆盖所有需要控制饮食的慢病」作为产品承诺。系统采用明确的支持清单和四级准入。

### 2.1 A 级：允许自动推荐

第一版只支持：

- 年满 18 岁；
- 已明确为 2 型糖尿病或糖尿病前期；
- 同时存在超重或肥胖，或只有减重目标；
- 病情、药物和日常进食相对稳定；
- 没有本设计列出的排除项。

第一版可处理：

- 单餐和一日方案；
- 减重所需热量缺口；
- 蛋白质安全下限；
- 每餐碳水范围；
- 食物升糖方向；
- 当天已吃食物的扣减；
- 过敏、忌口、偏好和家中食材；
- 体重和血糖趋势；
- 减重与控糖同时存在。

### 2.2 B 级：只执行专业人员设定的目标

以下场景不由系统自行推导临床目标。只有医生或营养师已经给出可执行额度时，系统才能帮助配餐：

- 使用胰岛素或磺脲类药物；
- 使用 SGLT2 抑制剂且计划低碳、断食或正处于急性病期；
- 慢性肾病；
- 高血压；
- 高脂血症；
- 高尿酸血症或痛风；
- 需要严格液体、钾、磷、蛋白质或钠管理的场景。

这些病种后续逐个升级为 A 级。每次升级必须补齐独立的准入、排除、数据要求、冲突测试和专业审核。

### 2.3 C 级：只做记录、科普和转介

以下场景不自动生成食材和克数：

- 1 型糖尿病、妊娠糖尿病或糖尿病类型不明；
- 妊娠、哺乳；
- 晚期慢性肾病、透析、肝硬化、心力衰竭；
- 肿瘤及治疗相关营养问题；
- 吞咽障碍、吸收障碍、炎症性肠病、乳糜泻；
- 老年衰弱、肌少症、低 BMI 或营养不良；
- 减重手术后；
- 进食障碍；
- 快速、非意愿性体重下降。

系统可以记录数据、解释指南并提示寻求专业人员帮助。

### 2.4 D 级：停止推荐

出现以下情况时不生成食材：

- 严重低血糖或高血糖及相关症状；
- 需要他人帮助、意识改变或不能安全吞咽；
- 疑似糖尿病酮症酸中毒或高渗高血糖状态；
- 血压危象；
- 持续呕吐、明显脱水或其他急性病表现；
- 输入的多病约束没有安全可行解。

具体阈值必须来自已版本化的官方指南或临床审核规则，不能直接使用开源演示项目中的常量。

## 3. 用户场景

### 3.1 单餐

用户问「今晚吃什么」时：

1. 读取当天已吃记录。
2. 冻结已吃和已确认的餐。
3. 计算剩余日额度和晚餐额度。
4. 使用家中食材、偏好和病种约束求解晚餐。
5. 返回食材、克数、做法、营养汇总和剩余额度。

如果晚餐调整会导致其他未来餐无法满足全天约束，则一起重算尚未吃的未来餐。

### 3.2 一日方案

用户请求一日三餐时：

- 生成早、中、晚餐，需要时增加加餐；
- 每餐有食材、克数和做法；
- 全天满足热量、蛋白质和病种约束；
- 支持替换某个不喜欢的食材；
- 替换后重新校验餐次和全天约束。

### 3.3 家中现有食材

用户可以通过以下方式录入家中食材：

- 打字：「有鸡蛋 4 个、西红柿 500 克、燕麦 300 克」；
- 自然语言：「冰箱里还有半颗白菜和昨天剩的鸡胸肉」；
- 拍摄冰箱、食材或购物小票；
- 在识别结果中手工增加、删除或修改。

录入过程分为两步：

1. 模型或识别服务只产出候选食材、可能数量、单位和置信度；
2. 用户确认后才写入库存，未经确认的识别结果不能参与配餐。

照片通常无法可靠判断精确克数。系统应：

- 能识别包装标重时读取包装净含量；
- 不能识别时询问数量、个数或大致重量；
- 可以用「1 个」「半颗」「1 盒」录入，但求解前必须通过份量换算表转换为范围；
- 对低置信度、遮挡和无法区分生熟状态的食材要求确认；
- 不根据图片自行推断过敏原不存在。

库存模式有两种：

- `ONLY_AVAILABLE`：用户明确说「只有这些」「不要推荐要买的」。库存是硬约束，方案不得使用库存外食材，也不得超过现有数量。
- `PREFER_AVAILABLE`：用户希望优先消耗家中食材。库存是软目标；当现有食材无法满足安全和营养约束时，可以给出最小补购清单。

如果 `ONLY_AVAILABLE` 没有可行解：

- 不允许模型添加新食材；
- 返回缺少的营养类别或发生冲突的约束；
- 给出「放宽为允许补购」或「调整餐次范围」的选择；
- 在用户明确同意前，不生成包含库存外食材的方案。

每条库存记录至少包含：

- 标准食材 ID 和用户看到的名称；
- 数量、单位及可换算范围；
- 生/熟、包装/散装状态；
- 可选的保质期或优先消耗时间；
- 来源：文字、照片、购物小票或手工修改；
- 识别置信度；
- 是否已经由用户确认；
- 入库、消耗和作废时间。

同一食材可能来自多批库存，求解时优先使用临期批次，但不能为减少浪费突破健康约束。

### 3.4 当天已吃

实际摄入按不可变事实记录。已吃食物不能被后续方案覆盖。

如果用户没有说明今天已经吃过什么：

- 单餐推荐只能使用该餐默认分配；
- 明确提示其他餐尚未计入；
- 不把结果描述成完整的当天剩余额度。

### 3.5 新测量上报

血糖和体重上报后不是简单的「调整或不调整」，而是五态决策：

1. `NEED_MORE_DATA`：单位、时间、餐前餐后语境或数据质量不足，要求补充或复测。
2. `URGENT_REFERRAL`：命中急症或排除规则，停止推荐。
3. `KEEP`：变化不足以改变当前额度，维持原方案。
4. `ADJUST_FUTURE_MEALS`：只调整尚未吃的相关餐次或进餐时间。
5. `REASSESS_DAILY_TARGET`：重新计算全天目标，或转专业人员。

决策必须考虑：

- 测量发生时间与记录时间；
- 空腹、餐前、餐后和关联餐次；
- 单位、设备或数据来源、数据质量；
- 多次趋势，而不是单个值；
- 症状、急性病和近期药物变化；
- 实际摄入、漏餐、运动、饮酒和方案执行情况；
- 营养状态和已有专业人员目标。

### 3.6 特别想吃受限制的食物

用户可能说：

- 「我不能吃蛋糕，但今天特别想吃一点」；
- 「痛风能不能少吃一口海鲜」；
- 「医生让我少盐，能不能吃一点腌菜解馋」。

系统不能直接把「不能吃」理解为可量化额度。必须先追问或读取已经记录的限制原因，并分为：

1. `ABSOLUTE_PROHIBITION`：明确过敏、乳糜泻、严重不耐受、明确药食禁忌、急性期禁忌或专业人员明确要求完全避免。
2. `CLINICIAN_RESTRICTED`：专业人员要求限制，但系统没有可计算的目标。
3. `BUDGET_LIMITED`：热量、碳水、钠、饱和脂肪、嘌呤等可以按剩余额度计算。
4. `PREFERENCE_AVOIDED`：只是平时不喜欢或自己选择不吃。
5. `UNKNOWN`：原因不清楚。

处理规则：

- `ABSOLUTE_PROHIBITION`：不计算「安全的一口」，也不保证少量无害；提供口感、香味或做法相近且不命中禁忌的替代品。
- `CLINICIAN_RESTRICTED`：沿用专业人员给定的范围；没有范围时不能自行放宽。
- `UNKNOWN`：先澄清原因，不生成试吃方案。
- `BUDGET_LIMITED`：只有用户通过 A 级准入且当前状态稳定时，才计算风险受控的小份。
- `PREFERENCE_AVOIDED`：按普通偏好处理。

风险受控的小份满足使用 `CRAVING_PORTION` 模式：

1. 用户说明想吃的食物和期望程度，例如一口、半份或指定克数。
2. 系统查询该食物可靠的成分数据和当天剩余额度。
3. 求解器寻找不突破硬约束的最小满足份量。
4. 可以通过改做法、减小份量、和正餐一起搭配或替换同餐其他食材降低营养负担。
5. 只调整尚未吃的未来餐，不修改已吃记录。
6. 返回允许份量、占用的额度、剩余风险和不能保证的部分。

系统不得：

- 宣称「这样吃没有伤害」；
- 建议自行多吃药、追加胰岛素或改变药物时间来抵消；
- 建议催吐、极端运动、整日挨饿或跳过必要餐次来补偿；
- 把一次可行解释成可以频繁食用；
- 在成分数据缺失或限制原因不明时猜测安全份量。

「解馋程度」是主观值，不能由系统假装精确计算。用户可以选择期望份量；系统只判断该份量能否进入当前约束。若不能，系统给出更小份量或替代品，不能为了满足偏好放宽硬约束。

## 4. 约束模型

### 4.1 约束优先级

约束按以下顺序处理：

1. 绝对过敏和明确禁忌；
2. 急性安全；
3. 防止营养不良的下限；
4. 医生或营养师设置的目标；
5. 当前主要治疗目标；
6. 长期风险目标；
7. 偏好、成本、家中食材、多样性和变化最小。

「想吃一次」属于第 7 级软目标，不能突破前六级约束。

高优先级约束不能被低优先级目标突破。

### 4.2 不能简单「取更紧」

多病共存必须合并成统一约束集合：

- 上限通常取较小值；
- 下限通常取较大值；
- 同一营养素的上下限可能发生冲突；
- 蛋白质、钾、磷和液体会随疾病分期、化验和透析状态变化；
- 体重变化可能是脂肪变化，也可能是液体潴留；
- 不同指南可能面向不同人群和时间尺度。

求解结果必须是：

- `FEASIBLE`：全部硬约束满足；
- `PARTIAL`：只有允许降级的软目标未满足；
- `INFEASIBLE`：硬约束没有交集，停止生成并返回冲突约束。

### 4.3 确定性求解

第一版使用纯 Java LP/MIP 求解器 `ojAlgo`：

- 决策变量：每种候选食材的克数或份量档位；
- 硬约束：过敏、禁忌、热量范围、蛋白质下限、每餐碳水范围；
- 软目标：优先家中食材、偏好、变化最小、食物多样、减少浪费；
- `CRAVING_PORTION` 时，在硬约束内最小化目标食物造成的营养负担，并尽量接近用户确认的期望份量；
- `ONLY_AVAILABLE` 时，候选集和最大克数受已确认库存限制；
- `PREFER_AVAILABLE` 时，使用现有库存和优先消耗临期食材进入软目标；
- 已吃餐和已确认餐固定，不允许修改；
- 尚未吃的未来餐可以联合优化。

复杂多天规划和多样性增加后再评估：

- Timefold Solver：Apache-2.0，适合多餐、多天、偏好和固定变量；
- OR-Tools：Apache-2.0，适合复杂整数约束，但有 JNI 和部署成本。

### 4.4 成分复算

求解器和模型都不能提交可信的营养汇总。Java 必须根据食材 ID、数据集版本和克数重新计算：

- 能量；
- 蛋白质；
- 脂肪；
- 碳水化合物；
- 钠；
- 后续病种需要的钾、磷、嘌呤等。

每个值必须保留：

- 数据来源和版本；
- 每 100 克或每份；
- 生重、熟重和可食部；
- 单位；
- 缺失值状态；
- 更新时间和置信等级。

## 5. 模型边界

Spring AI 只负责：

- 根据已确定的食材和克数写烹饪方法；
- 解释为什么这样搭配；
- 在不改变约束的情况下调整口味和表达；
- 输出固定 JSON；
- 生成 SSE 最终展示内容。

模型不得：

- 自行修改食材 ID 和克数；
- 生成新的营养数字并作为事实；
- 调整药物；
- 用检索片段突破规则；
- 在没有可行解时编造方案。

输出固定为：

- `profileSummary`：本次使用的结构化画像摘要；
- `corePrinciples`：核心原则；
- `mealPlan`：餐次、食材 ID、名称、克数、做法；
- `nutrientSummary`：Java 复算后写入；
- `decision`：维持、调整或转介；
- `evidenceRefs`：方案确定后补充的来源引用。

校验分三层：

1. JSON Schema：必填、枚举、类型、范围和禁止额外字段；
2. 领域校验：食材 ID、单位、重复项、数据版本和禁忌；
3. 营养复算：餐次和全天硬约束。

最多允许一次格式修复和一次明确错误码驱动的内容修复。仍失败时返回确定性求解结果或无可行方案，不无限调用模型。

未经完整校验的食谱不能通过 SSE 流给用户。SSE 可以先发送处理阶段，最后发送通过校验的完整结果。

### 5.1 SSE 只做最外层 WebFlux 封装

应用主体使用同步 Java。只在接口适配层使用 Reactor/WebFlux 类型封装 SSE：

```text
RecommendationSseController
    -> Flux<ServerSentEvent<RecommendationEvent>>
        -> RecommendationApplicationService (普通 Java)
            -> RecommendationProgressSink (普通 Java 回调接口)
```

技术约束：

- 主 Web 运行时沿用挂号项目的 `spring-boot-starter-web`；
- 额外引入 `spring-webflux` 模块，只用于 `Flux` 和 `ServerSentEvent` 外层适配；
- 不引入 `spring-boot-starter-webflux`，避免把整个应用切换为响应式运行时；
- Controller 和 SSE adapter 之外不出现 `Mono`、`Flux` 或 Reactor `Context`；
- 数据库继续使用 Spring JDBC，不使用 R2DBC；
- Redis 继续使用 `StringRedisTemplate`/Redisson，不使用 Reactive Redis；
- Spring AI、规则、求解和校验都暴露普通同步 Java 接口；
- 耗时任务交给 Java 21 虚拟线程执行器，不能阻塞请求线程；
- 客户端取消订阅时设置取消标记，应用服务在阶段边界检查并停止后续模型调用；
- 中间事件只报告阶段和可公开进度，最终通过校验后才发送完整方案。

SSE 事件固定为：

- `STARTED`；
- `VALIDATING`；
- `SOLVING`；
- `GENERATING_EXPLANATION`；
- `COMPLETED`；
- `FAILED`；
- 可选 `HEARTBEAT`。

`COMPLETED` 事件必须只有一次。`FAILED` 只返回稳定错误码和可公开信息，不能泄露提示词、堆栈、模型原始响应或健康隐私。

## 6. 状态、长上下文和差分

### 6.1 不保存文本长记忆

长上下文由结构化状态实现：

- 稳定资料：年龄、性别、身高、诊断、过敏、长期忌口；
- 可变资料：体重、血糖、用药、家中食材、目标；
- 不可变事实：测量、已吃记录、用户确认；
- 当前投影：从事实重建的画像快照；
- 方案版本：每次推荐、确认和替换的不可变版本。

对模型只传当前结构化快照、本次增量和必要的已确认方案。对话摘要不能作为医疗事实源。

### 6.2 影响图

状态差分不是对自然语言做文本 diff，而是：

`字段变化 → 命中规则变化 → 约束变化 → 影响时间窗 → 待优化餐次`

例子：

- 新晚餐偏好只影响晚餐软目标；
- 新午餐摄入影响当天剩余额度和所有尚未吃的餐；
- 新体重趋势可能影响下一天起的全天热量目标；
- 一次餐后血糖通常先关联对应餐次，不直接降低下一餐碳水；
- 新药物可能直接触发重新准入或转人工。

## 7. 数据存储

### 7.1 MySQL

MySQL 是唯一事实源，至少保存：

- `user_profile`：当前基础资料和版本；
- `condition_record`：疾病声明、来源和状态；
- `medication_statement`：药物、剂型、频次、开始结束时间和来源；
- `allergy_intolerance`：过敏和不耐受；
- `measurement_event`：测量值、单位、发生时间、记录时间、语境和来源；
- `intake_event`：实际吃下的食材、克数和餐次；
- `pantry_item`、`pantry_lot`：家中食材、批次、数量范围、来源、确认状态和保质期；
- `pantry_change_event`：入库、修改、预留、消耗和作废事件；
- `recognition_draft`：照片或文本识别候选；用户确认前不能进入求解；
- `food_item`、`food_nutrient`：食材和版本化成分值；
- `rule_set`、`rule_entry`：规则版本、来源、审核状态；
- `plan`、`plan_version`、`meal`、`meal_item`：方案和不可变版本；
- `decision_audit`：输入版本、约束、求解状态、校验失败和确认记录；
- `outbox_event`：以后异步集成使用。

每个写入接口都有 `idempotencyKey` 和数据库唯一约束。方案生成使用乐观锁或版本比较，旧输入不能覆盖新测量产生的状态。

每个方案记录：

- `profileVersion`；
- `ruleSetVersion`；
- `foodDatasetVersion`；
- `schemaVersion`；
- `modelVersion`；
- `promptVersion`；
- 输入摘要哈希和输出哈希。

### 7.2 Redis

Redis 只用于：

- 对话快照缓存；
- 短期任务状态；
- 分布式锁；
- 限流。

Redis 丢失后必须能从 MySQL 重建。不能把 Redis 作为唯一饮食画像存储。

### 7.3 RocketMQ

第一版同步推荐链路不接 RocketMQ。以下需求出现后再通过 transactional outbox 和幂等消费者引入：

- 设备测量异步接入；
- 批量重算；
- 通知；
- 跨服务审计或分析。

这样仍保留既定技术选型，但不提前引入重复消费、乱序和旧版本覆盖问题。

## 8. 接口边界

首批接口：

- `PUT /api/v1/profile`：写入基础资料；
- `POST /api/v1/measurements`：上报血糖或体重；
- `POST /api/v1/intakes`：记录已吃食物；
- `POST /api/v1/pantry/recognize-text`：从文字提取库存候选；
- `POST /api/v1/pantry/recognize-image`：从照片或购物小票提取库存候选；
- `POST /api/v1/pantry/confirm`：确认、修改并写入库存；
- `GET /api/v1/pantry`：查看当前库存；
- `POST /api/v1/pantry/adjust`：手工增减、消耗或作废库存；
- `POST /api/v1/recommendations`：请求单餐或一日方案；
- `POST /api/v1/recommendations/craving`：评估受限制食物能否小份纳入当前方案；
- `GET /api/v1/recommendations/{id}/events`：SSE 获取处理状态和最终方案；
- `POST /api/v1/plans/{id}/confirm`：确认方案；
- `POST /api/v1/plans/{id}/replace`：替换某个食材或餐次；
- `GET /api/v1/plans/current`：获取当前确认方案；
- `POST /api/v1/questions/food`：方案确定后的「能不能吃」问答，后续实现。

推荐请求必须包含：

- `scope`：`SINGLE_MEAL` 或 `FULL_DAY`；
- 解馋请求使用 `CRAVING_PORTION`；
- `date` 和时区；
- 单餐时的 `mealType`；
- `pantryMode`：`ONLY_AVAILABLE` 或 `PREFER_AVAILABLE`；
- 使用的 `pantryVersion`；
- `profileVersion`；
- `idempotencyKey`。

## 9. 指南和 RAG

指南有两个不同用途：

1. 规则编制：临床审核人员根据官方指南形成可计算规则，记录来源、版本、适用人群和审核状态。
2. 运行时解释：方案确定后检索出处，或回答「这个病能不能吃某样」。

运行时检索不决定克数，不修改硬约束，也不能把指南中的通用示例直接当成个人方案。

检索文档按以下类型分开：

- 食养原则；
- 病种适用范围和排除项；
- GI、食物交换和食材选择方向；
- 示例食谱；
- 风险和转介提示。

第一版只接卫健委原文链接和少量可引用片段，不复制第三方整理稿。

## 10. 开源复用

### 10.1 复用原则

本项目采用「业务源码全部自研、全部在本仓库开源」的原则：

1. 所有领域模型、规则引擎、求解编排、状态管理、接口、适配器、测试和构建配置都由本项目自行实现；
2. 不复制、翻译、移植或实质性改写其他开源项目的业务源码和测试源码，即使其许可证允许；
3. 第三方项目只用于研究产品场景、模块边界、数据结构和测试思想，最终实现必须从本项目需求独立设计；
4. 通用能力优先通过 Maven 使用正式发布的第三方依赖，不把依赖源码复制进仓库；
5. 临床规则、食谱和营养数据必须独立核对来源，不能跟随代码许可证推定；
6. GPL、AGPL、O'Saasy、无许可证和来源不明材料不进入主仓库。

本仓库是产品实现的唯一源码仓库，不保留私有业务模块或仅在本地存在的核心实现。可提交的 Java 源码、测试、数据库迁移、配置模板、提示词模板和构建文件全部公开。密钥、真实用户健康数据、受限数据集、模型权重、运行日志和构建产物不得提交；这不属于隐藏业务源码。

### 10.2 直接作为依赖或外部工具

| 项目 | 许可证 | 使用位置 | 复用方式 | 注意事项 |
| --- | --- | --- | --- | --- |
| [ojAlgo](https://github.com/optimatika/ojAlgo) | MIT | 第一版 LP/MIP 求解 | Maven 依赖；使用 `ExpressionsBasedModel`，不复制核心源码 | `develop` 分支已要求 Java 22；JDK 21 应锁定兼容的正式发布版，并做基准测试 |
| [networknt/json-schema-validator](https://github.com/networknt/json-schema-validator) | Apache-2.0 | 模型 JSON Schema 校验 | Maven 依赖；使用 `SchemaRegistry` 等公开 API | 必须把其 NOTICE 中适用署名合并进发行物；验证 Jackson 3 与 Boot BOM 的版本收敛 |
| [Testcontainers Java](https://github.com/testcontainers/testcontainers-java) | MIT | MySQL、Redis 集成测试 | 仅 test scope 依赖 | CI 必须提供 Docker 兼容运行时；保留 MIT 版权 |
| [ZXing](https://github.com/zxing/zxing) | Apache-2.0 | 包装食品条码 | 使用 `core`、`javase` 依赖 | 项目处于维护模式，但核心条码解码稳定；不要复制 Android Scanner 应用 |
| [PaddleOCR](https://github.com/PaddlePaddle/PaddleOCR) | Apache-2.0 | 购物小票和包装文字 OCR | 独立 OCR 服务，不嵌入主业务进程 | 模型文件和第三方依赖要继续核对 NOTICE；OCR 结果仍需用户确认 |
| [mica-ppocr](https://github.com/lets-mica/mica-ppocr) | Apache-2.0 | 纯 Java OCR 备选 | 先做兼容性实验，成功后再选 Spring Boot starter | 当前目标是 PP-OCRv6/ONNX；需实测 Boot 4、原生库体积和中文小票准确率 |
| [Timefold Solver](https://github.com/TimefoldAI/timefold-solver) | Apache-2.0 | 后续多餐、多天、多样性优化 | 使用正式 BOM 和 starter | Java 21、Spring Boot 4 适配度高；第一版 ojAlgo 已够用，不同时引入两套求解器 |
| [OR-Tools](https://github.com/google/or-tools) | Apache-2.0 | 复杂 CP-SAT 备选 | 后续依赖 | JNI、整数缩放和跨平台发布成本更高 |
| [JaVers](https://github.com/javers/javers) | Apache-2.0 | 审计辅助 | 可选 SQL starter | 不能代替业务方案版本、幂等键和不可变事件；第一版可不引入 |
| [HAPI FHIR](https://github.com/hapifhir/hapi-fhir) | Apache-2.0 | 以后接医院 | 只引入 `base`、目标 FHIR 结构和 validation 模块 | 保留 HAPI NOTICE；LOINC 等术语另有条款；发布版与 Boot 4/Jackson 需单测 |
| [Synthea](https://github.com/synthetichealth/synthea) | Apache-2.0 | 生成合成患者数据 | 作为独立 CLI 工具运行 | 不嵌入 Boot 4；其 NOTICE 含 RxNorm、LOINC、SNOMED CT 等第三方条款 |

第一版实际运行时计划只引入 ojAlgo、JSON Schema 校验器和 ZXing；Testcontainers 只进入测试。OCR、Timefold、JaVers 和 HAPI FHIR 分阶段引入。

### 10.3 可参考的实现设计，禁止复制源码

#### sugardaddi

[rmasciulli/sugardaddi](https://github.com/rmasciulli/sugardaddi) 使用 MIT 许可证。以下内容只作为需求和测试思想参考：

- `core/utils/DensityConversion.java` 和 `DensityConversionTest.java`：克、毫升和每 100 克/毫升换算；
- `Nutrition`、`ServingSize`、`Unit`、`NutritionBasis`、`DataConfidence`：区分未知值与确认的 0，并保留测量基准和置信度；
- `USDAMapper.java`：USDA 营养素 ID 和单位映射思路。

处理方式：

- 不复制或翻译上述 Java 文件，本项目根据自己的领域模型独立实现；
- Android Room 的 `NutritionEntity` 不进入 Spring JDBC 领域模型；
- `OpenFoodFactsMapper` 不复用，且其代码许可证不能改变 ODbL 数据的许可；
- `EUDietaryReferenceValues` 只适合欧盟标签，不作为中国用户的个体化目标；
- 密度值必须有来源，不能因为有换算函数就猜测食物密度。

本项目可以覆盖相同的换算场景，但测试输入、接口和实现均自行编写。

#### EveryDay_Food

[Jiayu-zheng1/EveryDay_Food](https://github.com/Jiayu-zheng1/EveryDay_Food) 使用 MIT 许可证。以下内容只用于梳理需求：

- `src/lib/shoppingList.ts` 及测试：中文数量、分数、「半」、单位和购物清单合并；
- `src/types.ts` 的 `Meal`、`Nutrition`、`ServingSize`、`PlanSlot` 结构；
- `src/lib/nutrition.ts` 的跨餐去重、组合数量上限和降级策略；
- `familyTable.ts` 的持久化版本字段。

不能使用：

- 1077/1093 道食谱和营养数字，来源不可核验；
- `TDEE-500`、固定 40% 蛋白质等无来源临床默认；
- 经验单位校准表用于营养计算；
- 食疗功效文字。

Java 实现不得翻译或保留其算法表达结构，只根据本项目确认的输入、输出和测试场景独立设计。

#### Timefold quickstarts

[Timefold quickstarts](https://github.com/TimefoldAI/timefold-quickstarts) 使用 Apache-2.0。后续引入 Timefold 时可以研究：

- `getting-started/spring-boot-integration` 的项目接线；
- `bed-allocation` 的 pinning 和允许未分配思路；
- `employee-scheduling` 的负载平衡；
- 约束 justification 的输出方式。

本项目不复制 quickstart 文件，只通过 Timefold 的公开 API 自行接线。没有官方营养配餐示例，不能把 `food-packaging` 误认为食谱示例。

### 10.4 只参考设计，不复制代码和内容

| 项目 | 可以参考 | 不能采用 |
| --- | --- | --- |
| [NutriChef](https://github.com/Hima-Mehta/NutriChef)（MIT） | `avoid`、`prefer`、`from/to/reason` 结构；RAG 条目 `{id,text,metadata}`；库存做菜交互 | `knowledge_base.json` 的无来源健康断言、印度食材、GI 和节省热量数字、直接由 RAG 生成配餐 |
| [metabolic-care-assistant](https://github.com/umer1556/metabolic-care-assistant)（MIT） | `profiles/glucose_logs/daily_checkins` 分表；安全等级与提示分离；候选标签过滤顺序 | `config.py` 临床阈值、`carb_servings × 15g`、14 道菜和随机选餐 |
| [diabetes-food-guide-skill](https://github.com/runyuan-wang/diabetes-food-guide-skill)（MIT） | KPK 编号、原则/交换表/食谱/禁忌分层 | Markdown 正文和 84 套食谱；规则必须从卫健委原文重新建立 |
| [SimT2D.jl](https://github.com/everval/SimT2D.jl)（MIT） | 时间序列与事件日志字段设计 | 当前模拟参数和 CSV；存在无来源概率、随机种子未贯穿和血糖单位冲突 |
| [Acara Plate](https://github.com/acara-app/plate)（O'Saasy） | 画像、血糖日志、营养计划和 AI 工具的模块边界 | 任何 PHP 源码、模板或实质性表达 |
| [OpenNutriTracker](https://github.com/simonoppowa/OpenNutriTracker)（GPL-3.0） | 早餐/午餐/晚餐/加餐体验和微量营养展示 | App、Backend、SQL、导入器和测试代码 |
| [wger](https://github.com/wger-project/wger)（AGPL-3.0） | 饮食记录和独立服务/API 模式 | 源码、模板和内置数据 |

### 10.5 不使用

- [team-gigabyte/meal-planner](https://github.com/team-gigabyte/meal-planner)：虽为 MIT，但 `violates_limits()` 未完成，营养评分无来源，GI 实现带未解决疑问，食谱受 Edamam 条款约束。
- [vishnupriyanpr/Verve](https://github.com/vishnupriyanpr/Verve)：虽为 MIT，但营养值不可信，宏量营养和食谱由模型直接生成，无成分表复算。
- [michiella/macros-tracker](https://github.com/michiella/macros-tracker)：没有许可证，代码默认保留全部权利。
- [polonnia/Diabetes-Recipe-Recommender](https://github.com/Polonnia/Diabetes-Recipe-Recommender)：没有许可证，食谱数据授权不明。
- [wangtianrui/NutritionMaster](https://github.com/wangtianrui/NutritionMaster)：没有许可证，数据来自薄荷和多个菜谱网站。
- [Sanotsu/china-food-composition-data](https://github.com/Sanotsu/china-food-composition-data)：无可复用许可证，截图和结构化数据来自《中国食物成分表》。
- [ruffood/cn-food-mcp](https://github.com/ruffood/cn-food-mcp)：代码的 MIT 表述不完整，提交的 CSV 无清晰授权链；代码和数据都不进入主仓库。

### 10.6 拍照、OCR 和条码

拍照输入分三条路径：

1. 包装食品先用 ZXing 识别条码，再查询已授权的产品数据；
2. 购物小票和包装文字用 PaddleOCR 或经过验证的 Java OCR 组件；
3. 冰箱或散装食材照片交给多模态模型生成候选。

开源食物视觉项目只能作研究参考：

- [FoodSeg103 Benchmark](https://github.com/LARC-CMU-SMU/FoodSeg103-Benchmark-v1) 代码为 Apache-2.0，可参考食物分割和多标签输出；
- RecipeNet、FoodNet、Inverse Cooking 等代码虽多为 MIT，但训练数据、预训练权重、菜谱链接和营养数据要分别核对；
- FoodSeg103 只有约 104 类，其他项目多基于西式食谱，不能覆盖中国家庭库存；
- 图片无法可靠给出克数、生熟状态和剩余库存。

第一版不复制或训练这些视觉模型。多模态识别只创建 `recognition_draft`，所有食材和数量必须由用户确认。

### 10.7 数据复用

| 数据 | 能否随仓库发布 | 用法 |
| --- | --- | --- |
| USDA FoodData Central | 可以，CC0 | 选择少量 Foundation/SR Legacy 记录；保存 `fdcId`、版本和来源 |
| FHIR 官方示例 | 可以，FHIR 规范材料 CC0 | 作为 Observation 等接口夹具；术语代码另核对条款 |
| SMART Bulk FHIR 合成数据 | 可以，仓库明确数据按 CC0 | 截取少量 Synthea 生成记录作导入测试 |
| 自己生成的合成业务场景 | 可以，按本仓库 Apache-2.0 | 作为主要规则和状态测试数据 |
| Synthea 生成记录 | 可以使用，但逐项检查术语 NOTICE | 压力、导入和版本测试；不当临床真值 |
| NHANES public-use | 不提交个体行；仅离线统计 | 遵守 NCHS 仅统计分析、禁止重识别和链接的协议 |
| Open Food Facts | 不混入主数据库 | ODbL 数据、CC BY-SA 图片分库存储并署名；第一版不用 |
| 《中国食物成分表》OCR/CSV | 不可以 | 取得权利人书面授权前排除 |
| 第三方食谱仓库 | 不可以，除非逐条证明来源 | 代码 MIT 不代表食谱和营养值也是 MIT |

### 10.8 依赖和数据许可证落地

1. CI 检查仓库中不得出现复制、翻译或实质性改写的第三方源码；
2. Maven 依赖生成第三方依赖清单、许可证清单和 SBOM；
3. 把依赖要求的 NOTICE 随发行物提供；
4. 建立 `docs/third-party-provenance.md`，记录依赖、外部工具、数据集、模型和研究参考项目的名称、版本、许可证及用途；
5. 外部 API 数据、模型权重、训练数据、图片和代码分别审核；
6. 没有明确授权证据的数据和内容不得提交或随发行物分发。

本节是工程合规策略，不替代针对具体发行方式的正式法律意见。

## 11. 测试数据

测试数据分为三类，不能混用。

### 11.1 可以直接随仓库发布

#### 自己编写的合成业务场景

这是首选数据。所有人物使用明显虚构的姓名和 ID，不含真实病历：

- 稳定减重用户；
- 糖尿病前期 + 超重；
- 2 型糖尿病 + 超重；
- 同一用户的空腹、餐前和餐后血糖；
- 文字录入家中食材并确认；
- 照片识别结果修改后确认；
- 照片无法估重，需要追问；
- `ONLY_AVAILABLE` 库存充足；
- `ONLY_AVAILABLE` 库存不足且无解；
- `PREFER_AVAILABLE` 生成最小补购清单；
- 两次并发推荐竞争同一份库存；
- 单位错误、迟到上报和重复上报；
- 已吃早餐后请求晚餐；
- 家中食材不足；
- 过敏和偏好冲突；
- 过敏食物即使只想吃一口也被拒绝；
- 限制原因未知时要求澄清；
- 高碳水食物的小份可以放入剩余额度；
- 用户期望份量过大，返回更小份量；
- 小份也会突破硬约束，返回替代品；
- 不得生成加药、挨饿、催吐或极端运动补偿；
- 硬约束无解；
- 急症停止推荐；
- 营养不良风险转介；
- 新旧版本并发和幂等重放。

这些数据按本仓库 Apache-2.0 发布。数值仅用于触发测试分支，不能宣称代表临床分布。

#### USDA FoodData Central 小型食材夹具

USDA FoodData Central 数据是 CC0，可以选取少量 Foundation Foods 或 SR Legacy 记录作为测试夹具。仓库中应保留：

- `fdcId`；
- 英文原名；
- 版本和发布日期；
- 每 100 克营养值；
- USDA 来源说明；
- 手工中文别名与原始数据分开。

适合测试：

- 每 100 克到实际克数的换算；
- 单位归一；
- 缺失营养素；
- 同食物不同数据版本；
- 求解器上下限。

它不能完整代表中国家常菜，不能把手工中文映射描述成官方中文名。

#### FHIR 官方示例和 SMART 合成数据

FHIR 规范内容采用 CC0。可以参考官方 Observation 示例编写：

- 体重：LOINC `29463-7`；
- 血糖：LOINC `2339-0`；
- UCUM 单位 `kg`、`mg/dL`、`mmol/L`。

`smart-on-fhir/sample-bulk-fhir-datasets` 的数据明确可按 CC0 使用，且由 Synthea 生成。可以截取少量 Patient、Condition、MedicationRequest 和 Observation，测试导入映射。

首批内部模型不直接使用 FHIR；这些数据只用于适配层和字段语义测试。

### 11.2 可以生成或离线分析，但不作为临床真值

#### Synthea

Synthea 软件是 Apache-2.0，生成数据没有真实患者隐私限制。可用来生成：

- 虚构患者；
- 疾病、用药和测量历史；
- FHIR/CSV 导入压力数据。

生成记录使用的术语系统可能有各自许可，提交前要检查 NOTICE。Synthea 不提供本项目所需的可靠饮食摄入和个体化营养目标。

#### SimT2D

`everval/SimT2D.jl` 使用 MIT 许可证，但当前实现不作为测试数据生成器：

- 多个事件概率和生理参数没有文献来源；
- 随机种子没有贯穿主要随机过程，难以稳定复现；
- 代码字段与仓库 CSV 的血糖单位存在冲突。

只参考「时间序列 + 餐食/运动/用药事件日志」的数据结构。五态决策使用本仓库自己编写、固定种子且逐条标明预期状态的合成序列。

#### GluFormer

GluFormer 代码为 Apache-2.0，可以生成类似 CGM 的轨迹，但模型主要来自非糖尿病成人数据，依赖和模型体积较大。第一版不引入，只作为以后压力和缺失片段测试的候选。

#### NHANES

NHANES 有饮食回顾、体重、血糖和化验等公开使用数据，适合离线统计分析和构建现实范围测试。

它仍是真实调查数据，并受 NCHS 数据使用协议约束：

- 只能用于统计分析和报告；
- 不得重识别；
- 不与可识别数据连接。

因此第一版不把 NHANES 个体行记录提交进仓库，也不用它作为接口单测夹具。

### 11.3 不能直接使用

- `china-food-composition-data` 和 `cn-food-mcp` 中来自《中国食物成分表》的识别数据；
- 从薄荷等网站抓取的食物数据；
- Open Food Facts 整库或混入自有数据库的数据，除非单独处理 ODbL 义务；
- 第三方仓库中来源不明的食谱和营养值；
- NutriChef 的疾病知识 JSON；
- metabolic-care-assistant 的临床阈值；
- 国家指南中的整套示例食谱和第三方整理稿，除非确认再发布授权；
- 真实用户、简历项目或工作数据。

### 11.4 首批测试夹具目录

```text
src/test/resources/fixtures/
  profiles/
    stable-weight-loss.json
    prediabetes-overweight.json
    type2-overweight.json
    excluded-malnutrition-risk.json
  measurements/
    glucose-trend-stable.json
    glucose-trend-adjust.json
    glucose-unit-error.json
    glucose-late-arrival.json
    urgent-glucose.json
    weight-weekly-trend.json
  intakes/
    breakfast-consumed.json
    duplicate-intake.json
  pantry/
    text-recognition-draft.json
    image-recognition-low-confidence.json
    confirmed-sufficient-pantry.json
    confirmed-insufficient-pantry.json
    concurrent-reservation.json
  foods/
    usda-foundation-subset.json
    synthetic-test-only-foods.json
  constraints/
    feasible-day.json
    infeasible-allergy.json
    infeasible-protein-energy.json
    craving-budget-limited-feasible.json
    craving-absolute-prohibition.json
    craving-unknown-reason.json
  plans/
    valid-single-dinner.json
    valid-full-day.json
    invalid-model-changed-grams.json
  fhir/
    observation-body-weight.json
    observation-blood-glucose.json
```

`synthetic-test-only-foods.json` 只能放在测试目录，并明确写 `notForUserRecommendation: true`。

## 12. 测试策略

### 12.1 规则单元测试

- 支持清单和排除规则；
- 血糖单位换算；
- 测量发生时间和记录时间；
- 五态决策；
- 热量、蛋白质和碳水上下限；
- 过敏和药物分流；
- 受限制食物的五类原因和 `CRAVING_PORTION`；
- 多病约束优先级；
- 无可行解。

### 12.2 成分计算测试

- 每 100 克换算；
- 生熟和可食部；
- 缺失值不当作 0；
- 相同食材不同版本；
- 小数精度和单位归一；
- 模型返回的营养数字被忽略。

### 12.3 求解器测试

- 可行方案满足全部硬约束；
- 无解时返回冲突约束；
- 已吃和已确认餐被冻结；
- `ONLY_AVAILABLE` 不使用库存外食材且不超出现有数量；
- `PREFER_AVAILABLE` 优先库存，不可行时只返回必要补购项；
- 未经用户确认的照片或文字候选不进入求解；
- 临期优先不能突破硬约束；
- 修改一餐后全天仍满足约束；
- 相同输入、相同版本得到可复现结果；
- 偏好变化只影响软目标；
- 优先家中食材但不突破硬约束。
- 解馋软目标不能突破过敏、药食禁忌、营养下限或临床限制。

### 12.4 状态和并发测试

- 相同 `idempotencyKey` 不重复写入；
- 延迟测量按发生时间处理；
- 重复和乱序事件不破坏当前投影；
- 旧画像版本不能确认新方案；
- Redis 清空后可从 MySQL 重建；
- 并发替换只有一个版本成功。
- 并发方案对同一库存批次的预留不会超卖。

### 12.5 模型契约测试

向模型适配层注入：

- 非 JSON；
- 缺字段；
- 额外字段；
- 不存在的食材 ID；
- 擅自修改克数；
- 编造营养数字；
- 被检索文本诱导突破禁忌。
- 用「只吃一口」诱导模型绕过绝对禁忌；
- 建议加药、跳餐或极端运动抵消。

系统必须拒绝、有限修复或回退到确定性结果。

### 12.6 集成测试

使用 Testcontainers 启动 MySQL 和 Redis，覆盖：

- 画像写入；
- 测量上报；
- 已吃扣减；
- 单餐和全天求解；
- 方案确认；
- 版本冲突；
- SSE 最终结果；
- 模型失败回退。

SSE 契约测试必须验证：

- 事件顺序合法且 `COMPLETED` 恰好一次；
- 完整校验前不会发送方案正文；
- 客户端取消后不再发起后续模型调用；
- `FAILED` 不泄露提示词、堆栈、模型原始响应或健康隐私；
- 慢客户端不会无限占用内存，`HEARTBEAT` 不影响最终结果。

第一版没有 RocketMQ 集成测试。

### 12.7 不可破坏的验收条件

- 被接受的方案硬约束通过率为 100%；
- D 级场景绝不生成食材方案；
- 模型不能改变求解器确定的食材 ID 和克数；
- 营养汇总全部由 Java 根据同版数据复算；
- 无解必须显式返回，不能降级成模型自由生成；
- 旧版本不能覆盖新状态；
- 每个决定可追溯到画像、规则、数据和模型版本；
- 测试夹具和产品营养数据严格隔离。

## 13. 分阶段实现

### P0：规则规格

- 支持清单；
- 准入、排除、急症和营养不良规则；
- 第一批药物分流；
- 约束优先级；
- 规则来源、版本和审核字段；
- 测试场景清单。

### P1：无模型确定性闭环

- MySQL 事实和方案版本；
- 小型 USDA 测试食材集；
- 单餐和一日方案；
- 风险受控的小份满足与绝对禁忌拒绝；
- 文字库存录入、照片识别草稿和用户确认；
- `ONLY_AVAILABLE` 与 `PREFER_AVAILABLE`；
- 库存数量约束和最小补购清单；
- 已吃扣减；
- ojAlgo 求解；
- Java 复算；
- 无解和冲突解释；
- 幂等和审计。

完成标志：即使没有模型，也能返回一份可验证的食材和克数方案。

### P2：模型表达

- Spring AI 固定 JSON；
- 做法和核心原则；
- JSON Schema 和领域校验；
- 有限修复；
- SSE；
- 模型失败回退。

### P3：动态调整

- 血糖和体重趋势；
- 五态决策；
- 冻结已吃餐；
- 重算未来餐；
- 延迟、乱序和重复测量。

### P4：病种逐个扩展

按高血压、高脂血症、痛风、慢性肾病分别建立规格，不一次性同时实现。

### P5：多病共存和真实验证

- 完整约束优先级；
- 人工复核工作流；
- 营养师盲评；
- 安全事件监测；
- 真实世界前瞻验证。

## 14. 成功指标

第一版不预写「生成小于 1 分钟」或「采纳率 85%」。

实现后实际统计：

- 硬约束通过率；
- 禁忌漏检率；
- 无解识别率；
- 同输入可复现性；
- 错误测量拦截率；
- 旧版本覆盖次数；
- 调整前后变化量；
- 专业人员一致率；
- 用户执行率；
- 人工转介率；
- 安全事件。

性能目标在有基准环境和真实测试结果后再写入。

## 15. 运行时

- 语言：Java，不使用 Kotlin；
- 项目版本：`0.1.0-SNAPSHOT`；
- JDK 21；
- Spring Boot 4.1.1；
- Spring AI 2.0.1；
- MySQL 8.4，与挂号项目 compose 对齐；
- Redis 7，与挂号项目 compose 对齐；
- RocketMQ 5.3.2，与挂号项目 compose 对齐；第一版不接主链路；
- rocketmq-spring 2.3.6，后续接 MQ 时使用；
- Redisson 4.3.0；
- Resilience4j 2.3.0；
- XXL-JOB 3.4.2，需要定时任务时再引入；
- Maven；
- `com.moonligh.nutritionist`。

共享组件版本以后跟随挂号项目调整，不在 nutritionist 单独升级。Spring AI、ojAlgo、JSON Schema Validator 和 ZXing 属于 nutritionist 专用依赖，单独验证并锁定。

## 16. 决策摘要

保留的方向：

- 单餐和一日方案；
- 「特别想吃一次」时，在不突破硬约束的前提下评估小份或替代品；
- 拍照或文字录入家中食材；
- 只有现有食材时的硬约束定制；
- 长期结构化画像；
- 测量后维持或调整；
- 当天已吃扣减；
- 家中食材优先；
- Java 校验；
- 方案确定后再做 RAG 解释。

修改的方向：

- 「所有慢病」改成支持清单和四级准入；
- 「多病取更紧」改成优先级约束和可行性检测；
- 「模型决定克数」改成求解器决定克数；
- 「只重算一餐」改成冻结已吃餐并重算受影响的未来餐；
- 「Redis 存画像」改成 MySQL 是事实源、Redis 是缓存；
- RocketMQ 推迟到确有异步需求；
- 药物、急症和营养不良安全能力前置。

## 17. 推荐实施方案

本节把前面的选择收敛成第一版唯一实施方案。未列入的候选技术不进入第一版。

### 17.1 架构形态

采用模块化单体，不拆微服务：

```text
Spring MVC HTTP / SSE adapter
    |
application orchestration
    |
    +-- safety       准入、急症、营养不良和药物分流
    +-- profile      长期画像和当前投影
    +-- pantry       文字、图片、条码、库存确认和预留
    +-- intake       实际摄入和当天已吃扣减
    +-- nutrition    食材、成分、单位和 Java 复算
    +-- rule         版本化病种规则和约束构建
    +-- solver       ojAlgo 可行性和克数求解
    +-- plan         单餐、全天、替换、解馋和方案版本
    +-- ai           Spring AI 做法、解释和固定 JSON
    +-- evidence     方案完成后的指南出处和问答
    +-- audit        决策依据、幂等和版本追溯
    |
MySQL (事实源) + Redis (可丢失缓存)
```

原因：

- 当前只有一个产品和一个代码仓库，微服务会放大事务、版本和部署成本；
- 规则、求解、校验必须在同一个一致性边界内完成；
- SSE 只在最外层适配器使用 `Flux<ServerSentEvent<?>>`，内部保持同步 Java；
- 模块接口先固定，确有独立扩缩容需求时再拆；
- RocketMQ 保留在技术路线中，但第一版不参与主链路。

### 17.2 第一版依赖

生产依赖：

- Spring Web：HTTP 和 SSE；
- Spring WebFlux 模块：只给最外层 SSE adapter 提供 `Flux`/`ServerSentEvent`，不使用 WebFlux starter；
- Spring Validation：请求校验；
- Spring JDBC：MySQL，和挂号服务一致；
- Spring Data Redis：可选缓存和短期锁；
- Spring AI：多模态候选识别、固定 JSON、做法和说明；
- ojAlgo：食材克数和份量档位求解；
- networknt JSON Schema Validator：模型输出第一层校验；
- ZXing：包装食品条码；
- MySQL Driver；
- Flyway：数据库迁移。

测试依赖：

- JUnit 5；
- AssertJ；
- Testcontainers MySQL；
- Testcontainers Redis 或兼容容器；
- Spring Boot Test；
- MockWebServer 或 WireMock，用于模型和 USDA API 契约测试。

第一版不引入：

- Timefold；
- OR-Tools；
- JaVers；
- HAPI FHIR；
- RocketMQ starter；
- PaddleOCR；
- Open Food Facts；
- 中国食物成分表转录数据。

这些依赖以后按明确需求逐个加入，不能为了展示技术栈提前堆入。

### 17.3 开源复用决定

所有阶段都不复制任何第三方业务源码。产品业务代码、测试和构建配置全部自研，并全部开源在本仓库；只使用正式依赖和合法数据。

具体决定：

- ojAlgo、networknt、Testcontainers 通过 Maven 使用；
- USDA FoodData Central 选取小型 CC0 数据子集；
- FHIR/SMART CC0 示例只作为后续适配测试；
- `sugardaddi` 的单位、基准和置信度设计用于领域建模参考，换算代码自行实现；
- EveryDay_Food 的中文数量解析和购物清单测试场景用于需求参考，Java 代码自行实现；
- NutriChef、metabolic-care-assistant 和 diabetes-food-guide-skill 只参考信息结构；
- 其他受限或无许可证项目不进入仓库。

这是一条长期边界，不是第一版的临时取舍。以后增加病种、求解器、识别能力或数据适配时仍执行同一原则，不通过复制源码缩短开发。Maven 依赖继续生成第三方许可证清单和 SBOM，并按第 10.8 节处理 NOTICE。

### 17.4 推荐主链路

一次推荐按以下顺序执行：

1. 接收 `SINGLE_MEAL`、`FULL_DAY` 或 `CRAVING_PORTION` 请求。
2. 校验 `profileVersion`、`pantryVersion`、日期、时区和幂等键。
3. 从 MySQL 重建当前画像，不使用对话文本作为事实。
4. 执行四级准入和急症分流。
5. 检查测量语境、单位、时间和趋势，得到五态决策。
6. 冻结已吃、已确认和用户指定不改变的餐次。
7. 根据当天剩余额度、库存模式和病种规则构造约束。
8. ojAlgo 返回 `FEASIBLE`、`PARTIAL` 或 `INFEASIBLE`。
9. Java 按同版成分数据重新计算并校验。
10. Spring AI 只能对固定食材和克数生成做法和说明。
11. JSON Schema、领域校验和营养复算再次检查模型输出。
12. 最外层 SSE adapter 把普通 Java 进度回调封装成 `Flux<ServerSentEvent<?>>` 并返回最终方案。
13. 方案确定后再追加指南出处或回答食物问答。

任何一步失败都不能降级成模型自由生成。

### 17.5 家中食材推荐

文字输入：

1. Spring AI 从自然语言提取候选食材、数量、单位和不确定项。
2. Java 完成单位标准化。
3. 用户确认后形成 `pantryVersion`。

照片输入：

1. 多模态模型识别食材候选；
2. 包装食品优先尝试条码；
3. 包装净含量或小票文字后续可接 OCR；
4. 无法估重时要求用户选择个数、份量或克数范围；
5. 用户确认后才进入库存。

推荐时：

- `ONLY_AVAILABLE`：库存外食材和超库存数量均为硬约束；
- `PREFER_AVAILABLE`：优先库存，无法满足时生成最小补购清单；
- 同一库存批次必须先预留再确认，避免两个并发方案重复使用；
- 用户确认吃掉后，把预留变为实际消耗；取消方案则释放预留。

### 17.6 「特别想吃一点」推荐

使用单独的 `CRAVING_PORTION` 流程：

1. 明确「不能吃」的原因；
2. 绝对过敏、明确禁忌和原因未知时不试算；
3. 可量化限制才进入求解；
4. 用户给出期望份量或「一口、半份」；
5. 系统换算成克数范围；
6. 求解器判断能否放入剩余额度；
7. 可行时返回份量、搭配、占用额度和剩余风险；
8. 不可行时给更小份量或不命中禁忌的口感替代品。

推荐表达必须使用「当前约束内可以容纳」或「风险相对更低」，不能说「没有伤害」。

### 17.7 第一版数据

产品食材数据：

- 使用 USDA Foundation Foods/SR Legacy 的少量 CC0 食材；
- 每条保留 `fdcId`、原名、版本、来源、每 100 克营养值；
- 中文名是项目维护的别名，不冒充 USDA 官方译名；
- 只发布能说明来源的数值；
- 缺失的 GI、嘌呤或药食数据保持缺失，不能填 0。

测试数据：

- 自己编写的合成用户、库存、摄入和测量事件；
- USDA CC0 小型成分夹具；
- 低置信度图片识别响应和用户修正确认；
- 硬约束可行、部分满足和无解场景；
- 绝对禁忌与小份解馋；
- 重复、乱序、延迟和并发事件；
- SMART/FHIR CC0 示例用于未来导入契约。

第一版不使用 NHANES 个体记录，不使用第三方食谱库，也不使用模拟器生成的临床阈值。

### 17.8 第一版交付顺序

第一批：

- Maven 工程和启动入口；
- MySQL、Flyway 和基础领域表；
- 画像、库存、摄入和测量事件；
- 自己编写的合成测试夹具；
- USDA 小型 CC0 食材集；
- 单位与成分复算。

第二批：

- 四级准入和五态测量决策；
- 规则版本；
- ojAlgo 单餐和全天求解；
- `ONLY_AVAILABLE`、`PREFER_AVAILABLE`；
- 无解解释和最小补购。

第三批：

- Spring AI 固定 JSON；
- 文字和图片库存草稿；
- 做法和解释；
- SSE；
- 模型失败回退。

第四批：

- `CRAVING_PORTION`；
- 替换某餐或食材；
- 库存预留与并发；
- 方案确认和审计。

第五批：

- 指南出处；
- 「这个病能不能吃某样」；
- 专业人员目标录入；
- 高血压等下一个单病种。

### 17.9 第一版完成标准

第一版只有同时满足以下条件才算完成：

- 不调用模型也能生成可验证的单餐和一日食材克数；
- 已吃食物会从当天额度扣除；
- `ONLY_AVAILABLE` 不会使用库存外食材；
- 绝对禁忌不会因「只吃一口」被绕过；
- 约束无解时明确返回冲突，不编造方案；
- 模型不能改变求解器确定的食材和克数；
- Redis 清空不影响事实和已确认方案；
- 重复和乱序请求不能覆盖新版本；
- 每个营养值、规则和决定都能追溯来源与版本；
- 所有已接受方案通过 Java 硬约束校验。

## 18. 主要来源

- 国家卫生健康委成人高血压、高脂血症、糖尿病食养指南（2023）：
  <https://www.nhc.gov.cn/sps/c100088/202301/f01895a06c5349ef999f25da833c166d.shtml>
- 国家卫生健康委成人高尿酸血症与痛风、肥胖、慢性肾脏病食养指南（2024）：
  <https://www.nhc.gov.cn/sps/c100088/202402/9ba512ba8e314a47a181db11d2fa188d.shtml>
- KDIGO 2024 CKD 指南：
  <https://kdigo.org/wp-content/uploads/2017/02/KDIGO-2024-CKD-Guideline-Executive-Summary.pdf>
- NICE 多病共存指南：
  <https://www.nice.org.uk/guidance/ng56/chapter/recommendations>
- USDA FoodData Central API 与 CC0：
  <https://fdc.nal.usda.gov/api-guide/>
- Synthea：
  <https://synthetichealth.github.io/synthea/>
- SMART on FHIR 合成数据：
  <https://github.com/smart-on-fhir/sample-bulk-fhir-datasets>
- FHIR R5 Observation：
  <https://hl7.org/fhir/R5/observation.html>
- FHIR R5 NutritionIntake：
  <https://hl7.org/FHIR/R5/nutritionintake.html>
- SimT2D：
  <https://github.com/everval/SimT2D.jl>
- ojAlgo：
  <https://github.com/optimatika/ojAlgo>
- Timefold Solver：
  <https://github.com/TimefoldAI/timefold-solver>
