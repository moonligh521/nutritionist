# 参与贡献

感谢你关注 `nutritionist`。当前仓库以设计与施工文档为先，业务代码按 V0.1 施工方案逐步落地。

## 开始之前

先看：

- [README.md](README.md)
- 产品基线：[docs/superpowers/specs/2026-11-10-慢病与减重食材推荐系统设计.md](docs/superpowers/specs/2026-11-10-慢病与减重食材推荐系统设计.md)
- 施工方案：[docs/superpowers/plans/2026-11-10-V0.1分阶段施工方案.md](docs/superpowers/plans/2026-11-10-V0.1分阶段施工方案.md)

已经有人在做的事，请先到对应 Issue 下面留言，避免两个人写同一块。较大改动先开 Issue 说明目标和做法，再提交代码。小的文档修正可以直接提 Pull Request。

账号、JWT、患者基础资料属于同产品体系的 `registration-assistant`。nutritionist 只保存患者引用和营养业务事实，不要在本仓库复制一套患者管理。

## 开发约定

- 运行时：JDK 21、Spring Boot 4.1.1、Spring AI 2.0.1、MySQL 8.0.46、Redis 8.2.10；RocketMQ 5.5.1 在 V0.1 主链路不接入。
- 包名：`com.moonligh.nutritionist`。
- 用到哪个工具，才把依赖写进构建文件，并在 `infrastructure` 封装；业务代码只依赖本仓库端口。
- 接口与领域对象使用明确的 `Req`/`Res`/`Command`/`Result`，不要使用 `Map<String,Object>` 传递业务数据。
- 写接口必须支持 `Idempotency-Key`；敏感健康数据不得写入日志、Issue 或提交说明。
- 示例只使用合成数据或可公开引用文本。
- 仓库归属写 moonligh，主页是 <https://moonligh.cn/>。

## 提交说明

提交说明使用 [Conventional Commits](https://www.conventionalcommits.org/)：

```text
feat: 增加推荐任务幂等创建
fix: 修复库存预留超卖
docs: 更新 V0.1 施工方案
test: 补充方案确认并发用例
refactor: 拆分安全评估服务
chore: 调整忽略规则
```

标题用现在时，说清这次提交做了什么。

## 分支与 Pull Request

版本开发分支写成 `feature-V主.次-YYYYMMDD`，日期用**实际创建当天**。例如某天开 `0.2` 版本开发，就写成 `feature-V0.2-20261201`。

例外：`0.1` 已定为 `feature-V0.1-20261105`，不再改日期。该版本下的并行分支、冻结与热修都沿用这个版本日期前缀，例如 `feature-V0.1-20261105-pantry`；`release` / `hotfix` 的日期仍用实际操作当天。

同一版本的并行改动，从版本开发分支拉出 `feature-V主.次-YYYYMMDD-短英文名`，再合回该版本分支。发布冻结使用 `release-V主.次-YYYYMMDD`，已发布版本的修复使用 `hotfix-V主.次.修订-YYYYMMDD`。

`master` 只通过合并请求接收发布结果。当前 V0.1 工作放在 `feature-V0.1-20261105`。

每个阶段（P0～P5）代码写完后，必须完成本阶段独立验收，以及本阶段与此前全部阶段的累计验收；两项都通过才可进入下一阶段。

Pull Request 请写明：

- 解决了哪个问题
- 行为有什么变化
- 怎样验证
- 有没有新增示例数据
- 是否依赖 `registration-assistant` 的接口变更

维护者可能直接修改提交说明，或请你补测试。还不能运行的阶段，文档和目录改动可以在说明里写「当前仓库尚无可执行测试」。

## 版本

版本号遵循 [语义化版本](https://semver.org/lang/zh-CN/)。项目版本从 `0.1.0-SNAPSHOT` 开始。对外可见变化写入 [CHANGELOG.md](CHANGELOG.md) 的 `Unreleased` 一节，发布时再归入具体版本。

## 许可

提交到本仓库的贡献，按 [Apache-2.0](LICENSE) 授权给本项目。除非贡献者在提交中明确标明不属于贡献，否则适用该许可证第 5 条。
