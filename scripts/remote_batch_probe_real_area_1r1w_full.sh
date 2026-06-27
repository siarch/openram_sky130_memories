#!/usr/bin/env bash
set -euo pipefail

ROOT="${SKY130_MEMORY_ROOT:-/Sky130_memory}"
VERSION_TAG="${SKY130_MEMORY_VERSION:-v20260612_1r1w_full}"
MATRIX="${REQUESTED_MATRIX:-$ROOT/configs/memory_matrix_1r1w_requested.yaml}"
BUILD_ROOT="$ROOT/work/openram_builds/$VERSION_TAG"
TRIAL_ROOT="$ROOT/work/openram_area_trials/$VERSION_TAG"
SUMMARY_JSONL="$ROOT/reports/$VERSION_TAG/real_area_summary.jsonl"
SUMMARY_TSV="$ROOT/reports/$VERSION_TAG/real_area_summary.tsv"

export OPENRAM_ROOT="${OPENRAM_ROOT:-$ROOT/src/OpenRAM-stable}"
export PDK_ROOT="${PDK_ROOT:-$ROOT/pdk}"

mkdir -p "$TRIAL_ROOT" "$(dirname "$SUMMARY_JSONL")"
: >"$SUMMARY_JSONL"
printf "memory_id\tstatus\twidth_um\theight_um\tarea_um2\trc\ttrial_dir\n" >"$SUMMARY_TSV"

python3 - "$MATRIX" <<'PY' > /tmp/real_area_mem_ids.txt
from pathlib import Path
import sys

matrix = Path(sys.argv[1])
cur = None
for raw in matrix.read_text(encoding="utf-8").splitlines():
    line = raw.rstrip()
    if not line.strip() or line.lstrip().startswith("#"):
        continue
    if line.startswith("  - "):
        if cur and cur.get("id"):
            print(cur["id"])
        cur = {}
        rest = line[4:]
        if rest.startswith("id:"):
            cur["id"] = rest.split(":", 1)[1].strip()
        continue
    if cur is None or not line.startswith("    "):
        continue
    if ":" not in line:
        continue
    k, v = line.strip().split(":", 1)
    cur[k.strip()] = v.strip().strip("'\"")
if cur and cur.get("id"):
    print(cur["id"])
PY

while IFS= read -r mem_id; do
    src_cfg="$BUILD_ROOT/$mem_id/$mem_id.py"
    trial_dir="$TRIAL_ROOT/$mem_id"
    rm -rf "$trial_dir"
    mkdir -p "$trial_dir"
    python3 /tmp/rewrite_area_trial_config.py "$src_cfg" "$trial_dir/area_trial.py"
    cp "$ROOT/work/openram_configs_full/$VERSION_TAG/sky130_sram_common.py" "$trial_dir/sky130_sram_common.py"

    rc=0
    if ! timeout 3600 python3 /tmp/remote_probe_real_area_single.py "$trial_dir/area_trial.py" >"$trial_dir/stdout.log" 2>&1; then
        rc=$?
    fi

    python3 - "$mem_id" "$trial_dir" "$rc" "$SUMMARY_JSONL" "$SUMMARY_TSV" <<'PY'
from pathlib import Path
import json
import re
import sys

mem_id = sys.argv[1]
trial_dir = Path(sys.argv[2])
rc = int(sys.argv[3])
summary_jsonl = Path(sys.argv[4])
summary_tsv = Path(sys.argv[5])

macro_logs = sorted(p for p in trial_dir.glob("*.log") if p.name != "stdout.log")
log_path = macro_logs[0] if macro_logs else None
width = height = area = None
bbox_line = ""
if log_path and log_path.exists():
    text = log_path.read_text(encoding="utf-8", errors="replace")
    matches = re.findall(r"Size:\s*([0-9.]+)\s*x\s*([0-9.]+)", text)
    if matches:
        width = float(matches[-1][0])
        height = float(matches[-1][1])
        area = width * height
        bbox_line = matches[-1][0] + "x" + matches[-1][1]

status = "ok" if width is not None and height is not None else "fail"
record = {
    "memory_id": mem_id,
    "status": status,
    "width_um": width,
    "height_um": height,
    "area_um2": area,
    "rc": rc,
    "trial_dir": str(trial_dir),
    "log_path": str(log_path) if log_path else None,
    "bbox": bbox_line,
}
with summary_jsonl.open("a", encoding="utf-8") as fp:
    fp.write(json.dumps(record, ensure_ascii=True) + "\n")
with summary_tsv.open("a", encoding="utf-8") as fp:
    fp.write(f"{mem_id}\t{status}\t{width or ''}\t{height or ''}\t{area or ''}\t{rc}\t{trial_dir}\n")
print(json.dumps(record, ensure_ascii=True))
PY
done < /tmp/real_area_mem_ids.txt
