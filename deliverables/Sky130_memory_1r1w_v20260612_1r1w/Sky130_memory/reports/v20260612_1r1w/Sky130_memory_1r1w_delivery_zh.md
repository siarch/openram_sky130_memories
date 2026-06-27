# Sky130 Memory 1R1W 交付说明（中文）

## 交付包

- 文件名：`Sky130_memory_1r1w_v20260612_1r1w.tar.gz`
- 交付版本：`v20260612_1r1w`
- 交付范围：仅包含本次 1R1W memory 需求对应的配置、代码实现、编译脚本、OpenRAM 原始产物、按工具归档视图、日志、manifest、报告与交付说明。
- 打包根路径：`/Sky130_memory`

## 解压方式

```bash
tar -xzf Sky130_memory_1r1w_v20260612_1r1w.tar.gz
```

解压后内容以 `/Sky130_memory` 为相对根路径组织；包内不包含旧版 `1rw` 交付，也不包含完整 PDK。

## 目标 Memory 清单

- `sky130_sram_128bytes_1r1w_16x64`
- `sky130_sram_256bytes_1r1w_16x128`
- `sky130_sram_512bytes_1r1w_16x256`
- `sky130_sram_1kbytes_1r1w_16x512`
- `sky130_sram_16kbytes_1r1w_16x8192`
- `sky130_sram_48bytes_1r1w_6x128`
- `sky130_sram_128bytes_1r1w_8x128`
- `sky130_sram_256bytes_1r1w_8x256`
- `sky130_sram_96bytes_1r1w_24x128`
- `sky130_sram_128bytes_1r1w_32x32`
- `sky130_sram_512bytes_1r1w_32x128`
- `sky130_sram_2144bytes_1r1w_134x128`
- `sky130_sram_4096bytes_1r1w_256x128`

## 交付内容说明

- `VERSION`：本次 1R1W 交付版本标识。
- `configs/memory_matrix.yaml`：本次 1R1W memory 请求清单。
- `src/OpenRAM-stable/compiler/modules/replica_column.py`：本次为适配 `netlist_only` 1R1W 流程而修订的源码实现。
- `scripts/generate_compile_scripts.py`、`scripts/postprocess_and_report.py`、`scripts/run_all.sh`：批量生成与归档脚本。
- `scripts/compile/*.sh`：13 个 1R1W memory 的独立编译脚本。
- `work/openram_configs/*.py`：OpenRAM 配置文件，仅包含本次 1R1W memory 与共用 `sky130_sram_common.py`。
- `work/openram_builds/v20260612_1r1w/`：每个 memory 的 OpenRAM 原始生成产物（`.v/.lib/.sp/.lvs.sp/.html` 等）。
- `outputs/<tool>/v20260612_1r1w/<mem_id>/`：按工具分类归档的前端/综合/验证/DFT视图。
- `logs/v20260612_1r1w/`：本次批量生成日志，以及 DC/Genus `.lib` smoke-check 日志。
- `manifests/v20260612_1r1w/`：机器可读 manifest 与脚本清单。
- `reports/v20260612_1r1w/`：项目报告、本交付说明（Markdown/PDF）与完整目录树。

## 代码实现与范围约束

- 本次交付仅保留 `1R1W` 相关实现与产物，不包含历史 `1RW` 版本文件。
- 物理视图（如 `LEF/DEF`）未纳入本包；本次流程按 `netlist_only` 收口，聚焦前端设计、验证、综合、DFT 与功耗分析所需视图。
- manifest 中的缺失项标记可用于追踪未提供的物理后端文件。

## 溯源信息

- 生成源：`ryan@192.168.49.140:/Sky130_memory`
- 打包时间：`2026-06-12 21:14:59`
- 文件总数：`435`
- 总大小：`122.1 MB`

## 完整目录树（交付包内）

