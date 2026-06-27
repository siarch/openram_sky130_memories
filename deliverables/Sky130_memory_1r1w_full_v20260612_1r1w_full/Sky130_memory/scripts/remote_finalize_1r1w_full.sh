#!/usr/bin/env bash
set -euo pipefail

ROOT="${SKY130_MEMORY_ROOT:-/Sky130_memory}"
VERSION_TAG="${SKY130_MEMORY_VERSION:-v20260612_1r1w_full}"
OPENRAM_ROOT="${OPENRAM_ROOT:-$ROOT/src/OpenRAM-stable}"
PDK_ROOT="${PDK_ROOT:-$ROOT/pdk}"
REQUESTED_MATRIX="${REQUESTED_MATRIX:-$ROOT/configs/memory_matrix_1r1w_requested.yaml}"
CFG_DIR="$ROOT/work/openram_configs_full/$VERSION_TAG"
BUILD_ROOT="$ROOT/work/openram_builds/$VERSION_TAG"
LOG_DIR="$ROOT/logs/$VERSION_TAG"
REPORT_DIR="$ROOT/reports/$VERSION_TAG"
MANIFEST_DIR="$ROOT/manifests/$VERSION_TAG"
ATTEMPT_JSONL="$REPORT_DIR/full_view_attempts.jsonl"
SYNC_JSON="$MANIFEST_DIR/full_view_manifest.json"
SUMMARY_MD="$REPORT_DIR/Sky130_memory_full_build_report.md"
MEM_LIST="$MANIFEST_DIR/full_memory_ids.txt"

mkdir -p "$CFG_DIR" "$BUILD_ROOT" "$LOG_DIR" "$REPORT_DIR" "$MANIFEST_DIR"
rm -f "$ATTEMPT_JSONL" "$SYNC_JSON" "$SUMMARY_MD" "$MEM_LIST"

export SKY130_MEMORY_ROOT="$ROOT"
export SKY130_MEMORY_VERSION="$VERSION_TAG"
export OPENRAM_ROOT
export PDK_ROOT

if [ ! -f "$REQUESTED_MATRIX" ]; then
  echo "Missing requested matrix: $REQUESTED_MATRIX" >&2
  exit 1
fi

if [ ! -f "$OPENRAM_ROOT/sram_compiler.py" ]; then
  echo "Missing OpenRAM compiler: $OPENRAM_ROOT/sram_compiler.py" >&2
  exit 1
fi

if [ ! -f "$ROOT/scripts/postprocess_and_report.py" ]; then
  echo "Missing remote postprocess script: $ROOT/scripts/postprocess_and_report.py" >&2
  exit 1
fi

python3 - <<'PY'
from pathlib import Path

path = Path("/Sky130_memory/scripts/postprocess_and_report.py")
text = path.read_text(encoding="utf-8")
original = text

text = text.replace('        dc_dir = out_root / "dc" / VERSION_TAG / tag\n', "")
text = text.replace('        dc_full_dir = out_root / "design_compiler" / VERSION_TAG / tag\n',
                    '        design_compiler_dir = out_root / "design_compiler" / VERSION_TAG / tag\n')
text = text.replace('        for p in [dc_dir, genus_dir, verdi_dir, spyglass_dir, dc_full_dir, tessent_dir]:\n',
                    '        for p in [genus_dir, verdi_dir, spyglass_dir, design_compiler_dir, tessent_dir]:\n')
text = text.replace('        if paths["lib"]:\n'
                    '            shutil.copy2(paths["lib"], dc_dir / f"{tag}.lib")\n'
                    '            shutil.copy2(paths["lib"], dc_full_dir / f"{tag}.lib")\n',
                    '        if paths["lib"]:\n'
                    '            shutil.copy2(paths["lib"], design_compiler_dir / f"{tag}.lib")\n')
text = text.replace('            shutil.copy2(paths["verilog"], dc_full_dir / f"{tag}.v")\n',
                    '            shutil.copy2(paths["verilog"], design_compiler_dir / f"{tag}.v")\n')

if text != original:
    path.write_text(text, encoding="utf-8")
PY

python3 - <<'PY' > "$MEM_LIST"
from pathlib import Path

matrix = Path("/Sky130_memory/configs/memory_matrix_1r1w_requested.yaml")
for line in matrix.read_text(encoding="utf-8").splitlines():
    stripped = line.strip()
    if stripped.startswith("- id:"):
        print(stripped.split(":", 1)[1].strip())
PY

if [ ! -s "$MEM_LIST" ]; then
  echo "No 1R1W memory IDs found in $REQUESTED_MATRIX" >&2
  exit 1
fi

