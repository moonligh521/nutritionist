# 饮食方案

按减脂、控糖、忌口和家里现有食材，生成可以改口的一日食谱。

本仓库是 [moonligh](https://moonligh.cn/) 的个人开源项目，采用 [Apache-2.0](LICENSE) 许可证。

## 概述

用户可以同时提出减脂、控糖、忌口等目标，也可以中途补一句家里现有的食材。状态机更新饮食画像后，只重算受影响的餐次。目标和健康限制冲突时，先识别冲突，再检索营养依据，最后输出改过的做法，并写明搭配或分量上的调整。

模型输出固定为饮食画像、核心原则和食谱表。Java 侧再用禁忌成分规则做最后一道拦截。结果用 SSE 流出，并可以按当前画像重新定制。示例中的食材、目标和限制都写在仓库里。

## 状态

当前提交的是仓库骨架和社区文件。包名、目录和文档已经按开源仓库放好，业务代码和构建文件尚未写入。下面的功能范围是这个仓库要完成的事，还不是已经可运行的能力。

## 功能范围

- 用状态机维护减脂、控糖、忌口和现有食材
- 条件变化后增量重算一日食谱
- 按识别、检索、妥协三步处理目标与健康限制的冲突
- 用 JSON Schema / Function Calling 输出饮食画像、核心原则和食谱表
- 在 Java 侧拦截明确的禁忌成分
- 用 SSE 输出，并支持按当前画像重新定制

## 技术选择

五个仓库使用同一套运行时，模型接入使用 Spring AI。

- JDK 21
- Spring Boot 4.1.1
- Spring AI 2.0.1
- MySQL 8.0.46
- Redis 8.2.10
- RocketMQ 5.5.1，Java 客户端使用 rocketmq-spring 2.3.6

在本仓库中，Spring AI 负责上下文、冲突说明和结构化食谱。Redis 保存对话中的饮食画像。MySQL 保存已确认的方案。食谱重算在当前对话里完成。

源码目录按 Maven 标准布局预留。构建文件会和第一批可运行代码一起提交。

## 目录

```text
src/main/java/com/moonligh/nutritionist/
src/main/resources/
src/test/java/com/moonligh/nutritionist/
```

Java 包名是 `com.moonligh.nutritionist`。

## 数据

食材、目标和健康限制使用示例配置。真实用户档案不进入仓库。

## 路线图

- [ ] 用状态机维护减脂、控糖、忌口和现有食材
- [ ] 条件变化后增量重算一日食谱
- [ ] 按识别、检索、妥协三步处理目标与健康限制的冲突
- [ ] 用 JSON Schema / Function Calling 输出饮食画像、核心原则和食谱表
- [ ] 在 Java 侧拦截明确的禁忌成分
- [ ] 用 SSE 输出，并支持按当前画像重新定制
- [ ] 补齐构建文件、启动入口和示例
- [ ] 为核心路径补测试

## 声明

本项目提供的是饮食信息整理，不能替代营养师或医师的个体化医嘱。

## 系列仓库

- `registration-assistant`：导诊挂号助手
- `report-interpreter`：报告解读
- `case-analysis`：案情分析
- `contract-review`：合同审查

## 参与贡献

贡献方式见 [CONTRIBUTING.md](CONTRIBUTING.md)，行为准则见 [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)。安全问题见 [SECURITY.md](SECURITY.md)，请不要把漏洞细节写进公开 Issue。

## 许可证

Copyright 2026 moonligh

本项目使用 Apache License 2.0，全文见 [LICENSE](LICENSE)。
