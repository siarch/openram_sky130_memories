#!/usr/bin/env python3
from __future__ import annotations

import json
import os
import re
import shutil
import subprocess
import sys
from pathlib import Path


ROOT = Path(os.environ.get("SKY130_MEMORY_ROOT", "/Sky130_memory"))
VERSION = os.environ.get("SKY130_MEMORY_VERSION", "v20260612_1r1w_full")
MATRIX = Path(os.environ.get("REQUESTED_MATRIX", str(ROOT / "configs" / "memory_matrix_1r1w_requested.yaml")))
BUILD_ROOT = ROOT / "work" / "openram_builds" / VERSION
TRIAL_ROOT = ROOT / "work" / "openram_area_trials" / VERSION
REPORT_ROOT = ROOT / "reports" / VERSION
SUMMARY_JSONL = REPORT_ROOT / "real_area_summary.jsonl"
SUMMARY_TSV = REPORT_ROOT / "real_area_summary.tsv"
DEBUG_LOG = REPORT_ROOT / "real_area_probe_debug.log"
OPENRAM_ROOT = os.environ.get("OPENRAM_ROOT", str(ROOT / "src" / "OpenRAM-stable"))
PDK_ROOT = os.environ.get("PDK_ROOT", str(ROOT / "pdk"))


def parse_ids(matrix: Path) -> list[str]:
    ids: list[str] = []
    cur: dict[str, str] | None = None
    for raw in matrix.read_text(encoding="utf-8").splitlines():
        line = raw.rstrip()
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        if line.startswith("  - "):
            if cur and cur.get("id"):
                ids.append(cur["id"])
            cur = {}
            rest = line[4:]
            if rest.startswith("id:"):
                cur["id"] = rest.split(":", 1)[1].strip()
            continue
        if cur is None or not line.startswith("    ") or ":" not in line:
            continue
        k, v = line.strip().split(":", 1)
        cur[k.strip()] = v.strip().strip("'\"")
    if cur and cur.get("id"):
        ids.append(cur["id"])
    return ids


def parse_bbox(log_path: Path) -> tuple[float | None, float | None]:
    text = log_path.read_text(encoding="utf-8", errors="replace")
    matches = re.findall(r"Size:\s*([0-9.]+)\s*x\s*([0-9.]+)", text)
    if not matches:
        return None, None
    return float(matches[-1][0]), float(matches[-1][1])


def parse_area_result(result_path: Path) -> tuple[float | None, float | None, float | None]:
    if not result_path.exists():
        return None, None, None
    rec = json.loads(result_path.read_text(encoding="utf-8"))
    if rec.get("status") != "OK":
        return None, None, None
    width = rec.get("width_um")
    height = rec.get("height_um")
    area = rec.get("area_um2")
    if width is None or height is None:
        return None, None, None
    return float(width), float(height), float(area) if area is not None else float(width) * float(height)


def main() -> int:
    TRIAL_ROOT.mkdir(parents=True, exist_ok=True)
    REPORT_ROOT.mkdir(parents=True, exist_ok=True)
    SUMMARY_JSONL.write_text("", encoding="utf-8")
    SUMMARY_TSV.write_text("memory_id\tstatus\twidth_um\theight_um\tarea_um2\trc\ttrial_dir\n", encoding="utf-8")
    DEBUG_LOG.write_text("", encoding="utf-8")

    env = os.environ.copy()
    env["OPENRAM_ROOT"] = OPENRAM_ROOT
    env["PDK_ROOT"] = PDK_ROOT

    startup = json.dumps({
        "phase": "startup",
        "matrix": str(MATRIX),
        "matrix_exists": MATRIX.exists(),
        "build_root_exists": BUILD_ROOT.exists(),
        "trial_root": str(TRIAL_ROOT),
    }, ensure_ascii=True)
    DEBUG_LOG.write_text(startup + "\n", encoding="utf-8")
    print(startup)
    ids = parse_ids(MATRIX)
    parsed = json.dumps({
        "phase": "parsed_ids",
        "count": len(ids),
        "first_ids": ids[:3],
    }, ensure_ascii=True)
    with DEBUG_LOG.open("a", encoding="utf-8") as fp:
        fp.write(parsed + "\n")
    print(parsed)
    for mem_id in ids:
        with DEBUG_LOG.open("a", encoding="utf-8") as fp:
            fp.write(json.dumps({"phase": "begin_mem", "memory_id": mem_id}, ensure_ascii=True) + "\n")
        src_cfg = BUILD_ROOT / mem_id / f"{mem_id}.py"
        trial_dir = TRIAL_ROOT / mem_id
        if trial_dir.exists():
            shutil.rmtree(trial_dir)
        trial_dir.mkdir(parents=True, exist_ok=True)

        subprocess.run(
            [sys.executable, "/tmp/rewrite_area_trial_config.py", str(src_cfg), str(trial_dir / "area_trial.py")],
            check=True,
            env=env,
        )
        shutil.copy2(ROOT / "work" / "openram_configs_full" / VERSION / "sky130_sram_common.py", trial_dir / "sky130_sram_common.py")

        stdout_log = trial_dir / "stdout.log"
        rc = 0
        with stdout_log.open("w", encoding="utf-8") as fp:
            try:
                subprocess.run(
                    [sys.executable, "/tmp/remote_probe_real_area_single.py", str(trial_dir / "area_trial.py")],
                    check=True,
                    stdout=fp,
                    stderr=subprocess.STDOUT,
                    env=env,
                    timeout=3600,
                )
            except subprocess.TimeoutExpired:
                rc = 124
            except subprocess.CalledProcessError as exc:
                rc = exc.returncode

        result_path = trial_dir / "area_result.json"
        macro_logs = sorted(p for p in trial_dir.glob("*.log") if p.name != "stdout.log")
        log_path = macro_logs[-1] if macro_logs else None
        width = height = area = None
        width, height, area = parse_area_result(result_path)
        if area is None and log_path and log_path.exists():
            width, height = parse_bbox(log_path)
            if width is not None and height is not None:
                area = width * height
        status = "ok" if area is not None else "fail"
        record = {
            "memory_id": mem_id,
            "status": status,
            "width_um": width,
            "height_um": height,
            "area_um2": area,
            "rc": rc,
            "trial_dir": str(trial_dir),
            "log_path": str(log_path) if log_path else None,
        }
        with SUMMARY_JSONL.open("a", encoding="utf-8") as fp:
            fp.write(json.dumps(record, ensure_ascii=True) + "\n")
        with SUMMARY_TSV.open("a", encoding="utf-8") as fp:
            fp.write(f"{mem_id}\t{status}\t{width or ''}\t{height or ''}\t{area or ''}\t{rc}\t{trial_dir}\n")
        with DEBUG_LOG.open("a", encoding="utf-8") as fp:
            fp.write(json.dumps({"phase": "end_mem", **record}, ensure_ascii=True) + "\n")
        print(json.dumps(record, ensure_ascii=True))

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
