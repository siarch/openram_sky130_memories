#!/usr/bin/env python3
from __future__ import annotations

import importlib.util
import json
import os
import re
import sys
import traceback
from pathlib import Path


def parse_int(name: str, text: str) -> int:
    m = re.search(rf"^{re.escape(name)}\s*=\s*(\d+)$", text, re.M)
    if not m:
        raise RuntimeError(f"missing integer setting: {name}")
    return int(m.group(1))


def parse_bbox_from_logs(log_dir: Path) -> tuple[float | None, float | None]:
    latest_match: tuple[float, float] | None = None
    for log_path in sorted(log_dir.glob("*.log")):
        text = log_path.read_text(encoding="utf-8", errors="replace")
        matches = re.findall(r"Size:\s*([0-9.]+)\s*x\s*([0-9.]+)", text)
        if matches:
            width, height = matches[-1]
            latest_match = (float(width), float(height))
    if latest_match is None:
        return None, None
    return latest_match


def main() -> int:
    if len(sys.argv) != 2:
        print("usage: remote_probe_real_area_single.py <config_py>", file=sys.stderr)
        return 2

    cfg = Path(sys.argv[1]).resolve()
    if not cfg.exists():
        print(f"config not found: {cfg}", file=sys.stderr)
        return 2
    if str(cfg.parent) not in sys.path:
        sys.path.insert(0, str(cfg.parent))

    text = cfg.read_text(encoding="utf-8")
    word_size = parse_int("word_size", text)
    num_words = parse_int("num_words", text)
    write_size = parse_int("write_size", text)
    num_rw_ports = parse_int("num_rw_ports", text)
    num_r_ports = parse_int("num_r_ports", text)
    num_w_ports = parse_int("num_w_ports", text)
    num_spare_rows = parse_int("num_spare_rows", text)
    num_spare_cols = parse_int("num_spare_cols", text)

    openram_root = Path(os.environ["OPENRAM_ROOT"]).resolve()
    spec = importlib.util.spec_from_file_location(
        "openram",
        openram_root / "__init__.py",
        submodule_search_locations=[str(openram_root)],
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"unable to load openram package from {openram_root}")
    openram = importlib.util.module_from_spec(spec)
    sys.modules["openram"] = openram
    spec.loader.exec_module(openram)
    from openram import OPTS
    from openram import debug
    from openram import sram_config
    from openram.sram_factory import factory

    # Reuse the generated config directly so the same technology and options apply.
    openram.init_openram(str(cfg), is_unit_test=True)
    OPTS.verbose_level = max(getattr(OPTS, "verbose_level", 0), 1)
    OPTS.check_lvsdrc = False
    OPTS.netlist_only = False
    OPTS.route_supplies = False
    OPTS.output_extended_config = False
    OPTS.num_rw_ports = num_rw_ports
    OPTS.num_r_ports = num_r_ports
    OPTS.num_w_ports = num_w_ports
    openram.setup_bitcell()

    c = sram_config(
        word_size=word_size,
        num_words=num_words,
        write_size=write_size,
        num_banks=1,
        num_spare_rows=num_spare_rows,
        num_spare_cols=num_spare_cols,
    )

    words_per_row_match = re.search(r"^words_per_row\s*=\s*(\d+)$", text, re.M)
    if words_per_row_match:
        c.words_per_row = int(words_per_row_match.group(1))
    c.recompute_sizes()

    try:
        a = factory.create(module_type="sram", sram_config=c)
        width = getattr(a, "width", None)
        height = getattr(a, "height", None)
        if width is None or height is None:
            width, height = parse_bbox_from_logs(cfg.parent)
        if width is None or height is None:
            raise AttributeError("'sram' object has no width/height and bbox was not found in logs")
        width = float(width)
        height = float(height)
        result = {
            "status": "OK",
            "config": str(cfg),
            "width_um": width,
            "height_um": height,
            "area_um2": width * height,
        }
        (cfg.parent / "area_result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
        print(f"STATUS=OK")
        print(f"WIDTH_UM={width}")
        print(f"HEIGHT_UM={height}")
        print(f"AREA_UM2={width * height}")
        return 0
    except Exception as exc:
        result = {
            "status": "FAIL",
            "config": str(cfg),
            "error_type": type(exc).__name__,
            "error": str(exc),
        }
        (cfg.parent / "area_result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
        print(f"STATUS=FAIL")
        print(f"ERROR={type(exc).__name__}: {exc}")
        traceback.print_exc()
        return 1
    finally:
        try:
            openram.end_openram()
        except Exception:
            pass


if __name__ == "__main__":
    raise SystemExit(main())
