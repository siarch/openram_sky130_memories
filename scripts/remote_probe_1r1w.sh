#!/usr/bin/env bash
set -euo pipefail

export SKY130_MEMORY_ROOT=/Sky130_memory
export SKY130_MEMORY_VERSION=v20260612_1r1w
export SKY130_MEMORY_NETLIST_ONLY=1

bash /tmp/deploy_sky130_memory.sh >/tmp/deploy_1r1w.log 2>&1
cp /tmp/memory_matrix_1r1w_requested.yaml /Sky130_memory/configs/memory_matrix.yaml
python3 /Sky130_memory/scripts/generate_compile_scripts.py >/tmp/generate_1r1w.log 2>&1

echo "CONFIG_OK"
grep -n "1r1w" /Sky130_memory/configs/memory_matrix.yaml | head -n 5 || true
echo "COMPILE_SCRIPT_CHECK"
ls -1 /Sky130_memory/scripts/compile/sky130_sram_128bytes_1r1w_16x64.sh

echo "RUN_PROBE_START"
bash /Sky130_memory/scripts/compile/sky130_sram_128bytes_1r1w_16x64.sh
echo "RUN_PROBE_DONE"

python3 /Sky130_memory/scripts/postprocess_and_report.py >/tmp/postprocess_1r1w.log 2>&1 || true

echo "PROBE_ARTIFACTS"
find /Sky130_memory/work/openram_builds/"$SKY130_MEMORY_VERSION"/sky130_sram_128bytes_1r1w_16x64 -maxdepth 1 -type f | sort || true
