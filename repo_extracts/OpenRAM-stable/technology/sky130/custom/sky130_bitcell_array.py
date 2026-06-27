#!/usr/bin/env python3
# See LICENSE for licensing information.




#
# Copyright (c) 2016-2023 Regents of the University of California
# All rights reserved.
#

from openram import debug
import json
import traceback
import urllib.request
from openram.modules import bitcell_array
from openram.sram_factory import factory
from openram import OPTS
from .sky130_bitcell_base_array import sky130_bitcell_base_array


# #region debug-point GA:sky130-bitcell-array-report-event
def _dbg_report(hypothesis_id, location, msg, data=None):
    env_path = "/mnt/d/trae_projects/Sky130_Power/.dbg/openram-power-exit.env"
    url = "http://127.0.0.1:7777/event"
    session_id = "openram-power-exit"
    try:
        with open(env_path, "r", encoding="utf-8") as env_file:
            for line in env_file:
                line = line.strip()
                if line.startswith("DEBUG_SERVER_URL="):
                    url = line.split("=", 1)[1]
                elif line.startswith("DEBUG_SESSION_ID="):
                    session_id = line.split("=", 1)[1]
    except Exception:
        pass
    payload = {
        "sessionId": session_id,
        "runId": "pre-fix",
        "hypothesisId": hypothesis_id,
        "location": location,
        "msg": msg,
        "data": data or {},
    }
    try:
        urllib.request.urlopen(
            urllib.request.Request(
                url,
                data=json.dumps(payload).encode(),
                headers={"Content-Type": "application/json"},
            )
        ).read()
    except Exception:
        pass
# #endregion


