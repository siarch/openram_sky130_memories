#!/usr/bin/env python3
from __future__ import annotations

import json
import re
import shutil
import subprocess
import tarfile
from pathlib import Path


VERSION = "v20260612_1r1w_full"
PACKAGE_DIR = Path(r"D:\trae_projects\Sky130_Power\deliverables\Sky130_memory_1r1w_full_v20260612_1r1w_full")
ROOT = PACKAGE_DIR / "Sky130_memory"
REPORT_DIR = ROOT / "reports" / VERSION
MANIFEST_PATH = ROOT / "manifests" / VERSION / "full_view_manifest.json"
PACKAGE_TGZ = PACKAGE_DIR.with_suffix(".tar.gz")

AREA_MAP = {
    "sky130_sram_128bytes_1r1w_16x64": (334.38, 174.02, 58188.8076, "ok"),
    "sky130_sram_256bytes_1r1w_16x128": (333.86, 237.22, 79198.2692, "ok"),
    "sky130_sram_512bytes_1r1w_16x256": (444.94, 253.61, 112841.2334, "ok"),
    "sky130_sram_1kbytes_1r1w_16x512": (455.70, 381.23, 173726.5110, "ok"),
    "sky130_sram_16kbytes_1r1w_16x8192": (1139.82, 1311.75, 1495158.8850, "ok"),
    "sky130_sram_48bytes_1r1w_6x128": (289.10, 183.09, 52931.3190, "ok"),
    "sky130_sram_128bytes_1r1w_8x128": (325.74, 185.53, 60434.5422, "ok"),
    "sky130_sram_256bytes_1r1w_8x256": (324.14, 248.73, 80623.3422, "ok"),
    "sky130_sram_96bytes_1r1w_24x128": (399.66, 237.22, 94807.3452, "ok"),
    "sky130_sram_128bytes_1r1w_32x32": (353.82, 174.02, 61571.7564, "ok"),
    "sky130_sram_512bytes_1r1w_32x128": (464.38, 240.825, 111834.3135, "ok"),
    "sky130_sram_2144bytes_1r1w_134x128": (936.32, 402.645, 377004.5664, "ok"),
    "sky130_sram_4096bytes_1r1w_256x128": (1741.58, 470.965, 820223.2247, "ok"),
}


def update_area(lib_path: Path, area: float) -> None:
    text = lib_path.read_text(encoding="utf-8")
    new_text, count = re.subn(
        r"(?m)^(\s*area\s*:\s*)[0-9.]+(\s*;)\s*$",
        rf"\g<1>{area:.4f}\2",
        text,
        count=1,
    )
    if count != 1:
        raise RuntimeError(f"area field not found in {lib_path}")
    lib_path.write_text(new_text, encoding="utf-8")


def sync_vcs_outputs(manifest: dict) -> None:
    vcs_root = ROOT / "outputs" / "vcs" / VERSION
    vcs_root.mkdir(parents=True, exist_ok=True)
    for item in manifest["memories"]:
        mem_id = item["memory_id"]
        build_dir = ROOT / "work" / "openram_builds" / VERSION / mem_id
        src_v = build_dir / f"{mem_id}.v"
        dst_dir = vcs_root / mem_id
        dst_dir.mkdir(parents=True, exist_ok=True)
        if src_v.exists():
            shutil.copy2(src_v, dst_dir / src_v.name)
        copied = item.setdefault("copied_outputs", {})
        copied["vcs_verilog"] = [f"/Sky130_memory/outputs/vcs/{VERSION}/{mem_id}/{mem_id}.v"]


def apply_known_areas() -> None:
    targets = [
        ROOT / "work" / "openram_builds" / VERSION,
        ROOT / "outputs" / "design_compiler" / VERSION,
        ROOT / "outputs" / "genus" / VERSION,
    ]
    for mem_id, (_, _, area, status) in AREA_MAP.items():
        if status != "ok" or area is None:
            continue
        for base in targets:
            mem_dir = base / mem_id
            for lib_path in sorted(mem_dir.glob("*.lib")):
                update_area(lib_path, area)


def write_local_area_summary() -> None:
    REPORT_DIR.mkdir(parents=True, exist_ok=True)
    out = REPORT_DIR / "real_area_summary_local.jsonl"
    lines = []
    for mem_id, (width, height, area, status) in AREA_MAP.items():
        lines.append(
            json.dumps(
                {
                    "memory_id": mem_id,
                    "status": status,
                    "width_um": width,
                    "height_um": height,
                    "area_um2": area,
                },
                ensure_ascii=False,
            )
        )
    out.write_text("\n".join(lines) + "\n", encoding="utf-8")


def refresh_manifest() -> None:
    manifest = json.loads(MANIFEST_PATH.read_text(encoding="utf-8"))
    sync_vcs_outputs(manifest)
    MANIFEST_PATH.write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding="utf-8")


def sync_scripts() -> None:
    package_scripts = ROOT / "scripts"
    package_scripts.mkdir(parents=True, exist_ok=True)
    for name in [
        "generate_1r1w_full_delivery_docs.py",
        "remote_sync_full_outputs.py",
        "refresh_full_delivery_package.py",
    ]:
        shutil.copy2(Path(__file__).resolve().parent / name, package_scripts / name)


def regenerate_docs() -> None:
    subprocess.run(
        ["python", str(Path(__file__).resolve().parent / "generate_1r1w_full_delivery_docs.py")],
        check=True,
        cwd=Path(__file__).resolve().parents[1],
    )


def rebuild_tarball() -> None:
    if PACKAGE_TGZ.exists():
        PACKAGE_TGZ.unlink()
    with tarfile.open(PACKAGE_TGZ, "w:gz") as tar:
        tar.add(ROOT, arcname="Sky130_memory")


def main() -> None:
    apply_known_areas()
    refresh_manifest()
    write_local_area_summary()
    sync_scripts()
    regenerate_docs()
    rebuild_tarball()


if __name__ == "__main__":
    main()
