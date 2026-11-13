# 更新日志

本文件遵循 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.1.0/)，版本号遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [Unreleased]

### Added

- 重设计 GitHub 上的 HIS：临床事实只追加一份，挂号、食材推荐和报告解读只发命令或读快照。不沿用营养库病情主表，也不照搬云医院模块。
- 补充 HIS 企业级架构：独立服务、幂等命令、版本化快照、内部令牌和故障时不把空档案当成无病。
- 增加临床数据仓库 `clinical-record`：追加病情事实并提供当前快照。食材推荐在配置地址后改为只读该快照，仓库不可用时拒绝配餐。
- 明确公共 HIS 边界：平台只放临床快照端口，营养仓只消费快照。
- 确认 V0.x 减重餐竖切范围：A 级最小集为减重 ± 可选稳定 2 型糖尿病/前期；高血压等保持 B 级；明确非目标（向量库、全病种 A 级、成分全库补齐）。
- 增加首批减重餐菜谱与库内 `food_id` 精确绑定清单及发布前门禁。

### Changed

- 读取临床快照改为平台统一 `Result`。仓库不可用时返回 `3102`，不再占用配餐安全错误码。
- 库存、推荐、方案、摄入、烹饪、临床记录、专业目标和 Kill Switch 写入 MySQL。
- 推荐单飞使用 Redis，Redis 不可用时退回数据库唯一约束。
- 账号限流在 Redis 故障时退回本机窗口。
- 库存识别可调用模型，超时或并发满时退回规则草稿。
- 开发版本改为 `0.1.1-SNAPSHOT`。

## [0.1.0] - 2026-11-11

### Added

- 建立 `nutritionist` 的仓库骨架、社区文件和 Apache-2.0 许可证。
- 增加 V1.5 产品设计基线与 V0.1 分阶段施工方案，覆盖字段级 API、幂等、事务、容量和跨仓患者边界。
- 完成 P0：Maven 双模块骨架、Flyway 幂等与审计表、患者绑定端口、CI 与分支名检查。
- 统一返回改为依赖独立仓 `moonligh-platform` 的 `platform-common`，删除本仓重复的 Result/错误码/TraceId 实现；营养错误码并入平台共享 `ErrorCode`。
- 接入 `platform-bom` / `platform-security`，患者绑定经挂号内部目录读取 `patientVersion`。
- 完成 P1：饮食画像、安全规则、营养目标与食材营养复算（V2/V3）。
- 完成 P2：库存、审核菜谱候选、ojAlgo 确定性求解、推荐任务与方案/摄入闭环（V4）。
- 完成 P3：推荐 SSE、库存识别草稿、按计划烹饪；烹饪偏差返回 2801。
- 完成 P4：烹饪调整复算、效果六类评价、解馋过敏拒绝与限量允许。
- 完成 P5 软件项：专业目标角色门禁、Kill Switch 双审批恢复、k6 脚本与放行检查清单（V5）。

### Changed

- 确定运行时为 JDK 21、Spring Boot 4.1.1、Spring AI 2.0.1、MySQL 8.0.46、Redis 8.2.10、RocketMQ 5.5.1。
- 分支规范对齐挂号服务的 `feature-V主.次-YYYYMMDD` 体系，日期用实际创建日；`0.1` 例外固定为 `feature-V0.1-20261105`。默认分支使用 `master`，版本从 `0.1.0-SNAPSHOT` 开始。
- 明确 P0～P5 阶段门禁：每阶段须完成本阶段独立验收与累计验收后方可进入下一阶段。
- 明确账号与患者主数据归属 `registration-assistant`，nutritionist 只保存引用与营养业务事实。
- 对外接口前缀为 `/api/nutrition`，不带版本段。
- 测试与运行使用挂号同一套 MySQL、Redis、RocketMQ；营养库名为 `nutritionist`。
