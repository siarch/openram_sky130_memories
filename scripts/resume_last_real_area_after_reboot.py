#!/usr/bin/env python3
from __future__ import annotations

import subprocess
import sys
from pathlib import Path


HOST = "ryan@192.168.49.140"
ROOT = "/Sky130_memory"
VERSION = "v20260612_1r1w_full"
MEM_ID = "sky130_sram_4096bytes_1r1w_256x128"


def run(
    cmd: list[str],
    *,
    check: bool = True,
    input_text: str | None = None,
) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        cmd,
        check=check,
        text=True,
        capture_output=True,
        input=input_text,
    )


def main() -> int:
    repo_root = Path(__file__).resolve().parents[1]
    probe_script = repo_root / "scripts" / "remote_probe_real_area_single.py"
    update_script = repo_root / "scripts" / "update_lib_area_from_summary.py"

    try:
        ping = run(["ssh", "-o", "ConnectTimeout=10", HOST, "echo", "SSH_OK"])
        print(ping.stdout.strip())
    except subprocess.CalledProcessError as exc:
        sys.stderr.write(exc.stderr)
        return exc.returncode or 1

    for src, dst in [
        (probe_script, f"{HOST}:/tmp/remote_probe_real_area_single.py"),
        (update_script, f"{HOST}:/tmp/update_lib_area_from_summary.py"),
    ]:
        cp = run(["scp", str(src), dst])
        if cp.stdout.strip():
            print(cp.stdout.strip())
        if cp.stderr.strip():
            print(cp.stderr.strip(), file=sys.stderr)

    remote_script = f"""\
set -eu

ROOT="{ROOT}"
VERSION="{VERSION}"
MEM_ID="{MEM_ID}"
SUMMARY="$ROOT/reports/$VERSION/real_area_summary.jsonl"
TRIAL_DIR="$ROOT/work/openram_area_trials/$VERSION/$MEM_ID"
BUILD_DIR="$ROOT/work/openram_builds/$VERSION/$MEM_ID"
CFG_SRC="$BUILD_DIR/$MEM_ID.py"
CFG_DST="$TRIAL_DIR/area_trial.py"
COMMON_SRC="$ROOT/work/openram_configs_full/$VERSION/sky130_sram_common.py"

mkdir -p "$TRIAL_DIR" "$ROOT/reports/$VERSION"

if [ -f "$TRIAL_DIR/area_result.json" ]; then
  echo "__EXISTING_AREA_RESULT__"
  cat "$TRIAL_DIR/area_result.json"
fi

if python3 - "$TRIAL_DIR/area_result.json" <<'PY'
import json
import sys
from pathlib import Path

path = Path(sys.argv[1])
if not path.exists():
    raise SystemExit(1)
rec = json.loads(path.read_text(encoding="utf-8"))
if rec.get("status") != "OK":
    raise SystemExit(1)
PY
then
  status=0
else
  status=$?
fi

if [ "$status" -ne 0 ]; then
  cp "$CFG_SRC" "$CFG_DST"
  cp "$COMMON_SRC" "$TRIAL_DIR/sky130_sram_common.py"
  chmod +x /tmp/remote_probe_real_area_single.py
  OPENRAM_ROOT="${{OPENRAM_ROOT:-$ROOT/src/OpenRAM-stable}}" \\
  PDK_ROOT="${{PDK_ROOT:-$ROOT/pdk}}" \\
  python3 /tmp/remote_probe_real_area_single.py "$CFG_DST"
fi

python3 - "$TRIAL_DIR" <<'PY'
import json
import re
import sys
from pathlib import Path

trial_dir = Path(sys.argv[1])
area_result = trial_dir / "area_result.json"
if area_result.exists():
    rec = json.loads(area_result.read_text(encoding="utf-8"))
    if rec.get("status") == "OK":
        raise SystemExit(0)

latest = None
latest_log = None
for log_path in sorted(trial_dir.glob("*.log")):
    text = log_path.read_text(encoding="utf-8", errors="replace")
    matches = re.findall(r"Size:\\s*([0-9.]+)\\s*x\\s*([0-9.]+)", text)
    if matches:
        width, height = matches[-1]
        latest = (float(width), float(height))
        latest_log = str(log_path)

if latest is None:
    raise SystemExit("bbox was not found in trial logs")

width, height = latest
rec = {{
    "status": "OK",
    "width_um": width,
    "height_um": height,
    "area_um2": width * height,
    "log_path": latest_log,
}}
area_result.write_text(json.dumps(rec, ensure_ascii=True, indent=2) + "\n", encoding="utf-8")
print(json.dumps(rec, ensure_ascii=True))
PY

python3 - "$SUMMARY" "$MEM_ID" "$TRIAL_DIR" <<'PY'
import json
import sys
from pathlib import Path

summary = Path(sys.argv[1])
mem_id = sys.argv[2]
trial_dir = Path(sys.argv[3])
area_result = trial_dir / "area_result.json"
rec = json.loads(area_result.read_text(encoding="utf-8"))
if rec.get("status") != "OK":
    raise SystemExit(f"area_result is not OK: {{rec}}")

rows = []
if summary.exists():
    for raw in summary.read_text(encoding="utf-8").splitlines():
        if not raw.strip():
            continue
        item = json.loads(raw)
        if item.get("memory_id") == mem_id:
            continue
        rows.append(item)

rows.append(
    {{
        "memory_id": mem_id,
        "status": "ok",
        "width_um": float(rec["width_um"]),
        "height_um": float(rec["height_um"]),
        "area_um2": float(rec["area_um2"]),
        "rc": 0,
        "trial_dir": str(trial_dir),
        "log_path": None,
    }}
)

summary.write_text(
    "\\n".join(json.dumps(item, ensure_ascii=True) for item in rows) + "\\n",
    encoding="utf-8",
)
print(json.dumps(rows[-1], ensure_ascii=True))
PY

chmod +x /tmp/update_lib_area_from_summary.py
python3 /tmp/update_lib_area_from_summary.py "$SUMMARY" "$ROOT"

echo "__FINAL_SUMMARY_TAIL__"
tail -n 3 "$SUMMARY"
"""
    remote_script = remote_script.replace("\r\n", "\n")

    ssh = subprocess.run(
        ["ssh", HOST, "bash", "-s"],
        check=False,
        input=remote_script.encode("utf-8"),
        capture_output=True,
    )
    stdout = ssh.stdout.decode("utf-8", errors="replace")
    stderr = ssh.stderr.decode("utf-8", errors="replace")
    if stdout.strip():
        print(stdout)
    if stderr.strip():
        print(stderr, file=sys.stderr)
    return ssh.returncode


if __name__ == "__main__":
    raise SystemExit(main())
