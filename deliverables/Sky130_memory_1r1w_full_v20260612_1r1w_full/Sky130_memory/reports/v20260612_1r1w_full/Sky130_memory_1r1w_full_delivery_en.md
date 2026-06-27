# Sky130 Memory 1R1W Full Delivery Notes (English)

## Delivery Archive

- File name: `Sky130_memory_1r1w_full_v20260612_1r1w_full.tar.gz`
- Delivery version: `v20260612_1r1w_full`
- Scope: only the configuration, scripts, patched source, raw OpenRAM outputs, tool-grouped outputs, logs, manifests, diff reports, and delivery notes for this 1R1W full release.
- Archive root: `/Sky130_memory`
- Documentation format: Markdown and HTML; no additional PDF is generated per the latest request.

## How to Extract

```bash
tar -xzf Sky130_memory_1r1w_full_v20260612_1r1w_full.tar.gz
```

## Target Memory List

- `sky130_sram_128bytes_1r1w_16x64`
- `sky130_sram_128bytes_1r1w_32x32`
- `sky130_sram_128bytes_1r1w_8x128`
- `sky130_sram_16kbytes_1r1w_16x8192`
- `sky130_sram_1kbytes_1r1w_16x512`
- `sky130_sram_2144bytes_1r1w_134x128`
- `sky130_sram_256bytes_1r1w_16x128`
- `sky130_sram_256bytes_1r1w_8x256`
- `sky130_sram_4096bytes_1r1w_256x128`
- `sky130_sram_48bytes_1r1w_6x128`
- `sky130_sram_512bytes_1r1w_16x256`
- `sky130_sram_512bytes_1r1w_32x128`
- `sky130_sram_96bytes_1r1w_24x128`

## Directory and Path Policy

- The canonical synthesis output directory is `outputs/design_compiler`.
- The redundant alias directory `outputs/dc` has been verified and removed.
- `dc_vs_design_compiler_diff.md/json` are preserved in the package for traceability.

## dc vs design_compiler Conclusion

- In `v20260612_1r1w`, `dc` contains 13 files and `design_compiler` contains 26 files.
- All 13 common files are identical in size, modification time, and SHA256.
- `dc` has no unique files, while `design_compiler` adds 13 `.v` files.
- Conclusion: `dc` is only a redundant alias, so `design_compiler` remains the sole canonical directory.

## Multi-Corner .lib Coverage

- This full package delivers independent `.lib` files for 9 PVT scenarios per memory.
- Corner combination: `SS/TT/FF x 0C/25C/100C`.
- Voltage mapping: `SS=1.7V`, `TT=1.8V`, `FF=1.9V`.
- The nominal temperature point remains `25C` to match the existing project baseline.

## View Summary

| Memory | libs | v | vcs_v | sp | lvs_sp | html |
|---|---:|---:|---:|---:|---:|---:|
| sky130_sram_128bytes_1r1w_16x64 | 9 | 1 | 1 | 1 | 1 | 1 |
| sky130_sram_128bytes_1r1w_32x32 | 9 | 1 | 1 | 1 | 1 | 1 |
| sky130_sram_128bytes_1r1w_8x128 | 9 | 1 | 1 | 1 | 1 | 1 |
| sky130_sram_16kbytes_1r1w_16x8192 | 9 | 1 | 1 | 1 | 1 | 1 |
| sky130_sram_1kbytes_1r1w_16x512 | 9 | 1 | 1 | 1 | 1 | 1 |
| sky130_sram_2144bytes_1r1w_134x128 | 9 | 1 | 1 | 1 | 1 | 1 |
| sky130_sram_256bytes_1r1w_16x128 | 9 | 1 | 1 | 1 | 1 | 1 |
| sky130_sram_256bytes_1r1w_8x256 | 9 | 1 | 1 | 1 | 1 | 1 |
| sky130_sram_4096bytes_1r1w_256x128 | 9 | 1 | 1 | 1 | 1 | 1 |
| sky130_sram_48bytes_1r1w_6x128 | 9 | 1 | 1 | 1 | 1 | 1 |
| sky130_sram_512bytes_1r1w_16x256 | 9 | 1 | 1 | 1 | 1 | 1 |
| sky130_sram_512bytes_1r1w_32x128 | 9 | 1 | 1 | 1 | 1 | 1 |
| sky130_sram_96bytes_1r1w_24x128 | 9 | 1 | 1 | 1 | 1 | 1 |

## Real-Area Summary

| Memory | status | width_um | height_um | area_um2 |
|---|---|---:|---:|---:|
| sky130_sram_128bytes_1r1w_16x64 | ok | 334.3800 | 174.0200 | 58188.8076 |
| sky130_sram_128bytes_1r1w_32x32 | ok | 353.8200 | 174.0200 | 61571.7564 |
| sky130_sram_128bytes_1r1w_8x128 | ok | 325.7400 | 185.5300 | 60434.5422 |
| sky130_sram_16kbytes_1r1w_16x8192 | ok | 1139.8200 | 1311.7500 | 1495158.8850 |
| sky130_sram_1kbytes_1r1w_16x512 | ok | 455.7000 | 381.2300 | 173726.5110 |
| sky130_sram_2144bytes_1r1w_134x128 | ok | 936.3200 | 402.6450 | 377004.5664 |
| sky130_sram_256bytes_1r1w_16x128 | ok | 333.8600 | 237.2200 | 79198.2692 |
| sky130_sram_256bytes_1r1w_8x256 | ok | 324.1400 | 248.7300 | 80623.3422 |
| sky130_sram_4096bytes_1r1w_256x128 | ok | 1741.5800 | 470.9650 | 820223.2247 |
| sky130_sram_48bytes_1r1w_6x128 | ok | 289.1000 | 183.0900 | 52931.3190 |
| sky130_sram_512bytes_1r1w_16x256 | ok | 444.9400 | 253.6100 | 112841.2334 |
| sky130_sram_512bytes_1r1w_32x128 | ok | 464.3800 | 240.8250 | 111834.3135 |
| sky130_sram_96bytes_1r1w_24x128 | ok | 399.6600 | 237.2200 | 94807.3452 |

