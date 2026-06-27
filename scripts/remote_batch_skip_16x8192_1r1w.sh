#!/usr/bin/env bash
set -euo pipefail

export SKY130_MEMORY_ROOT=/Sky130_memory
export SKY130_MEMORY_VERSION=v20260612_1r1w
export SKY130_MEMORY_NETLIST_ONLY=1

summary="/tmp/batch_skip_16x8192_1r1w_summary.tsv"
: > "$summary"

while IFS= read -r script_path; do
    [ -f "$script_path" ] || continue
    mem_id="$(basename "$script_path" .sh)"
    if [ "$mem_id" = "sky130_sram_16kbytes_1r1w_16x8192" ]; then
        echo -e "${mem_id}\tSKIPPED_LONGRUN" >> "$summary"
        continue
    fi
    echo "RUN $mem_id"
    if timeout 180 bash "$script_path" >"/tmp/${mem_id}.skip.log" 2>&1; then
        echo -e "${mem_id}\tOK" >> "$summary"
    else
        rc=$?
        if [ "$rc" -eq 124 ]; then
            echo -e "${mem_id}\tTIMEOUT" >> "$summary"
        else
            echo -e "${mem_id}\tFAIL(${rc})" >> "$summary"
        fi
    fi
done < <(find /Sky130_memory/scripts/compile -maxdepth 1 -type f -name '*.sh' | sort)

python3 /Sky130_memory/scripts/postprocess_and_report.py >/tmp/postprocess_skip_16x8192_1r1w.log 2>&1 || true

cat "$summary"
