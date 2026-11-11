# 更新日志

本文件遵循 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.1.0/)，版本号遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [Unreleased]

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
- V0.1 软件主链路已可在本地 JDK 21 下通过 `nutritionist-service` 测试；正式标签与合入仍以放行清单为准。