```text
.
|-- configs
|   `-- memory_matrix.yaml
|-- logs
|   `-- v20260612_1r1w
|       |-- sky130_sram_128bytes_1r1w_16x64.log
|       |-- sky130_sram_128bytes_1r1w_16x64_dc_read_lib.out
|       |-- sky130_sram_128bytes_1r1w_16x64_dc_read_lib.tcl
|       |-- sky130_sram_128bytes_1r1w_16x64_genus_read_lib.out
|       |-- sky130_sram_128bytes_1r1w_16x64_genus_read_lib.tcl
|       |-- sky130_sram_128bytes_1r1w_32x32.log
|       |-- sky130_sram_128bytes_1r1w_32x32_dc_read_lib.out
|       |-- sky130_sram_128bytes_1r1w_32x32_dc_read_lib.tcl
|       |-- sky130_sram_128bytes_1r1w_32x32_genus_read_lib.out
|       |-- sky130_sram_128bytes_1r1w_32x32_genus_read_lib.tcl
|       |-- sky130_sram_128bytes_1r1w_8x128.log
|       |-- sky130_sram_128bytes_1r1w_8x128_dc_read_lib.out
|       |-- sky130_sram_128bytes_1r1w_8x128_dc_read_lib.tcl
|       |-- sky130_sram_128bytes_1r1w_8x128_genus_read_lib.out
|       |-- sky130_sram_128bytes_1r1w_8x128_genus_read_lib.tcl
|       |-- sky130_sram_16kbytes_1r1w_16x8192.log
|       |-- sky130_sram_16kbytes_1r1w_16x8192_dc_read_lib.out
|       |-- sky130_sram_16kbytes_1r1w_16x8192_dc_read_lib.tcl
|       |-- sky130_sram_16kbytes_1r1w_16x8192_genus_read_lib.out
|       |-- sky130_sram_16kbytes_1r1w_16x8192_genus_read_lib.tcl
|       |-- sky130_sram_1kbytes_1r1w_16x512.log
|       |-- sky130_sram_1kbytes_1r1w_16x512_dc_read_lib.out
|       |-- sky130_sram_1kbytes_1r1w_16x512_dc_read_lib.tcl
|       |-- sky130_sram_1kbytes_1r1w_16x512_genus_read_lib.out
|       |-- sky130_sram_1kbytes_1r1w_16x512_genus_read_lib.tcl
|       |-- sky130_sram_2144bytes_1r1w_134x128.log
|       |-- sky130_sram_2144bytes_1r1w_134x128_dc_read_lib.out
|       |-- sky130_sram_2144bytes_1r1w_134x128_dc_read_lib.tcl
|       |-- sky130_sram_2144bytes_1r1w_134x128_genus_read_lib.out
|       |-- sky130_sram_2144bytes_1r1w_134x128_genus_read_lib.tcl
|       |-- sky130_sram_256bytes_1r1w_16x128.log
|       |-- sky130_sram_256bytes_1r1w_16x128_dc_read_lib.out
|       |-- sky130_sram_256bytes_1r1w_16x128_dc_read_lib.tcl
|       |-- sky130_sram_256bytes_1r1w_16x128_genus_read_lib.out
|       |-- sky130_sram_256bytes_1r1w_16x128_genus_read_lib.tcl
|       |-- sky130_sram_256bytes_1r1w_8x256.log
|       |-- sky130_sram_256bytes_1r1w_8x256_dc_read_lib.out
|       |-- sky130_sram_256bytes_1r1w_8x256_dc_read_lib.tcl
|       |-- sky130_sram_256bytes_1r1w_8x256_genus_read_lib.out
|       |-- sky130_sram_256bytes_1r1w_8x256_genus_read_lib.tcl
|       |-- sky130_sram_4096bytes_1r1w_256x128.log
|       |-- sky130_sram_4096bytes_1r1w_256x128_dc_read_lib.out
|       |-- sky130_sram_4096bytes_1r1w_256x128_dc_read_lib.tcl
|       |-- sky130_sram_4096bytes_1r1w_256x128_genus_read_lib.out
|       |-- sky130_sram_4096bytes_1r1w_256x128_genus_read_lib.tcl
|       |-- sky130_sram_48bytes_1r1w_6x128.log
|       |-- sky130_sram_48bytes_1r1w_6x128_dc_read_lib.out
|       |-- sky130_sram_48bytes_1r1w_6x128_dc_read_lib.tcl
|       |-- sky130_sram_48bytes_1r1w_6x128_genus_read_lib.out
|       |-- sky130_sram_48bytes_1r1w_6x128_genus_read_lib.tcl
|       |-- sky130_sram_512bytes_1r1w_16x256.log
|       |-- sky130_sram_512bytes_1r1w_16x256_dc_read_lib.out
|       |-- sky130_sram_512bytes_1r1w_16x256_dc_read_lib.tcl
|       |-- sky130_sram_512bytes_1r1w_16x256_genus_read_lib.out
|       |-- sky130_sram_512bytes_1r1w_16x256_genus_read_lib.tcl
|       |-- sky130_sram_512bytes_1r1w_32x128.log
|       |-- sky130_sram_512bytes_1r1w_32x128_dc_read_lib.out
|       |-- sky130_sram_512bytes_1r1w_32x128_dc_read_lib.tcl
|       |-- sky130_sram_512bytes_1r1w_32x128_genus_read_lib.out
|       |-- sky130_sram_512bytes_1r1w_32x128_genus_read_lib.tcl
|       |-- sky130_sram_96bytes_1r1w_24x128.log
|       |-- sky130_sram_96bytes_1r1w_24x128_dc_read_lib.out
|       |-- sky130_sram_96bytes_1r1w_24x128_dc_read_lib.tcl
|       |-- sky130_sram_96bytes_1r1w_24x128_genus_read_lib.out
|       `-- sky130_sram_96bytes_1r1w_24x128_genus_read_lib.tcl
|-- manifests
|   `-- v20260612_1r1w
|       |-- compile_scripts.json
|       `-- memory_manifest.json
|-- outputs
|   |-- dc
|   |   `-- v20260612_1r1w
|   |       |-- sky130_sram_128bytes_1r1w_16x64
|   |       |   `-- sky130_sram_128bytes_1r1w_16x64.lib
|   |       |-- sky130_sram_128bytes_1r1w_32x32
|   |       |   `-- sky130_sram_128bytes_1r1w_32x32.lib
|   |       |-- sky130_sram_128bytes_1r1w_8x128
|   |       |   `-- sky130_sram_128bytes_1r1w_8x128.lib
|   |       |-- sky130_sram_16kbytes_1r1w_16x8192
|   |       |   `-- sky130_sram_16kbytes_1r1w_16x8192.lib
|   |       |-- sky130_sram_1kbytes_1r1w_16x512
|   |       |   `-- sky130_sram_1kbytes_1r1w_16x512.lib
|   |       |-- sky130_sram_2144bytes_1r1w_134x128
|   |       |   `-- sky130_sram_2144bytes_1r1w_134x128.lib
|   |       |-- sky130_sram_256bytes_1r1w_16x128
|   |       |   `-- sky130_sram_256bytes_1r1w_16x128.lib
|   |       |-- sky130_sram_256bytes_1r1w_8x256
|   |       |   `-- sky130_sram_256bytes_1r1w_8x256.lib
|   |       |-- sky130_sram_4096bytes_1r1w_256x128
|   |       |   `-- sky130_sram_4096bytes_1r1w_256x128.lib
|   |       |-- sky130_sram_48bytes_1r1w_6x128
|   |       |   `-- sky130_sram_48bytes_1r1w_6x128.lib
|   |       |-- sky130_sram_512bytes_1r1w_16x256
|   |       |   `-- sky130_sram_512bytes_1r1w_16x256.lib
|   |       |-- sky130_sram_512bytes_1r1w_32x128
|   |       |   `-- sky130_sram_512bytes_1r1w_32x128.lib
|   |       `-- sky130_sram_96bytes_1r1w_24x128
|   |           `-- sky130_sram_96bytes_1r1w_24x128.lib
|   |-- design_compiler
|   |   `-- v20260612_1r1w
|   |       |-- sky130_sram_128bytes_1r1w_16x64
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64.lib
|   |       |   `-- sky130_sram_128bytes_1r1w_16x64.v
|   |       |-- sky130_sram_128bytes_1r1w_32x32
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32.lib
|   |       |   `-- sky130_sram_128bytes_1r1w_32x32.v
|   |       |-- sky130_sram_128bytes_1r1w_8x128
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128.lib
|   |       |   `-- sky130_sram_128bytes_1r1w_8x128.v
|   |       |-- sky130_sram_16kbytes_1r1w_16x8192
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.lib
|   |       |   `-- sky130_sram_16kbytes_1r1w_16x8192.v
|   |       |-- sky130_sram_1kbytes_1r1w_16x512
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512.lib
|   |       |   `-- sky130_sram_1kbytes_1r1w_16x512.v
|   |       |-- sky130_sram_2144bytes_1r1w_134x128
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128.lib
|   |       |   `-- sky130_sram_2144bytes_1r1w_134x128.v
|   |       |-- sky130_sram_256bytes_1r1w_16x128
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128.lib
|   |       |   `-- sky130_sram_256bytes_1r1w_16x128.v
|   |       |-- sky130_sram_256bytes_1r1w_8x256
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256.lib
|   |       |   `-- sky130_sram_256bytes_1r1w_8x256.v
|   |       |-- sky130_sram_4096bytes_1r1w_256x128
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128.lib
|   |       |   `-- sky130_sram_4096bytes_1r1w_256x128.v
|   |       |-- sky130_sram_48bytes_1r1w_6x128
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128.lib
|   |       |   `-- sky130_sram_48bytes_1r1w_6x128.v
|   |       |-- sky130_sram_512bytes_1r1w_16x256
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256.lib
|   |       |   `-- sky130_sram_512bytes_1r1w_16x256.v
|   |       |-- sky130_sram_512bytes_1r1w_32x128
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128.lib
|   |       |   `-- sky130_sram_512bytes_1r1w_32x128.v
|   |       `-- sky130_sram_96bytes_1r1w_24x128
|   |           |-- sky130_sram_96bytes_1r1w_24x128.lib
|   |           `-- sky130_sram_96bytes_1r1w_24x128.v
|   |-- genus
|   |   `-- v20260612_1r1w
|   |       |-- sky130_sram_128bytes_1r1w_16x64
|   |       |   `-- sky130_sram_128bytes_1r1w_16x64.lib
|   |       |-- sky130_sram_128bytes_1r1w_32x32
|   |       |   `-- sky130_sram_128bytes_1r1w_32x32.lib
|   |       |-- sky130_sram_128bytes_1r1w_8x128
|   |       |   `-- sky130_sram_128bytes_1r1w_8x128.lib
|   |       |-- sky130_sram_16kbytes_1r1w_16x8192
|   |       |   `-- sky130_sram_16kbytes_1r1w_16x8192.lib
|   |       |-- sky130_sram_1kbytes_1r1w_16x512
|   |       |   `-- sky130_sram_1kbytes_1r1w_16x512.lib
|   |       |-- sky130_sram_2144bytes_1r1w_134x128
|   |       |   `-- sky130_sram_2144bytes_1r1w_134x128.lib
|   |       |-- sky130_sram_256bytes_1r1w_16x128
|   |       |   `-- sky130_sram_256bytes_1r1w_16x128.lib
|   |       |-- sky130_sram_256bytes_1r1w_8x256
|   |       |   `-- sky130_sram_256bytes_1r1w_8x256.lib
|   |       |-- sky130_sram_4096bytes_1r1w_256x128
|   |       |   `-- sky130_sram_4096bytes_1r1w_256x128.lib
|   |       |-- sky130_sram_48bytes_1r1w_6x128
|   |       |   `-- sky130_sram_48bytes_1r1w_6x128.lib
|   |       |-- sky130_sram_512bytes_1r1w_16x256
|   |       |   `-- sky130_sram_512bytes_1r1w_16x256.lib
|   |       |-- sky130_sram_512bytes_1r1w_32x128
|   |       |   `-- sky130_sram_512bytes_1r1w_32x128.lib
|   |       `-- sky130_sram_96bytes_1r1w_24x128
|   |           `-- sky130_sram_96bytes_1r1w_24x128.lib
|   |-- spyglass
|   |   `-- v20260612_1r1w
|   |       |-- sky130_sram_128bytes_1r1w_16x64
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64.prj
|   |       |   `-- sky130_sram_128bytes_1r1w_16x64.v
|   |       |-- sky130_sram_128bytes_1r1w_32x32
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32.prj
|   |       |   `-- sky130_sram_128bytes_1r1w_32x32.v
|   |       |-- sky130_sram_128bytes_1r1w_8x128
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128.prj
|   |       |   `-- sky130_sram_128bytes_1r1w_8x128.v
|   |       |-- sky130_sram_16kbytes_1r1w_16x8192
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.prj
|   |       |   `-- sky130_sram_16kbytes_1r1w_16x8192.v
|   |       |-- sky130_sram_1kbytes_1r1w_16x512
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512.prj
|   |       |   `-- sky130_sram_1kbytes_1r1w_16x512.v
|   |       |-- sky130_sram_2144bytes_1r1w_134x128
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128.prj
|   |       |   `-- sky130_sram_2144bytes_1r1w_134x128.v
|   |       |-- sky130_sram_256bytes_1r1w_16x128
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128.prj
|   |       |   `-- sky130_sram_256bytes_1r1w_16x128.v
|   |       |-- sky130_sram_256bytes_1r1w_8x256
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256.prj
|   |       |   `-- sky130_sram_256bytes_1r1w_8x256.v
|   |       |-- sky130_sram_4096bytes_1r1w_256x128
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128.prj
|   |       |   `-- sky130_sram_4096bytes_1r1w_256x128.v
|   |       |-- sky130_sram_48bytes_1r1w_6x128
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128.prj
|   |       |   `-- sky130_sram_48bytes_1r1w_6x128.v
|   |       |-- sky130_sram_512bytes_1r1w_16x256
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256.prj
|   |       |   `-- sky130_sram_512bytes_1r1w_16x256.v
|   |       |-- sky130_sram_512bytes_1r1w_32x128
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128.prj
|   |       |   `-- sky130_sram_512bytes_1r1w_32x128.v
|   |       |-- sky130_sram_96bytes_1r1w_24x128
|   |       |   |-- sky130_sram_96bytes_1r1w_24x128.prj
|   |       |   `-- sky130_sram_96bytes_1r1w_24x128.v
|   |       `-- v20260612_1r1w.prj
|   |-- tessent
|   |   `-- v20260612_1r1w
|   |       |-- sky130_sram_128bytes_1r1w_16x64
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_128bytes_1r1w_16x64.v
|   |       |-- sky130_sram_128bytes_1r1w_32x32
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_128bytes_1r1w_32x32.v
|   |       |-- sky130_sram_128bytes_1r1w_8x128
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_128bytes_1r1w_8x128.v
|   |       |-- sky130_sram_16kbytes_1r1w_16x8192
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_16kbytes_1r1w_16x8192.v
|   |       |-- sky130_sram_1kbytes_1r1w_16x512
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_1kbytes_1r1w_16x512.v
|   |       |-- sky130_sram_2144bytes_1r1w_134x128
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_2144bytes_1r1w_134x128.v
|   |       |-- sky130_sram_256bytes_1r1w_16x128
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_256bytes_1r1w_16x128.v
|   |       |-- sky130_sram_256bytes_1r1w_8x256
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_256bytes_1r1w_8x256.v
|   |       |-- sky130_sram_4096bytes_1r1w_256x128
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_4096bytes_1r1w_256x128.v
|   |       |-- sky130_sram_48bytes_1r1w_6x128
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_48bytes_1r1w_6x128.v
|   |       |-- sky130_sram_512bytes_1r1w_16x256
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_512bytes_1r1w_16x256.v
|   |       |-- sky130_sram_512bytes_1r1w_32x128
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_512bytes_1r1w_32x128.v
|   |       |-- sky130_sram_96bytes_1r1w_24x128
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_96bytes_1r1w_24x128.v
|   |       `-- README_TESSENT_INPUTS.txt
|   `-- verdi
|       `-- v20260612_1r1w
|           |-- sky130_sram_128bytes_1r1w_16x64
|           |   |-- sky130_sram_128bytes_1r1w_16x64.html
|           |   |-- sky130_sram_128bytes_1r1w_16x64.sp
|           |   `-- sky130_sram_128bytes_1r1w_16x64.v
|           |-- sky130_sram_128bytes_1r1w_32x32
|           |   |-- sky130_sram_128bytes_1r1w_32x32.html
|           |   |-- sky130_sram_128bytes_1r1w_32x32.sp
|           |   `-- sky130_sram_128bytes_1r1w_32x32.v
|           |-- sky130_sram_128bytes_1r1w_8x128
|           |   |-- sky130_sram_128bytes_1r1w_8x128.html
|           |   |-- sky130_sram_128bytes_1r1w_8x128.sp
|           |   `-- sky130_sram_128bytes_1r1w_8x128.v
|           |-- sky130_sram_16kbytes_1r1w_16x8192
|           |   |-- sky130_sram_16kbytes_1r1w_16x8192.html
|           |   |-- sky130_sram_16kbytes_1r1w_16x8192.sp
|           |   `-- sky130_sram_16kbytes_1r1w_16x8192.v
|           |-- sky130_sram_1kbytes_1r1w_16x512
|           |   |-- sky130_sram_1kbytes_1r1w_16x512.html
|           |   |-- sky130_sram_1kbytes_1r1w_16x512.sp
|           |   `-- sky130_sram_1kbytes_1r1w_16x512.v
|           |-- sky130_sram_2144bytes_1r1w_134x128
|           |   |-- sky130_sram_2144bytes_1r1w_134x128.html
|           |   |-- sky130_sram_2144bytes_1r1w_134x128.sp
|           |   `-- sky130_sram_2144bytes_1r1w_134x128.v
|           |-- sky130_sram_256bytes_1r1w_16x128
|           |   |-- sky130_sram_256bytes_1r1w_16x128.html
|           |   |-- sky130_sram_256bytes_1r1w_16x128.sp
|           |   `-- sky130_sram_256bytes_1r1w_16x128.v
|           |-- sky130_sram_256bytes_1r1w_8x256
|           |   |-- sky130_sram_256bytes_1r1w_8x256.html
|           |   |-- sky130_sram_256bytes_1r1w_8x256.sp
|           |   `-- sky130_sram_256bytes_1r1w_8x256.v
|           |-- sky130_sram_4096bytes_1r1w_256x128
|           |   |-- sky130_sram_4096bytes_1r1w_256x128.html
|           |   |-- sky130_sram_4096bytes_1r1w_256x128.sp
|           |   `-- sky130_sram_4096bytes_1r1w_256x128.v
|           |-- sky130_sram_48bytes_1r1w_6x128
|           |   |-- sky130_sram_48bytes_1r1w_6x128.html
|           |   |-- sky130_sram_48bytes_1r1w_6x128.sp
|           |   `-- sky130_sram_48bytes_1r1w_6x128.v
|           |-- sky130_sram_512bytes_1r1w_16x256
|           |   |-- sky130_sram_512bytes_1r1w_16x256.html
|           |   |-- sky130_sram_512bytes_1r1w_16x256.sp
|           |   `-- sky130_sram_512bytes_1r1w_16x256.v
|           |-- sky130_sram_512bytes_1r1w_32x128
|           |   |-- sky130_sram_512bytes_1r1w_32x128.html
|           |   |-- sky130_sram_512bytes_1r1w_32x128.sp
|           |   `-- sky130_sram_512bytes_1r1w_32x128.v
|           `-- sky130_sram_96bytes_1r1w_24x128
|               |-- sky130_sram_96bytes_1r1w_24x128.html
|               |-- sky130_sram_96bytes_1r1w_24x128.sp
|               `-- sky130_sram_96bytes_1r1w_24x128.v
|-- reports
|   `-- v20260612_1r1w
|       |-- package_tree.txt
|       |-- Sky130_memory_1r1w_delivery_en.html
|       |-- Sky130_memory_1r1w_delivery_en.md
|       |-- Sky130_memory_1r1w_delivery_en.pdf
|       |-- Sky130_memory_1r1w_delivery_zh.html
|       |-- Sky130_memory_1r1w_delivery_zh.md
|       |-- Sky130_memory_1r1w_delivery_zh.pdf
|       `-- Sky130_memory_report.md
|-- scripts
|   |-- compile
|   |   |-- sky130_sram_128bytes_1r1w_16x64.sh
|   |   |-- sky130_sram_128bytes_1r1w_32x32.sh
|   |   |-- sky130_sram_128bytes_1r1w_8x128.sh
|   |   |-- sky130_sram_16kbytes_1r1w_16x8192.sh
|   |   |-- sky130_sram_1kbytes_1r1w_16x512.sh
|   |   |-- sky130_sram_2144bytes_1r1w_134x128.sh
|   |   |-- sky130_sram_256bytes_1r1w_16x128.sh
|   |   |-- sky130_sram_256bytes_1r1w_8x256.sh
|   |   |-- sky130_sram_4096bytes_1r1w_256x128.sh
|   |   |-- sky130_sram_48bytes_1r1w_6x128.sh
|   |   |-- sky130_sram_512bytes_1r1w_16x256.sh
|   |   |-- sky130_sram_512bytes_1r1w_32x128.sh
|   |   `-- sky130_sram_96bytes_1r1w_24x128.sh
|   |-- generate_compile_scripts.py
|   |-- postprocess_and_report.py
|   `-- run_all.sh
|-- src
|   `-- OpenRAM-stable
|       `-- compiler
|           `-- modules
|               `-- replica_column.py
|-- work
|   |-- openram_builds
|   |   `-- v20260612_1r1w
|   |       |-- sky130_sram_128bytes_1r1w_16x64
|   |       |   |-- datasheet.info
|   |       |   |-- delay_meas.sp
|   |       |   |-- delay_stim.sp
|   |       |   |-- functional_meas.sp
|   |       |   |-- functional_stim.sp
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64.html
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64.log
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64.lvs.sp
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64.py
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64.sp
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64.v
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_TT_1p8V_25C.lib
|   |       |   |-- sram.sp
|   |       |   `-- trimmed.sp
|   |       |-- sky130_sram_128bytes_1r1w_32x32
|   |       |   |-- datasheet.info
|   |       |   |-- delay_meas.sp
|   |       |   |-- delay_stim.sp
|   |       |   |-- functional_meas.sp
|   |       |   |-- functional_stim.sp
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32.html
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32.log
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32.lvs.sp
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32.py
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32.sp
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32.v
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_TT_1p8V_25C.lib
|   |       |   |-- sram.sp
|   |       |   `-- trimmed.sp
|   |       |-- sky130_sram_128bytes_1r1w_8x128
|   |       |   |-- datasheet.info
|   |       |   |-- delay_meas.sp
|   |       |   |-- delay_stim.sp
|   |       |   |-- functional_meas.sp
|   |       |   |-- functional_stim.sp
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128.html
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128.log
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128.lvs.sp
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128.py
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128.sp
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128.v
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_TT_1p8V_25C.lib
|   |       |   |-- sram.sp
|   |       |   `-- trimmed.sp
|   |       |-- sky130_sram_16kbytes_1r1w_16x8192
|   |       |   |-- datasheet.info
|   |       |   |-- delay_meas.sp
|   |       |   |-- delay_stim.sp
|   |       |   |-- functional_meas.sp
|   |       |   |-- functional_stim.sp
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.html
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.log
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.lvs.sp
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.py
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.sp
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.v
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_TT_1p8V_25C.lib
|   |       |   |-- sram.sp
|   |       |   `-- trimmed.sp
|   |       |-- sky130_sram_1kbytes_1r1w_16x512
|   |       |   |-- datasheet.info
|   |       |   |-- delay_meas.sp
|   |       |   |-- delay_stim.sp
|   |       |   |-- functional_meas.sp
|   |       |   |-- functional_stim.sp
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512.html
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512.log
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512.lvs.sp
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512.py
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512.sp
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512.v
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_TT_1p8V_25C.lib
|   |       |   |-- sram.sp
|   |       |   `-- trimmed.sp
|   |       |-- sky130_sram_2144bytes_1r1w_134x128
|   |       |   |-- datasheet.info
|   |       |   |-- delay_meas.sp
|   |       |   |-- delay_stim.sp
|   |       |   |-- functional_meas.sp
|   |       |   |-- functional_stim.sp
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128.html
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128.log
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128.lvs.sp
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128.py
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128.sp
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128.v
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_TT_1p8V_25C.lib
|   |       |   |-- sram.sp
|   |       |   `-- trimmed.sp
|   |       |-- sky130_sram_256bytes_1r1w_16x128
|   |       |   |-- datasheet.info
|   |       |   |-- delay_meas.sp
|   |       |   |-- delay_stim.sp
|   |       |   |-- functional_meas.sp
|   |       |   |-- functional_stim.sp
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128.html
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128.log
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128.lvs.sp
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128.py
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128.sp
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128.v
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_TT_1p8V_25C.lib
|   |       |   |-- sram.sp
|   |       |   `-- trimmed.sp
|   |       |-- sky130_sram_256bytes_1r1w_8x256
|   |       |   |-- datasheet.info
|   |       |   |-- delay_meas.sp
|   |       |   |-- delay_stim.sp
|   |       |   |-- functional_meas.sp
|   |       |   |-- functional_stim.sp
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256.html
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256.log
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256.lvs.sp
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256.py
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256.sp
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256.v
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_TT_1p8V_25C.lib
|   |       |   |-- sram.sp
|   |       |   `-- trimmed.sp
|   |       |-- sky130_sram_4096bytes_1r1w_256x128
|   |       |   |-- datasheet.info
|   |       |   |-- delay_meas.sp
|   |       |   |-- delay_stim.sp
|   |       |   |-- functional_meas.sp
|   |       |   |-- functional_stim.sp
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128.html
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128.log
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128.lvs.sp
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128.py
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128.sp
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128.v
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_TT_1p8V_25C.lib
|   |       |   |-- sram.sp
|   |       |   `-- trimmed.sp
|   |       |-- sky130_sram_48bytes_1r1w_6x128
|   |       |   |-- datasheet.info
|   |       |   |-- delay_meas.sp
|   |       |   |-- delay_stim.sp
|   |       |   |-- functional_meas.sp
|   |       |   |-- functional_stim.sp
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128.html
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128.log
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128.lvs.sp
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128.py
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128.sp
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128.v
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_TT_1p8V_25C.lib
|   |       |   |-- sram.sp
|   |       |   `-- trimmed.sp
|   |       |-- sky130_sram_512bytes_1r1w_16x256
|   |       |   |-- datasheet.info
|   |       |   |-- delay_meas.sp
|   |       |   |-- delay_stim.sp
|   |       |   |-- functional_meas.sp
|   |       |   |-- functional_stim.sp
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256.html
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256.log
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256.lvs.sp
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256.py
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256.sp
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256.v
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_TT_1p8V_25C.lib
|   |       |   |-- sram.sp
|   |       |   `-- trimmed.sp
|   |       |-- sky130_sram_512bytes_1r1w_32x128
|   |       |   |-- datasheet.info
|   |       |   |-- delay_meas.sp
|   |       |   |-- delay_stim.sp
|   |       |   |-- functional_meas.sp
|   |       |   |-- functional_stim.sp
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128.html
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128.log
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128.lvs.sp
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128.py
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128.sp
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128.v
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_TT_1p8V_25C.lib
|   |       |   |-- sram.sp
|   |       |   `-- trimmed.sp
|   |       `-- sky130_sram_96bytes_1r1w_24x128
|   |           |-- datasheet.info
|   |           |-- delay_meas.sp
|   |           |-- delay_stim.sp
|   |           |-- functional_meas.sp
|   |           |-- functional_stim.sp
|   |           |-- sky130_sram_96bytes_1r1w_24x128.html
|   |           |-- sky130_sram_96bytes_1r1w_24x128.log
|   |           |-- sky130_sram_96bytes_1r1w_24x128.lvs.sp
|   |           |-- sky130_sram_96bytes_1r1w_24x128.py
|   |           |-- sky130_sram_96bytes_1r1w_24x128.sp
|   |           |-- sky130_sram_96bytes_1r1w_24x128.v
|   |           |-- sky130_sram_96bytes_1r1w_24x128_TT_1p8V_25C.lib
|   |           |-- sram.sp
|   |           `-- trimmed.sp
|   `-- openram_configs
|       |-- sky130_sram_128bytes_1r1w_16x64.py
|       |-- sky130_sram_128bytes_1r1w_32x32.py
|       |-- sky130_sram_128bytes_1r1w_8x128.py
|       |-- sky130_sram_16kbytes_1r1w_16x8192.py
|       |-- sky130_sram_1kbytes_1r1w_16x512.py
|       |-- sky130_sram_2144bytes_1r1w_134x128.py
|       |-- sky130_sram_256bytes_1r1w_16x128.py
|       |-- sky130_sram_256bytes_1r1w_8x256.py
|       |-- sky130_sram_4096bytes_1r1w_256x128.py
|       |-- sky130_sram_48bytes_1r1w_6x128.py
|       |-- sky130_sram_512bytes_1r1w_16x256.py
|       |-- sky130_sram_512bytes_1r1w_32x128.py
|       |-- sky130_sram_96bytes_1r1w_24x128.py
|       `-- sky130_sram_common.py
`-- VERSION
```
