# CLAUDE.md

## 项目背景
本项目用于交付 SKY130 1R1W SRAM 的多工具视图，覆盖：
- Design Compiler
- Genus
- VCS
- Verdi
- SpyGlass
- Tessent

## 推荐流程
1. 生成或整理 memory 输出
2. 获取真实 bbox / 面积
3. 更新 `real_area_summary.jsonl`
4. 回写 `.lib area`
5. 同步 outputs 标准目录
6. 重生成中英文文档
7. 重打 tar.gz
8. 做最终核验

## 面积证据优先级
最终面积判断优先使用：
1. `real_area_summary.jsonl`
2. `area_result.json`
3. trial log 中的 `Size:`

## 已验证经验
- OpenRAM 生成的 `.lib` 可能 timing/power 正常，但 `area : 0`。
- 综合工具侧的 macro 面积必须来自真实 bbox。
- 批处理中断后，不要盲目整批重跑；先检查最后一块的 trial 日志。
- 若日志里已有 `Size:`，可直接据此恢复 width / height / area。
- `outputs/vcs` 是必须交付的 Synopsys 仿真输出视图。

## 远端协作建议
- Windows PowerShell + Linux SSH 场景下，引号、here-doc、CRLF 很容易出问题。
- `ssh ... bash -lc "<cmd>"` 只适合短小、单行、无复杂 quoting 的命令。
- 优先使用：
  - 小型远端 helper 脚本
  - `scp` 拉取 summary / log / result
  - `ssh ... bash -s`
- 遇到以下情况时，不要继续在 PowerShell 中裸拼远端命令：
  - 多行逻辑
  - here-doc
  - 重定向或管道
  - 循环、命令替换、复杂正则
- 更稳妥的执行顺序优先为：
  1. 本地生成脚本
  2. `scp` 上传
  3. 远端 `bash` / `python3` 执行
- 通过 stdin 喂远端脚本时，要优先保证 LF/UTF-8；必要时直接发送二进制 stdin，避免 CRLF 污染脚本。
- 长时间运行任务优先使用 `tmux` 托管，并同时给出会话名、日志路径和状态查询方式。
- 当 stdout 不稳定时，优先拉文件而不是继续依赖终端输出。
- 结果核验优先级固定为：
  1. `scp` 拉回实际结果文件
  2. 检查 `summary` / `log` / `area_result.json`
  3. 最后才参考终端 stdout

## 完成前检查
- 13 / 13 面积表完整
- 最后一块 memory 不再是 pending
- `.lib area` 非零
- 文档包含 `vcs_v`
- tar.gz 已更新
