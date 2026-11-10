# 更新日志

本文件遵循 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.1.0/)，版本号遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [Unreleased]

### Added

- 建立 `nutritionist` 的仓库骨架、社区文件和 Apache-2.0 许可证。
- 增加 V1.5 产品设计基线与 V0.1 分阶段施工方案，覆盖字段级 API、幂等、事务、容量和跨仓患者边界。

### Changed

- 确定运行时为 JDK 21、Spring Boot 4.1.1、Spring AI 2.0.1、MySQL 8.0.46、Redis 8.2.10、RocketMQ 5.5.1。
- 分支规范对齐挂号服务的 `feature-V主.次-年月日` 体系，版本从 `0.1.0-SNAPSHOT` 开始。
- 明确账号与患者主数据归属 `registration-assistant`，nutritionist 只保存引用与营养业务事实。
