#!/usr/bin/env python3
# See LICENSE for licensing information.
#
# Copyright (c) 2016-2024 Regents of the University of California and The Board
# of Regents for the Oklahoma Agricultural and Mechanical College
# (acting for and on behalf of Oklahoma State University)
# All rights reserved.
#
"""
SRAM Compiler

The output files append the given suffixes to the output name:
a spice (.sp) file for circuit simulation
a GDS2 (.gds) file containing the layout
a LEF (.lef) file for preliminary P&R (real one should be from layout)
a Liberty (.lib) file for timing analysis/optimization
"""

import sys
import os
import datetime
import json
import urllib.request

# You don't need the next two lines if you're sure that openram package is installed
from common import *
make_openram_package()
import openram

(OPTS, args) = openram.parse_args()

# Check that we are left with a single configuration file as argument.
if len(args) != 1:
    print(openram.USAGE)
    sys.exit(2)

# Set top process to openram
OPTS.top_process = 'openram'

# These depend on arguments, so don't load them until now.
from openram import debug


# #region debug-point A:report-event
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

# Parse config file and set up all the options
openram.init_openram(config_file=args[0])

# Ensure that the right bitcell exists or use the parameterised one
openram.setup_bitcell()

# Only print banner here so it's not in unit tests
openram.print_banner()

# Keep track of running stats
start_time = datetime.datetime.now()
openram.print_time("Start", start_time)

# Output info about this run
openram.report_status()

# #region debug-point B:after-report-status
_dbg_report("B", "sram_compiler.py:report_status", "[DEBUG] after report_status", {"output_name": OPTS.output_name, "output_path": OPTS.output_path, "netlist_only": OPTS.netlist_only})
# #endregion

debug.print_raw("Words per row: {}".format(OPTS.words_per_row))

output_extensions = ["lvs", "sp", "v", "lib", "py", "html", "log"]
# Only output lef/gds if back-end
if not OPTS.netlist_only:
    output_extensions.extend(["lef", "gds"])

output_files = ["{0}{1}.{2}".format(OPTS.output_path,
                                    OPTS.output_name, x)
                for x in output_extensions]
debug.print_raw("Output files are: ")
for path in output_files:
    debug.print_raw(path)

# Create an SRAM (we can also pass sram_config, see documentation/tutorials for details)
from openram import sram
# #region debug-point C:before-sram-create
_dbg_report("C", "sram_compiler.py:before_sram", "[DEBUG] before sram()", {"output_name": OPTS.output_name, "words_per_row": OPTS.words_per_row})
# #endregion
s = sram()
# #region debug-point D:after-sram-create
_dbg_report("D", "sram_compiler.py:after_sram", "[DEBUG] after sram()", {"sram_name": getattr(s, "name", None)})
# #endregion

# Output the files for the resulting SRAM
# #region debug-point E:before-save
_dbg_report("E", "sram_compiler.py:before_save", "[DEBUG] before save()", {"output_path": OPTS.output_path, "output_name": OPTS.output_name})
# #endregion
s.save()
# #region debug-point F:after-save
_dbg_report("F", "sram_compiler.py:after_save", "[DEBUG] after save()", {"output_name": OPTS.output_name})
# #endregion

# Delete temp files etc.
# #region debug-point G:before-end
_dbg_report("G", "sram_compiler.py:before_end", "[DEBUG] before end_openram()", {"output_name": OPTS.output_name})
# #endregion
openram.end_openram()
openram.print_time("End", datetime.datetime.now(), start_time)
