word_size = 32
num_words = 256
human_byte_size = "{:.0f}kbytes".format((word_size * num_words)/1024/8)
write_size = 8
num_rw_ports = 1
num_r_ports = 0
num_w_ports = 0
num_spare_rows = 1
num_spare_cols = 1
ports_human = '1rw'
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
