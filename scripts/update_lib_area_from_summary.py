#!/usr/bin/env python3
from __future__ import annotations

import json
import re
import sys
from pathlib import Path


def update_area(lib_path: Path, area: float) -> bool:
    text = lib_path.read_text(encoding="utf-8")
    new_text, count = re.subn(
        r"(?m)^(\s*area\s*:\s*)[0-9.]+(\s*;)\s*$",
        rf"\g<1>{area:.4f}\2",
        text,
        count=1,
    )
    if count != 1:
        return False
    lib_path.write_text(new_text, encoding="utf-8")
    return True


def main() -> int:
    if len(sys.argv) != 3:
        print("usage: update_lib_area_from_summary.py <summary_jsonl> <deliverable_root>", file=sys.stderr)
        return 2

    summary = Path(sys.argv[1])
    root = Path(sys.argv[2])
    updated = 0
    failed: list[str] = []

    for raw in summary.read_text(encoding="utf-8").splitlines():
        if not raw.strip():
            continue
        rec = json.loads(raw)
        if rec.get("status") != "ok":
            failed.append(rec["memory_id"])
            continue
        mem_id = rec["memory_id"]
        area = float(rec["area_um2"])
        targets = [
            root / "work" / "openram_builds" / "v20260612_1r1w_full" / mem_id,
            root / "outputs" / "design_compiler" / "v20260612_1r1w_full" / mem_id,
            root / "outputs" / "genus" / "v20260612_1r1w_full" / mem_id,
        ]
        for target in targets:
            for lib_path in sorted(target.glob("*.lib")):
                if not update_area(lib_path, area):
                    failed.append(str(lib_path))
                else:
                    updated += 1

    print(f"updated_libs={updated}")
    if failed:
        print("failed_targets=")
        for item in failed:
            print(item)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
