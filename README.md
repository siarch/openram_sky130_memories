# Sky130_Memory

## 说明
该工作区从 `D:\trae_projects\Sky130_Power` 中独立拆分而来，专门存放 SKY130 memory 生成相关内容，覆盖：

- 早期 SKY130 1RW memory 交付与文档
- 当前 SKY130 1R1W memory 生成、真实面积收口与交付内容
- 相关配置、脚本、OpenRAM 提取源码和交付包

后续新的 SKY130 memory 相关任务，建议优先在本工作区内继续维护，而不是再混回 `Sky130_Power`。

## 目录树

```text
Sky130_Memory/
|-- AGENTS.md
|-- CLAUDE.md
|-- CLAUDE.local.md
|-- README.md
|-- .gitignore
|-- configs/
|   |-- memory_matrix_1r1w_requested.yaml
|   |-- memory_matrix_1r1w_remaining8.yaml
|   `-- memory_matrix_1r1w_remaining2.yaml
|-- scripts/
|   |-- generate_1r1w_delivery_docs.py
|   |-- generate_1r1w_full_delivery_docs.py
|   |-- refresh_full_delivery_package.py
|   |-- remote_batch_1r1w.sh
|   |-- remote_batch_probe_real_area_1r1w_full.py
|   |-- remote_probe_real_area_single.py
|   |-- remote_finalize_one_area_from_bbox.py
|   |-- remote_sync_full_outputs.py
|   |-- resume_last_real_area_after_reboot.py
|   |-- update_lib_area_from_summary.py
|   |-- monitor_real_area_progress.ps1
|   `-- ...
|-- generated_openram_configs/
|   |-- sky130_sram_common.py
|   |-- sky130_sram_1rw_tiny_run.py
|   |-- sky130_sram_64byte_1rw_8x64_2_run.py
|   `-- sky130_sram_1kbyte_1rw_32x256_8_run.py
|-- generated_openram_power_configs/
|   `-- ...
|-- repo_extracts/
|   `-- OpenRAM-stable/
|       |-- compiler/
|       |-- technology/
|       `-- ...
`-- deliverables/
    |-- Sky130_memory_v20260610_162230/
    |-- Sky130_memory_v20260610_162230.tar.gz
    |-- Sky130_memory_v20260610_162230_delivery_en.md
    |-- Sky130_memory_v20260610_162230_delivery_zh.md
    |-- Sky130_memory_v20260610_162230_delivery_zh.pdf
    |-- Sky130_memory_1r1w_v20260612_1r1w/
    |-- Sky130_memory_1r1w_v20260612_1r1w.tar.gz
    |-- Sky130_memory_1r1w_delivery_en.md
    |-- Sky130_memory_1r1w_delivery_en.pdf
    |-- Sky130_memory_1r1w_delivery_zh.md
    |-- Sky130_memory_1r1w_delivery_zh.pdf
    |-- Sky130_memory_1r1w_full_v20260612_1r1w_full/
    |-- Sky130_memory_1r1w_full_v20260612_1r1w_full.tar.gz
    |-- real_area_progress_watch.log
    |-- area_trial_16x64.log
    |-- outputs_root_listing.txt
    |-- root_version_listing.txt
    |-- stage_dirs.txt
    |-- stage_listing.txt
    `-- package_tree.txt
```

## 目录说明

### 根目录文件
- `AGENTS.md`：项目硬规则，约束输出目录、面积来源、恢复流程和交付核验。
- `CLAUDE.md`：项目协作说明，偏流程、经验与检查清单。
- `CLAUDE.local.md`：本机环境说明，如 VMware NAT/SSH 恢复步骤，不建议提交远端仓库。
- `README.md`：本工作区总览和目录树说明。
- `.gitignore`：忽略本地缓存与本机规则文件。

### configs/
- 存放 1R1W memory 生成清单。
- 当前以 `memory_matrix_1r1w_*.yaml` 为主，用于分批补跑和剩余项追踪。

### scripts/
- 存放 memory 生成、面积探测、文档生成、输出同步、断点恢复等脚本。
- 重点脚本类型：
  - 批量生成：`remote_batch_1r1w.sh`
  - 真实面积探测：`remote_batch_probe_real_area_1r1w_full.py`
  - 单点 probe：`remote_probe_real_area_single.py`
  - `.lib area` 回写：`update_lib_area_from_summary.py`
  - full 包刷新：`refresh_full_delivery_package.py`
  - 文档生成：`generate_1r1w_delivery_docs.py`、`generate_1r1w_full_delivery_docs.py`
  - 断点恢复：`resume_last_real_area_after_reboot.py`
  - 单点面积补回：`remote_finalize_one_area_from_bbox.py`

