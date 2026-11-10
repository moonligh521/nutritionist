# 饮食方案

按减脂、控糖、忌口和家里现有食材，生成可以改口的一日食谱。

本仓库是 [moonligh](https://moonligh.cn/) 的个人开源项目，采用 [Apache-2.0](LICENSE) 许可证。

## 概述

用户可以同时提出减脂、控糖、忌口等目标，也可以中途补一句家里现有的食材。状态机更新饮食画像后，只重算受影响的餐次。目标和健康限制冲突时，先识别冲突，再检索营养依据，最后输出改过的做法，并写明搭配或分量上的调整。

模型输出固定为饮食画像、核心原则和食谱表。Java 侧再用禁忌成分规则做最后一道拦截。结果用 SSE 流出，并可以按当前画像重新定制。示例中的食材、目标和限制都写在仓库里。

## 状态

当前已具备产品设计基线与 V0.1 分阶段施工方案。业务代码和构建文件仍按施工任务逐步写入，还不是可运行服务。

权威文档：

- 产品基线：[`docs/superpowers/specs/2026-11-10-慢病与减重食材推荐系统设计.md`](docs/superpowers/specs/2026-11-10-慢病与减重食材推荐系统设计.md)
- 施工方案：[`docs/superpowers/plans/2026-11-10-V0.1分阶段施工方案.md`](docs/superpowers/plans/2026-11-10-V0.1分阶段施工方案.md)

账号、患者基础资料和网关鉴权与同产品体系的 `registration-assistant` 共享；本仓库只保存患者引用和营养业务事实。

## 功能范围

- 慢病与减重场景的安全准入、营养目标与餐次额度
- 家中食材约束下的单餐与一日确定性配餐
- 审核菜谱、精确配料与按计划烹饪执行
- 实际摄入、测量反馈与未来餐调整
- Java 复算与禁忌拦截；模型只做识别草稿和教学表达
- SSE 输出推荐任务进度与最终校验结果

## 技术选择

与挂号服务对齐同一套运行时，模型接入使用 Spring AI。

- JDK 21
- Spring Boot 4.1.1
- Spring AI 2.0.1
- MySQL 8.0.46
- Redis 8.2.10
- RocketMQ 5.5.1，Java 客户端使用 rocketmq-spring 2.3.6；V0.1 主链路不接入

规则和确定性求解器决定菜品与克数；Java 复算校验；Redis 只做可丢失缓存；MySQL 是事实源。源码按 Maven 多模块落地，构建文件随 P0 任务提交。

## 目录

```text
nutritionist-api/
nutritionist-service/
  src/main/java/com/moonligh/nutritionist/
  src/main/resources/
  src/test/java/com/moonligh/nutritionist/
```

Java 包名是 `com.moonligh.nutritionist`。本地需 JDK 21，验证命令：`mvn -B verify`。

## 数据

食材、目标和健康限制使用示例配置。真实用户档案不进入仓库。

## 路线图

按 [`V0.1 分阶段施工方案`](docs/superpowers/plans/2026-11-10-V0.1分阶段施工方案.md) 推进：

- [ ] P0：工程骨架、统一返回、幂等、患者引用、CI
- [ ] P1：画像、安全、目标、食材营养复算
- [ ] P2：无模型确定性配餐 MVP
- [ ] P3：识别草稿、SSE、按计划烹饪
- [ ] P4：动态调整、解馋、效果评价
- [ ] P5：专业验证、压测与放行

## 声明

本项目提供的是饮食信息整理，不能替代营养师或医师的个体化医嘱。

## 参与贡献

贡献方式见 [CONTRIBUTING.md](CONTRIBUTING.md)，行为准则见 [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)。安全问题见 [SECURITY.md](SECURITY.md)，请不要把漏洞细节写进公开 Issue。

## 许可证

Copyright 2026 moonligh

本项目使用 Apache License 2.0，全文见 [LICENSE](LICENSE)。
