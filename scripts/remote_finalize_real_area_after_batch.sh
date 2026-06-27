#!/usr/bin/env bash
set -euo pipefail

while pgrep -f remote_batch_probe_real_area_1r1w_full.py >/dev/null 2>&1; do
  sleep 30
done

python3 /tmp/update_lib_area_from_summary.py \
  /Sky130_memory/reports/v20260612_1r1w_full/real_area_summary.jsonl \
  /Sky130_memory
