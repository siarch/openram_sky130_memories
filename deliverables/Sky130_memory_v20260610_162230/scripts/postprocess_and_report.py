import json
import os
import re
import shutil
import subprocess
from datetime import datetime
from pathlib import Path

ROOT = Path(os.environ.get("SKY130_MEMORY_ROOT", "/Sky130_memory"))
VERSION_TAG = os.environ.get("SKY130_MEMORY_VERSION", "")
GROUP_NAME = os.environ.get("SKY130_MEMORY_GROUP", "sky130mem")

def sh(cmd: str, timeout_sec: int = 120):
    return subprocess.run(cmd, shell=True, text=True, capture_output=True, timeout=timeout_sec)

def which(cmd: str):
    return shutil.which(cmd) or ""

def find_first(dir_path: Path, pattern: str):
    for p in dir_path.glob(pattern):
        return p
    return None

def normalize_id(s: str):
    return re.sub(r"[^A-Za-z0-9_.-]+", "_", s)

def ensure_dir(p: Path):
    p.mkdir(parents=True, exist_ok=True)

def copy_if_exists(src: Path, dst: Path):
    if src and src.exists():
        ensure_dir(dst.parent)
        shutil.copy2(src, dst)
        return str(dst)
    return ""

def parse_lib_basic(path: Path):
    text = path.read_text(encoding="utf-8", errors="replace")
    m = re.search(r'library\s*\(\s*([^)]+)\s*\)\s*\{', text)
    return m.group(1).strip().strip('"') if m else None

def validate_outputs(entry):
    issues = []
    if not entry.get("verilog"):
        issues.append("missing_verilog")
    if not entry.get("lib"):
        issues.append("missing_lib")
    if not entry.get("lef"):
        issues.append("missing_lef")
    return issues

