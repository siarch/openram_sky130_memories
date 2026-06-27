#!/usr/bin/env python3
from __future__ import annotations

import json
import sys
from pathlib import Path


def main() -> int:
    if len(sys.argv) != 7:
        raise SystemExit(
            "usage: remote_finalize_one_area_from_bbox.py "
            "<summary_jsonl> <memory_id> <trial_dir> <log_path> <width_um> <height_um>"
        )

    summary_path = Path(sys.argv[1])
    memory_id = sys.argv[2]
    trial_dir = Path(sys.argv[3])
    log_path = sys.argv[4]
    width = float(sys.argv[5])
    height = float(sys.argv[6])
    area = width * height

    trial_dir.mkdir(parents=True, exist_ok=True)
    area_result = {
        "status": "OK",
        "width_um": width,
        "height_um": height,
        "area_um2": area,
        "log_path": log_path,
    }
    (trial_dir / "area_result.json").write_text(
        json.dumps(area_result, ensure_ascii=True, indent=2) + "\n",
        encoding="utf-8",
    )

    rows: list[dict] = []
    if summary_path.exists():
        for raw in summary_path.read_text(encoding="utf-8").splitlines():
            if not raw.strip():
                continue
            rec = json.loads(raw)
            if rec.get("memory_id") == memory_id:
                continue
            rows.append(rec)

    rows.append(
        {
            "memory_id": memory_id,
            "status": "ok",
            "width_um": width,
            "height_um": height,
            "area_um2": area,
            "rc": 0,
            "trial_dir": str(trial_dir),
            "log_path": log_path,
        }
    )
    summary_path.parent.mkdir(parents=True, exist_ok=True)
    summary_path.write_text(
        "\n".join(json.dumps(item, ensure_ascii=True) for item in rows) + "\n",
        encoding="utf-8",
    )
    print(json.dumps(rows[-1], ensure_ascii=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