### generated_openram_configs/
- 存放较早阶段生成的 OpenRAM 配置样例，主要覆盖 1RW 方向。
- 可用于回溯旧版 memory 生成入口和配置形式。

### generated_openram_power_configs/
- 存放与功耗分析或批量运行相关的生成配置。
- 当前目录已独立复制，便于后续继续扩展 memory 分析流程。

### repo_extracts/OpenRAM-stable/
- 存放独立提取出的 OpenRAM 源码树。
- 用于：
  - 技术库和 bitcell 行为排查
  - `replica_column` 等源码修复
  - 复现 1RW / 1R1W 生成逻辑

### deliverables/
- 存放 memory 相关交付包、交付文档与过程证据。
- 已分层包含：
  - 旧版 1RW 交付：`Sky130_memory_v20260610_162230*`
  - 1R1W netlist-only 交付：`Sky130_memory_1r1w_v20260612_1r1w*`
  - 1R1W full 交付：`Sky130_memory_1r1w_full_v20260612_1r1w_full*`
  - 真实面积过程证据：`real_area_progress_watch.log`
  - 过程辅助清单：`outputs_root_listing.txt`、`stage_listing.txt`、`package_tree.txt`

#### deliverables 子目录树

```text
deliverables/
|-- Sky130_memory_v20260610_162230/
|   |-- configs/
|   |-- logs/
|   |-- manifests/
|   |-- outputs/
|   |   |-- dc/                  # 历史旧目录，保留用于回溯
|   |   |-- design_compiler/
|   |   |-- genus/
|   |   |-- spyglass/
|   |   |-- tessent/
|   |   `-- verdi/
|   |-- reports/
|   |-- scripts/
|   |-- work/
|   `-- VERSION
|-- Sky130_memory_v20260610_162230.tar.gz
|-- Sky130_memory_v20260610_162230_delivery_en.md
|-- Sky130_memory_v20260610_162230_delivery_zh.md
|-- Sky130_memory_v20260610_162230_delivery_zh.pdf
|
|-- Sky130_memory_1r1w_v20260612_1r1w/
|   `-- Sky130_memory/
|       |-- configs/
|       |-- logs/
|       |-- manifests/
|       |-- outputs/
|       |   |-- design_compiler/
|       |   |-- genus/
|       |   |-- spyglass/
|       |   |-- tessent/
|       |   `-- verdi/
|       |-- reports/
|       |-- scripts/
|       |-- src/
|       |-- work/
|       `-- VERSION
|-- Sky130_memory_1r1w_v20260612_1r1w.tar.gz
|-- Sky130_memory_1r1w_delivery_en.md
|-- Sky130_memory_1r1w_delivery_en.pdf
|-- Sky130_memory_1r1w_delivery_zh.md
|-- Sky130_memory_1r1w_delivery_zh.pdf
|
|-- Sky130_memory_1r1w_full_v20260612_1r1w_full/
|   `-- Sky130_memory/
|       |-- configs/
|       |-- logs/
|       |-- manifests/
|       |-- outputs/
|       |   |-- design_compiler/
|       |   |-- genus/
|       |   |-- spyglass/
|       |   |-- tessent/
|       |   |-- vcs/             # full 包新增的 Synopsys 仿真输出
|       |   `-- verdi/
|       |-- reports/
|       |-- scripts/
|       |-- src/
|       `-- work/
|-- Sky130_memory_1r1w_full_v20260612_1r1w_full.tar.gz
|
|-- real_area_progress_watch.log
|-- area_trial_16x64.log
|-- outputs_root_listing.txt
|-- root_version_listing.txt
|-- stage_dirs.txt
|-- stage_listing.txt
`-- package_tree.txt
```

## 当前工作边界
- 本仓库当前聚焦于 SKY130 memory 资产，不再混入一般功耗分析任务。
- 目录中的核心生成主题是：
  - SKY130 1RW memory
  - SKY130 1R1W memory
  - 真实面积提取与 `.lib area` 回写
  - 多工具输出整理与交付打包

## 建议维护方式
- 新增 memory 规格时，优先把配置放进 `configs/`
- 新的远端执行或恢复逻辑，优先落到 `scripts/`
- 新交付包统一归档到 `deliverables/`
- 若后续继续拆仓，可再引入：
  - `docs/`
  - `notes/`
  - `outputs_cache/`

## 来源说明
本目录为 memory 相关资产的独立工作区，目标是与 `Sky130_Power` 并行维护。
