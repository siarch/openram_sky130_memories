# Sky130 Memory Compiler Deployment Report

## 已完成工作综述
- 根目录: `/Sky130_memory`
- 版本标识: `v20260610_162230`
- 已发现并归档 memory 条目数: `6`

## 已生成内存清单

| ID | library_name | work_dir | outputs(genus) | outputs(verdi) | issues |
|---|---|---|---|---|---|
| sky130_sram_16kbyte_1rw_32x4096_8 | sky130_sram_16kbyte_1rw_32x4096_8_TT_1p8V_25C_lib | /Sky130_memory/work/openram_builds/v20260610_162230/sky130_sram_16kbyte_1rw_32x4096_8 | /Sky130_memory/outputs/genus/v20260610_162230/sky130_sram_16kbyte_1rw_32x4096_8/sky130_sram_16kbyte_1rw_32x4096_8.lib | /Sky130_memory/outputs/verdi/v20260610_162230/sky130_sram_16kbyte_1rw_32x4096_8/sky130_sram_16kbyte_1rw_32x4096_8.v | missing_lef |
| sky130_sram_1kbyte_1rw_32x256_8 | sky130_sram_1kbyte_1rw_32x256_8_TT_1p8V_25C_lib | /Sky130_memory/work/openram_builds/v20260610_162230/sky130_sram_1kbyte_1rw_32x256_8 | /Sky130_memory/outputs/genus/v20260610_162230/sky130_sram_1kbyte_1rw_32x256_8/sky130_sram_1kbyte_1rw_32x256_8.lib | /Sky130_memory/outputs/verdi/v20260610_162230/sky130_sram_1kbyte_1rw_32x256_8/sky130_sram_1kbyte_1rw_32x256_8.v | missing_lef |
| sky130_sram_2kbyte_1rw_32x512_8 | sky130_sram_2kbyte_1rw_32x512_8_TT_1p8V_25C_lib | /Sky130_memory/work/openram_builds/v20260610_162230/sky130_sram_2kbyte_1rw_32x512_8 | /Sky130_memory/outputs/genus/v20260610_162230/sky130_sram_2kbyte_1rw_32x512_8/sky130_sram_2kbyte_1rw_32x512_8.lib | /Sky130_memory/outputs/verdi/v20260610_162230/sky130_sram_2kbyte_1rw_32x512_8/sky130_sram_2kbyte_1rw_32x512_8.v | missing_lef |
| sky130_sram_4kbyte_1rw_32x1024_8 | sky130_sram_4kbyte_1rw_32x1024_8_TT_1p8V_25C_lib | /Sky130_memory/work/openram_builds/v20260610_162230/sky130_sram_4kbyte_1rw_32x1024_8 | /Sky130_memory/outputs/genus/v20260610_162230/sky130_sram_4kbyte_1rw_32x1024_8/sky130_sram_4kbyte_1rw_32x1024_8.lib | /Sky130_memory/outputs/verdi/v20260610_162230/sky130_sram_4kbyte_1rw_32x1024_8/sky130_sram_4kbyte_1rw_32x1024_8.v | missing_lef |
| sky130_sram_4kbyte_1rw_64x512_8 | sky130_sram_4kbyte_1rw_64x512_8_TT_1p8V_25C_lib | /Sky130_memory/work/openram_builds/v20260610_162230/sky130_sram_4kbyte_1rw_64x512_8 | /Sky130_memory/outputs/genus/v20260610_162230/sky130_sram_4kbyte_1rw_64x512_8/sky130_sram_4kbyte_1rw_64x512_8.lib | /Sky130_memory/outputs/verdi/v20260610_162230/sky130_sram_4kbyte_1rw_64x512_8/sky130_sram_4kbyte_1rw_64x512_8.v | missing_lef |
| sky130_sram_8kbyte_1rw_32x2048_8 | sky130_sram_8kbyte_1rw_32x2048_8_TT_1p8V_25C_lib | /Sky130_memory/work/openram_builds/v20260610_162230/sky130_sram_8kbyte_1rw_32x2048_8 | /Sky130_memory/outputs/genus/v20260610_162230/sky130_sram_8kbyte_1rw_32x2048_8/sky130_sram_8kbyte_1rw_32x2048_8.lib | /Sky130_memory/outputs/verdi/v20260610_162230/sky130_sram_8kbyte_1rw_32x2048_8/sky130_sram_8kbyte_1rw_32x2048_8.v | missing_lef |

## 验证与归档

| Tool | Detected | Notes |
|---|---:|---|
| iverilog | no |  |
| dc_shell | yes |  |
| genus | yes |  |
| spyglass | yes |  |
| verdi | yes |  |
| tessent | yes |  |
| pandoc | no |  |

### 自动化 smoke check 说明
- 若 `iverilog` 可用，会对每个 memory 的 Verilog 视图做一次语法级编译检查。
- 若 `dc_shell` 可用，会尝试执行 `read_lib -format liberty` 读取 `.lib`，结果写入 `logs/<version>/*_dc_read_lib.out`。
- 若 `genus` 可用，会尝试执行 `read_libs` 读取 `.lib`，结果写入 `logs/<version>/*_genus_read_lib.out`。
- 若工具未安装或无许可证，检查会被跳过或返回非 0，仍会保留日志以便团队定位环境问题。

## 定制内存生成操作指南

### 环境变量
- `SKY130_MEMORY_ROOT` (默认 `/Sky130_memory`)
- `SKY130_MEMORY_GROUP` (默认 `sky130mem`)
- `SKY130_MEMORY_VERSION` (默认自动时间戳)
- `OPENRAM_ROOT` (默认 `$SKY130_MEMORY_ROOT/src/OpenRAM-stable`)
- `PDK_ROOT` (默认 `$SKY130_MEMORY_ROOT/pdk`)

### 生成/重跑流程
1. 更新配置清单：编辑 `$SKY130_MEMORY_ROOT/configs/memory_matrix.yaml`
2. 生成每个配置的编译脚本：`python3 $SKY130_MEMORY_ROOT/scripts/generate_compile_scripts.py`
3. 逐个执行 `$SKY130_MEMORY_ROOT/scripts/compile/<id>.sh`
4. 归档多工具输出并生成报告：`python3 $SKY130_MEMORY_ROOT/scripts/postprocess_and_report.py`

### 常见问题排查
- `.lib` 缺失：检查 OpenRAM 是否启用 characterization 输出以及 PDK/技术路径是否正确
- `.lef` 缺失：确认不是 netlist_only 模式，且布局流程可用
- 工具不可用：DC/Genus/Spyglass/Verdi/Tessent 的专有命令需在服务器环境中正确配置

