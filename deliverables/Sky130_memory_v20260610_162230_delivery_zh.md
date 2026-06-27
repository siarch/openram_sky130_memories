# Sky130 Memory 交付说明（中文）

## 交付包

- 文件名：`Sky130_memory_v20260610_162230.tar.gz`
- 

## 解压方式

```bash
tar -xzf Sky130_memory_v20260610_162230.tar.gz
```

解压后内容以 `/Sky130_memory` 为相对根路径组织（即打包的是该目录下的交付相关子树，而非完整源代码/PDK）。

## 交付内容说明

- `configs/memory_matrix.yaml`：内存配置清单（可扩展）。
- `scripts/`：脚本入口与按配置拆分的编译脚本。
- `work/openram_builds/v20260610_162230/`：每个 memory 的 OpenRAM 原始生成产物（`.v/.lib/.sp/.html/.lvs.sp` 等）。
- `outputs/<tool>/v20260610_162230/<mem_id>/`：按工具分类归档后的视图文件。
- `logs/v20260610_162230/`：编译日志、批量日志 `run_all.out`、以及 DC/Genus 读取 `.lib` 的 smoke-check 日志。
- `manifests/v20260610_162230/memory_manifest.json`：机器可读的交付清单（包含每款 memory 的输出路径与缺失项标记）。
- `reports/v20260610_162230/`：项目报告（Markdown + PDF）。

## 目录树（交付包内）

