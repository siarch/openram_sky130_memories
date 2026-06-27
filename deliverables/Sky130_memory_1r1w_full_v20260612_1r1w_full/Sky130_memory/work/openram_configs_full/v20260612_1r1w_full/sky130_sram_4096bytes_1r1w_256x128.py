word_size = 256
num_words = 128
human_byte_size = "4kbytes"
write_size = 256
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
spice_name = 'ngspice'
drc_name = 'magic'
lvs_name = 'netgen'
pex_name = 'magic'
nominal_corner_only = False
analytical_delay = True
output_extended_config = True
process_corners = ['SS', 'TT', 'FF']
supply_voltages = [1.7, 1.8, 1.9]
temperatures = [0, 25, 100]
use_specified_corners = [('SS', 1.7, 0), ('SS', 1.7, 25), ('SS', 1.7, 100), ('TT', 1.8, 0), ('TT', 1.8, 25), ('TT', 1.8, 100), ('FF', 1.9, 0), ('FF', 1.9, 25), ('FF', 1.9, 100)]
