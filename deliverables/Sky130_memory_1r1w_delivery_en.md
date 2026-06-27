# Sky130 Memory 1R1W Delivery Notes (English)

## Delivery Archive

- File name: `Sky130_memory_1r1w_v20260612_1r1w.tar.gz`
- Delivery version: `v20260612_1r1w`
- Scope: only the configuration, code implementation, compile scripts, raw OpenRAM outputs, tool-classified views, logs, manifests, reports, and delivery notes for this requested 1R1W memory batch.
- Archive root: `/Sky130_memory`

## How to Extract

```bash
tar -xzf Sky130_memory_1r1w_v20260612_1r1w.tar.gz
```

After extraction, the content is organized with `/Sky130_memory` as the relative root. The package excludes historical `1rw` deliverables and does not embed the full PDK.

## Target Memory List

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

## What Is Included

- `VERSION`: version tag for this 1R1W delivery.
- `configs/memory_matrix.yaml`: requested 1R1W memory matrix.
- `src/OpenRAM-stable/compiler/modules/replica_column.py`: patched source implementation for the `netlist_only` 1R1W flow.
- `scripts/generate_compile_scripts.py`, `scripts/postprocess_and_report.py`, `scripts/run_all.sh`: generation and post-processing scripts.
- `scripts/compile/*.sh`: 13 standalone compile scripts for the requested 1R1W memories.
- `work/openram_configs/*.py`: OpenRAM configs for this 1R1W batch plus shared `sky130_sram_common.py`.
- `work/openram_builds/v20260612_1r1w/`: raw OpenRAM outputs per memory (`.v/.lib/.sp/.lvs.sp/.html`, etc.).
- `outputs/<tool>/v20260612_1r1w/<mem_id>/`: archived views grouped by tool.
- `logs/v20260612_1r1w/`: batch logs and DC/Genus `.lib` smoke-check logs.
- `manifests/v20260612_1r1w/`: machine-readable manifests and script inventory.
- `reports/v20260612_1r1w/`: project report, these delivery notes (Markdown/PDF), and the complete directory tree.

## Implementation and Scope Notes

- This package keeps only the 1R1W-related implementation and deliverables for this request.
- Physical backend views such as `LEF/DEF` are intentionally excluded; this release is closed under `netlist_only` for frontend, verification, synthesis, DFT, and power-analysis usage.
- Missing-item flags in the manifest remain the authoritative traceability source for omitted physical views.

## Traceability

- Source: `ryan@192.168.49.140:/Sky130_memory`
- Package time: `2026-06-12 21:14:59`
- Total files: `435`
- Total size: `122.1 MB`

## Complete Directory Tree (Inside the Archive)

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
