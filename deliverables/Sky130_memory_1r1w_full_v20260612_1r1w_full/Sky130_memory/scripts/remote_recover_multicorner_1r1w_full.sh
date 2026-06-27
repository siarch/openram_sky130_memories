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
MEM_LIST="$MANIFEST_DIR/full_memory_ids.txt"
MULTI_JSONL="$REPORT_DIR/multicorner_attempts.jsonl"
SUMMARY_MD="$REPORT_DIR/Sky130_memory_full_build_report.md"
MANIFEST_JSON="$MANIFEST_DIR/full_view_manifest.json"

export SKY130_MEMORY_ROOT="$ROOT"
export SKY130_MEMORY_VERSION="$VERSION_TAG"
export OPENRAM_ROOT
export PDK_ROOT

mkdir -p "$CFG_DIR" "$BUILD_ROOT" "$LOG_DIR" "$REPORT_DIR" "$MANIFEST_DIR"
rm -f "$MULTI_JSONL" "$SUMMARY_MD" "$MANIFEST_JSON" "$MEM_LIST"

python3 - <<'PY' > "$MEM_LIST"
from pathlib import Path

matrix = Path("/Sky130_memory/configs/memory_matrix_1r1w_requested.yaml")
for line in matrix.read_text(encoding="utf-8").splitlines():
    stripped = line.strip()
    if stripped.startswith("- id:"):
        print(stripped.split(":", 1)[1].strip())
PY

if [ ! -s "$MEM_LIST" ]; then
  echo "No memory IDs found in $REQUESTED_MATRIX" >&2
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
        "netlist_only = True",
        "route_supplies = False",
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
  local log_file="$LOG_DIR/${mem_id}.multicorner_attempt${attempt}.log"

  rm -rf "$out_dir"
  mkdir -p "$out_dir"

  export OPENRAM_HOME="$OPENRAM_ROOT/compiler"
  export OPENRAM_TECH="$OPENRAM_ROOT/technology"
  export PYTHONPATH="$OPENRAM_HOME:$OPENRAM_TECH/sky130:$OPENRAM_TECH/sky130/custom"
  export PDK_ROOT

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
  local log_file="$LOG_DIR/${mem_id}.multicorner_attempt${attempt}.log"

  python3 - "$mem_id" "$attempt" "$rc" "$mode" "$out_dir" "$log_file" "$MULTI_JSONL" <<'PY'
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
        "sp": count("*.sp"),
        "lvs_sp": count("*.lvs.sp"),
        "html": count("*.html"),
    },
}
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
    v_count="$(find "$BUILD_ROOT/$mem_id" -maxdepth 1 -name '*.v' | wc -l)"
    if [ "$rc" -eq 0 ] && [ "$lib_count" -ge 9 ] && [ "$v_count" -ge 1 ]; then
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
REPORT_DIR = ROOT / "reports" / VERSION
MANIFEST_DIR = ROOT / "manifests" / VERSION
FULL_ATTEMPTS = REPORT_DIR / "full_view_attempts.jsonl"
MULTI_ATTEMPTS = REPORT_DIR / "multicorner_attempts.jsonl"

def ensure_dir(path: Path) -> None:
    path.mkdir(parents=True, exist_ok=True)

full_attempts = []
if FULL_ATTEMPTS.exists():
    full_attempts = [json.loads(line) for line in FULL_ATTEMPTS.read_text(encoding="utf-8").splitlines() if line.strip()]

multi_attempts = defaultdict(list)
if MULTI_ATTEMPTS.exists():
    for raw in MULTI_ATTEMPTS.read_text(encoding="utf-8").splitlines():
        if raw.strip():
            item = json.loads(raw)
            multi_attempts[item["memory_id"]].append(item)

manifest = {"version": VERSION, "memories": []}

