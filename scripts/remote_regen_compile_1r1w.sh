#!/usr/bin/env bash
set -euo pipefail

export SKY130_MEMORY_ROOT=/Sky130_memory
export SKY130_MEMORY_VERSION=v20260612_1r1w
export SKY130_MEMORY_NETLIST_ONLY=1

rm -f /Sky130_memory/scripts/compile/*.sh
cp /tmp/memory_matrix_1r1w_requested.yaml /Sky130_memory/configs/memory_matrix.yaml
python3 /Sky130_memory/scripts/generate_compile_scripts.py

echo "COMPILE_COUNT"
find /Sky130_memory/scripts/compile -maxdepth 1 -type f -name '*.sh' | wc -l
echo "COMPILE_LIST"
find /Sky130_memory/scripts/compile -maxdepth 1 -type f -name '*.sh' | sort