def main():
    build_root = ROOT / "work" / "openram_builds" / VERSION_TAG
    out_root = ROOT / "outputs"
    manifest_dir = ROOT / "manifests" / VERSION_TAG
    log_dir = ROOT / "logs" / VERSION_TAG
    ensure_dir(manifest_dir)
    ensure_dir(log_dir)

    tool_presence = {
        "iverilog": bool(which("iverilog")),
        "dc_shell": bool(which("dc_shell")),
        "genus": bool(which("genus")),
        "spyglass": bool(which("spyglass")),
        "verdi": bool(which("verdi")),
        "tessent": bool(which("tessent")),
        "pandoc": bool(which("pandoc")),
    }
    tool_smoke = {"tools": tool_presence, "checks": []}

    entries = []
    for mem_dir in sorted(build_root.glob("*")):
        if not mem_dir.is_dir():
            continue
        mem_id = mem_dir.name
        tag = normalize_id(mem_id)

        verilog = find_first(mem_dir, "*.v")
        lef = find_first(mem_dir, "*.lef")
        lib = find_first(mem_dir, "*_TT_1p8V_25C.lib") or find_first(mem_dir, "*.lib")
        spice = find_first(mem_dir, "*.sp")
        html = find_first(mem_dir, "*.html")

        dc_dir = out_root / "dc" / VERSION_TAG / tag
        genus_dir = out_root / "genus" / VERSION_TAG / tag
        verdi_dir = out_root / "verdi" / VERSION_TAG / tag
        spyglass_dir = out_root / "spyglass" / VERSION_TAG / tag
        dc_full_dir = out_root / "design_compiler" / VERSION_TAG / tag
        tessent_dir = out_root / "tessent" / VERSION_TAG / tag

        paths = {
            "id": mem_id,
            "work_dir": str(mem_dir),
            "verilog": copy_if_exists(verilog, verdi_dir / f"{tag}.v"),
            "lib": copy_if_exists(lib, genus_dir / f"{tag}.lib"),
            "lef": copy_if_exists(lef, out_root / "genus" / VERSION_TAG / tag / f"{tag}.lef"),
            "spice": copy_if_exists(spice, verdi_dir / f"{tag}.sp"),
            "html": copy_if_exists(html, out_root / "verdi" / VERSION_TAG / tag / f"{tag}.html"),
        }

        if paths["lib"]:
            shutil.copy2(paths["lib"], dc_dir / f"{tag}.lib")
            shutil.copy2(paths["lib"], dc_full_dir / f"{tag}.lib")

        if paths["verilog"]:
            shutil.copy2(paths["verilog"], spyglass_dir / f"{tag}.v")
            shutil.copy2(paths["verilog"], dc_full_dir / f"{tag}.v")
            shutil.copy2(paths["verilog"], tessent_dir / f"{tag}.v")

        spy_prj = spyglass_dir / f"{tag}.prj"
        ensure_dir(spy_prj.parent)
        if not spy_prj.exists():
            spy_prj.write_text(f"read_file -type verilog {tag}.v\n", encoding="utf-8")

        tessent_note = tessent_dir / "README_TESSENT_INPUTS.txt"
        ensure_dir(tessent_note.parent)
        if not tessent_note.exists():
            tessent_note.write_text(
                "This directory contains the RTL/Verilog view. Tessent-specific DFT collateral generation requires Tessent flow integration and is left to the team environment.\n",
                encoding="utf-8",
            )

        lib_name = parse_lib_basic(Path(paths["lib"])) if paths["lib"] else None
        smoke = {}
        if tool_presence["iverilog"] and paths["verilog"]:
            r = sh(f"iverilog -tnull \"{paths['verilog']}\"", timeout_sec=120)
            smoke["iverilog_rc"] = r.returncode
        if tool_presence["dc_shell"] and paths["lib"]:
            tcl = log_dir / f"{tag}_dc_read_lib.tcl"
            tcl.write_text("\n".join([f"read_lib -format liberty \"{paths['lib']}\"", "report_lib", "exit"]) + "\n", encoding="utf-8")
            r = sh(f"dc_shell -f \"{tcl}\"", timeout_sec=300)
            (log_dir / f"{tag}_dc_read_lib.out").write_text((r.stdout or "") + (r.stderr or ""), encoding="utf-8")
            smoke["dc_shell_read_lib_rc"] = r.returncode
        if tool_presence["genus"] and paths["lib"]:
            tcl = log_dir / f"{tag}_genus_read_lib.tcl"
            tcl.write_text("\n".join([f"read_libs \"{paths['lib']}\"", "report_libs", "exit"]) + "\n", encoding="utf-8")
            r = sh(f"genus -batch -files \"{tcl}\"", timeout_sec=300)
            (log_dir / f"{tag}_genus_read_lib.out").write_text((r.stdout or "") + (r.stderr or ""), encoding="utf-8")
            smoke["genus_read_lib_rc"] = r.returncode
        entry = {
            **paths,
            "library_name": lib_name,
            "issues": validate_outputs(paths),
            "smoke": smoke,
        }
        entries.append(entry)

    out_manifest = {
        "root": str(ROOT),
        "version": VERSION_TAG,
        "generated_at": datetime.utcnow().isoformat() + "Z",
        "group": GROUP_NAME,
        "memories": entries,
    }
    (manifest_dir / "memory_manifest.json").write_text(
        json.dumps(out_manifest, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )

    report_md = ROOT / "reports" / VERSION_TAG / "Sky130_memory_report.md"
    ensure_dir(report_md.parent)
    lines = []
    lines.append("# Sky130 Memory Compiler Deployment Report")
    lines.append("")
    lines.append("## 已完成工作综述")
    lines.append(f"- 根目录: `{ROOT}`")
    lines.append(f"- 版本标识: `{VERSION_TAG}`")
    lines.append(f"- 已发现并归档 memory 条目数: `{len(entries)}`")
    lines.append("")
    lines.append("## 已生成内存清单")
    lines.append("")
    lines.append("| ID | library_name | work_dir | outputs(genus) | outputs(verdi) | issues |")
    lines.append("|---|---|---|---|---|---|")
    for e in entries:
        lines.append(
            "| {id} | {library_name} | {work_dir} | {genus_lib} | {verdi_v} | {issues} |".format(
                id=e["id"],
                library_name=e.get("library_name") or "",
                work_dir=e.get("work_dir") or "",
                genus_lib=e.get("lib") or "",
                verdi_v=e.get("verilog") or "",
                issues=",".join(e.get("issues") or []),
            )
        )
    lines.append("")
    lines.append("## 验证与归档")
    lines.append("")
    lines.append("| Tool | Detected | Notes |")
    lines.append("|---|---:|---|")
    for k, v in tool_presence.items():
        lines.append(f"| {k} | {'yes' if v else 'no'} |  |")
    lines.append("")
    lines.append("### 自动化 smoke check 说明")
    lines.append("- 若 `iverilog` 可用，会对每个 memory 的 Verilog 视图做一次语法级编译检查。")
    lines.append("- 若 `dc_shell` 可用，会尝试执行 `read_lib -format liberty` 读取 `.lib`，结果写入 `logs/<version>/*_dc_read_lib.out`。")
    lines.append("- 若 `genus` 可用，会尝试执行 `read_libs` 读取 `.lib`，结果写入 `logs/<version>/*_genus_read_lib.out`。")
    lines.append("- 若工具未安装或无许可证，检查会被跳过或返回非 0，仍会保留日志以便团队定位环境问题。")
    lines.append("")
    lines.append("## 定制内存生成操作指南")
    lines.append("")
    lines.append("### 环境变量")
    lines.append("- `SKY130_MEMORY_ROOT` (默认 `/Sky130_memory`)")
    lines.append("- `SKY130_MEMORY_GROUP` (默认 `sky130mem`)")
    lines.append("- `SKY130_MEMORY_VERSION` (默认自动时间戳)")
    lines.append("- `OPENRAM_ROOT` (默认 `$SKY130_MEMORY_ROOT/src/OpenRAM-stable`)")
    lines.append("- `PDK_ROOT` (默认 `$SKY130_MEMORY_ROOT/pdk`)")
    lines.append("")
    lines.append("### 生成/重跑流程")
    lines.append("1. 更新配置清单：编辑 `$SKY130_MEMORY_ROOT/configs/memory_matrix.yaml`")
    lines.append("2. 生成每个配置的编译脚本：`python3 $SKY130_MEMORY_ROOT/scripts/generate_compile_scripts.py`")
    lines.append("3. 逐个执行 `$SKY130_MEMORY_ROOT/scripts/compile/<id>.sh`")
    lines.append("4. 归档多工具输出并生成报告：`python3 $SKY130_MEMORY_ROOT/scripts/postprocess_and_report.py`")
    lines.append("")
    lines.append("### 常见问题排查")
    lines.append("- `.lib` 缺失：检查 OpenRAM 是否启用 characterization 输出以及 PDK/技术路径是否正确")
    lines.append("- `.lef` 缺失：确认不是 netlist_only 模式，且布局流程可用")
    lines.append("- 工具不可用：DC/Genus/Spyglass/Verdi/Tessent 的专有命令需在服务器环境中正确配置")
    lines.append("")
    report_md.write_text("\n".join(lines) + "\n", encoding="utf-8")

    report_pdf = ROOT / "reports" / VERSION_TAG / "Sky130_memory_report.pdf"
    if tool_presence["pandoc"]:
        sh(f"pandoc \"{report_md}\" -o \"{report_pdf}\"", timeout_sec=300)

if __name__ == "__main__":
    main()
