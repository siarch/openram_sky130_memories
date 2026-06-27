# AGENTS.md

## 项目范围
本仓库用于 SKY130 1R1W SRAM 的生成、真实面积收口、多工具输出整理与交付打包。

## 硬规则
- 标准输出目录固定为：
  - `outputs/design_compiler`
  - `outputs/genus`
  - `outputs/vcs`
- 禁止继续使用或重新引入废弃的 `dc` 路径。
- full 交付必须包含：
  - 中英文说明文档
  - package tree
  - `outputs/vcs`
  - 真实面积汇总表

## 面积规则
- 最终交付中的 `.lib area` 不允许为 `0`。
- 真实面积的权威来源优先级：
  1. `real_area_summary.jsonl`
  2. `area_result.json`
  3. trial 日志中的 `Size: width x height`
- 若 `area_result.json` 缺失，但 trial 日志已有有效 `Size:`，允许据此补写：
  - `area_result.json`
  - summary 条目
  - `.lib area`

## 恢复规则
- 批处理中断后，优先补最后失败项，不整批重跑。
- 未确认的面积不得伪造。
- 只要日志中已有可验证 bbox，就应优先利用现有证据链收口。

## 交付核验
最终交付前必须确认：
- 13 / 13 面积表完整
- raw / design_compiler / genus 的 `.lib area` 非零
- `outputs/vcs` 已纳入交付
- 文档和 tar.gz 已重新生成

## 远端执行
- 复杂远端命令优先使用 `ssh ... bash -s` 或远端脚本。
- 避免在 PowerShell 中直接拼接超长嵌套引号命令。
- 简单单行命令可使用 `ssh ... bash -lc "<cmd>"`，但多行逻辑、here-doc、重定向或包含管道时，不要优先选 `bash -lc`。
- Windows PowerShell 下要假设引号、管道、here-doc、重定向和 CRLF 都可能破坏远端执行；优先选择：
  - 本地生成脚本
  - `scp` 上传
  - 远端直接执行
- 长时间运行任务优先使用 `tmux`、后台脚本或可轮询状态文件，不要依赖单个交互式 SSH 会话长期挂住。
- 远端结果核验优先级：
  1. `scp` 拉回实际文件
  2. 读取 summary / log / result 文件
  3. 最后才依赖终端 stdout
