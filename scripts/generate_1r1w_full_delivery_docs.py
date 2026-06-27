from __future__ import annotations

import html
import json
from datetime import datetime
from pathlib import Path


PACKAGE_NAME = "Sky130_memory_1r1w_full_v20260612_1r1w_full.tar.gz"
VERSION = "v20260612_1r1w_full"
SERVER = "ryan@192.168.49.140:/Sky130_memory"
ROOT = Path(
    r"D:\trae_projects\Sky130_Power\deliverables\Sky130_memory_1r1w_full_v20260612_1r1w_full\Sky130_memory"
)
REPORT_DIR = ROOT / "reports" / VERSION
MANIFEST_PATH = ROOT / "manifests" / VERSION / "full_view_manifest.json"


def build_tree(root: Path) -> str:
    lines = ["."]

    def visit(path: Path, prefix: str = "") -> None:
        entries = sorted(path.iterdir(), key=lambda p: (p.is_file(), p.name.lower()))
        for index, entry in enumerate(entries):
            connector = "`-- " if index == len(entries) - 1 else "|-- "
            lines.append(f"{prefix}{connector}{entry.name}")
            if entry.is_dir():
                extension = "    " if index == len(entries) - 1 else "|   "
                visit(entry, prefix + extension)

    visit(root)
    return "\n".join(lines)


def format_size(num_bytes: int) -> str:
    units = ["B", "KB", "MB", "GB"]
    size = float(num_bytes)
    for unit in units:
        if size < 1024 or unit == units[-1]:
            return f"{size:.1f} {unit}" if unit != "B" else f"{int(size)} B"
        size /= 1024
    return f"{num_bytes} B"


def collect_stats(root: Path) -> tuple[int, int]:
    file_count = 0
    total_size = 0
    for path in root.rglob("*"):
        if path.is_file():
            file_count += 1
            total_size += path.stat().st_size
    return file_count, total_size


