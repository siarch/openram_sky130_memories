#!/usr/bin/env bash
set -euo pipefail

export SKY130_MEMORY_ROOT=/Sky130_memory
export SKY130_MEMORY_VERSION=v20260612_1r1w
export SKY130_MEMORY_NETLIST_ONLY=1

summary="/tmp/batch_1r1w_summary.tsv"
: > "$summary"

while IFS= read -r script_path; do
    [ -f "$script_path" ] || continue
    mem_id="$(basename "$script_path" .sh)"
    echo "RUN $mem_id"
    if bash "$script_path" >"/tmp/${mem_id}.batch.log" 2>&1; then
        echo -e "${mem_id}\tOK" >> "$summary"
    else
        rc=$?
        echo -e "${mem_id}\tFAIL(${rc})" >> "$summary"
    fi
done < <(find /Sky130_memory/scripts/compile -maxdepth 1 -type f -name '*.sh' | sort)

python3 /Sky130_memory/scripts/postprocess_and_report.py >/tmp/postprocess_batch_1r1w.log 2>&1 || true

echo "BATCH_SUMMARY"
cat "$summary"