## Physical-View Note

- The full-view path was retried as requested, and the failure evidence is preserved in `full_view_attempts.jsonl` and `logs/v20260612_1r1w_full/`.
- `LEF/GDS/DEF` generation is still blocked by the OpenRAM 1R1W full-mode `replica_column` physical constraint.
- After the retry budget was exhausted, those specific physical views were skipped without blocking multi-corner `.lib`, Verilog, SPICE, or HTML delivery.

## Key Contents in the Package

- `configs/memory_matrix.yaml`: copied requested 1R1W memory matrix.
- `scripts/remote_finalize_1r1w_full.sh`: full-view retry and closure script.
- `scripts/remote_recover_multicorner_1r1w_full.sh`: multi-corner liberty recovery script.
- `scripts/remote_sync_full_outputs.py`: full-output synchronization and reporting script.
- `scripts/analyze_output_aliases.py`: diff analysis script for `dc` vs `design_compiler`.
- `src/OpenRAM-stable/compiler/modules/replica_column.py`: patched source touched in this work.
- `work/openram_builds/v20260612_1r1w_full/`: raw full-version generated outputs per memory.
- `outputs/<tool>/v20260612_1r1w_full/<mem_id>/`: tool-classified archived views, currently including `design_compiler / genus / verdi / spyglass / tessent / vcs`.
- `reports/v20260612_1r1w_full/`: build report, attempt logs, diff report, tree, and these delivery notes.

## Traceability

- Source: `ryan@192.168.49.140:/Sky130_memory`
- Package time: `2026-06-13 10:26:15`
- Total files: `727`
- Total size: `178.4 MB`

## Complete Directory Tree (Inside the Archive)

