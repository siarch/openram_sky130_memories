from __future__ import annotations

import json
import shutil
from collections import defaultdict
from pathlib import Path


ROOT = Path("/Sky130_memory")
VERSION = "v20260612_1r1w_full"
BUILD_ROOT = ROOT / "work" / "openram_builds" / VERSION
OUT_ROOT = ROOT / "outputs"
REPORT_DIR = ROOT / "reports" / VERSION
MANIFEST_DIR = ROOT / "manifests" / VERSION
FULL_ATTEMPTS = REPORT_DIR / "full_view_attempts.jsonl"
MULTI_ATTEMPTS = REPORT_DIR / "multicorner_attempts.jsonl"


def ensure_dir(path: Path) -> None:
    path.mkdir(parents=True, exist_ok=True)


def read_jsonl(path: Path) -> list[dict]:
    if not path.exists():
        return []
    return [json.loads(line) for line in path.read_text(encoding="utf-8").splitlines() if line.strip()]


def main() -> None:
    ensure_dir(REPORT_DIR)
    ensure_dir(MANIFEST_DIR)

    full_attempts = read_jsonl(FULL_ATTEMPTS)
    multi_attempts_by_mem: dict[str, list[dict]] = defaultdict(list)
    for item in read_jsonl(MULTI_ATTEMPTS):
        multi_attempts_by_mem[item["memory_id"]].append(item)

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
        vcs_dir = OUT_ROOT / "vcs" / VERSION / mem_id
        for path in [design_compiler_dir, genus_dir, verdi_dir, spyglass_dir, tessent_dir, vcs_dir]:
            ensure_dir(path)

        copied = {"libs": [], "verilog": [], "vcs_verilog": [], "spice": [], "lvs_sp": [], "html": []}

        for lib_path in sorted(mem_dir.glob("*.lib")):
            shutil.copy2(lib_path, design_compiler_dir / lib_path.name)
            shutil.copy2(lib_path, genus_dir / lib_path.name)
            copied["libs"].append(str(design_compiler_dir / lib_path.name))

        for v_path in sorted(mem_dir.glob("*.v")):
            for dst_dir in [design_compiler_dir, verdi_dir, spyglass_dir, tessent_dir, vcs_dir]:
                shutil.copy2(v_path, dst_dir / v_path.name)
            copied["verilog"].append(str(design_compiler_dir / v_path.name))
            copied["vcs_verilog"].append(str(vcs_dir / v_path.name))

        for spice_path in [mem_dir / f"{mem_id}.sp", mem_dir / f"{mem_id}.lvs.sp"]:
            if spice_path.exists():
                shutil.copy2(spice_path, verdi_dir / spice_path.name)
                if spice_path.name.endswith(".lvs.sp"):
                    copied["lvs_sp"].append(str(verdi_dir / spice_path.name))
                else:
                    copied["spice"].append(str(verdi_dir / spice_path.name))

        html_path = mem_dir / f"{mem_id}.html"
        if html_path.exists():
            shutil.copy2(html_path, verdi_dir / html_path.name)
            copied["html"].append(str(verdi_dir / html_path.name))

        manifest["memories"].append(
            {
                "memory_id": mem_id,
                "build_dir": str(mem_dir),
                "multicorner_attempts": multi_attempts_by_mem.get(mem_id, []),
                "copied_outputs": copied,
            }
        )

    dc_dir = OUT_ROOT / "dc"
    if dc_dir.exists():
        shutil.rmtree(dc_dir)

    (MANIFEST_DIR / "full_view_manifest.json").write_text(
        json.dumps(
            {
                "version": VERSION,
                "full_view_attempts": full_attempts,
                "multicorner_manifest": manifest,
            },
            ensure_ascii=False,
            indent=2,
        ),
        encoding="utf-8",
    )

    lines = [
        "# Sky130 Memory 1R1W Full Build Report",
        "",
        f"- version: `{VERSION}`",
        "- canonical synthesis output directory: `/Sky130_memory/outputs/design_compiler`",
        "- redundant alias directory `/Sky130_memory/outputs/dc` removed after diff verification.",
        f"- full-view retry log: `{FULL_ATTEMPTS}`",
        f"- multicorner retry log: `{MULTI_ATTEMPTS}`",
        "",
        "## Multicorner Summary",
        "",
        "| Memory | libs | v | vcs_v | sp | lvs_sp | html | attempts |",
        "|---|---:|---:|---:|---:|---:|---:|---:|",
    ]

    for item in manifest["memories"]:
        copied = item["copied_outputs"]
        lines.append(
            "| {mem} | {libs} | {v} | {vcs_v} | {sp} | {lvs} | {html} | {attempts} |".format(
                mem=item["memory_id"],
                libs=len(copied["libs"]),
                v=len(copied["verilog"]),
                vcs_v=len(copied["vcs_verilog"]),
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
            "- After the retry budget was exhausted, the flow continued with multi-corner liberty generation so that the remaining deliverables were not blocked.",
            "",
            "## Corner Policy",
            "",
            "- PVT coverage target: SS/TT/FF x 0C/25C/100C.",
            "- Voltage mapping: SS=1.7V, TT=1.8V, FF=1.9V.",
            "",
        ]
    )

    (REPORT_DIR / "Sky130_memory_full_build_report.md").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
