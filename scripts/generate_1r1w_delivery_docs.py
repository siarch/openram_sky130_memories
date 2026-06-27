from __future__ import annotations

import html
from datetime import datetime
from pathlib import Path


PACKAGE_NAME = "Sky130_memory_1r1w_v20260612_1r1w.tar.gz"
VERSION = "v20260612_1r1w"
SERVER = "ryan@192.168.49.140:/Sky130_memory"
ROOT = Path(r"D:\trae_projects\Sky130_Power\deliverables\Sky130_memory_1r1w_v20260612_1r1w\Sky130_memory")
REPORT_DIR = ROOT / "reports" / VERSION


def parse_memory_ids(config_path: Path) -> list[str]:
    mem_ids: list[str] = []
    for line in config_path.read_text(encoding="utf-8").splitlines():
        stripped = line.strip()
        if stripped.startswith("- id:"):
            mem_ids.append(stripped.split(":", 1)[1].strip())
    return mem_ids


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


def render_markdown_zh(mem_ids: list[str], tree: str, file_count: int, total_size: int) -> str:
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    mem_list = "\n".join(f"- `{mem_id}`" for mem_id in mem_ids)
    return f"""# Sky130 Memory 1R1W 交付说明（中文）

## 交付包

- 文件名：`{PACKAGE_NAME}`
- 交付版本：`{VERSION}`
- 交付范围：仅包含本次 1R1W memory 需求对应的配置、代码实现、编译脚本、OpenRAM 原始产物、按工具归档视图、日志、manifest、报告与交付说明。
- 打包根路径：`/Sky130_memory`

## 解压方式

```bash
tar -xzf {PACKAGE_NAME}
```

解压后内容以 `/Sky130_memory` 为相对根路径组织；包内不包含旧版 `1rw` 交付，也不包含完整 PDK。

## 目标 Memory 清单

{mem_list}

## 交付内容说明

- `VERSION`：本次 1R1W 交付版本标识。
- `configs/memory_matrix.yaml`：本次 1R1W memory 请求清单。
- `src/OpenRAM-stable/compiler/modules/replica_column.py`：本次为适配 `netlist_only` 1R1W 流程而修订的源码实现。
- `scripts/generate_compile_scripts.py`、`scripts/postprocess_and_report.py`、`scripts/run_all.sh`：批量生成与归档脚本。
- `scripts/compile/*.sh`：13 个 1R1W memory 的独立编译脚本。
- `work/openram_configs/*.py`：OpenRAM 配置文件，仅包含本次 1R1W memory 与共用 `sky130_sram_common.py`。
- `work/openram_builds/{VERSION}/`：每个 memory 的 OpenRAM 原始生成产物（`.v/.lib/.sp/.lvs.sp/.html` 等）。
- `outputs/<tool>/{VERSION}/<mem_id>/`：按工具分类归档的前端/综合/验证/DFT视图。
- `logs/{VERSION}/`：本次批量生成日志，以及 DC/Genus `.lib` smoke-check 日志。
- `manifests/{VERSION}/`：机器可读 manifest 与脚本清单。
- `reports/{VERSION}/`：项目报告、本交付说明（Markdown/PDF）与完整目录树。

## 代码实现与范围约束

- 本次交付仅保留 `1R1W` 相关实现与产物，不包含历史 `1RW` 版本文件。
- 物理视图（如 `LEF/DEF`）未纳入本包；本次流程按 `netlist_only` 收口，聚焦前端设计、验证、综合、DFT 与功耗分析所需视图。
- manifest 中的缺失项标记可用于追踪未提供的物理后端文件。

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


def render_markdown_en(mem_ids: list[str], tree: str, file_count: int, total_size: int) -> str:
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    mem_list = "\n".join(f"- `{mem_id}`" for mem_id in mem_ids)
    return f"""# Sky130 Memory 1R1W Delivery Notes (English)

## Delivery Archive

- File name: `{PACKAGE_NAME}`
- Delivery version: `{VERSION}`
- Scope: only the configuration, code implementation, compile scripts, raw OpenRAM outputs, tool-classified views, logs, manifests, reports, and delivery notes for this requested 1R1W memory batch.
- Archive root: `/Sky130_memory`

## How to Extract

```bash
tar -xzf {PACKAGE_NAME}
```

After extraction, the content is organized with `/Sky130_memory` as the relative root. The package excludes historical `1rw` deliverables and does not embed the full PDK.

## Target Memory List

{mem_list}

## What Is Included

- `VERSION`: version tag for this 1R1W delivery.
- `configs/memory_matrix.yaml`: requested 1R1W memory matrix.
- `src/OpenRAM-stable/compiler/modules/replica_column.py`: patched source implementation for the `netlist_only` 1R1W flow.
- `scripts/generate_compile_scripts.py`, `scripts/postprocess_and_report.py`, `scripts/run_all.sh`: generation and post-processing scripts.
- `scripts/compile/*.sh`: 13 standalone compile scripts for the requested 1R1W memories.
- `work/openram_configs/*.py`: OpenRAM configs for this 1R1W batch plus shared `sky130_sram_common.py`.
- `work/openram_builds/{VERSION}/`: raw OpenRAM outputs per memory (`.v/.lib/.sp/.lvs.sp/.html`, etc.).
- `outputs/<tool>/{VERSION}/<mem_id>/`: archived views grouped by tool.
- `logs/{VERSION}/`: batch logs and DC/Genus `.lib` smoke-check logs.
- `manifests/{VERSION}/`: machine-readable manifests and script inventory.
- `reports/{VERSION}/`: project report, these delivery notes (Markdown/PDF), and the complete directory tree.

## Implementation and Scope Notes

- This package keeps only the 1R1W-related implementation and deliverables for this request.
- Physical backend views such as `LEF/DEF` are intentionally excluded; this release is closed under `netlist_only` for frontend, verification, synthesis, DFT, and power-analysis usage.
- Missing-item flags in the manifest remain the authoritative traceability source for omitted physical views.

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
    mem_ids = parse_memory_ids(ROOT / "configs" / "memory_matrix.yaml")
    tree = build_tree(ROOT)
    file_count, total_size = collect_stats(ROOT)

    (REPORT_DIR / "package_tree.txt").write_text(tree + "\n", encoding="utf-8")

    zh_md = render_markdown_zh(mem_ids, tree, file_count, total_size)
    en_md = render_markdown_en(mem_ids, tree, file_count, total_size)

    zh_md_path = REPORT_DIR / "Sky130_memory_1r1w_delivery_zh.md"
    en_md_path = REPORT_DIR / "Sky130_memory_1r1w_delivery_en.md"
    zh_html_path = REPORT_DIR / "Sky130_memory_1r1w_delivery_zh.html"
    en_html_path = REPORT_DIR / "Sky130_memory_1r1w_delivery_en.html"

    zh_md_path.write_text(zh_md, encoding="utf-8")
    en_md_path.write_text(en_md, encoding="utf-8")
    zh_html_path.write_text(markdown_to_html("Sky130 Memory 1R1W Delivery Notes (ZH)", zh_md), encoding="utf-8")
    en_html_path.write_text(markdown_to_html("Sky130 Memory 1R1W Delivery Notes (EN)", en_md), encoding="utf-8")


if __name__ == "__main__":
    main()
