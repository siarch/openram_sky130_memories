# Sky130 Memory Delivery Notes (English)

## Delivery Archive

- File name: `Sky130_memory_v20260610_162230.tar.gz`
- 

## How to Extract

```bash
tar -xzf Sky130_memory_v20260610_162230.tar.gz
```

After extraction, the content is organized with `/Sky130_memory` as the relative root (this package contains the deliverable sub-tree, not the full OpenRAM source tree or full PDK).

## What’s Inside

- `configs/memory_matrix.yaml`: memory configuration matrix (extendable).
- `scripts/`: entry scripts and per-memory compile scripts.
- `work/openram_builds/v20260610_162230/`: raw OpenRAM outputs per memory (`.v/.lib/.sp/.html/.lvs.sp`, etc.).
- `outputs/<tool>/v20260610_162230/<mem_id>/`: tool-classified archived views.
- `logs/v20260610_162230/`: compile logs, batch log `run_all.out`, and DC/Genus `.lib` read smoke-check logs.
- `manifests/v20260610_162230/memory_manifest.json`: machine-readable manifest (includes output paths and missing-item flags).
- `reports/v20260610_162230/`: project report (Markdown + PDF).

## Directory Tree (Inside the Archive)

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
|           |-- sky130_sram_1kbyte_1rw_32x256_8
|           |-- sky130_sram_2kbyte_1rw_32x512_8
|           |-- sky130_sram_4kbyte_1rw_32x1024_8
|           |-- sky130_sram_4kbyte_1rw_64x512_8
|           `-- sky130_sram_8kbyte_1rw_32x2048_8
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

Note: the directory tree is a depth-limited view for showing the deliverable structure. Please refer to the actual package content for the full file list inside each memory directory.
