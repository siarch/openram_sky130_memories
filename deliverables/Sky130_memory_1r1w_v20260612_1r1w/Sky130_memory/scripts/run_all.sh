#!/usr/bin/env bash
set -euo pipefail

ROOT="${SKY130_MEMORY_ROOT:-/Sky130_memory}"
VERSION_TAG="${SKY130_MEMORY_VERSION:-v$(date +%Y%m%d_%H%M%S)}"
export SKY130_MEMORY_ROOT="$ROOT"
export SKY130_MEMORY_VERSION="$VERSION_TAG"

python3 "$ROOT/scripts/generate_compile_scripts.py"

COMPILE_LIST="$ROOT/work/${VERSION_TAG}_compile_list.txt"
python3 - <<PY > "$COMPILE_LIST"
import json
from pathlib import Path
root = Path("${ROOT}")
version = "${VERSION_TAG}"
manifest = root / "manifests" / version / "compile_scripts.json"
data = json.loads(manifest.read_text(encoding="utf-8"))
for p in data.get("compile_scripts", []):
    print(p)
PY

while IFS= read -r s; do
  [ -f "$s" ] || continue
  bash "$s"
done < "$COMPILE_LIST"

python3 "$ROOT/scripts/postprocess_and_report.py"