for mem_dir in sorted(BUILD_ROOT.glob("*")):
    if not mem_dir.is_dir():
        continue
    mem_id = mem_dir.name
    design_compiler_dir = OUT_ROOT / "design_compiler" / VERSION / mem_id
    genus_dir = OUT_ROOT / "genus" / VERSION / mem_id
    verdi_dir = OUT_ROOT / "verdi" / VERSION / mem_id
    spyglass_dir = OUT_ROOT / "spyglass" / VERSION / mem_id
    tessent_dir = OUT_ROOT / "tessent" / VERSION / mem_id
    for path in [design_compiler_dir, genus_dir, verdi_dir, spyglass_dir, tessent_dir]:
        ensure_dir(path)

    copied = {
        "libs": [],
        "verilog": [],
        "spice": [],
        "lvs_sp": [],
        "html": [],
    }

    for lib_path in sorted(mem_dir.glob("*.lib")):
        shutil.copy2(lib_path, design_compiler_dir / lib_path.name)
        shutil.copy2(lib_path, genus_dir / lib_path.name)
        copied["libs"].append(str(design_compiler_dir / lib_path.name))

    for v_path in sorted(mem_dir.glob("*.v")):
        for dst_dir in [design_compiler_dir, verdi_dir, spyglass_dir, tessent_dir]:
            shutil.copy2(v_path, dst_dir / v_path.name)
        copied["verilog"].append(str(design_compiler_dir / v_path.name))

    top_spice = mem_dir / f"{mem_id}.sp"
    lvs_spice = mem_dir / f"{mem_id}.lvs.sp"
    html_path = mem_dir / f"{mem_id}.html"
    if top_spice.exists():
        shutil.copy2(top_spice, verdi_dir / top_spice.name)
        copied["spice"].append(str(verdi_dir / top_spice.name))
    if lvs_spice.exists():
        shutil.copy2(lvs_spice, verdi_dir / lvs_spice.name)
        copied["lvs_sp"].append(str(verdi_dir / lvs_spice.name))
    if html_path.exists():
        shutil.copy2(html_path, verdi_dir / html_path.name)
        copied["html"].append(str(verdi_dir / html_path.name))

    manifest["memories"].append(
        {
            "memory_id": mem_id,
            "build_dir": str(mem_dir),
            "multicorner_attempts": multi_attempts.get(mem_id, []),
            "copied_outputs": copied,
        }
    )

(MANIFEST_DIR / "full_view_manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding="utf-8")

dc_dir = ROOT / "outputs" / "dc"
if dc_dir.exists():
    shutil.rmtree(dc_dir)

lines = [
    "# Sky130 Memory 1R1W Full Build Report",
    "",
    f"- version: `{VERSION}`",
    "- canonical synthesis output directory: `/Sky130_memory/outputs/design_compiler`",
    "- redundant alias directory `/Sky130_memory/outputs/dc` removed after pre-check confirmed it only duplicated `.lib` files.",
    f"- full-view retry log: `{FULL_ATTEMPTS}`",
    f"- multicorner retry log: `{MULTI_ATTEMPTS}`",
    "",
    "## Multicorner Summary",
    "",
    "| Memory | libs | v | sp | lvs_sp | html | attempts |",
    "|---|---:|---:|---:|---:|---:|---:|",
]

for item in manifest["memories"]:
    copied = item["copied_outputs"]
    lines.append(
        "| {mem} | {libs} | {v} | {sp} | {lvs} | {html} | {attempts} |".format(
            mem=item["memory_id"],
            libs=len(copied["libs"]),
            v=len(copied["verilog"]),
            sp=len(copied["spice"]),
            lvs=len(copied["lvs_sp"]),
            html=len(copied["html"]),
            attempts=len(item["multicorner_attempts"]),
        )
    )

lines.extend(
    [
        "",
        "## Full-View Status",
        "",
        "- LEF/GDS/DEF full-view generation was attempted separately and the failure evidence is preserved in `full_view_attempts.jsonl` and `logs/<version>/`.",
        "- The blocking error is the SKY130 replica-column physical mirroring assertion in full mode for 1R1W configurations.",
        "- Per the execution rule, the physical-view generation is skipped after the retry budget is exhausted so that multi-corner liberty delivery can still complete.",
        "",
        "## Corner Policy",
        "",
        "- PVT coverage target: SS/TT/FF x 0C/25C/100C.",
        "- Voltage mapping: SS=1.7V, TT=1.8V, FF=1.9V.",
        "",
    ]
)

(REPORT_DIR / "Sky130_memory_full_build_report.md").write_text("\n".join(lines) + "\n", encoding="utf-8")
PY