```text
.
|-- VERSION
|-- configs
|   `-- memory_matrix.yaml
|-- logs
|   `-- v20260610_162230
|       |-- run_all.out
|       |-- sky130_sram_16kbyte_1rw_32x4096_8.log
|       |-- sky130_sram_16kbyte_1rw_32x4096_8_dc_read_lib.out
|       |-- sky130_sram_16kbyte_1rw_32x4096_8_dc_read_lib.tcl
|       |-- sky130_sram_16kbyte_1rw_32x4096_8_genus_read_lib.out
|       |-- sky130_sram_16kbyte_1rw_32x4096_8_genus_read_lib.tcl
|       |-- sky130_sram_1kbyte_1rw_32x256_8.log
|       |-- sky130_sram_1kbyte_1rw_32x256_8_dc_read_lib.out
|       |-- sky130_sram_1kbyte_1rw_32x256_8_dc_read_lib.tcl
|       |-- sky130_sram_1kbyte_1rw_32x256_8_genus_read_lib.out
|       |-- sky130_sram_1kbyte_1rw_32x256_8_genus_read_lib.tcl
|       |-- sky130_sram_2kbyte_1rw_32x512_8.log
|       |-- sky130_sram_2kbyte_1rw_32x512_8_dc_read_lib.out
|       |-- sky130_sram_2kbyte_1rw_32x512_8_dc_read_lib.tcl
|       |-- sky130_sram_2kbyte_1rw_32x512_8_genus_read_lib.out
|       |-- sky130_sram_2kbyte_1rw_32x512_8_genus_read_lib.tcl
|       |-- sky130_sram_4kbyte_1rw_32x1024_8.log
|       |-- sky130_sram_4kbyte_1rw_32x1024_8_dc_read_lib.out
|       |-- sky130_sram_4kbyte_1rw_32x1024_8_dc_read_lib.tcl
|       |-- sky130_sram_4kbyte_1rw_32x1024_8_genus_read_lib.out
|       |-- sky130_sram_4kbyte_1rw_32x1024_8_genus_read_lib.tcl
|       |-- sky130_sram_4kbyte_1rw_64x512_8.log
|       |-- sky130_sram_4kbyte_1rw_64x512_8_dc_read_lib.out
|       |-- sky130_sram_4kbyte_1rw_64x512_8_dc_read_lib.tcl
|       |-- sky130_sram_4kbyte_1rw_64x512_8_genus_read_lib.out
|       |-- sky130_sram_4kbyte_1rw_64x512_8_genus_read_lib.tcl
|       |-- sky130_sram_8kbyte_1rw_32x2048_8.log
|       |-- sky130_sram_8kbyte_1rw_32x2048_8_dc_read_lib.out
|       |-- sky130_sram_8kbyte_1rw_32x2048_8_dc_read_lib.tcl
|       |-- sky130_sram_8kbyte_1rw_32x2048_8_genus_read_lib.out
|       `-- sky130_sram_8kbyte_1rw_32x2048_8_genus_read_lib.tcl
|-- manifests
|   `-- v20260610_162230
|       |-- compile_scripts.json
|       `-- memory_manifest.json
|-- outputs
|   |-- dc
|   |   `-- v20260610_162230
|   |       |-- sky130_sram_16kbyte_1rw_32x4096_8
|   |       |   `-- sky130_sram_16kbyte_1rw_32x4096_8.lib
|   |       |-- sky130_sram_1kbyte_1rw_32x256_8
|   |       |   `-- sky130_sram_1kbyte_1rw_32x256_8.lib
|   |       |-- sky130_sram_2kbyte_1rw_32x512_8
|   |       |   `-- sky130_sram_2kbyte_1rw_32x512_8.lib
|   |       |-- sky130_sram_4kbyte_1rw_32x1024_8
|   |       |   `-- sky130_sram_4kbyte_1rw_32x1024_8.lib
|   |       |-- sky130_sram_4kbyte_1rw_64x512_8
|   |       |   `-- sky130_sram_4kbyte_1rw_64x512_8.lib
|   |       `-- sky130_sram_8kbyte_1rw_32x2048_8
|   |           `-- sky130_sram_8kbyte_1rw_32x2048_8.lib
|   |-- design_compiler
|   |   `-- v20260610_162230
|   |       |-- sky130_sram_16kbyte_1rw_32x4096_8
|   |       |   |-- sky130_sram_16kbyte_1rw_32x4096_8.lib
|   |       |   `-- sky130_sram_16kbyte_1rw_32x4096_8.v
|   |       |-- sky130_sram_1kbyte_1rw_32x256_8
|   |       |   |-- sky130_sram_1kbyte_1rw_32x256_8.lib
|   |       |   `-- sky130_sram_1kbyte_1rw_32x256_8.v
|   |       |-- sky130_sram_2kbyte_1rw_32x512_8
|   |       |   |-- sky130_sram_2kbyte_1rw_32x512_8.lib
|   |       |   `-- sky130_sram_2kbyte_1rw_32x512_8.v
|   |       |-- sky130_sram_4kbyte_1rw_32x1024_8
|   |       |   |-- sky130_sram_4kbyte_1rw_32x1024_8.lib
|   |       |   `-- sky130_sram_4kbyte_1rw_32x1024_8.v
|   |       |-- sky130_sram_4kbyte_1rw_64x512_8
|   |       |   |-- sky130_sram_4kbyte_1rw_64x512_8.lib
|   |       |   `-- sky130_sram_4kbyte_1rw_64x512_8.v
|   |       `-- sky130_sram_8kbyte_1rw_32x2048_8
|   |           |-- sky130_sram_8kbyte_1rw_32x2048_8.lib
|   |           `-- sky130_sram_8kbyte_1rw_32x2048_8.v
|   |-- genus
|   |   `-- v20260610_162230
|   |       |-- sky130_sram_16kbyte_1rw_32x4096_8
|   |       |   `-- sky130_sram_16kbyte_1rw_32x4096_8.lib
|   |       |-- sky130_sram_1kbyte_1rw_32x256_8
|   |       |   `-- sky130_sram_1kbyte_1rw_32x256_8.lib
|   |       |-- sky130_sram_2kbyte_1rw_32x512_8
|   |       |   `-- sky130_sram_2kbyte_1rw_32x512_8.lib
|   |       |-- sky130_sram_4kbyte_1rw_32x1024_8
|   |       |   `-- sky130_sram_4kbyte_1rw_32x1024_8.lib
|   |       |-- sky130_sram_4kbyte_1rw_64x512_8
|   |       |   `-- sky130_sram_4kbyte_1rw_64x512_8.lib
|   |       `-- sky130_sram_8kbyte_1rw_32x2048_8
|   |           `-- sky130_sram_8kbyte_1rw_32x2048_8.lib
|   |-- spyglass
|   |   `-- v20260610_162230
|   |       |-- sky130_sram_16kbyte_1rw_32x4096_8
|   |       |   |-- sky130_sram_16kbyte_1rw_32x4096_8.prj
|   |       |   `-- sky130_sram_16kbyte_1rw_32x4096_8.v
|   |       |-- sky130_sram_1kbyte_1rw_32x256_8
|   |       |   |-- sky130_sram_1kbyte_1rw_32x256_8.prj
|   |       |   `-- sky130_sram_1kbyte_1rw_32x256_8.v
|   |       |-- sky130_sram_2kbyte_1rw_32x512_8
|   |       |   |-- sky130_sram_2kbyte_1rw_32x512_8.prj
|   |       |   `-- sky130_sram_2kbyte_1rw_32x512_8.v
|   |       |-- sky130_sram_4kbyte_1rw_32x1024_8
|   |       |   |-- sky130_sram_4kbyte_1rw_32x1024_8.prj
|   |       |   `-- sky130_sram_4kbyte_1rw_32x1024_8.v
|   |       |-- sky130_sram_4kbyte_1rw_64x512_8
|   |       |   |-- sky130_sram_4kbyte_1rw_64x512_8.prj
|   |       |   `-- sky130_sram_4kbyte_1rw_64x512_8.v
|   |       |-- sky130_sram_8kbyte_1rw_32x2048_8
|   |       |   |-- sky130_sram_8kbyte_1rw_32x2048_8.prj
|   |       |   `-- sky130_sram_8kbyte_1rw_32x2048_8.v
|   |       `-- v20260610_162230.prj
|   |-- tessent
|   |   `-- v20260610_162230
|   |       |-- README_TESSENT_INPUTS.txt
|   |       |-- sky130_sram_16kbyte_1rw_32x4096_8
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_16kbyte_1rw_32x4096_8.v
|   |       |-- sky130_sram_1kbyte_1rw_32x256_8
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_1kbyte_1rw_32x256_8.v
|   |       |-- sky130_sram_2kbyte_1rw_32x512_8
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_2kbyte_1rw_32x512_8.v
|   |       |-- sky130_sram_4kbyte_1rw_32x1024_8
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_4kbyte_1rw_32x1024_8.v
|   |       |-- sky130_sram_4kbyte_1rw_64x512_8
|   |       |   |-- README_TESSENT_INPUTS.txt
|   |       |   `-- sky130_sram_4kbyte_1rw_64x512_8.v
|   |       `-- sky130_sram_8kbyte_1rw_32x2048_8
|   |           |-- README_TESSENT_INPUTS.txt
|   |           `-- sky130_sram_8kbyte_1rw_32x2048_8.v
|   `-- verdi
|       `-- v20260610_162230
|           |-- sky130_sram_16kbyte_1rw_32x4096_8
|           |   |-- sky130_sram_16kbyte_1rw_32x4096_8.html
|           |   |-- sky130_sram_16kbyte_1rw_32x4096_8.sp
|           |   `-- sky130_sram_16kbyte_1rw_32x4096_8.v
|           |-- sky130_sram_1kbyte_1rw_32x256_8
|           |   |-- sky130_sram_1kbyte_1rw_32x256_8.html
|           |   |-- sky130_sram_1kbyte_1rw_32x256_8.sp
|           |   `-- sky130_sram_1kbyte_1rw_32x256_8.v
|           |-- sky130_sram_2kbyte_1rw_32x512_8
|           |   |-- sky130_sram_2kbyte_1rw_32x512_8.html
|           |   |-- sky130_sram_2kbyte_1rw_32x512_8.sp
|           |   `-- sky130_sram_2kbyte_1rw_32x512_8.v
|           |-- sky130_sram_4kbyte_1rw_32x1024_8
|           |   |-- sky130_sram_4kbyte_1rw_32x1024_8.html
|           |   |-- sky130_sram_4kbyte_1rw_32x1024_8.sp
|           |   `-- sky130_sram_4kbyte_1rw_32x1024_8.v
|           |-- sky130_sram_4kbyte_1rw_64x512_8
|           |   |-- sky130_sram_4kbyte_1rw_64x512_8.html
|           |   |-- sky130_sram_4kbyte_1rw_64x512_8.sp
|           |   `-- sky130_sram_4kbyte_1rw_64x512_8.v
|           `-- sky130_sram_8kbyte_1rw_32x2048_8
|               |-- sky130_sram_8kbyte_1rw_32x2048_8.html
|               |-- sky130_sram_8kbyte_1rw_32x2048_8.sp
|               `-- sky130_sram_8kbyte_1rw_32x2048_8.v
|-- reports
|   `-- v20260610_162230
|       |-- Sky130_memory_report.md
|       `-- Sky130_memory_report.pdf
|-- scripts
|   |-- compile
|   |   |-- sky130_sram_16kbyte_1rw_32x4096_8.sh
|   |   |-- sky130_sram_1kbyte_1rw_32x256_8.sh
|   |   |-- sky130_sram_2kbyte_1rw_32x512_8.sh
|   |   |-- sky130_sram_4kbyte_1rw_32x1024_8.sh
|   |   |-- sky130_sram_4kbyte_1rw_64x512_8.sh
|   |   `-- sky130_sram_8kbyte_1rw_32x2048_8.sh
|   |-- generate_compile_scripts.py
|   |-- postprocess_and_report.py
|   `-- run_all.sh
`-- work
    `-- openram_builds
        `-- v20260610_162230
            |-- sky130_sram_16kbyte_1rw_32x4096_8
            |-- sky130_sram_1kbyte_1rw_32x256_8
            |-- sky130_sram_2kbyte_1rw_32x512_8
            |-- sky130_sram_4kbyte_1rw_32x1024_8
            |-- sky130_sram_4kbyte_1rw_64x512_8
            `-- sky130_sram_8kbyte_1rw_32x2048_8
```

注：目录树为打包内容的最大深度截断视图（用于展示交付物组织结构）。各 memory 目录内完整文件列表以包内实际内容为准。
