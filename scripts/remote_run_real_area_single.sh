#!/usr/bin/env bash
set -euo pipefail

export OPENRAM_ROOT="${OPENRAM_ROOT:-/Sky130_memory/src/OpenRAM-stable}"
export PDK_ROOT="${PDK_ROOT:-/Sky130_memory/pdk}"

CFG="${1:?usage: remote_run_real_area_single.sh <config_py>}"

python3 /tmp/remote_probe_real_area_single.py "$CFG"