class sky130_bitcell_array(bitcell_array, sky130_bitcell_base_array):
    """
    Creates a rows x cols array of memory cells.
    Assumes bit-lines and word lines are connected by abutment.
    """
    def __init__(self, rows, cols, column_offset=0, name=""):
        # #region debug-point GB:ctor-enter
        _dbg_report("GB", "technology/sky130/custom/sky130_bitcell_array.py:ctor_enter", "[DEBUG] sky130_bitcell_array ctor enter", {"rows": rows, "cols": cols, "column_offset": column_offset})
        # #endregion
        # Don't call the regular bitcell_array constructor since we don't want its constructor, just
        # some of it's useful member functions
        sky130_bitcell_base_array.__init__(self, rows=rows, cols=cols, column_offset=column_offset, name=name)
        if self.row_size % 2 == 0:
            debug.error("Invalid number of rows {}. number of rows (excluding dummy rows) must be odd to connect to col ends".format(self.row_size), -1)
        debug.info(1, "Creating {0} {1} x {2}".format(self.name, self.row_size, self.column_size))
        self.add_comment("rows: {0} cols: {1}".format(self.row_size, self.column_size))

        # This will create a default set of bitline/wordline names
        self.create_all_bitline_names()
        self.create_all_wordline_names()
        # #region debug-point GC:before-create-netlist
        _dbg_report("GC", "technology/sky130/custom/sky130_bitcell_array.py:before_create_netlist", "[DEBUG] before create_netlist()", {"name": self.name})
        # #endregion
        self.create_netlist()
        # #region debug-point GD:after-create-netlist
        _dbg_report("GD", "technology/sky130/custom/sky130_bitcell_array.py:after_create_netlist", "[DEBUG] after create_netlist()", {"name": self.name, "inst_count": len(self.insts)})
        # #endregion
        if not OPTS.netlist_only:
            self.create_layout()
            self.add_supply_pins()

    def add_modules(self):
        """ Add the modules used in this design """
        # Bitcell for port names only
        # #region debug-point GE:before-cell-create
        _dbg_report("GE", "technology/sky130/custom/sky130_bitcell_array.py:before_cell_create", "[DEBUG] before cell create", {"bitcell": OPTS.bitcell})
        # #endregion
        self.cell = factory.create(module_type=OPTS.bitcell, version="opt1")
        # #region debug-point GF:after-cell-create
        _dbg_report("GF", "technology/sky130/custom/sky130_bitcell_array.py:after_cell_create", "[DEBUG] after cell create", {"cell": getattr(self.cell, "name", None)})
        # #endregion
        # #region debug-point GG:before-cell2-create
        _dbg_report("GG", "technology/sky130/custom/sky130_bitcell_array.py:before_cell2_create", "[DEBUG] before cell2 create", {"bitcell": OPTS.bitcell})
        # #endregion
        self.cell2 = factory.create(module_type=OPTS.bitcell, version="opt1a")
        # #region debug-point GH:after-cell2-create
        _dbg_report("GH", "technology/sky130/custom/sky130_bitcell_array.py:after_cell2_create", "[DEBUG] after cell2 create", {"cell2": getattr(self.cell2, "name", None)})
        # #endregion
        # #region debug-point GI:before-strap-create
        _dbg_report("GI", "technology/sky130/custom/sky130_bitcell_array.py:before_strap_create", "[DEBUG] before strap create", {})
        # #endregion
        self.strap = factory.create(module_type="internal", version="wlstrap")
        # #region debug-point GJ:after-strap-create
        _dbg_report("GJ", "technology/sky130/custom/sky130_bitcell_array.py:after_strap_create", "[DEBUG] after strap create", {"strap": getattr(self.strap, "name", None)})
        # #endregion
        # #region debug-point GK:before-strap2-create
        _dbg_report("GK", "technology/sky130/custom/sky130_bitcell_array.py:before_strap2_create", "[DEBUG] before strap2 create", {"version": "wlstrap_p"})
        # #endregion
        self.strap2 = factory.create(module_type="internal", version="wlstrap_p")
        # #region debug-point GL:after-strap2-create
        _dbg_report("GL", "technology/sky130/custom/sky130_bitcell_array.py:after_strap2_create", "[DEBUG] after strap2 create", {"strap2": getattr(self.strap2, "name", None)})
        # #endregion
        # #region debug-point GM:before-strap3-create
        _dbg_report("GM", "technology/sky130/custom/sky130_bitcell_array.py:before_strap3_create", "[DEBUG] before strap3 create", {"version": "wlstrapa"})
        # #endregion
        self.strap3 = factory.create(module_type="internal", version="wlstrapa")
        # #region debug-point GN:after-strap3-create
        _dbg_report("GN", "technology/sky130/custom/sky130_bitcell_array.py:after_strap3_create", "[DEBUG] after strap3 create", {"strap3": getattr(self.strap3, "name", None)})
        # #endregion
        # #region debug-point GO:before-strap4-create
        _dbg_report("GO", "technology/sky130/custom/sky130_bitcell_array.py:before_strap4_create", "[DEBUG] before strap4 create", {"version": "wlstrapa_p"})
        # #endregion
        self.strap4 = factory.create(module_type="internal", version="wlstrapa_p")
        # #region debug-point GP:after-strap4-create
        _dbg_report("GP", "technology/sky130/custom/sky130_bitcell_array.py:after_strap4_create", "[DEBUG] after strap4 create", {"strap4": getattr(self.strap4, "name", None)})
        # #endregion

    def create_instances(self):
        """ Create the module instances used in this design """
        _dbg_report("GQ", "technology/sky130/custom/sky130_bitcell_array.py:create_instances_enter", "[DEBUG] create_instances enter", {"row_size": self.row_size, "column_size": self.column_size})
        self.cell_inst = {}
        self.array_layout = []
        alternate_bitcell = (self.row_size) % 2
        last = {"row": None, "col": None, "phase": "init"}

        def _proc_mem_kb():
            try:
                out = {}
                with open("/proc/self/status", "r", encoding="utf-8") as f:
                    for line in f:
                        if line.startswith("VmRSS:") or line.startswith("VmSize:"):
                            key, value = line.split(":", 1)
                            out[key] = value.strip()
                return out
            except Exception:
                return {}

        try:
            for row in range(0, self.row_size):
                last["row"] = row
                last["col"] = None
                last["phase"] = "row_enter"

                row_layout = []

                alternate_strap = (self.row_size + 1) % 2
                for col in range(0, self.column_size):
                    last["col"] = col
                    last["phase"] = "bitcell_add_inst"

                    if alternate_bitcell == 1:
                        row_layout.append(self.cell)
                        self.cell_inst[row, col] = self.add_inst(
                            name="row_{}_col_{}_bitcell".format(row, col),
                            mod=self.cell,
                        )
                    else:
                        row_layout.append(self.cell2)
                        self.cell_inst[row, col] = self.add_inst(
                            name="row_{}_col_{}_bitcell".format(row, col),
                            mod=self.cell2,
                        )

                    last["phase"] = "bitcell_connect_inst"
                    self.connect_inst(self.get_bitcell_pins(row, col))

                    if col != self.column_size - 1:
                        last["phase"] = "strap_add_inst"
                        if alternate_strap:
                            if row % 2:
                                name = "row_{}_col_{}_wlstrapa_p".format(row, col)
                                row_layout.append(self.strap4)
                                self.add_inst(name=name, mod=self.strap4)
                            else:
                                name = "row_{}_col_{}_wlstrap_p".format(row, col)
                                row_layout.append(self.strap2)
                                self.add_inst(name=name, mod=self.strap2)
                            alternate_strap = 0
                        else:
                            if row % 2:
                                name = "row_{}_col_{}_wlstrapa".format(row, col)
                                row_layout.append(self.strap3)
                                self.add_inst(name=name, mod=self.strap3)
                            else:
                                name = "row_{}_col_{}_wlstrap".format(row, col)
                                row_layout.append(self.strap)
                                self.add_inst(name=name, mod=self.strap)
                            alternate_strap = 1

                        last["phase"] = "strap_connect_inst"
                        self.connect_inst(self.get_strap_pins(row, col, name))

                    if (row in (14, 15, 16, 17)) and (col in (0, 1, 2, 3, 7, 15, 31, 63, self.column_size - 2)):
                        _dbg_report(
                            "GR",
                            "technology/sky130/custom/sky130_bitcell_array.py:create_instances_progress",
                            "[DEBUG] create_instances progress",
                            {"row": row, "col": col, "inst_count": len(self.insts), "last": dict(last), **_proc_mem_kb()},
                        )

                if alternate_bitcell == 0:
                    alternate_bitcell = 1
                else:
                    alternate_bitcell = 0

                self.array_layout.append(row_layout)
                if row in (0, 15, 31, 47, self.row_size - 1):
                    _dbg_report(
                        "GR",
                        "technology/sky130/custom/sky130_bitcell_array.py:create_instances_progress",
                        "[DEBUG] create_instances progress",
                        {"row": row, "col": None, "inst_count": len(self.insts), "last": dict(last), **_proc_mem_kb()},
                    )

            _dbg_report("GS", "technology/sky130/custom/sky130_bitcell_array.py:create_instances_exit", "[DEBUG] create_instances exit", {"inst_count": len(self.insts)})
        except BaseException as e:
            _dbg_report(
                "GT",
                "technology/sky130/custom/sky130_bitcell_array.py:create_instances_exception",
                "[DEBUG] create_instances exception",
                {"exc_type": type(e).__name__, "exc": str(e), "traceback": traceback.format_exc(), "inst_count": len(self.insts), "last": dict(last), **_proc_mem_kb()},
            )
            raise
