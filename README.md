# Sky130 Memory

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Windows%20%2F%20Linux-blue)](README.md)
[![GitHub Repo](https://img.shields.io/badge/GitHub-openram__sky130__memories-181717?logo=github)](https://github.com/siarch/openram_sky130_memories)

Utilities, configuration sets, extracted references, and delivery artifacts for
SKY130 SRAM generation, real-area closure, multi-tool output organization, and
delivery packaging, with a current focus on 1RW and 1R1W memories.

## Quick Links

- [Repository](https://github.com/siarch/openram_sky130_memories)
- [`configs/`](configs/)
- [`scripts/`](scripts/)
- [`deliverables/`](deliverables/)
- [`LICENSE`](LICENSE)

## What This Repository Contains

- `configs/`: memory matrix inputs used for batch generation and recovery runs
- `scripts/`: remote execution, area probing, recovery, packaging, and doc generation helpers
- `generated_openram_configs/`: historical OpenRAM config samples
- `generated_openram_power_configs/`: power-related generated config samples
- `repo_extracts/OpenRAM-stable/`: extracted upstream OpenRAM source tree for reference and patching
- `deliverables/`: generated packages, reports, manifests, and process evidence

## Current Scope

This repository is used to maintain SKY130 memory-related assets, including:

- SKY130 1RW and 1R1W SRAM generation workflows
- real macro area extraction and `.lib area` backfill
- output organization for Design Compiler, Genus, VCS, Verdi, SpyGlass, and Tessent
- bilingual delivery document generation and package refresh scripts

## Typical Workflow

1. Prepare or update matrix entries in `configs/`
2. Run generation or recovery scripts from `scripts/`
3. Collect real area evidence and update summary files
4. Backfill `.lib area` from validated area data
5. Refresh delivery docs and package contents under `deliverables/`

## Repository Notes

- `AGENTS.md` records workspace rules and delivery constraints
- `CLAUDE.md` records project process guidance and recovery experience
- `CLAUDE.local.md` is intentionally local-only and is ignored by Git
- Historical delivery artifacts are kept in-repo for traceability

## License

Unless otherwise noted, repository-authored scripts, documentation, and glue
code in this repository are released under the [MIT License](LICENSE).

Third-party and upstream components keep their own original copyright and
license terms. In particular:

- `repo_extracts/OpenRAM-stable/` contains OpenRAM upstream material and remains
  under OpenRAM's original copyright and license terms
- any SKY130-related upstream technology or reference material remains under the
  copyright and license terms of the respective SKY130 upstream owners

This repository-level MIT license does not override or relicense third-party
content imported from upstream projects.