```text
.
|-- configs
|   |-- memory_matrix.yaml
|   `-- memory_matrix_1r1w_requested.yaml
|-- logs
|   `-- v20260612_1r1w_full
|       |-- sky130_sram_128bytes_1r1w_16x64.attempt1.log
|       |-- sky130_sram_128bytes_1r1w_16x64.attempt2.log
|       |-- sky130_sram_128bytes_1r1w_16x64.attempt3.log
|       |-- sky130_sram_128bytes_1r1w_16x64.multicorner_attempt1.log
|       |-- sky130_sram_128bytes_1r1w_32x32.attempt1.log
|       |-- sky130_sram_128bytes_1r1w_32x32.attempt2.log
|       |-- sky130_sram_128bytes_1r1w_32x32.attempt3.log
|       |-- sky130_sram_128bytes_1r1w_32x32.multicorner_attempt1.log
|       |-- sky130_sram_128bytes_1r1w_8x128.attempt1.log
|       |-- sky130_sram_128bytes_1r1w_8x128.attempt2.log
|       |-- sky130_sram_128bytes_1r1w_8x128.attempt3.log
|       |-- sky130_sram_128bytes_1r1w_8x128.multicorner_attempt1.log
|       |-- sky130_sram_16kbytes_1r1w_16x8192.attempt1.log
|       |-- sky130_sram_16kbytes_1r1w_16x8192.attempt2.log
|       |-- sky130_sram_16kbytes_1r1w_16x8192.attempt3.log
|       |-- sky130_sram_16kbytes_1r1w_16x8192.multicorner_attempt1.log
|       |-- sky130_sram_1kbytes_1r1w_16x512.attempt1.log
|       |-- sky130_sram_1kbytes_1r1w_16x512.attempt2.log
|       |-- sky130_sram_1kbytes_1r1w_16x512.attempt3.log
|       |-- sky130_sram_1kbytes_1r1w_16x512.multicorner_attempt1.log
|       |-- sky130_sram_2144bytes_1r1w_134x128.attempt1.log
|       |-- sky130_sram_2144bytes_1r1w_134x128.attempt2.log
|       |-- sky130_sram_2144bytes_1r1w_134x128.attempt3.log
|       |-- sky130_sram_2144bytes_1r1w_134x128.multicorner_attempt1.log
|       |-- sky130_sram_256bytes_1r1w_16x128.attempt1.log
|       |-- sky130_sram_256bytes_1r1w_16x128.attempt2.log
|       |-- sky130_sram_256bytes_1r1w_16x128.attempt3.log
|       |-- sky130_sram_256bytes_1r1w_16x128.multicorner_attempt1.log
|       |-- sky130_sram_256bytes_1r1w_8x256.attempt1.log
|       |-- sky130_sram_256bytes_1r1w_8x256.attempt2.log
|       |-- sky130_sram_256bytes_1r1w_8x256.attempt3.log
|       |-- sky130_sram_256bytes_1r1w_8x256.multicorner_attempt1.log
|       |-- sky130_sram_4096bytes_1r1w_256x128.attempt1.log
|       |-- sky130_sram_4096bytes_1r1w_256x128.attempt2.log
|       |-- sky130_sram_4096bytes_1r1w_256x128.attempt3.log
|       |-- sky130_sram_4096bytes_1r1w_256x128.multicorner_attempt1.log
|       |-- sky130_sram_48bytes_1r1w_6x128.attempt1.log
|       |-- sky130_sram_48bytes_1r1w_6x128.attempt2.log
|       |-- sky130_sram_48bytes_1r1w_6x128.attempt3.log
|       |-- sky130_sram_48bytes_1r1w_6x128.multicorner_attempt1.log
|       |-- sky130_sram_512bytes_1r1w_16x256.attempt1.log
|       |-- sky130_sram_512bytes_1r1w_16x256.attempt2.log
|       |-- sky130_sram_512bytes_1r1w_16x256.attempt3.log
|       |-- sky130_sram_512bytes_1r1w_16x256.multicorner_attempt1.log
|       |-- sky130_sram_512bytes_1r1w_32x128.attempt1.log
|       |-- sky130_sram_512bytes_1r1w_32x128.attempt2.log
|       |-- sky130_sram_512bytes_1r1w_32x128.attempt3.log
|       |-- sky130_sram_512bytes_1r1w_32x128.multicorner_attempt1.log
|       |-- sky130_sram_96bytes_1r1w_24x128.attempt1.log
|       |-- sky130_sram_96bytes_1r1w_24x128.attempt2.log
|       |-- sky130_sram_96bytes_1r1w_24x128.attempt3.log
|       |-- sky130_sram_96bytes_1r1w_24x128.multicorner_attempt1.log
|       |-- sky130_sram_96bytes_1r1w_24x128.multicorner_attempt2.log
|       `-- sky130_sram_96bytes_1r1w_24x128.multicorner_attempt3.log
|-- manifests
|   `-- v20260612_1r1w_full
|       |-- full_memory_ids.txt
|       `-- full_view_manifest.json
|-- outputs
|   |-- design_compiler
|   |   `-- v20260612_1r1w_full
|   |       |-- sky130_sram_128bytes_1r1w_16x64
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64.v
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_128bytes_1r1w_16x64_TT_1p8V_25C.lib
|   |       |-- sky130_sram_128bytes_1r1w_32x32
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32.v
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_128bytes_1r1w_32x32_TT_1p8V_25C.lib
|   |       |-- sky130_sram_128bytes_1r1w_8x128
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128.v
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_128bytes_1r1w_8x128_TT_1p8V_25C.lib
|   |       |-- sky130_sram_16kbytes_1r1w_16x8192
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.v
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_16kbytes_1r1w_16x8192_TT_1p8V_25C.lib
|   |       |-- sky130_sram_1kbytes_1r1w_16x512
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512.v
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_1kbytes_1r1w_16x512_TT_1p8V_25C.lib
|   |       |-- sky130_sram_2144bytes_1r1w_134x128
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128.v
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_2144bytes_1r1w_134x128_TT_1p8V_25C.lib
|   |       |-- sky130_sram_256bytes_1r1w_16x128
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128.v
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_256bytes_1r1w_16x128_TT_1p8V_25C.lib
|   |       |-- sky130_sram_256bytes_1r1w_8x256
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256.v
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_256bytes_1r1w_8x256_TT_1p8V_25C.lib
|   |       |-- sky130_sram_4096bytes_1r1w_256x128
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128.v
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_4096bytes_1r1w_256x128_TT_1p8V_25C.lib
|   |       |-- sky130_sram_48bytes_1r1w_6x128
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128.v
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_48bytes_1r1w_6x128_TT_1p8V_25C.lib
|   |       |-- sky130_sram_512bytes_1r1w_16x256
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256.v
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_512bytes_1r1w_16x256_TT_1p8V_25C.lib
|   |       |-- sky130_sram_512bytes_1r1w_32x128
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128.v
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_512bytes_1r1w_32x128_TT_1p8V_25C.lib
|   |       `-- sky130_sram_96bytes_1r1w_24x128
|   |           |-- sky130_sram_96bytes_1r1w_24x128.v
|   |           |-- sky130_sram_96bytes_1r1w_24x128_FF_1p9V_0C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_FF_1p9V_100C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_FF_1p9V_25C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_SS_1p7V_0C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_SS_1p7V_100C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_SS_1p7V_25C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_TT_1p8V_0C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_TT_1p8V_100C.lib
|   |           `-- sky130_sram_96bytes_1r1w_24x128_TT_1p8V_25C.lib
|   |-- genus
|   |   `-- v20260612_1r1w_full
|   |       |-- sky130_sram_128bytes_1r1w_16x64
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_16x64_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_128bytes_1r1w_16x64_TT_1p8V_25C.lib
|   |       |-- sky130_sram_128bytes_1r1w_32x32
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_32x32_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_128bytes_1r1w_32x32_TT_1p8V_25C.lib
|   |       |-- sky130_sram_128bytes_1r1w_8x128
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_128bytes_1r1w_8x128_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_128bytes_1r1w_8x128_TT_1p8V_25C.lib
|   |       |-- sky130_sram_16kbytes_1r1w_16x8192
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_16kbytes_1r1w_16x8192_TT_1p8V_25C.lib
|   |       |-- sky130_sram_1kbytes_1r1w_16x512
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_1kbytes_1r1w_16x512_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_1kbytes_1r1w_16x512_TT_1p8V_25C.lib
|   |       |-- sky130_sram_2144bytes_1r1w_134x128
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_2144bytes_1r1w_134x128_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_2144bytes_1r1w_134x128_TT_1p8V_25C.lib
|   |       |-- sky130_sram_256bytes_1r1w_16x128
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_16x128_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_256bytes_1r1w_16x128_TT_1p8V_25C.lib
|   |       |-- sky130_sram_256bytes_1r1w_8x256
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_256bytes_1r1w_8x256_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_256bytes_1r1w_8x256_TT_1p8V_25C.lib
|   |       |-- sky130_sram_4096bytes_1r1w_256x128
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_4096bytes_1r1w_256x128_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_4096bytes_1r1w_256x128_TT_1p8V_25C.lib
|   |       |-- sky130_sram_48bytes_1r1w_6x128
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_48bytes_1r1w_6x128_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_48bytes_1r1w_6x128_TT_1p8V_25C.lib
|   |       |-- sky130_sram_512bytes_1r1w_16x256
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_16x256_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_512bytes_1r1w_16x256_TT_1p8V_25C.lib
|   |       |-- sky130_sram_512bytes_1r1w_32x128
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_FF_1p9V_0C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_FF_1p9V_100C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_FF_1p9V_25C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_SS_1p7V_0C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_SS_1p7V_100C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_SS_1p7V_25C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_TT_1p8V_0C.lib
|   |       |   |-- sky130_sram_512bytes_1r1w_32x128_TT_1p8V_100C.lib
|   |       |   `-- sky130_sram_512bytes_1r1w_32x128_TT_1p8V_25C.lib
|   |       `-- sky130_sram_96bytes_1r1w_24x128
|   |           |-- sky130_sram_96bytes_1r1w_24x128_FF_1p9V_0C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_FF_1p9V_100C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_FF_1p9V_25C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_SS_1p7V_0C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_SS_1p7V_100C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_SS_1p7V_25C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_TT_1p8V_0C.lib
|   |           |-- sky130_sram_96bytes_1r1w_24x128_TT_1p8V_100C.lib
|   |           `-- sky130_sram_96bytes_1r1w_24x128_TT_1p8V_25C.lib
|   |-- spyglass
|   |   `-- v20260612_1r1w_full
|   |       |-- sky130_sram_128bytes_1r1w_16x64
|   |       |   `-- sky130_sram_128bytes_1r1w_16x64.v
|   |       |-- sky130_sram_128bytes_1r1w_32x32
|   |       |   `-- sky130_sram_128bytes_1r1w_32x32.v
|   |       |-- sky130_sram_128bytes_1r1w_8x128
|   |       |   `-- sky130_sram_128bytes_1r1w_8x128.v
|   |       |-- sky130_sram_16kbytes_1r1w_16x8192
|   |       |   `-- sky130_sram_16kbytes_1r1w_16x8192.v
|   |       |-- sky130_sram_1kbytes_1r1w_16x512
|   |       |   `-- sky130_sram_1kbytes_1r1w_16x512.v
|   |       |-- sky130_sram_2144bytes_1r1w_134x128
|   |       |   `-- sky130_sram_2144bytes_1r1w_134x128.v
|   |       |-- sky130_sram_256bytes_1r1w_16x128
|   |       |   `-- sky130_sram_256bytes_1r1w_16x128.v
|   |       |-- sky130_sram_256bytes_1r1w_8x256
|   |       |   `-- sky130_sram_256bytes_1r1w_8x256.v
|   |       |-- sky130_sram_4096bytes_1r1w_256x128
|   |       |   `-- sky130_sram_4096bytes_1r1w_256x128.v
|   |       |-- sky130_sram_48bytes_1r1w_6x128
|   |       |   `-- sky130_sram_48bytes_1r1w_6x128.v
|   |       |-- sky130_sram_512bytes_1r1w_16x256
|   |       |   `-- sky130_sram_512bytes_1r1w_16x256.v
|   |       |-- sky130_sram_512bytes_1r1w_32x128
|   |       |   `-- sky130_sram_512bytes_1r1w_32x128.v
|   |       `-- sky130_sram_96bytes_1r1w_24x128
|   |           `-- sky130_sram_96bytes_1r1w_24x128.v
|   |-- tessent
|   |   `-- v20260612_1r1w_full
|   |       |-- sky130_sram_128bytes_1r1w_16x64
|   |       |   `-- sky130_sram_128bytes_1r1w_16x64.v
|   |       |-- sky130_sram_128bytes_1r1w_32x32
|   |       |   `-- sky130_sram_128bytes_1r1w_32x32.v
|   |       |-- sky130_sram_128bytes_1r1w_8x128
|   |       |   `-- sky130_sram_128bytes_1r1w_8x128.v
|   |       |-- sky130_sram_16kbytes_1r1w_16x8192
|   |       |   `-- sky130_sram_16kbytes_1r1w_16x8192.v
|   |       |-- sky130_sram_1kbytes_1r1w_16x512
|   |       |   `-- sky130_sram_1kbytes_1r1w_16x512.v
|   |       |-- sky130_sram_2144bytes_1r1w_134x128
|   |       |   `-- sky130_sram_2144bytes_1r1w_134x128.v
|   |       |-- sky130_sram_256bytes_1r1w_16x128
|   |       |   `-- sky130_sram_256bytes_1r1w_16x128.v
|   |       |-- sky130_sram_256bytes_1r1w_8x256
|   |       |   `-- sky130_sram_256bytes_1r1w_8x256.v
|   |       |-- sky130_sram_4096bytes_1r1w_256x128
|   |       |   `-- sky130_sram_4096bytes_1r1w_256x128.v
|   |       |-- sky130_sram_48bytes_1r1w_6x128
|   |       |   `-- sky130_sram_48bytes_1r1w_6x128.v
|   |       |-- sky130_sram_512bytes_1r1w_16x256
|   |       |   `-- sky130_sram_512bytes_1r1w_16x256.v
|   |       |-- sky130_sram_512bytes_1r1w_32x128
|   |       |   `-- sky130_sram_512bytes_1r1w_32x128.v
|   |       `-- sky130_sram_96bytes_1r1w_24x128
|   |           `-- sky130_sram_96bytes_1r1w_24x128.v
|   |-- vcs
|   |   `-- v20260612_1r1w_full
|   |       |-- sky130_sram_128bytes_1r1w_16x64
|   |       |   `-- sky130_sram_128bytes_1r1w_16x64.v
|   |       |-- sky130_sram_128bytes_1r1w_32x32
|   |       |   `-- sky130_sram_128bytes_1r1w_32x32.v
|   |       |-- sky130_sram_128bytes_1r1w_8x128
|   |       |   `-- sky130_sram_128bytes_1r1w_8x128.v
|   |       |-- sky130_sram_16kbytes_1r1w_16x8192
|   |       |   `-- sky130_sram_16kbytes_1r1w_16x8192.v
|   |       |-- sky130_sram_1kbytes_1r1w_16x512
|   |       |   `-- sky130_sram_1kbytes_1r1w_16x512.v
|   |       |-- sky130_sram_2144bytes_1r1w_134x128
|   |       |   `-- sky130_sram_2144bytes_1r1w_134x128.v
|   |       |-- sky130_sram_256bytes_1r1w_16x128
|   |       |   `-- sky130_sram_256bytes_1r1w_16x128.v
|   |       |-- sky130_sram_256bytes_1r1w_8x256
|   |       |   `-- sky130_sram_256bytes_1r1w_8x256.v
|   |       |-- sky130_sram_4096bytes_1r1w_256x128
|   |       |   `-- sky130_sram_4096bytes_1r1w_256x128.v
|   |       |-- sky130_sram_48bytes_1r1w_6x128
|   |       |   `-- sky130_sram_48bytes_1r1w_6x128.v
|   |       |-- sky130_sram_512bytes_1r1w_16x256
|   |       |   `-- sky130_sram_512bytes_1r1w_16x256.v
|   |       |-- sky130_sram_512bytes_1r1w_32x128
|   |       |   `-- sky130_sram_512bytes_1r1w_32x128.v
|   |       `-- sky130_sram_96bytes_1r1w_24x128
|   |           `-- sky130_sram_96bytes_1r1w_24x128.v
|   `-- verdi
|       `-- v20260612_1r1w_full
|           |-- sky130_sram_128bytes_1r1w_16x64
|           |   |-- sky130_sram_128bytes_1r1w_16x64.html
|           |   |-- sky130_sram_128bytes_1r1w_16x64.lvs.sp
|           |   |-- sky130_sram_128bytes_1r1w_16x64.sp
|           |   `-- sky130_sram_128bytes_1r1w_16x64.v
|           |-- sky130_sram_128bytes_1r1w_32x32
|           |   |-- sky130_sram_128bytes_1r1w_32x32.html
|           |   |-- sky130_sram_128bytes_1r1w_32x32.lvs.sp
|           |   |-- sky130_sram_128bytes_1r1w_32x32.sp
|           |   `-- sky130_sram_128bytes_1r1w_32x32.v
|           |-- sky130_sram_128bytes_1r1w_8x128
|           |   |-- sky130_sram_128bytes_1r1w_8x128.html
|           |   |-- sky130_sram_128bytes_1r1w_8x128.lvs.sp
|           |   |-- sky130_sram_128bytes_1r1w_8x128.sp
|           |   `-- sky130_sram_128bytes_1r1w_8x128.v
|           |-- sky130_sram_16kbytes_1r1w_16x8192
|           |   |-- sky130_sram_16kbytes_1r1w_16x8192.html
|           |   |-- sky130_sram_16kbytes_1r1w_16x8192.lvs.sp
|           |   |-- sky130_sram_16kbytes_1r1w_16x8192.sp
|           |   `-- sky130_sram_16kbytes_1r1w_16x8192.v
|           |-- sky130_sram_1kbytes_1r1w_16x512
|           |   |-- sky130_sram_1kbytes_1r1w_16x512.html
|           |   |-- sky130_sram_1kbytes_1r1w_16x512.lvs.sp
|           |   |-- sky130_sram_1kbytes_1r1w_16x512.sp
|           |   `-- sky130_sram_1kbytes_1r1w_16x512.v
|           |-- sky130_sram_2144bytes_1r1w_134x128
|           |   |-- sky130_sram_2144bytes_1r1w_134x128.html
|           |   |-- sky130_sram_2144bytes_1r1w_134x128.lvs.sp
|           |   |-- sky130_sram_2144bytes_1r1w_134x128.sp
|           |   `-- sky130_sram_2144bytes_1r1w_134x128.v
|           |-- sky130_sram_256bytes_1r1w_16x128
|           |   |-- sky130_sram_256bytes_1r1w_16x128.html
|           |   |-- sky130_sram_256bytes_1r1w_16x128.lvs.sp
|           |   |-- sky130_sram_256bytes_1r1w_16x128.sp
|           |   `-- sky130_sram_256bytes_1r1w_16x128.v
|           |-- sky130_sram_256bytes_1r1w_8x256
|           |   |-- sky130_sram_256bytes_1r1w_8x256.html
|           |   |-- sky130_sram_256bytes_1r1w_8x256.lvs.sp
|           |   |-- sky130_sram_256bytes_1r1w_8x256.sp
|           |   `-- sky130_sram_256bytes_1r1w_8x256.v
|           |-- sky130_sram_4096bytes_1r1w_256x128
|           |   |-- sky130_sram_4096bytes_1r1w_256x128.html
|           |   |-- sky130_sram_4096bytes_1r1w_256x128.lvs.sp
|           |   |-- sky130_sram_4096bytes_1r1w_256x128.sp
|           |   `-- sky130_sram_4096bytes_1r1w_256x128.v
|           |-- sky130_sram_48bytes_1r1w_6x128
|           |   |-- sky130_sram_48bytes_1r1w_6x128.html
|           |   |-- sky130_sram_48bytes_1r1w_6x128.lvs.sp
|           |   |-- sky130_sram_48bytes_1r1w_6x128.sp
|           |   `-- sky130_sram_48bytes_1r1w_6x128.v
|           |-- sky130_sram_512bytes_1r1w_16x256
|           |   |-- sky130_sram_512bytes_1r1w_16x256.html
|           |   |-- sky130_sram_512bytes_1r1w_16x256.lvs.sp
|           |   |-- sky130_sram_512bytes_1r1w_16x256.sp
|           |   `-- sky130_sram_512bytes_1r1w_16x256.v
|           |-- sky130_sram_512bytes_1r1w_32x128
|           |   |-- sky130_sram_512bytes_1r1w_32x128.html
|           |   |-- sky130_sram_512bytes_1r1w_32x128.lvs.sp
|           |   |-- sky130_sram_512bytes_1r1w_32x128.sp
|           |   `-- sky130_sram_512bytes_1r1w_32x128.v
|           `-- sky130_sram_96bytes_1r1w_24x128
|               |-- sky130_sram_96bytes_1r1w_24x128.html
|               |-- sky130_sram_96bytes_1r1w_24x128.lvs.sp
|               |-- sky130_sram_96bytes_1r1w_24x128.sp
|               `-- sky130_sram_96bytes_1r1w_24x128.v
|-- reports
|   `-- v20260612_1r1w_full
|       |-- dc_vs_design_compiler_diff.json
|       |-- dc_vs_design_compiler_diff.md
|       |-- full_view_attempts.jsonl
|       |-- multicorner_attempts.jsonl
|       |-- package_tree.txt
|       |-- real_area_summary_local.jsonl
|       |-- Sky130_memory_1r1w_full_delivery_en.html
|       |-- Sky130_memory_1r1w_full_delivery_en.md
|       |-- Sky130_memory_1r1w_full_delivery_zh.html
|       |-- Sky130_memory_1r1w_full_delivery_zh.md
|       `-- Sky130_memory_full_build_report.md
|-- scripts
|   |-- analyze_output_aliases.py
|   |-- generate_1r1w_full_delivery_docs.py
|   |-- refresh_full_delivery_package.py
|   |-- remote_finalize_1r1w_full.sh
|   |-- remote_recover_multicorner_1r1w_full.sh
|   `-- remote_sync_full_outputs.py
|-- src
|   `-- OpenRAM-stable
|       `-- compiler
|           `-- modules
|               `-- replica_column.py
`-- work
    |-- openram_builds
    |   `-- v20260612_1r1w_full
    |       |-- sky130_sram_128bytes_1r1w_16x64
    |       |   |-- datasheet.info
    |       |   |-- delay_meas.sp
    |       |   |-- delay_stim.sp
    |       |   |-- functional_meas.sp
    |       |   |-- functional_stim.sp
    |       |   |-- sky130_sram_128bytes_1r1w_16x64.html
    |       |   |-- sky130_sram_128bytes_1r1w_16x64.log
    |       |   |-- sky130_sram_128bytes_1r1w_16x64.lvs.sp
    |       |   |-- sky130_sram_128bytes_1r1w_16x64.py
    |       |   |-- sky130_sram_128bytes_1r1w_16x64.sp
    |       |   |-- sky130_sram_128bytes_1r1w_16x64.v
    |       |   |-- sky130_sram_128bytes_1r1w_16x64_extended.py
    |       |   |-- sky130_sram_128bytes_1r1w_16x64_FF_1p9V_0C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_16x64_FF_1p9V_100C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_16x64_FF_1p9V_25C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_16x64_SS_1p7V_0C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_16x64_SS_1p7V_100C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_16x64_SS_1p7V_25C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_16x64_TT_1p8V_0C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_16x64_TT_1p8V_100C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_16x64_TT_1p8V_25C.lib
    |       |   |-- sram.sp
    |       |   `-- trimmed.sp
    |       |-- sky130_sram_128bytes_1r1w_32x32
    |       |   |-- datasheet.info
    |       |   |-- delay_meas.sp
    |       |   |-- delay_stim.sp
    |       |   |-- functional_meas.sp
    |       |   |-- functional_stim.sp
    |       |   |-- sky130_sram_128bytes_1r1w_32x32.html
    |       |   |-- sky130_sram_128bytes_1r1w_32x32.log
    |       |   |-- sky130_sram_128bytes_1r1w_32x32.lvs.sp
    |       |   |-- sky130_sram_128bytes_1r1w_32x32.py
    |       |   |-- sky130_sram_128bytes_1r1w_32x32.sp
    |       |   |-- sky130_sram_128bytes_1r1w_32x32.v
    |       |   |-- sky130_sram_128bytes_1r1w_32x32_extended.py
    |       |   |-- sky130_sram_128bytes_1r1w_32x32_FF_1p9V_0C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_32x32_FF_1p9V_100C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_32x32_FF_1p9V_25C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_32x32_SS_1p7V_0C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_32x32_SS_1p7V_100C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_32x32_SS_1p7V_25C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_32x32_TT_1p8V_0C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_32x32_TT_1p8V_100C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_32x32_TT_1p8V_25C.lib
    |       |   |-- sram.sp
    |       |   `-- trimmed.sp
    |       |-- sky130_sram_128bytes_1r1w_8x128
    |       |   |-- datasheet.info
    |       |   |-- delay_meas.sp
    |       |   |-- delay_stim.sp
    |       |   |-- functional_meas.sp
    |       |   |-- functional_stim.sp
    |       |   |-- sky130_sram_128bytes_1r1w_8x128.html
    |       |   |-- sky130_sram_128bytes_1r1w_8x128.log
    |       |   |-- sky130_sram_128bytes_1r1w_8x128.lvs.sp
    |       |   |-- sky130_sram_128bytes_1r1w_8x128.py
    |       |   |-- sky130_sram_128bytes_1r1w_8x128.sp
    |       |   |-- sky130_sram_128bytes_1r1w_8x128.v
    |       |   |-- sky130_sram_128bytes_1r1w_8x128_extended.py
    |       |   |-- sky130_sram_128bytes_1r1w_8x128_FF_1p9V_0C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_8x128_FF_1p9V_100C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_8x128_FF_1p9V_25C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_8x128_SS_1p7V_0C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_8x128_SS_1p7V_100C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_8x128_SS_1p7V_25C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_8x128_TT_1p8V_0C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_8x128_TT_1p8V_100C.lib
    |       |   |-- sky130_sram_128bytes_1r1w_8x128_TT_1p8V_25C.lib
    |       |   |-- sram.sp
    |       |   `-- trimmed.sp
    |       |-- sky130_sram_16kbytes_1r1w_16x8192
    |       |   |-- datasheet.info
    |       |   |-- delay_meas.sp
    |       |   |-- delay_stim.sp
    |       |   |-- functional_meas.sp
    |       |   |-- functional_stim.sp
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.html
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.log
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.lvs.sp
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.py
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.sp
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192.v
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_extended.py
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_FF_1p9V_0C.lib
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_FF_1p9V_100C.lib
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_FF_1p9V_25C.lib
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_SS_1p7V_0C.lib
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_SS_1p7V_100C.lib
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_SS_1p7V_25C.lib
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_TT_1p8V_0C.lib
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_TT_1p8V_100C.lib
    |       |   |-- sky130_sram_16kbytes_1r1w_16x8192_TT_1p8V_25C.lib
    |       |   |-- sram.sp
    |       |   `-- trimmed.sp
    |       |-- sky130_sram_1kbytes_1r1w_16x512
    |       |   |-- datasheet.info
    |       |   |-- delay_meas.sp
    |       |   |-- delay_stim.sp
    |       |   |-- functional_meas.sp
    |       |   |-- functional_stim.sp
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512.html
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512.log
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512.lvs.sp
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512.py
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512.sp
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512.v
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512_extended.py
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512_FF_1p9V_0C.lib
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512_FF_1p9V_100C.lib
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512_FF_1p9V_25C.lib
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512_SS_1p7V_0C.lib
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512_SS_1p7V_100C.lib
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512_SS_1p7V_25C.lib
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512_TT_1p8V_0C.lib
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512_TT_1p8V_100C.lib
    |       |   |-- sky130_sram_1kbytes_1r1w_16x512_TT_1p8V_25C.lib
    |       |   |-- sram.sp
    |       |   `-- trimmed.sp
    |       |-- sky130_sram_2144bytes_1r1w_134x128
    |       |   |-- datasheet.info
    |       |   |-- delay_meas.sp
    |       |   |-- delay_stim.sp
    |       |   |-- functional_meas.sp
    |       |   |-- functional_stim.sp
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128.html
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128.log
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128.lvs.sp
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128.py
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128.sp
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128.v
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128_extended.py
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128_FF_1p9V_0C.lib
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128_FF_1p9V_100C.lib
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128_FF_1p9V_25C.lib
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128_SS_1p7V_0C.lib
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128_SS_1p7V_100C.lib
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128_SS_1p7V_25C.lib
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128_TT_1p8V_0C.lib
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128_TT_1p8V_100C.lib
    |       |   |-- sky130_sram_2144bytes_1r1w_134x128_TT_1p8V_25C.lib
    |       |   |-- sram.sp
    |       |   `-- trimmed.sp
    |       |-- sky130_sram_256bytes_1r1w_16x128
    |       |   |-- datasheet.info
    |       |   |-- delay_meas.sp
    |       |   |-- delay_stim.sp
    |       |   |-- functional_meas.sp
    |       |   |-- functional_stim.sp
    |       |   |-- sky130_sram_256bytes_1r1w_16x128.html
    |       |   |-- sky130_sram_256bytes_1r1w_16x128.log
    |       |   |-- sky130_sram_256bytes_1r1w_16x128.lvs.sp
    |       |   |-- sky130_sram_256bytes_1r1w_16x128.py
    |       |   |-- sky130_sram_256bytes_1r1w_16x128.sp
    |       |   |-- sky130_sram_256bytes_1r1w_16x128.v
    |       |   |-- sky130_sram_256bytes_1r1w_16x128_extended.py
    |       |   |-- sky130_sram_256bytes_1r1w_16x128_FF_1p9V_0C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_16x128_FF_1p9V_100C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_16x128_FF_1p9V_25C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_16x128_SS_1p7V_0C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_16x128_SS_1p7V_100C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_16x128_SS_1p7V_25C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_16x128_TT_1p8V_0C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_16x128_TT_1p8V_100C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_16x128_TT_1p8V_25C.lib
    |       |   |-- sram.sp
    |       |   `-- trimmed.sp
    |       |-- sky130_sram_256bytes_1r1w_8x256
    |       |   |-- datasheet.info
    |       |   |-- delay_meas.sp
    |       |   |-- delay_stim.sp
    |       |   |-- functional_meas.sp
    |       |   |-- functional_stim.sp
    |       |   |-- sky130_sram_256bytes_1r1w_8x256.html
    |       |   |-- sky130_sram_256bytes_1r1w_8x256.log
    |       |   |-- sky130_sram_256bytes_1r1w_8x256.lvs.sp
    |       |   |-- sky130_sram_256bytes_1r1w_8x256.py
    |       |   |-- sky130_sram_256bytes_1r1w_8x256.sp
    |       |   |-- sky130_sram_256bytes_1r1w_8x256.v
    |       |   |-- sky130_sram_256bytes_1r1w_8x256_extended.py
    |       |   |-- sky130_sram_256bytes_1r1w_8x256_FF_1p9V_0C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_8x256_FF_1p9V_100C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_8x256_FF_1p9V_25C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_8x256_SS_1p7V_0C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_8x256_SS_1p7V_100C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_8x256_SS_1p7V_25C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_8x256_TT_1p8V_0C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_8x256_TT_1p8V_100C.lib
    |       |   |-- sky130_sram_256bytes_1r1w_8x256_TT_1p8V_25C.lib
    |       |   |-- sram.sp
    |       |   `-- trimmed.sp
    |       |-- sky130_sram_4096bytes_1r1w_256x128
    |       |   |-- datasheet.info
    |       |   |-- delay_meas.sp
    |       |   |-- delay_stim.sp
    |       |   |-- functional_meas.sp
    |       |   |-- functional_stim.sp
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128.html
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128.log
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128.lvs.sp
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128.py
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128.sp
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128.v
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128_extended.py
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128_FF_1p9V_0C.lib
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128_FF_1p9V_100C.lib
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128_FF_1p9V_25C.lib
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128_SS_1p7V_0C.lib
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128_SS_1p7V_100C.lib
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128_SS_1p7V_25C.lib
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128_TT_1p8V_0C.lib
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128_TT_1p8V_100C.lib
    |       |   |-- sky130_sram_4096bytes_1r1w_256x128_TT_1p8V_25C.lib
    |       |   |-- sram.sp
    |       |   `-- trimmed.sp
    |       |-- sky130_sram_48bytes_1r1w_6x128
    |       |   |-- datasheet.info
    |       |   |-- delay_meas.sp
    |       |   |-- delay_stim.sp
    |       |   |-- functional_meas.sp
    |       |   |-- functional_stim.sp
    |       |   |-- sky130_sram_48bytes_1r1w_6x128.html
    |       |   |-- sky130_sram_48bytes_1r1w_6x128.log
    |       |   |-- sky130_sram_48bytes_1r1w_6x128.lvs.sp
    |       |   |-- sky130_sram_48bytes_1r1w_6x128.py
    |       |   |-- sky130_sram_48bytes_1r1w_6x128.sp
    |       |   |-- sky130_sram_48bytes_1r1w_6x128.v
    |       |   |-- sky130_sram_48bytes_1r1w_6x128_extended.py
    |       |   |-- sky130_sram_48bytes_1r1w_6x128_FF_1p9V_0C.lib
    |       |   |-- sky130_sram_48bytes_1r1w_6x128_FF_1p9V_100C.lib
    |       |   |-- sky130_sram_48bytes_1r1w_6x128_FF_1p9V_25C.lib
    |       |   |-- sky130_sram_48bytes_1r1w_6x128_SS_1p7V_0C.lib
    |       |   |-- sky130_sram_48bytes_1r1w_6x128_SS_1p7V_100C.lib
    |       |   |-- sky130_sram_48bytes_1r1w_6x128_SS_1p7V_25C.lib
    |       |   |-- sky130_sram_48bytes_1r1w_6x128_TT_1p8V_0C.lib
    |       |   |-- sky130_sram_48bytes_1r1w_6x128_TT_1p8V_100C.lib
    |       |   |-- sky130_sram_48bytes_1r1w_6x128_TT_1p8V_25C.lib
    |       |   |-- sram.sp
    |       |   `-- trimmed.sp
    |       |-- sky130_sram_512bytes_1r1w_16x256
    |       |   |-- datasheet.info
    |       |   |-- delay_meas.sp
    |       |   |-- delay_stim.sp
    |       |   |-- functional_meas.sp
    |       |   |-- functional_stim.sp
    |       |   |-- sky130_sram_512bytes_1r1w_16x256.html
    |       |   |-- sky130_sram_512bytes_1r1w_16x256.log
    |       |   |-- sky130_sram_512bytes_1r1w_16x256.lvs.sp
    |       |   |-- sky130_sram_512bytes_1r1w_16x256.py
    |       |   |-- sky130_sram_512bytes_1r1w_16x256.sp
    |       |   |-- sky130_sram_512bytes_1r1w_16x256.v
    |       |   |-- sky130_sram_512bytes_1r1w_16x256_extended.py
    |       |   |-- sky130_sram_512bytes_1r1w_16x256_FF_1p9V_0C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_16x256_FF_1p9V_100C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_16x256_FF_1p9V_25C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_16x256_SS_1p7V_0C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_16x256_SS_1p7V_100C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_16x256_SS_1p7V_25C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_16x256_TT_1p8V_0C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_16x256_TT_1p8V_100C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_16x256_TT_1p8V_25C.lib
    |       |   |-- sram.sp
    |       |   `-- trimmed.sp
    |       |-- sky130_sram_512bytes_1r1w_32x128
    |       |   |-- datasheet.info
    |       |   |-- delay_meas.sp
    |       |   |-- delay_stim.sp
    |       |   |-- functional_meas.sp
    |       |   |-- functional_stim.sp
    |       |   |-- sky130_sram_512bytes_1r1w_32x128.html
    |       |   |-- sky130_sram_512bytes_1r1w_32x128.log
    |       |   |-- sky130_sram_512bytes_1r1w_32x128.lvs.sp
    |       |   |-- sky130_sram_512bytes_1r1w_32x128.py
    |       |   |-- sky130_sram_512bytes_1r1w_32x128.sp
    |       |   |-- sky130_sram_512bytes_1r1w_32x128.v
    |       |   |-- sky130_sram_512bytes_1r1w_32x128_extended.py
    |       |   |-- sky130_sram_512bytes_1r1w_32x128_FF_1p9V_0C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_32x128_FF_1p9V_100C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_32x128_FF_1p9V_25C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_32x128_SS_1p7V_0C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_32x128_SS_1p7V_100C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_32x128_SS_1p7V_25C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_32x128_TT_1p8V_0C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_32x128_TT_1p8V_100C.lib
    |       |   |-- sky130_sram_512bytes_1r1w_32x128_TT_1p8V_25C.lib
    |       |   |-- sram.sp
    |       |   `-- trimmed.sp
    |       `-- sky130_sram_96bytes_1r1w_24x128
    |           |-- datasheet.info
    |           |-- delay_meas.sp
    |           |-- delay_stim.sp
    |           |-- functional_meas.sp
    |           |-- functional_stim.sp
    |           |-- sky130_sram_96bytes_1r1w_24x128.html
    |           |-- sky130_sram_96bytes_1r1w_24x128.log
    |           |-- sky130_sram_96bytes_1r1w_24x128.lvs.sp
    |           |-- sky130_sram_96bytes_1r1w_24x128.py
    |           |-- sky130_sram_96bytes_1r1w_24x128.sp
    |           |-- sky130_sram_96bytes_1r1w_24x128.v
    |           |-- sky130_sram_96bytes_1r1w_24x128_extended.py
    |           |-- sky130_sram_96bytes_1r1w_24x128_FF_1p9V_0C.lib
    |           |-- sky130_sram_96bytes_1r1w_24x128_FF_1p9V_100C.lib
    |           |-- sky130_sram_96bytes_1r1w_24x128_FF_1p9V_25C.lib
    |           |-- sky130_sram_96bytes_1r1w_24x128_SS_1p7V_0C.lib
    |           |-- sky130_sram_96bytes_1r1w_24x128_SS_1p7V_100C.lib
    |           |-- sky130_sram_96bytes_1r1w_24x128_SS_1p7V_25C.lib
    |           |-- sky130_sram_96bytes_1r1w_24x128_TT_1p8V_0C.lib
    |           |-- sky130_sram_96bytes_1r1w_24x128_TT_1p8V_100C.lib
    |           |-- sky130_sram_96bytes_1r1w_24x128_TT_1p8V_25C.lib
    |           |-- sram.sp
    |           `-- trimmed.sp
    `-- openram_configs_full
        `-- v20260612_1r1w_full
            |-- sky130_sram_128bytes_1r1w_16x64.py
            |-- sky130_sram_128bytes_1r1w_32x32.py
            |-- sky130_sram_128bytes_1r1w_8x128.py
            |-- sky130_sram_16kbytes_1r1w_16x8192.py
            |-- sky130_sram_1kbytes_1r1w_16x512.py
            |-- sky130_sram_2144bytes_1r1w_134x128.py
            |-- sky130_sram_256bytes_1r1w_16x128.py
            |-- sky130_sram_256bytes_1r1w_8x256.py
            |-- sky130_sram_4096bytes_1r1w_256x128.py
            |-- sky130_sram_48bytes_1r1w_6x128.py
            |-- sky130_sram_512bytes_1r1w_16x256.py
            |-- sky130_sram_512bytes_1r1w_32x128.py
            |-- sky130_sram_96bytes_1r1w_24x128.py
            `-- sky130_sram_common.py
```