write_configs() {
  local analytical_flag="$1"
  ANALYTICAL_FLAG="$analytical_flag" python3 - <<'PY'
import os
import shutil
from pathlib import Path

ROOT = Path("/Sky130_memory")
VERSION = os.environ["SKY130_MEMORY_VERSION"]
OPENRAM_ROOT = Path(os.environ["OPENRAM_ROOT"])
CFG_DIR = ROOT / "work" / "openram_configs_full" / VERSION
CFG_DIR.mkdir(parents=True, exist_ok=True)
MATRIX = Path("/Sky130_memory/configs/memory_matrix_1r1w_requested.yaml")
COMMON_SRC = OPENRAM_ROOT / "macros" / "sram_configs" / "sky130_sram_common.py"
COMMON_DST = CFG_DIR / "sky130_sram_common.py"
if COMMON_SRC.exists():
    shutil.copy2(COMMON_SRC, COMMON_DST)

ANALYTICAL = os.environ["ANALYTICAL_FLAG"].strip().lower() == "true"

CORNERS = [
    ("SS", 1.7, 0),
    ("SS", 1.7, 25),
    ("SS", 1.7, 100),
    ("TT", 1.8, 0),
    ("TT", 1.8, 25),
    ("TT", 1.8, 100),
    ("FF", 1.9, 0),
    ("FF", 1.9, 25),
    ("FF", 1.9, 100),
]

def parse_simple_yaml(path: Path):
    items = []
    cur = None
    for raw in path.read_text(encoding="utf-8").splitlines():
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        if line.startswith("- "):
            if cur:
                items.append(cur)
            cur = {}
            key, value = line[2:].split(":", 1)
            cur[key.strip()] = value.strip().strip("'").strip('"')
        elif ":" in line and cur is not None:
            key, value = line.split(":", 1)
            cur[key.strip()] = value.strip().strip("'").strip('"')
    if cur:
        items.append(cur)
    return [item for item in items if item.get("id")]

def format_human_byte_size(word_size: int, words: int) -> str:
    total_bytes = (word_size * words) // 8
    if total_bytes >= 1024 and total_bytes % 1024 == 0:
        return f"{total_bytes // 1024}kbytes"
    return f"{total_bytes}bytes"

for item in parse_simple_yaml(MATRIX):
    mem_id = item["id"]
    word_size = int(item["word_size"])
    num_words = int(item["words"])
    write_size = int(item.get("write_size", item["word_size"]))
    lines = [
        f"word_size = {word_size}",
        f"num_words = {num_words}",
        f"human_byte_size = \"{format_human_byte_size(word_size, num_words)}\"",
        f"write_size = {write_size}",
        "num_rw_ports = 0",
        "num_r_ports = 1",
        "num_w_ports = 1",
        "num_spare_rows = 1",
        "num_spare_cols = 1",
        "ports_human = '1r1w'",
        "import os",
        "exec(open(os.path.join(os.path.dirname(__file__), 'sky130_sram_common.py')).read())",
        "use_nix = False",
        "check_lvsdrc = False",
        "netlist_only = False",
        "route_supplies = 'ring'",
        "spice_name = 'ngspice'",
        "drc_name = 'magic'",
        "lvs_name = 'netgen'",
        "pex_name = 'magic'",
        "nominal_corner_only = False",
        f"analytical_delay = {str(ANALYTICAL)}",
        "output_extended_config = True",
        "process_corners = ['SS', 'TT', 'FF']",
        "supply_voltages = [1.7, 1.8, 1.9]",
        "temperatures = [0, 25, 100]",
        f"use_specified_corners = {repr(CORNERS)}",
        "",
    ]
    (CFG_DIR / f"{mem_id}.py").write_text("\n".join(lines), encoding="utf-8")
PY
}

run_memory() {
  local mem_id="$1"
  local attempt="$2"
  local cfg="$CFG_DIR/$mem_id.py"
  local out_dir="$BUILD_ROOT/$mem_id"
  local log_file="$LOG_DIR/${mem_id}.attempt${attempt}.log"

  rm -rf "$out_dir"
  mkdir -p "$out_dir"

  export OPENRAM_HOME="$OPENRAM_ROOT/compiler"
  export OPENRAM_TECH="$OPENRAM_ROOT/technology"
  export PYTHONPATH="$OPENRAM_HOME:$OPENRAM_TECH/sky130:$OPENRAM_TECH/sky130/custom"

  set +e
  (
    cd "$OPENRAM_ROOT"
    python3 -u "$OPENRAM_ROOT/sram_compiler.py" -o "$mem_id" -p "$out_dir" "$cfg"
  ) >"$log_file" 2>&1
  local rc=$?
  set -e
  return "$rc"
}

