import json
import os
import shutil
from pathlib import Path

ROOT = Path(os.environ.get("SKY130_MEMORY_ROOT", "/Sky130_memory"))
VERSION_TAG = os.environ.get("SKY130_MEMORY_VERSION", "")
OPENRAM_ROOT = Path(os.environ.get("OPENRAM_ROOT", str(ROOT / "src" / "OpenRAM-stable")))
PDK_ROOT = Path(os.environ.get("PDK_ROOT", str(ROOT / "pdk")))
OFFLINE = os.environ.get("SKY130_MEMORY_OFFLINE", "0").strip().lower() in {"1", "true", "yes"}
NETLIST_ONLY = os.environ.get("SKY130_MEMORY_NETLIST_ONLY", "0").strip().lower() in {"1", "true", "yes"}

def parse_simple_yaml(path: Path):
    lines = path.read_text(encoding="utf-8").splitlines()
    items = []
    cur = None
    for raw in lines:
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        if line.startswith("- "):
            if cur:
                items.append(cur)
            cur = {}
            kv = line[2:].split(":", 1)
            if len(kv) == 2:
                cur[kv[0].strip()] = kv[1].strip().strip('"').strip("'")
        elif ":" in line and cur is not None:
            k, v = line.split(":", 1)
            cur[k.strip()] = v.strip().strip('"').strip("'")
    if cur:
        items.append(cur)
    return items

def write_executable(path: Path, text: str):
    path.write_text(text, encoding="utf-8")
    path.chmod(path.stat().st_mode | 0o111)

def main():
    matrix = ROOT / "configs" / "memory_matrix.yaml"
    compile_dir = ROOT / "scripts" / "compile"
    compile_dir.mkdir(parents=True, exist_ok=True)

    items = parse_simple_yaml(matrix)
    memories = [x for x in items if x.get("id")]
    if not memories:
        raise SystemExit(f"No memories found in {matrix}")

    scripts = []
    for m in memories:
        mem_id = m["id"]
        word_size = int(m.get("word_size", "0") or "0")
        words = int(m.get("words", "0") or "0")
        write_size = int(m.get("write_size", "0") or "0")
        script_path = compile_dir / f"{mem_id}.sh"
        scripts.append(str(script_path))

        cfg_dir = ROOT / "work" / "openram_configs"
        cfg_dir.mkdir(parents=True, exist_ok=True)
        cfg_path = cfg_dir / f"{mem_id}.py"

        common_src = OPENRAM_ROOT / "macros" / "sram_configs" / "sky130_sram_common.py"
        common_dst = cfg_dir / "sky130_sram_common.py"
        if common_src.exists() and (not common_dst.exists() or common_dst.stat().st_size == 0):
            shutil.copy2(common_src, common_dst)

        cfg_text = "\n".join(
            [
                f"word_size = {word_size}",
                f"num_words = {words}",
                "human_byte_size = \"{:.0f}kbytes\".format((word_size * num_words)/1024/8)",
                f"write_size = {write_size}",
                "num_rw_ports = 1",
                "num_r_ports = 0",
                "num_w_ports = 0",
                "num_spare_rows = 1",
                "num_spare_cols = 1",
                "ports_human = '1rw'",
                "import os",
                "exec(open(os.path.join(os.path.dirname(__file__), 'sky130_sram_common.py')).read())",
                "use_nix = False",
                "check_lvsdrc = False",
                f"netlist_only = {str(NETLIST_ONLY)}",
                "route_supplies = False",
                "spice_name = \"ngspice\"",
                "drc_name = \"magic\"",
                "lvs_name = \"netgen\"",
                "pex_name = \"magic\"",
                "nominal_corner_only = True",
                "",
            ]
        )
        cfg_path.write_text(cfg_text, encoding="utf-8")

        out_dir = ROOT / "work" / "openram_builds" / VERSION_TAG / mem_id
        log_dir = ROOT / "logs" / VERSION_TAG
        log_dir.mkdir(parents=True, exist_ok=True)
        log_path = log_dir / f"{mem_id}.log"

        sh = "\n".join(
            [
                "#!/usr/bin/env bash",
                "set -euo pipefail",
                f"ROOT=\"{ROOT}\"",
                f"VERSION_TAG=\"{VERSION_TAG}\"",
                f"MEM_ID=\"{mem_id}\"",
                f"OPENRAM_ROOT=\"{OPENRAM_ROOT}\"",
                f"PDK_ROOT=\"{PDK_ROOT}\"",
                f"CFG=\"{cfg_path}\"",
                f"OUT_DIR=\"{out_dir}\"",
                f"LOG=\"{log_path}\"",
                "mkdir -p \"$OUT_DIR\"",
                "export OPENRAM_HOME=\"$OPENRAM_ROOT/compiler\"",
                "export OPENRAM_TECH=\"$OPENRAM_ROOT/technology\"",
                "export PYTHONPATH=\"$OPENRAM_HOME:$OPENRAM_TECH/sky130:$OPENRAM_TECH/sky130/custom\"",
                "export PDK_ROOT",
                "cd \"$OPENRAM_ROOT\"",
                "START_TS=$(date +%s)",
                "echo \"START=$(date -Iseconds)\" | tee \"$LOG\"",
                "echo \"MEM_ID=$MEM_ID\" | tee -a \"$LOG\"",
                "echo \"CFG=$CFG\" | tee -a \"$LOG\"",
                "echo \"OUT_DIR=$OUT_DIR\" | tee -a \"$LOG\"",
                "python3 -u \"$OPENRAM_ROOT/sram_compiler.py\" -o \"$MEM_ID\" -p \"$OUT_DIR\" \"$CFG\" 2>&1 | tee -a \"$LOG\"",
                "END_TS=$(date +%s)",
                "echo \"END=$(date -Iseconds)\" | tee -a \"$LOG\"",
                "echo \"ELAPSED_SEC=$((END_TS-START_TS))\" | tee -a \"$LOG\"",
                "",
            ]
        )
        write_executable(script_path, sh)

    manifest = {
        "root": str(ROOT),
        "version": VERSION_TAG,
        "openram_root": str(OPENRAM_ROOT),
        "pdk_root": str(PDK_ROOT),
        "offline": OFFLINE,
        "compile_scripts": scripts,
    }
    (ROOT / "manifests" / VERSION_TAG / "compile_scripts.json").write_text(
        json.dumps(manifest, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )

if __name__ == "__main__":
    main()