def load_manifest(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def load_area_summary(report_dir: Path) -> dict[str, dict]:
    candidates = [
        report_dir / "real_area_summary_local.jsonl",
        report_dir / "real_area_summary.jsonl",
    ]
    summary: dict[str, dict] = {}
    for path in candidates:
        if not path.exists():
            continue
        for raw in path.read_text(encoding="utf-8").splitlines():
            if not raw.strip():
                continue
            rec = json.loads(raw)
            summary[rec["memory_id"]] = rec
        if summary:
            break
    return summary


def summarize_memories(manifest: dict) -> tuple[list[str], list[str]]:
    memories = manifest.get("memories")
    if memories is None:
        memories = manifest.get("multicorner_manifest", {}).get("memories", [])

    mem_ids: list[str] = []
    table_rows: list[str] = []
    for item in memories:
        mem_id = item["memory_id"]
        copied = item.get("copied_outputs", {})
        mem_ids.append(mem_id)
        table_rows.append(
            "| {mem} | {libs} | {v} | {vcs_v} | {sp} | {lvs} | {html} |".format(
                mem=mem_id,
                libs=len(copied.get("libs", [])),
                v=len(copied.get("verilog", [])),
                vcs_v=len(copied.get("vcs_verilog", [])),
                sp=len(copied.get("spice", [])),
                lvs=len(copied.get("lvs_sp", [])),
                html=len(copied.get("html", [])),
            )
        )
    return mem_ids, table_rows


def format_area_value(value: float | int | None) -> str:
    if value is None:
        return "-"
    return f"{float(value):.4f}"


def build_area_rows(mem_ids: list[str], area_summary: dict[str, dict]) -> list[str]:
    rows: list[str] = []
    for mem_id in mem_ids:
        rec = area_summary.get(mem_id, {})
        rows.append(
            "| {mem} | {status} | {width} | {height} | {area} |".format(
                mem=mem_id,
                status=rec.get("status", "pending"),
                width=format_area_value(rec.get("width_um")),
                height=format_area_value(rec.get("height_um")),
                area=format_area_value(rec.get("area_um2")),
            )
        )
    return rows


def render_markdown_zh(mem_ids: list[str], rows: list[str], area_rows: list[str], tree: str, file_count: int, total_size: int) -> str:
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    mem_list = "\n".join(f"- `{mem_id}`" for mem_id in mem_ids)
    view_rows = "\n".join(rows)
    area_table = "\n".join(area_rows)
    return f"""# Sky130 Memory 1R1W Full 交付说明（中文）

## 交付包

- 文件名：`{PACKAGE_NAME}`
- 交付版本：`{VERSION}`
- 交付范围：仅包含本次 1R1W full 版本相关配置、脚本、源码修复点、OpenRAM 原始产物、按工具归档输出、日志、manifest、差异报告与交付说明。
- 打包根路径：`/Sky130_memory`
- 说明文档格式：Markdown 与 HTML；按当前要求未额外生成 PDF。

## 解压方式

```bash
tar -xzf {PACKAGE_NAME}
```

## 目标 Memory 清单

{mem_list}

## 目录与路径规范

- 规范综合输出目录固定为 `outputs/design_compiler`。
- 冗余别名目录 `outputs/dc` 已完成差异核查并删除。
- `dc_vs_design_compiler_diff.md/json` 已随包保留，用于追溯删除依据。

## dc 与 design_compiler 差异结论

- `v20260612_1r1w` 中，`dc` 共 13 个文件，`design_compiler` 共 26 个文件。
- 13 个公共文件在大小、修改时间、SHA256 上完全一致。
- `dc` 无独占文件；`design_compiler` 额外包含 13 个 `.v` 文件。
- 结论：`dc` 仅是冗余别名，保留 `design_compiler` 作为唯一规范目录。

## 多工艺角 .lib 覆盖

- 当前 full 包按 9 个 PVT 场景交付每个 memory 的独立 `.lib` 文件。
- 角点组合：`SS/TT/FF x 0C/25C/100C`。
- 电压映射：`SS=1.7V`、`TT=1.8V`、`FF=1.9V`。
- 常温点采用 `25C`，与现有项目基准场景保持一致。

## 视图结果汇总

| Memory | libs | v | vcs_v | sp | lvs_sp | html |
|---|---:|---:|---:|---:|---:|---:|
{view_rows}

## 真实面积汇总

| Memory | status | width_um | height_um | area_um2 |
|---|---|---:|---:|---:|
{area_table}

## 物理视图说明

- 已按要求对 full-view 路径进行重试，并保留 `full_view_attempts.jsonl` 与 `logs/{VERSION}/` 作为失败证据。
- 当前 `LEF/GDS/DEF` 仍受 OpenRAM 1R1W full 模式下的 `replica_column` 物理约束阻塞。
- 达到重试上限后已按规则跳过该特定视图，不影响多角 `.lib`、Verilog、SPICE、HTML 等其余输出。

## 包内关键内容

- `configs/memory_matrix.yaml`：本次 1R1W 请求清单副本。
- `scripts/remote_finalize_1r1w_full.sh`：full-view 重试与收口脚本。
- `scripts/remote_recover_multicorner_1r1w_full.sh`：多角 `.lib` 恢复脚本。
- `scripts/remote_sync_full_outputs.py`：full 版本 outputs 归档与报告脚本。
- `scripts/analyze_output_aliases.py`：`dc` 与 `design_compiler` 差异分析脚本。
- `src/OpenRAM-stable/compiler/modules/replica_column.py`：本次相关源码修复点。
- `work/openram_builds/{VERSION}/`：每个 memory 的原始 full 版本生成产物。
- `outputs/<tool>/{VERSION}/<mem_id>/`：按工具分类归档视图，当前包含 `design_compiler / genus / verdi / spyglass / tessent / vcs`。
- `reports/{VERSION}/`：build report、attempt logs、差异报告、目录树与本说明文档。

## 溯源信息

- 生成源：`{SERVER}`
- 打包时间：`{timestamp}`
- 文件总数：`{file_count}`
- 总大小：`{format_size(total_size)}`

## 完整目录树（交付包内）

```text
{tree}
```
"""


def render_markdown_en(mem_ids: list[str], rows: list[str], area_rows: list[str], tree: str, file_count: int, total_size: int) -> str:
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    mem_list = "\n".join(f"- `{mem_id}`" for mem_id in mem_ids)
    view_rows = "\n".join(rows)
    area_table = "\n".join(area_rows)
    return f"""# Sky130 Memory 1R1W Full Delivery Notes (English)

## Delivery Archive

- File name: `{PACKAGE_NAME}`
- Delivery version: `{VERSION}`
- Scope: only the configuration, scripts, patched source, raw OpenRAM outputs, tool-grouped outputs, logs, manifests, diff reports, and delivery notes for this 1R1W full release.
- Archive root: `/Sky130_memory`
- Documentation format: Markdown and HTML; no additional PDF is generated per the latest request.

## How to Extract

```bash
tar -xzf {PACKAGE_NAME}
```

## Target Memory List

{mem_list}

## Directory and Path Policy

- The canonical synthesis output directory is `outputs/design_compiler`.
- The redundant alias directory `outputs/dc` has been verified and removed.
- `dc_vs_design_compiler_diff.md/json` are preserved in the package for traceability.

## dc vs design_compiler Conclusion

- In `v20260612_1r1w`, `dc` contains 13 files and `design_compiler` contains 26 files.
- All 13 common files are identical in size, modification time, and SHA256.
- `dc` has no unique files, while `design_compiler` adds 13 `.v` files.
- Conclusion: `dc` is only a redundant alias, so `design_compiler` remains the sole canonical directory.

## Multi-Corner .lib Coverage

- This full package delivers independent `.lib` files for 9 PVT scenarios per memory.
- Corner combination: `SS/TT/FF x 0C/25C/100C`.
- Voltage mapping: `SS=1.7V`, `TT=1.8V`, `FF=1.9V`.
- The nominal temperature point remains `25C` to match the existing project baseline.

## View Summary

| Memory | libs | v | vcs_v | sp | lvs_sp | html |
|---|---:|---:|---:|---:|---:|---:|
{view_rows}

## Real-Area Summary

| Memory | status | width_um | height_um | area_um2 |
|---|---|---:|---:|---:|
{area_table}

## Physical-View Note

- The full-view path was retried as requested, and the failure evidence is preserved in `full_view_attempts.jsonl` and `logs/{VERSION}/`.
- `LEF/GDS/DEF` generation is still blocked by the OpenRAM 1R1W full-mode `replica_column` physical constraint.
- After the retry budget was exhausted, those specific physical views were skipped without blocking multi-corner `.lib`, Verilog, SPICE, or HTML delivery.

## Key Contents in the Package

- `configs/memory_matrix.yaml`: copied requested 1R1W memory matrix.
- `scripts/remote_finalize_1r1w_full.sh`: full-view retry and closure script.
- `scripts/remote_recover_multicorner_1r1w_full.sh`: multi-corner liberty recovery script.
- `scripts/remote_sync_full_outputs.py`: full-output synchronization and reporting script.
- `scripts/analyze_output_aliases.py`: diff analysis script for `dc` vs `design_compiler`.
- `src/OpenRAM-stable/compiler/modules/replica_column.py`: patched source touched in this work.
- `work/openram_builds/{VERSION}/`: raw full-version generated outputs per memory.
- `outputs/<tool>/{VERSION}/<mem_id>/`: tool-classified archived views, currently including `design_compiler / genus / verdi / spyglass / tessent / vcs`.
- `reports/{VERSION}/`: build report, attempt logs, diff report, tree, and these delivery notes.

## Traceability

- Source: `{SERVER}`
- Package time: `{timestamp}`
- Total files: `{file_count}`
- Total size: `{format_size(total_size)}`

## Complete Directory Tree (Inside the Archive)

```text
{tree}
```
"""


def markdown_to_html(title: str, markdown_text: str) -> str:
    body = html.escape(markdown_text)
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>{html.escape(title)}</title>
  <style>
    body {{
      font-family: "Microsoft YaHei", "Segoe UI", Arial, sans-serif;
      margin: 32px;
      color: #111;
      line-height: 1.45;
      white-space: pre-wrap;
      font-size: 12px;
    }}
    code, pre {{
      font-family: Consolas, "Courier New", monospace;
    }}
  </style>
</head>
<body>{body}</body>
</html>
"""


def main() -> None:
    REPORT_DIR.mkdir(parents=True, exist_ok=True)
    manifest = load_manifest(MANIFEST_PATH)
    mem_ids, rows = summarize_memories(manifest)
    area_summary = load_area_summary(REPORT_DIR)
    area_rows = build_area_rows(mem_ids, area_summary)
    tree = build_tree(ROOT)
    file_count, total_size = collect_stats(ROOT)

    (REPORT_DIR / "package_tree.txt").write_text(tree + "\n", encoding="utf-8")

    zh_md = render_markdown_zh(mem_ids, rows, area_rows, tree, file_count, total_size)
    en_md = render_markdown_en(mem_ids, rows, area_rows, tree, file_count, total_size)

    zh_md_path = REPORT_DIR / "Sky130_memory_1r1w_full_delivery_zh.md"
    en_md_path = REPORT_DIR / "Sky130_memory_1r1w_full_delivery_en.md"
    zh_html_path = REPORT_DIR / "Sky130_memory_1r1w_full_delivery_zh.html"
    en_html_path = REPORT_DIR / "Sky130_memory_1r1w_full_delivery_en.html"

    zh_md_path.write_text(zh_md, encoding="utf-8")
    en_md_path.write_text(en_md, encoding="utf-8")
    zh_html_path.write_text(markdown_to_html("Sky130 Memory 1R1W Full Delivery Notes (ZH)", zh_md), encoding="utf-8")
    en_html_path.write_text(markdown_to_html("Sky130 Memory 1R1W Full Delivery Notes (EN)", en_md), encoding="utf-8")


if __name__ == "__main__":
    main()