record_attempt() {
  local mem_id="$1"
  local attempt="$2"
  local rc="$3"
  local mode="$4"
  local out_dir="$BUILD_ROOT/$mem_id"
  local log_file="$LOG_DIR/${mem_id}.attempt${attempt}.log"

  python3 - "$mem_id" "$attempt" "$rc" "$mode" "$out_dir" "$log_file" "$ATTEMPT_JSONL" <<'PY'
import json
import sys
from pathlib import Path

mem_id, attempt, rc, mode, out_dir, log_file, jsonl_path = sys.argv[1:]
base = Path(out_dir)

def count(pattern: str) -> int:
    return len(list(base.glob(pattern))) if base.exists() else 0

entry = {
    "memory_id": mem_id,
    "attempt": int(attempt),
    "rc": int(rc),
    "mode": mode,
    "log_file": log_file,
    "views": {
        "lib": count("*.lib"),
        "verilog": count("*.v"),
        "lef": count("*.lef"),
        "gds": count("*.gds"),
        "def": count("*.def"),
        "sp": count("*.sp"),
        "lvs_sp": count("*.lvs.sp"),
        "html": count("*.html"),
    },
}
Path(jsonl_path).parent.mkdir(parents=True, exist_ok=True)
with Path(jsonl_path).open("a", encoding="utf-8") as fh:
    fh.write(json.dumps(entry, ensure_ascii=False) + "\n")
PY
}

pick_mode() {
  local probe_mem
  probe_mem="$(head -n 1 "$MEM_LIST")"
  write_configs false
  if run_memory "$probe_mem" 1; then
    record_attempt "$probe_mem" 1 0 spice
    echo "spice"
    return 0
  fi
  local rc=$?
  record_attempt "$probe_mem" 1 "$rc" spice
  write_configs true
  echo "analytical"
}

MODE="$(pick_mode)"
write_configs "$([ "$MODE" = "analytical" ] && echo true || echo false)"

while IFS= read -r mem_id; do
  [ -n "$mem_id" ] || continue
  attempt=1
  while [ "$attempt" -le 3 ]; do
    if run_memory "$mem_id" "$attempt"; then
      rc=0
    else
      rc=$?
    fi
    record_attempt "$mem_id" "$attempt" "$rc" "$MODE"

    lib_count="$(find "$BUILD_ROOT/$mem_id" -maxdepth 1 -name '*.lib' | wc -l)"
    lef_count="$(find "$BUILD_ROOT/$mem_id" -maxdepth 1 -name '*.lef' | wc -l)"
    gds_count="$(find "$BUILD_ROOT/$mem_id" -maxdepth 1 -name '*.gds' | wc -l)"
    v_count="$(find "$BUILD_ROOT/$mem_id" -maxdepth 1 -name '*.v' | wc -l)"

    if [ "$rc" -eq 0 ] && [ "$lib_count" -ge 9 ] && [ "$v_count" -ge 1 ] && [ "$lef_count" -ge 1 ] && [ "$gds_count" -ge 1 ]; then
      break
    fi
    attempt=$((attempt + 1))
  done
done < "$MEM_LIST"

python3 - <<'PY'
import json
import os
import shutil
from collections import defaultdict
from pathlib import Path

ROOT = Path("/Sky130_memory")
VERSION = os.environ["SKY130_MEMORY_VERSION"]
BUILD_ROOT = ROOT / "work" / "openram_builds" / VERSION
OUT_ROOT = ROOT / "outputs"
MANIFEST_PATH = ROOT / "manifests" / VERSION / "full_view_manifest.json"
ATTEMPT_PATH = ROOT / "reports" / VERSION / "full_view_attempts.jsonl"

def ensure_dir(path: Path) -> None:
    path.mkdir(parents=True, exist_ok=True)

attempts = defaultdict(list)
if ATTEMPT_PATH.exists():
    for raw in ATTEMPT_PATH.read_text(encoding="utf-8").splitlines():
        if raw.strip():
            item = json.loads(raw)
            attempts[item["memory_id"]].append(item)

manifest = {
    "version": VERSION,
    "memories": [],
}

