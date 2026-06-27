word_size = 32
num_words = 32
human_byte_size = "128bytes"
write_size = 32
num_rw_ports = 0
num_r_ports = 1
num_w_ports = 1
num_spare_rows = 1
num_spare_cols = 1
ports_human = '1r1w'
import os
exec(open(os.path.join(os.path.dirname(__file__), 'sky130_sram_common.py')).read())
use_nix = False
check_lvsdrc = False
netlist_only = True
route_supplies = False
spice_name = "ngspice"
drc_name = "magic"
lvs_name = "netgen"
pex_name = "magic"
nominal_corner_only = True
