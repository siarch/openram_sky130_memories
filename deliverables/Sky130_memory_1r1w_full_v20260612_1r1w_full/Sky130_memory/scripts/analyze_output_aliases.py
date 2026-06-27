from __future__ import annotations

import hashlib
import json
from dataclasses import dataclass
from pathlib import Path


ROOT = Path("/Sky130_memory")


@dataclass
class FileMeta:
    rel: str
    size: int
    mtime: int
    sha256: str


def scan(base: Path) -> dict[str, FileMeta]:
    result: dict[str, FileMeta] = {}
    for path in sorted(base.rglob("*")):
        if not path.is_file():
            continue
        rel = path.relative_to(base).as_posix()
        result[rel] = FileMeta(
            rel=rel,
            size=path.stat().st_size,
            mtime=int(path.stat().st_mtime),
            sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
        )
    return result


def main() -> None:
    outputs = ROOT / "outputs"
    dc_root = outputs / "dc"
    dcmp_root = outputs / "design_compiler"
    versions = sorted(
        {p.name for p in dc_root.iterdir() if p.is_dir()}
        & {p.name for p in dcmp_root.iterdir() if p.is_dir()}
    )

    report = []
    for version in versions:
        dc = scan(dc_root / version)
        dcmp = scan(dcmp_root / version)
        only_dc = sorted(set(dc) - set(dcmp))
        only_dcmp = sorted(set(dcmp) - set(dc))
        common = sorted(set(dc) & set(dcmp))

        same = []
        changed = []
        for rel in common:
            a = dc[rel]
            b = dcmp[rel]
            item = {
                "path": rel,
                "dc": {"size": a.size, "mtime": a.mtime, "sha256": a.sha256},
                "design_compiler": {"size": b.size, "mtime": b.mtime, "sha256": b.sha256},
            }
            if (a.size, a.sha256) == (b.size, b.sha256):
                same.append(item)
            else:
                changed.append(item)

        report.append(
            {
                "version": version,
                "dc_file_count": len(dc),
                "design_compiler_file_count": len(dcmp),
                "identical_common_files": same,
                "different_common_files": changed,
                "only_in_dc": [
                    {"path": rel, "size": dc[rel].size, "mtime": dc[rel].mtime, "sha256": dc[rel].sha256}
                    for rel in only_dc
                ],
                "only_in_design_compiler": [
                    {
                        "path": rel,
                        "size": dcmp[rel].size,
                        "mtime": dcmp[rel].mtime,
                        "sha256": dcmp[rel].sha256,
                    }
                    for rel in only_dcmp
                ],
            }
        )

    out_dir = ROOT / "reports"
    out_dir.mkdir(parents=True, exist_ok=True)
    out_json = out_dir / "dc_vs_design_compiler_diff.json"
    out_md = out_dir / "dc_vs_design_compiler_diff.md"
    out_json.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")

    lines = ["# dc vs design_compiler diff report", ""]
    for item in report:
        lines.append(f"## {item['version']}")
        lines.append("")
        lines.append(f"- dc files: {item['dc_file_count']}")
        lines.append(f"- design_compiler files: {item['design_compiler_file_count']}")
        lines.append(f"- identical common files: {len(item['identical_common_files'])}")
        lines.append(f"- different common files: {len(item['different_common_files'])}")
        lines.append(f"- only in dc: {len(item['only_in_dc'])}")
        lines.append(f"- only in design_compiler: {len(item['only_in_design_compiler'])}")
        lines.append("")
        if item["only_in_dc"]:
            lines.append("### only in dc")
            for entry in item["only_in_dc"]:
                lines.append(
                    f"- {entry['path']} | size={entry['size']} | mtime={entry['mtime']} | sha256={entry['sha256']}"
                )
            lines.append("")
        if item["only_in_design_compiler"]:
            lines.append("### only in design_compiler")
            for entry in item["only_in_design_compiler"]:
                lines.append(
                    f"- {entry['path']} | size={entry['size']} | mtime={entry['mtime']} | sha256={entry['sha256']}"
                )
            lines.append("")
        if item["different_common_files"]:
            lines.append("### different common files")
            for entry in item["different_common_files"]:
                lines.append(
                    f"- {entry['path']} | dc_size={entry['dc']['size']} | dcmp_size={entry['design_compiler']['size']} | "
                    f"dc_sha256={entry['dc']['sha256']} | dcmp_sha256={entry['design_compiler']['sha256']}"
                )
            lines.append("")
    out_md.write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
