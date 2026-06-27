#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path


def replace_line(text: str, key: str, value: str) -> str:
    pattern = rf"^{re.escape(key)}\s*=.*$"
    repl = f"{key} = {value}"
    if re.search(pattern, text, re.M):
        return re.sub(pattern, repl, text, count=1, flags=re.M)
    return text.rstrip() + "\n" + repl + "\n"


def main() -> int:
    if len(sys.argv) != 3:
        print("usage: rewrite_area_trial_config.py <src_cfg> <dst_cfg>", file=sys.stderr)
        return 2

    src = Path(sys.argv[1])
    dst = Path(sys.argv[2])
    text = src.read_text(encoding="utf-8")

    # Preserve native full-layout constraints; only remove the project-added spare row/col.
    text = replace_line(text, "num_spare_rows", "0")
    text = replace_line(text, "num_spare_cols", "0")
    text = replace_line(text, "netlist_only", "False")
    text = replace_line(text, "route_supplies", "False")
    text = replace_line(text, "check_lvsdrc", "False")
    text = replace_line(text, "output_path", repr(str(dst.parent) + "/"))

    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_text(text, encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
