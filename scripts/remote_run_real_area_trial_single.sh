#!/usr/bin/env bash
set -euo pipefail

SRC_CFG="${1:?usage: remote_run_real_area_trial_single.sh <src_cfg> <trial_dir>}"
TRIAL_DIR="${2:?usage: remote_run_real_area_trial_single.sh <src_cfg> <trial_dir>}"

export OPENRAM_ROOT="${OPENRAM_ROOT:-/Sky130_memory/src/OpenRAM-stable}"
export PDK_ROOT="${PDK_ROOT:-/Sky130_memory/pdk}"

mkdir -p "$TRIAL_DIR"
python3 /tmp/rewrite_area_trial_config.py "$SRC_CFG" "$TRIAL_DIR/area_trial.py"
cp /Sky130_memory/work/openram_configs_full/v20260612_1r1w_full/sky130_sram_common.py "$TRIAL_DIR/sky130_sram_common.py"
python3 /tmp/remote_probe_real_area_single.py "$TRIAL_DIR/area_trial.py"
