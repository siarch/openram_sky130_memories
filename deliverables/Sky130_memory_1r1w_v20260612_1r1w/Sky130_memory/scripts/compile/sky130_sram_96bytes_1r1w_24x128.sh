#!/usr/bin/env bash
set -euo pipefail
ROOT="/Sky130_memory"
VERSION_TAG="v20260612_1r1w"
MEM_ID="sky130_sram_96bytes_1r1w_24x128"
OPENRAM_ROOT="/Sky130_memory/src/OpenRAM-stable"
PDK_ROOT="/Sky130_memory/pdk"
CFG="/Sky130_memory/work/openram_configs/sky130_sram_96bytes_1r1w_24x128.py"
OUT_DIR="/Sky130_memory/work/openram_builds/v20260612_1r1w/sky130_sram_96bytes_1r1w_24x128"
LOG="/Sky130_memory/logs/v20260612_1r1w/sky130_sram_96bytes_1r1w_24x128.log"
mkdir -p "$OUT_DIR"
export OPENRAM_HOME="$OPENRAM_ROOT/compiler"
export OPENRAM_TECH="$OPENRAM_ROOT/technology"
export PYTHONPATH="$OPENRAM_HOME:$OPENRAM_TECH/sky130:$OPENRAM_TECH/sky130/custom"
export PDK_ROOT
cd "$OPENRAM_ROOT"
START_TS=$(date +%s)
echo "START=$(date -Iseconds)" | tee "$LOG"
echo "MEM_ID=$MEM_ID" | tee -a "$LOG"
echo "CFG=$CFG" | tee -a "$LOG"
echo "OUT_DIR=$OUT_DIR" | tee -a "$LOG"
python3 -u "$OPENRAM_ROOT/sram_compiler.py" -o "$MEM_ID" -p "$OUT_DIR" "$CFG" 2>&1 | tee -a "$LOG"
END_TS=$(date +%s)
echo "END=$(date -Iseconds)" | tee -a "$LOG"
echo "ELAPSED_SEC=$((END_TS-START_TS))" | tee -a "$LOG"