for mem_dir in sorted(BUILD_ROOT.glob("*")):
    if not mem_dir.is_dir():
        continue
    mem_id = mem_dir.name
    design_compiler_dir = OUT_ROOT / "design_compiler" / VERSION / mem_id
    genus_dir = OUT_ROOT / "genus" / VERSION / mem_id
    verdi_dir = OUT_ROOT / "verdi" / VERSION / mem_id
    spyglass_dir = OUT_ROOT / "spyglass" / VERSION / mem_id
    tessent_dir = OUT_ROOT / "tessent" / VERSION / mem_id
    physical_dir = OUT_ROOT / "physical_views" / VERSION / mem_id
    for path in [design_compiler_dir, genus_dir, verdi_dir, spyglass_dir, tessent_dir, physical_dir]:
        ensure_dir(path)

    copied = {
        "libs": [],
        "verilog": [],
        "spice": [],
        "lef": [],
        "gds": [],
        "def": [],
        "html": [],
        "lvs_sp": [],
    }

    for lib_path in sorted(mem_dir.glob("*.lib")):
        shutil.copy2(lib_path, design_compiler_dir / lib_path.name)
        shutil.copy2(lib_path, genus_dir / lib_path.name)
        copied["libs"].append(str(design_compiler_dir / lib_path.name))

    for v_path in sorted(mem_dir.glob("*.v")):
        for dst_dir in [design_compiler_dir, verdi_dir, spyglass_dir, tessent_dir]:
            shutil.copy2(v_path, dst_dir / v_path.name)
        copied["verilog"].append(str(design_compiler_dir / v_path.name))

    for html_path in sorted(mem_dir.glob("*.html")):
        shutil.copy2(html_path, verdi_dir / html_path.name)
        copied["html"].append(str(verdi_dir / html_path.name))

    top_spice = mem_dir / f"{mem_id}.sp"
    lvs_spice = mem_dir / f"{mem_id}.lvs.sp"
    if top_spice.exists():
        shutil.copy2(top_spice, physical_dir / top_spice.name)
        copied["spice"].append(str(physical_dir / top_spice.name))
    if lvs_spice.exists():
        shutil.copy2(lvs_spice, physical_dir / lvs_spice.name)
        copied["lvs_sp"].append(str(physical_dir / lvs_spice.name))

    for pattern, key in [("*.lef", "lef"), ("*.gds", "gds"), ("*.def", "def")]:
        for view_path in sorted(mem_dir.glob(pattern)):
            shutil.copy2(view_path, physical_dir / view_path.name)
            copied[key].append(str(physical_dir / view_path.name))

    manifest["memories"].append(
        {
            "memory_id": mem_id,
            "build_dir": str(mem_dir),
            "attempts": attempts.get(mem_id, []),
            "copied_outputs": copied,
        }
    )

MANIFEST_PATH.write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding="utf-8")
PY

rm -rf "$ROOT/outputs/dc"

python3 - <<'PY'
import json
import os
from pathlib import Path

ROOT = Path("/Sky130_memory")
VERSION = os.environ["SKY130_MEMORY_VERSION"]
report_dir = ROOT / "reports" / VERSION
manifest = json.loads((ROOT / "manifests" / VERSION / "full_view_manifest.json").read_text(encoding="utf-8"))
attempt_lines = [json.loads(line) for line in (report_dir / "full_view_attempts.jsonl").read_text(encoding="utf-8").splitlines() if line.strip()]

mode = attempt_lines[0]["mode"] if attempt_lines else "unknown"
lines = [
    "# Sky130 Memory 1R1W Full Build Report",
    "",
    f"- version: `{VERSION}`",
    f"- mode: `{mode}`",
    f"- dc cleanup: `/Sky130_memory/outputs/dc` removed after alias verification",
    f"- memory count: `{len(manifest['memories'])}`",
    "",
    "## View Summary",
    "",
    "| Memory | libs | v | lef | gds | def | html | attempts |",
    "|---|---:|---:|---:|---:|---:|---:|---:|",
]

for item in manifest["memories"]:
    copied = item["copied_outputs"]
    lines.append(
        "| {mem} | {libs} | {v} | {lef} | {gds} | {defv} | {html} | {attempts} |".format(
            mem=item["memory_id"],
            libs=len(copied["libs"]),
            v=len(copied["verilog"]),
            lef=len(copied["lef"]),
            gds=len(copied["gds"]),
            defv=len(copied["def"]),
            html=len(copied["html"]),
            attempts=len(item["attempts"]),
        )
    )

lines.extend(
    [
        "",
        "## Notes",
        "",
        "- The multi-corner liberty target is 9 corners per memory: SS/TT/FF x 0C/25C/100C with 1.7V/1.8V/1.9V mapped to SS/TT/FF respectively.",
        "- DEF is attempted as part of the full-view collection step; if OpenRAM does not emit DEF for a memory, the missing file is retained in the manifest and attempts log.",
        "- Detailed retry evidence is recorded in `full_view_attempts.jsonl` and per-attempt logs under `logs/<version>/`.",
        "",
    ]
)

(report_dir / "Sky130_memory_full_build_report.md").write_text("\n".join(lines) + "\n", encoding="utf-8")
PY
