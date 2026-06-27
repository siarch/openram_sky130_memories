"""
Single-port SKY130 SRAM, 64 bytes total, with 2-bit write granularity.
"""

word_size = 8  # Bits
num_words = 64
human_byte_size = "{:.0f}bytes".format((word_size * num_words) / 8)

write_size = 2  # Bits

num_rw_ports = 1
num_r_ports = 0
num_w_ports = 0
num_spare_rows = 1
num_spare_cols = 1
ports_human = "1rw"

import os
exec(open(os.path.join(os.path.dirname(__file__), "sky130_sram_common.py")).read())
use_nix = False
check_lvsdrc = False
spice_name = "ngspice"
drc_name = "magic"
lvs_name = "netgen"
pex_name = "magic"
keep_temp = True
