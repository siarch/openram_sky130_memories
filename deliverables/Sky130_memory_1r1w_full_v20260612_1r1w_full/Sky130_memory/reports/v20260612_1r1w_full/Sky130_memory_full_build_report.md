# Sky130 Memory 1R1W Full Build Report

- version: `v20260612_1r1w_full`
- mode: `spice`
- dc cleanup: `/Sky130_memory/outputs/dc` removed after alias verification
- memory count: `13`

## View Summary

| Memory | libs | v | lef | gds | def | html | attempts |
|---|---:|---:|---:|---:|---:|---:|---:|
| sky130_sram_128bytes_1r1w_16x64 | 9 | 1 | 0 | 0 | 0 | 1 | 4 |
| sky130_sram_128bytes_1r1w_32x32 | 9 | 1 | 0 | 0 | 0 | 1 | 3 |
| sky130_sram_128bytes_1r1w_8x128 | 9 | 1 | 0 | 0 | 0 | 1 | 3 |
| sky130_sram_16kbytes_1r1w_16x8192 | 9 | 1 | 0 | 0 | 0 | 1 | 3 |
| sky130_sram_1kbytes_1r1w_16x512 | 9 | 1 | 0 | 0 | 0 | 1 | 3 |
| sky130_sram_2144bytes_1r1w_134x128 | 9 | 1 | 0 | 0 | 0 | 1 | 3 |
| sky130_sram_256bytes_1r1w_16x128 | 9 | 1 | 0 | 0 | 0 | 1 | 3 |
| sky130_sram_256bytes_1r1w_8x256 | 9 | 1 | 0 | 0 | 0 | 1 | 3 |
| sky130_sram_4096bytes_1r1w_256x128 | 9 | 1 | 0 | 0 | 0 | 1 | 3 |
| sky130_sram_48bytes_1r1w_6x128 | 9 | 1 | 0 | 0 | 0 | 1 | 3 |
| sky130_sram_512bytes_1r1w_16x256 | 9 | 1 | 0 | 0 | 0 | 1 | 3 |
| sky130_sram_512bytes_1r1w_32x128 | 9 | 1 | 0 | 0 | 0 | 1 | 3 |
| sky130_sram_96bytes_1r1w_24x128 | 9 | 1 | 0 | 0 | 0 | 1 | 3 |

## Notes

- The multi-corner liberty target is 9 corners per memory: SS/TT/FF x 0C/25C/100C with 1.7V/1.8V/1.9V mapped to SS/TT/FF respectively.
- DEF is attempted as part of the full-view collection step; if OpenRAM does not emit DEF for a memory, the missing file is retained in the manifest and attempts log.
- Detailed retry evidence is recorded in `full_view_attempts.jsonl` and per-attempt logs under `logs/<version>/`.

