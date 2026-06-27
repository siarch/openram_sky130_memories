* Functional test stimulus file for 10ns period

* SS process corner
.lib "/Sky130_memory/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice" ss
.include "/tmp/openram_ryan_34035_temp/sram.sp"

* Global Power Supplies
Vvdd vdd 0 1.7

*Nodes gnd and 0 are the same global ground node in ngspice/hspice/xa. Otherwise, this source may be needed.
*Vgnd gnd 0 0.0

* Instantiation of the SRAM
Xsky130_sram_128bytes_1r1w_16x64 din0_0 din0_1 din0_2 din0_3 din0_4 din0_5 din0_6 din0_7 din0_8 din0_9 din0_10 din0_11 din0_12 din0_13 din0_14 din0_15 din0_16 a0_0 a0_1 a0_2 a0_3 a0_4 a0_5 a0_6 a1_0 a1_1 a1_2 a1_3 a1_4 a1_5 a1_6 CSB0 CSB1 clk0 clk1 SPARE_WEN0_0 dout1_0 dout1_1 dout1_2 dout1_3 dout1_4 dout1_5 dout1_6 dout1_7 dout1_8 dout1_9 dout1_10 dout1_11 dout1_12 dout1_13 dout1_14 dout1_15 dout1_16 vdd gnd sky130_sram_128bytes_1r1w_16x64

* SRAM output loads
CD10 dout1_0  0 27.56f
CD11 dout1_1  0 27.56f
CD12 dout1_2  0 27.56f
CD13 dout1_3  0 27.56f
CD14 dout1_4  0 27.56f
CD15 dout1_5  0 27.56f
CD16 dout1_6  0 27.56f
CD17 dout1_7  0 27.56f
CD18 dout1_8  0 27.56f
CD19 dout1_9  0 27.56f
CD110 dout1_10  0 27.56f
CD111 dout1_11  0 27.56f
CD112 dout1_12  0 27.56f
CD113 dout1_13  0 27.56f
CD114 dout1_14  0 27.56f
CD115 dout1_15  0 27.56f
CD116 dout1_16  0 27.56f


* Important signals for debug
* bl:	xsram:xbank0:bl_0_1
* br:	xsram:xbank0:br_0_1
* s_en:	xsram:s_en
* q:	xsram:xbank0:xbitcell_array:xbitcell_array:xbit_r0_c0.Q
* qbar:	xsram:xbank0:xbitcell_array:xbitcell_array:xbit_r0_c0.Q_bar


* Sequence of operations
*	Idle during cycle 0 (0ns - 10ns)
*	Writing 0+1000000001100011  to  address 0000000 (from port 0) during cycle 1 (10ns - 20ns)
*	Writing 0+0110000000011001  to  address 0000001 (from port 0) during cycle 2 (20ns - 30ns)
*	Writing 0+0011011111010111  to  address 0000001 (from port 0) during cycle 3 (30ns - 40ns)
*	Reading 0+0011011111010111 from address 0000001 (from port 1) during cycle 4 (40ns - 50ns)
*	Writing 0+1010111010010110  to  address 0000001 (from port 0) during cycle 5 (50ns - 60ns)
*	Writing 0+1010101011011111  to  address 0000000 (from port 0) during cycle 6 (60ns - 70ns)
*	Writing 0+0100111100011111  to  address 0000000 (from port 0) during cycle 7 (70ns - 80ns)
*	Reading 0+1010111010010110 from address 0000001 (from port 1) during cycle 7 (70ns - 80ns)
*	Writing 0+0011011011100100  to  address 0000001 (from port 0) during cycle 8 (80ns - 90ns)
*	Reading 0+0100111100011111 from address 0000000 (from port 1) during cycle 8 (80ns - 90ns)
*	Writing 0+1010010100111111  to  address 0000001 (from port 0) during cycle 9 (90ns - 100ns)
*	Writing 0+0101110000000111  to  address 0000001 (from port 0) during cycle 10 (100ns - 110ns)
*	Writing 0+1010111001001011  to  address 0000001 (from port 0) during cycle 11 (110ns - 120ns)
*	Writing 0+0101010110000111  to  address 1000000 (from port 0) during cycle 12 (120ns - 130ns)
*	Writing 0+0011111111100001  to  address 0000000 (from port 0) during cycle 13 (130ns - 140ns)
*	Reading 0+0101010110000111 from address 1000000 (from port 1) during cycle 13 (130ns - 140ns)
*	Reading 0+0101010110000111 from address 1000000 (from port 1) during cycle 14 (140ns - 150ns)
*	Writing 0+1111000110011101  to  address 0000001 (from port 0) during cycle 15 (150ns - 160ns)
*	Writing 0+0000010111000010  to  address 0000000 (from port 0) during cycle 16 (160ns - 170ns)
*	Writing 0+1001001010111010  to  address 0000000 (from port 0) during cycle 17 (170ns - 180ns)
*	Writing 0+1011010011111011  to  address 1000000 (from port 0) during cycle 19 (190ns - 200ns)
*	Reading 0+1001001010111010 from address 0000000 (from port 1) during cycle 21 (210ns - 220ns)
*	Writing 0+0111000010000000  to  address 1000000 (from port 0) during cycle 22 (220ns - 230ns)
*	Writing 0+1000011111011100  to  address 0111111 (from port 0) during cycle 23 (230ns - 240ns)
*	Reading 0+1001001010111010 from address 0000000 (from port 1) during cycle 24 (240ns - 250ns)
*	Writing 0+1000011010010110  to  address 0000001 (from port 0) during cycle 25 (250ns - 260ns)
*	Reading 0+1000011111011100 from address 0111111 (from port 1) during cycle 25 (250ns - 260ns)
*	Writing 0+0111010000001000  to  address 1000000 (from port 0) during cycle 26 (260ns - 270ns)
*	Reading 0+1000011111011100 from address 0111111 (from port 1) during cycle 26 (260ns - 270ns)
*	Writing 0+0010101001110100  to  address 1000000 (from port 0) during cycle 27 (270ns - 280ns)
*	Writing 0+0011111001100101  to  address 1000000 (from port 0) during cycle 28 (280ns - 290ns)
*	Writing 0+0011110100010100  to  address 1000000 (from port 0) during cycle 29 (290ns - 300ns)
*	Reading 0+1000011111011100 from address 0111111 (from port 1) during cycle 30 (300ns - 310ns)
*	Reading 0+1001001010111010 from address 0000000 (from port 1) during cycle 31 (310ns - 320ns)
*	Writing 0+0001000110010111  to  address 0111111 (from port 0) during cycle 32 (320ns - 330ns)
*	Writing 0+0001001010111000  to  address 1000000 (from port 0) during cycle 33 (330ns - 340ns)
*	Reading 0+1000011010010110 from address 0000001 (from port 1) during cycle 33 (330ns - 340ns)
*	Reading 0+0001001010111000 from address 1000000 (from port 1) during cycle 34 (340ns - 350ns)
*	Writing 0+1001111100110011  to  address 1000000 (from port 0) during cycle 35 (350ns - 360ns)
*	Reading 0+1001001010111010 from address 0000000 (from port 1) during cycle 36 (360ns - 370ns)
*	Writing 0+0111111111010101  to  address 0000000 (from port 0) during cycle 38 (380ns - 390ns)
*	Reading 0+0001000110010111 from address 0111111 (from port 1) during cycle 38 (380ns - 390ns)
*	Reading 0+0111111111010101 from address 0000000 (from port 1) during cycle 39 (390ns - 400ns)
*	Writing 0+0001011110001010  to  address 1000000 (from port 0) during cycle 40 (400ns - 410ns)
*	Reading 0+0001000110010111 from address 0111111 (from port 1) during cycle 40 (400ns - 410ns)
*	Writing 0+0100101100010111  to  address 0000001 (from port 0) during cycle 42 (420ns - 430ns)
*	Reading 0+0001000110010111 from address 0111111 (from port 1) during cycle 45 (450ns - 460ns)
*	Writing 0+1011101101111110  to  address 0000001 (from port 0) during cycle 46 (460ns - 470ns)
*	Reading 0+0001011110001010 from address 1000000 (from port 1) during cycle 48 (480ns - 490ns)
*	Writing 0+0110011011100011  to  address 1000000 (from port 0) during cycle 49 (490ns - 500ns)
*	Writing 0+1101001110111111  to  address 0000000 (from port 0) during cycle 51 (510ns - 520ns)
*	Reading 0+1101001110111111 from address 0000000 (from port 1) during cycle 53 (530ns - 540ns)
*	Reading 0+0110011011100011 from address 1000000 (from port 1) during cycle 54 (540ns - 550ns)
*	Writing 0+0111100110010101  to  address 0000000 (from port 0) during cycle 55 (550ns - 560ns)
*	Writing 0+0001111010101100  to  address 0000000 (from port 0) during cycle 56 (560ns - 570ns)
*	Writing 0+1010011111111101  to  address 0111111 (from port 0) during cycle 57 (570ns - 580ns)
*	Reading 0+1011101101111110 from address 0000001 (from port 1) during cycle 57 (570ns - 580ns)
*	Writing 0+0100010100001010  to  address 0111111 (from port 0) during cycle 61 (610ns - 620ns)
*	Writing 0+0100100111111111  to  address 0000001 (from port 0) during cycle 62 (620ns - 630ns)
*	Reading 0+0100010100001010 from address 0111111 (from port 1) during cycle 64 (640ns - 650ns)
*	Writing 0+0000111000010010  to  address 0000000 (from port 0) during cycle 65 (650ns - 660ns)
*	Reading 0+0100010100001010 from address 0111111 (from port 1) during cycle 65 (650ns - 660ns)
*	Writing 0+1011000101111100  to  address 1000000 (from port 0) during cycle 66 (660ns - 670ns)
*	Writing 0+1110001010011110  to  address 0111111 (from port 0) during cycle 67 (670ns - 680ns)
*	Writing 0+1000001000001110  to  address 0000000 (from port 0) during cycle 68 (680ns - 690ns)
*	Writing 0+0100001111100010  to  address 0000000 (from port 0) during cycle 69 (690ns - 700ns)
*	Reading 0+1110001010011110 from address 0111111 (from port 1) during cycle 69 (690ns - 700ns)
*	Writing 0+0111000100110001  to  address 0111111 (from port 0) during cycle 72 (720ns - 730ns)
*	Writing 0+1000010110011111  to  address 1000000 (from port 0) during cycle 74 (740ns - 750ns)
*	Reading 0+0111000100110001 from address 0111111 (from port 1) during cycle 75 (750ns - 760ns)
*	Writing 0+0001011011101011  to  address 0111111 (from port 0) during cycle 76 (760ns - 770ns)
*	Writing 0+0100100110010101  to  address 0000000 (from port 0) during cycle 77 (770ns - 780ns)
*	Reading 0+0100100110010101 from address 0000000 (from port 1) during cycle 79 (790ns - 800ns)
*	Writing 0+0101000010101100  to  address 0000000 (from port 0) during cycle 81 (810ns - 820ns)
*	Writing 0+1011111101000110  to  address 0111111 (from port 0) during cycle 82 (820ns - 830ns)
*	Reading 0+1000010110011111 from address 1000000 (from port 1) during cycle 82 (820ns - 830ns)
*	Writing 0+0100101011011011  to  address 0000001 (from port 0) during cycle 83 (830ns - 840ns)
*	Reading 0+1011111101000110 from address 0111111 (from port 1) during cycle 83 (830ns - 840ns)
*	Writing 0+1010010001101111  to  address 0000001 (from port 0) during cycle 85 (850ns - 860ns)
*	Writing 0+0001101011110011  to  address 0111111 (from port 0) during cycle 86 (860ns - 870ns)
*	Reading 0+1010010001101111 from address 0000001 (from port 1) during cycle 86 (860ns - 870ns)
*	Reading 0+1000010110011111 from address 1000000 (from port 1) during cycle 87 (870ns - 880ns)
*	Writing 0+0110111000100000  to  address 1000000 (from port 0) during cycle 88 (880ns - 890ns)
*	Reading 0+0110111000100000 from address 1000000 (from port 1) during cycle 90 (900ns - 910ns)
*	Reading 0+0110111000100000 from address 1000000 (from port 1) during cycle 91 (910ns - 920ns)
*	Writing 0+0001010110011111  to  address 1000000 (from port 0) during cycle 92 (920ns - 930ns)
*	Reading 0+1010010001101111 from address 0000001 (from port 1) during cycle 92 (920ns - 930ns)
*	Writing 0+0011000111100101  to  address 0000000 (from port 0) during cycle 93 (930ns - 940ns)
*	Writing 0+0110001111000000  to  address 0000001 (from port 0) during cycle 94 (940ns - 950ns)
*	Reading 0+0011000111100101 from address 0000000 (from port 1) during cycle 94 (940ns - 950ns)
*	Writing 0+1001001111001010  to  address 0000000 (from port 0) during cycle 95 (950ns - 960ns)
*	Reading 0+0001010110011111 from address 1000000 (from port 1) during cycle 95 (950ns - 960ns)
*	Writing 0+1100101011001001  to  address 0000000 (from port 0) during cycle 96 (960ns - 970ns)
*	Writing 0+0101100010000011  to  address 0111111 (from port 0) during cycle 99 (990ns - 1000ns)
*	Reading 0+0001010110011111 from address 1000000 (from port 1) during cycle 100 (1000ns - 1010ns)
*	Reading 0+0101100010000011 from address 0111111 (from port 1) during cycle 101 (1010ns - 1020ns)
*	Reading 0+1100101011001001 from address 0000000 (from port 1) during cycle 103 (1030ns - 1040ns)
*	Reading 0+0101100010000011 from address 0111111 (from port 1) during cycle 104 (1040ns - 1050ns)
*	Writing 0+1010100010110110  to  address 0000001 (from port 0) during cycle 105 (1050ns - 1060ns)
*	Reading 0+0001010110011111 from address 1000000 (from port 1) during cycle 105 (1050ns - 1060ns)
*	Writing 0+1001101011101011  to  address 0000001 (from port 0) during cycle 108 (1080ns - 1090ns)
*	Writing 0+1100001011101001  to  address 0000000 (from port 0) during cycle 109 (1090ns - 1100ns)
*	Reading 0+0001010110011111 from address 1000000 (from port 1) during cycle 109 (1090ns - 1100ns)
*	Reading 0+0001010110011111 from address 1000000 (from port 1) during cycle 110 (1100ns - 1110ns)
*	Reading 0+0101100010000011 from address 0111111 (from port 1) during cycle 111 (1110ns - 1120ns)
*	Reading 0+1100001011101001 from address 0000000 (from port 1) during cycle 112 (1120ns - 1130ns)
*	Writing 0+1100100111011001  to  address 0000001 (from port 0) during cycle 113 (1130ns - 1140ns)
*	Writing 0+1110101001001100  to  address 0000000 (from port 0) during cycle 114 (1140ns - 1150ns)
*	Reading 0+1110101001001100 from address 0000000 (from port 1) during cycle 116 (1160ns - 1170ns)
*	Writing 0+0000110011101011  to  address 0000001 (from port 0) during cycle 117 (1170ns - 1180ns)
*	Reading 0+0001010110011111 from address 1000000 (from port 1) during cycle 117 (1170ns - 1180ns)
*	Reading 0+1110101001001100 from address 0000000 (from port 1) during cycle 118 (1180ns - 1190ns)
*	Writing 0+0010100000000101  to  address 0000001 (from port 0) during cycle 119 (1190ns - 1200ns)
*	Writing 0+0101001100001111  to  address 0000001 (from port 0) during cycle 120 (1200ns - 1210ns)
*	Writing 0+0000101010000111  to  address 0000000 (from port 0) during cycle 121 (1210ns - 1220ns)
*	Writing 0+1011100110110111  to  address 0000000 (from port 0) during cycle 122 (1220ns - 1230ns)
*	Reading 0+0101100010000011 from address 0111111 (from port 1) during cycle 123 (1230ns - 1240ns)
*	Writing 0+0110001100011010  to  address 0000001 (from port 0) during cycle 125 (1250ns - 1260ns)
*	Reading 0+1011100110110111 from address 0000000 (from port 1) during cycle 125 (1250ns - 1260ns)
*	Reading 0+0101100010000011 from address 0111111 (from port 1) during cycle 127 (1270ns - 1280ns)
*	Writing 0+0011111101110001  to  address 1000000 (from port 0) during cycle 128 (1280ns - 1290ns)
*	Reading 0+0101100010000011 from address 0111111 (from port 1) during cycle 129 (1290ns - 1300ns)
*	Reading 0+1011100110110111 from address 0000000 (from port 1) during cycle 130 (1300ns - 1310ns)
*	Writing 0+1000110001110010  to  address 1000000 (from port 0) during cycle 131 (1310ns - 1320ns)
*	Reading 0+1011100110110111 from address 0000000 (from port 1) during cycle 131 (1310ns - 1320ns)
*	Writing 0+1100000001101001  to  address 0111111 (from port 0) during cycle 132 (1320ns - 1330ns)
*	Reading 0+0110001100011010 from address 0000001 (from port 1) during cycle 133 (1330ns - 1340ns)
*	Writing 0+0011110001011000  to  address 0000001 (from port 0) during cycle 134 (1340ns - 1350ns)
*	Reading 0+1000110001110010 from address 1000000 (from port 1) during cycle 135 (1350ns - 1360ns)
*	Reading 0+0011110001011000 from address 0000001 (from port 1) during cycle 136 (1360ns - 1370ns)
*	Writing 0+1111001000101110  to  address 0000000 (from port 0) during cycle 137 (1370ns - 1380ns)
*	Reading 0+1000110001110010 from address 1000000 (from port 1) during cycle 137 (1370ns - 1380ns)
*	Writing 0+0010100111110101  to  address 0000001 (from port 0) during cycle 138 (1380ns - 1390ns)
*	Reading 0+1000110001110010 from address 1000000 (from port 1) during cycle 139 (1390ns - 1400ns)
*	Writing 0+1110000011001010  to  address 1000000 (from port 0) during cycle 140 (1400ns - 1410ns)
*	Reading 0+0010100111110101 from address 0000001 (from port 1) during cycle 140 (1400ns - 1410ns)
*	Writing 0+0001001110011001  to  address 0000001 (from port 0) during cycle 141 (1410ns - 1420ns)
*	Reading 0+1100000001101001 from address 0111111 (from port 1) during cycle 142 (1420ns - 1430ns)
*	Reading 0+1111001000101110 from address 0000000 (from port 1) during cycle 143 (1430ns - 1440ns)
*	Writing 0+1111010010100111  to  address 0000001 (from port 0) during cycle 144 (1440ns - 1450ns)
*	Writing 0+0011010101010001  to  address 0111111 (from port 0) during cycle 145 (1450ns - 1460ns)
*	Reading 0+0011010101010001 from address 0111111 (from port 1) during cycle 147 (1470ns - 1480ns)
*	Reading 0+1111010010100111 from address 0000001 (from port 1) during cycle 148 (1480ns - 1490ns)
*	Reading 0+0011010101010001 from address 0111111 (from port 1) during cycle 149 (1490ns - 1500ns)
*	Writing 0+0110100100101001  to  address 0111111 (from port 0) during cycle 150 (1500ns - 1510ns)
*	Reading 0+1111001000101110 from address 0000000 (from port 1) during cycle 150 (1500ns - 1510ns)
*	Reading 0+1111010010100111 from address 0000001 (from port 1) during cycle 151 (1510ns - 1520ns)
*	Reading 0+1111001000101110 from address 0000000 (from port 1) during cycle 153 (1530ns - 1540ns)
*	Writing 0+0010111010000001  to  address 0111111 (from port 0) during cycle 154 (1540ns - 1550ns)
*	Reading 0+1111001000101110 from address 0000000 (from port 1) during cycle 155 (1550ns - 1560ns)
*	Reading 0+1111010010100111 from address 0000001 (from port 1) during cycle 156 (1560ns - 1570ns)
*	Writing 0+0000000000111101  to  address 0000000 (from port 0) during cycle 157 (1570ns - 1580ns)
*	Writing 0+1000101100000001  to  address 0111111 (from port 0) during cycle 158 (1580ns - 1590ns)
*	Reading 0+0000000000111101 from address 0000000 (from port 1) during cycle 159 (1590ns - 1600ns)
*	Writing 0+1001110010010100  to  address 0000001 (from port 0) during cycle 161 (1610ns - 1620ns)
*	Reading 0+0000000000111101 from address 0000000 (from port 1) during cycle 162 (1620ns - 1630ns)
*	Writing 0+0110011100111101  to  address 0000000 (from port 0) during cycle 163 (1630ns - 1640ns)
*	Reading 0+1110000011001010 from address 1000000 (from port 1) during cycle 163 (1630ns - 1640ns)
*	Writing 0+1011001011011110  to  address 1000000 (from port 0) during cycle 164 (1640ns - 1650ns)
*	Reading 0+1000101100000001 from address 0111111 (from port 1) during cycle 164 (1640ns - 1650ns)
*	Writing 0+0000111001001010  to  address 0000001 (from port 0) during cycle 165 (1650ns - 1660ns)
*	Reading 0+0110011100111101 from address 0000000 (from port 1) during cycle 168 (1680ns - 1690ns)
*	Writing 0+1100100010111001  to  address 1000000 (from port 0) during cycle 169 (1690ns - 1700ns)
*	Reading 0+0000111001001010 from address 0000001 (from port 1) during cycle 170 (1700ns - 1710ns)
*	Reading 0+1100100010111001 from address 1000000 (from port 1) during cycle 171 (1710ns - 1720ns)
*	Reading 0+1100100010111001 from address 1000000 (from port 1) during cycle 173 (1730ns - 1740ns)
*	Reading 0+1000101100000001 from address 0111111 (from port 1) during cycle 174 (1740ns - 1750ns)
*	Writing 0+0000100101011111  to  address 1000000 (from port 0) during cycle 176 (1760ns - 1770ns)
*	Writing 0+1100110110111100  to  address 1000000 (from port 0) during cycle 177 (1770ns - 1780ns)
*	Writing 0+1100010010010110  to  address 1000000 (from port 0) during cycle 178 (1780ns - 1790ns)
*	Reading 0+0000111001001010 from address 0000001 (from port 1) during cycle 178 (1780ns - 1790ns)
*	Writing 0+1011010111100111  to  address 0111111 (from port 0) during cycle 179 (1790ns - 1800ns)
*	Reading 0+0110011100111101 from address 0000000 (from port 1) during cycle 181 (1810ns - 1820ns)
*	Reading 0+1100010010010110 from address 1000000 (from port 1) during cycle 182 (1820ns - 1830ns)
*	Reading 0+0000111001001010 from address 0000001 (from port 1) during cycle 183 (1830ns - 1840ns)
*	Writing 0+0101000110100001  to  address 0000001 (from port 0) during cycle 184 (1840ns - 1850ns)
*	Reading 0+1011010111100111 from address 0111111 (from port 1) during cycle 185 (1850ns - 1860ns)
*	Writing 0+1010101110111111  to  address 0000000 (from port 0) during cycle 186 (1860ns - 1870ns)
*	Reading 0+1100010010010110 from address 1000000 (from port 1) during cycle 186 (1860ns - 1870ns)
*	Writing 0+1010001010000000  to  address 0000000 (from port 0) during cycle 188 (1880ns - 1890ns)
*	Reading 0+1011010111100111 from address 0111111 (from port 1) during cycle 188 (1880ns - 1890ns)
*	Reading 0+1100010010010110 from address 1000000 (from port 1) during cycle 189 (1890ns - 1900ns)
*	Writing 0+0111001001011111  to  address 0000001 (from port 0) during cycle 191 (1910ns - 1920ns)
*	Reading 0+1010001010000000 from address 0000000 (from port 1) during cycle 192 (1920ns - 1930ns)
*	Writing 0+0010011101110010  to  address 1000000 (from port 0) during cycle 193 (1930ns - 1940ns)
*	Writing 0+0000110010101001  to  address 1000000 (from port 0) during cycle 194 (1940ns - 1950ns)
*	Reading 0+0111001001011111 from address 0000001 (from port 1) during cycle 195 (1950ns - 1960ns)
*	Writing 0+1001111110110100  to  address 0111111 (from port 0) during cycle 198 (1980ns - 1990ns)
*	Reading 0+1010001010000000 from address 0000000 (from port 1) during cycle 198 (1980ns - 1990ns)
*	Reading 0+0000110010101001 from address 1000000 (from port 1) during cycle 200 (2000ns - 2010ns)
*	Writing 0+0010001101000010  to  address 0111111 (from port 0) during cycle 201 (2010ns - 2020ns)
*	Reading 0+1010001010000000 from address 0000000 (from port 1) during cycle 201 (2010ns - 2020ns)
*	Writing 0+1110010101001110  to  address 0000000 (from port 0) during cycle 202 (2020ns - 2030ns)
*	Reading 0+0111001001011111 from address 0000001 (from port 1) during cycle 202 (2020ns - 2030ns)
*	Writing 0+1111010110010101  to  address 0111111 (from port 0) during cycle 203 (2030ns - 2040ns)
*	Reading 0+1110010101001110 from address 0000000 (from port 1) during cycle 203 (2030ns - 2040ns)
*	Reading 0+1111010110010101 from address 0111111 (from port 1) during cycle 204 (2040ns - 2050ns)
*	Idle during cycle 205 (2050ns - 2060ns)

* Generation of data and address signals
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 1), (40, 1), (50, 0), (60, 1), (70, 1), (80, 0), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 1), (160, 0), (170, 0), (180, 0), (190, 1), (200, 1), (210, 1), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 1), (290, 0), (300, 0), (310, 0), (320, 1), (330, 0), (340, 0), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 0), (410, 0), (420, 1), (430, 1), (440, 1), (450, 1), (460, 0), (470, 0), (480, 0), (490, 1), (500, 1), (510, 1), (520, 1), (530, 1), (540, 1), (550, 1), (560, 0), (570, 1), (580, 1), (590, 1), (600, 1), (610, 0), (620, 1), (630, 1), (640, 1), (650, 0), (660, 0), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 1), (750, 1), (760, 1), (770, 1), (780, 1), (790, 1), (800, 1), (810, 0), (820, 0), (830, 1), (840, 1), (850, 1), (860, 1), (870, 1), (880, 0), (890, 0), (900, 0), (910, 0), (920, 1), (930, 1), (940, 0), (950, 0), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 1), (1130, 1), (1140, 0), (1150, 0), (1160, 0), (1170, 1), (1180, 1), (1190, 1), (1200, 1), (1210, 1), (1220, 1), (1230, 1), (1240, 1), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 0), (1320, 1), (1330, 1), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 1), (1400, 0), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 0), (1620, 0), (1630, 1), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 0), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 1), (1860, 1), (1870, 1), (1880, 0), (1890, 0), (1900, 0), (1910, 1), (1920, 1), (1930, 0), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_0  din0_0  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 1.7v 19.495n 1.7v 19.505n 1.7v 29.495n 1.7v 29.505n 1.7v 39.495n 1.7v 39.505n 1.7v 49.495n 1.7v 49.505n 0.0v 59.495n 0.0v 59.505n 1.7v 69.495n 1.7v 69.505n 1.7v 79.495n 1.7v 79.505n 0.0v 89.495n 0.0v 89.505n 1.7v 99.495n 1.7v 99.505n 1.7v 109.495n 1.7v 109.505n 1.7v 119.495n 1.7v 119.505n 1.7v 129.495n 1.7v 129.505n 1.7v 139.495n 1.7v 139.505n 1.7v 149.495n 1.7v 149.505n 1.7v 159.495n 1.7v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 1.7v 219.495n 1.7v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 1.7v 289.495n 1.7v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 1.7v 329.495n 1.7v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 1.7v 359.495n 1.7v 359.505n 1.7v 369.495n 1.7v 369.505n 1.7v 379.495n 1.7v 379.505n 1.7v 389.495n 1.7v 389.505n 1.7v 399.495n 1.7v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 0.0v 469.495n 0.0v 469.505n 0.0v 479.495n 0.0v 479.505n 0.0v 489.495n 0.0v 489.505n 1.7v 499.495n 1.7v 499.505n 1.7v 509.495n 1.7v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 1.7v 539.495n 1.7v 539.505n 1.7v 549.495n 1.7v 549.505n 1.7v 559.495n 1.7v 559.505n 0.0v 569.495n 0.0v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 0.0v 619.495n 0.0v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 0.0v 659.495n 0.0v 659.505n 0.0v 669.495n 0.0v 669.505n 0.0v 679.495n 0.0v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 1.7v 769.495n 1.7v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 1.7v 799.495n 1.7v 799.505n 1.7v 809.495n 1.7v 809.505n 0.0v 819.495n 0.0v 819.505n 0.0v 829.495n 0.0v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 1.7v 859.495n 1.7v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 1.7v 929.495n 1.7v 929.505n 1.7v 939.495n 1.7v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 1.7v 969.495n 1.7v 969.505n 1.7v 979.495n 1.7v 979.505n 1.7v 989.495n 1.7v 989.505n 1.7v 999.495n 1.7v 999.505n 1.7v 1009.495n 1.7v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 1.7v 1039.495n 1.7v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 1.7v 1089.495n 1.7v 1089.505n 1.7v 1099.495n 1.7v 1099.505n 1.7v 1109.495n 1.7v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 1.7v 1129.495n 1.7v 1129.505n 1.7v 1139.495n 1.7v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 1.7v 1179.495n 1.7v 1179.505n 1.7v 1189.495n 1.7v 1189.505n 1.7v 1199.495n 1.7v 1199.505n 1.7v 1209.495n 1.7v 1209.505n 1.7v 1219.495n 1.7v 1219.505n 1.7v 1229.495n 1.7v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 1.7v 1309.495n 1.7v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 1.7v 1329.495n 1.7v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 1.7v 1389.495n 1.7v 1389.505n 1.7v 1399.495n 1.7v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 1.7v 1419.495n 1.7v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 1.7v 1439.495n 1.7v 1439.505n 1.7v 1449.495n 1.7v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 1.7v 1509.495n 1.7v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 1.7v 1549.495n 1.7v 1549.505n 1.7v 1559.495n 1.7v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 1.7v 1579.495n 1.7v 1579.505n 1.7v 1589.495n 1.7v 1589.505n 1.7v 1599.495n 1.7v 1599.505n 1.7v 1609.495n 1.7v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 1.7v 1639.495n 1.7v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 1.7v 1699.495n 1.7v 1699.505n 1.7v 1709.495n 1.7v 1709.505n 1.7v 1719.495n 1.7v 1719.505n 1.7v 1729.495n 1.7v 1729.505n 1.7v 1739.495n 1.7v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 1.7v 1849.495n 1.7v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 1.7v 1869.495n 1.7v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 1.7v 1919.495n 1.7v 1919.505n 1.7v 1929.495n 1.7v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 1.7v 1949.495n 1.7v 1949.505n 1.7v 1959.495n 1.7v 1959.505n 1.7v 1969.495n 1.7v 1969.505n 1.7v 1979.495n 1.7v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 1), (20, 0), (30, 1), (40, 1), (50, 1), (60, 1), (70, 1), (80, 0), (90, 1), (100, 1), (110, 1), (120, 1), (130, 0), (140, 0), (150, 0), (160, 1), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 0), (240, 0), (250, 1), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 1), (330, 0), (340, 0), (350, 1), (360, 1), (370, 1), (380, 0), (390, 0), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 1), (490, 1), (500, 1), (510, 1), (520, 1), (530, 1), (540, 1), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 0), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 0), (730, 0), (740, 1), (750, 1), (760, 1), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 1), (840, 1), (850, 1), (860, 1), (870, 1), (880, 0), (890, 0), (900, 0), (910, 0), (920, 1), (930, 0), (940, 0), (950, 1), (960, 0), (970, 0), (980, 0), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 1), (1080, 1), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 1), (1180, 1), (1190, 0), (1200, 1), (1210, 1), (1220, 1), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 0), (1290, 0), (1300, 0), (1310, 1), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 1), (1380, 0), (1390, 0), (1400, 1), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 1), (1770, 0), (1780, 1), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 1), (1870, 1), (1880, 0), (1890, 0), (1900, 0), (1910, 1), (1920, 1), (1930, 1), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 1), (2020, 1), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_1  din0_1  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 1.7v 19.495n 1.7v 19.505n 0.0v 29.495n 0.0v 29.505n 1.7v 39.495n 1.7v 39.505n 1.7v 49.495n 1.7v 49.505n 1.7v 59.495n 1.7v 59.505n 1.7v 69.495n 1.7v 69.505n 1.7v 79.495n 1.7v 79.505n 0.0v 89.495n 0.0v 89.505n 1.7v 99.495n 1.7v 99.505n 1.7v 109.495n 1.7v 109.505n 1.7v 119.495n 1.7v 119.505n 1.7v 129.495n 1.7v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 1.7v 169.495n 1.7v 169.505n 1.7v 179.495n 1.7v 179.505n 1.7v 189.495n 1.7v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 1.7v 219.495n 1.7v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 1.7v 259.495n 1.7v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 1.7v 329.495n 1.7v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 1.7v 359.495n 1.7v 359.505n 1.7v 369.495n 1.7v 369.505n 1.7v 379.495n 1.7v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 1.7v 499.495n 1.7v 499.505n 1.7v 509.495n 1.7v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 1.7v 539.495n 1.7v 539.505n 1.7v 549.495n 1.7v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 0.0v 579.495n 0.0v 579.505n 0.0v 589.495n 0.0v 589.505n 0.0v 599.495n 0.0v 599.505n 0.0v 609.495n 0.0v 609.505n 1.7v 619.495n 1.7v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 1.7v 659.495n 1.7v 659.505n 0.0v 669.495n 0.0v 669.505n 1.7v 679.495n 1.7v 679.505n 1.7v 689.495n 1.7v 689.505n 1.7v 699.495n 1.7v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 0.0v 729.495n 0.0v 729.505n 0.0v 739.495n 0.0v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 1.7v 769.495n 1.7v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 1.7v 859.495n 1.7v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 1.7v 929.495n 1.7v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 1.7v 959.495n 1.7v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 1.7v 999.495n 1.7v 999.505n 1.7v 1009.495n 1.7v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 1.7v 1039.495n 1.7v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 1.7v 1059.495n 1.7v 1059.505n 1.7v 1069.495n 1.7v 1069.505n 1.7v 1079.495n 1.7v 1079.505n 1.7v 1089.495n 1.7v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 1.7v 1179.495n 1.7v 1179.505n 1.7v 1189.495n 1.7v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 1.7v 1209.495n 1.7v 1209.505n 1.7v 1219.495n 1.7v 1219.505n 1.7v 1229.495n 1.7v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 1.7v 1259.495n 1.7v 1259.505n 1.7v 1269.495n 1.7v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 1.7v 1319.495n 1.7v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 1.7v 1379.495n 1.7v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 1.7v 1409.495n 1.7v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 1.7v 1449.495n 1.7v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 1.7v 1689.495n 1.7v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 1.7v 1789.495n 1.7v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 1.7v 1869.495n 1.7v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 1.7v 1919.495n 1.7v 1919.505n 1.7v 1929.495n 1.7v 1929.505n 1.7v 1939.495n 1.7v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 1.7v 2019.495n 1.7v 2019.505n 1.7v 2029.495n 1.7v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 0.0v 2049.495n 0.0v 2049.505n 0.0v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 1), (40, 1), (50, 1), (60, 1), (70, 1), (80, 1), (90, 1), (100, 1), (110, 0), (120, 1), (130, 0), (140, 0), (150, 1), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 1), (240, 1), (250, 1), (260, 0), (270, 1), (280, 1), (290, 1), (300, 1), (310, 1), (320, 1), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 1), (390, 1), (400, 0), (410, 0), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 1), (490, 0), (500, 0), (510, 1), (520, 1), (530, 1), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 1), (600, 1), (610, 0), (620, 1), (630, 1), (640, 1), (650, 0), (660, 1), (670, 1), (680, 1), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 1), (750, 1), (760, 0), (770, 1), (780, 1), (790, 1), (800, 1), (810, 1), (820, 1), (830, 0), (840, 0), (850, 1), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 1), (930, 1), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 1), (1060, 1), (1070, 1), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 1), (1150, 1), (1160, 1), (1170, 0), (1180, 0), (1190, 1), (1200, 1), (1210, 1), (1220, 1), (1230, 1), (1240, 1), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 1), (1380, 1), (1390, 1), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 1), (1580, 0), (1590, 0), (1600, 0), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 1), (1770, 1), (1780, 1), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 1), (1870, 1), (1880, 0), (1890, 0), (1900, 0), (1910, 1), (1920, 1), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 0), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_2  din0_2  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 1.7v 39.495n 1.7v 39.505n 1.7v 49.495n 1.7v 49.505n 1.7v 59.495n 1.7v 59.505n 1.7v 69.495n 1.7v 69.505n 1.7v 79.495n 1.7v 79.505n 1.7v 89.495n 1.7v 89.505n 1.7v 99.495n 1.7v 99.505n 1.7v 109.495n 1.7v 109.505n 0.0v 119.495n 0.0v 119.505n 1.7v 129.495n 1.7v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 1.7v 159.495n 1.7v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 1.7v 259.495n 1.7v 259.505n 0.0v 269.495n 0.0v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 1.7v 319.495n 1.7v 319.505n 1.7v 329.495n 1.7v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 1.7v 389.495n 1.7v 389.505n 1.7v 399.495n 1.7v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 1.7v 539.495n 1.7v 539.505n 1.7v 549.495n 1.7v 549.505n 1.7v 559.495n 1.7v 559.505n 1.7v 569.495n 1.7v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 0.0v 619.495n 0.0v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 0.0v 659.495n 0.0v 659.505n 1.7v 669.495n 1.7v 669.505n 1.7v 679.495n 1.7v 679.505n 1.7v 689.495n 1.7v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 0.0v 729.495n 0.0v 729.505n 0.0v 739.495n 0.0v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 0.0v 769.495n 0.0v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 1.7v 799.495n 1.7v 799.505n 1.7v 809.495n 1.7v 809.505n 1.7v 819.495n 1.7v 819.505n 1.7v 829.495n 1.7v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 1.7v 859.495n 1.7v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 1.7v 929.495n 1.7v 929.505n 1.7v 939.495n 1.7v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 1.7v 1059.495n 1.7v 1059.505n 1.7v 1069.495n 1.7v 1069.505n 1.7v 1079.495n 1.7v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 1.7v 1149.495n 1.7v 1149.505n 1.7v 1159.495n 1.7v 1159.505n 1.7v 1169.495n 1.7v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 1.7v 1199.495n 1.7v 1199.505n 1.7v 1209.495n 1.7v 1209.505n 1.7v 1219.495n 1.7v 1219.505n 1.7v 1229.495n 1.7v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 1.7v 1379.495n 1.7v 1379.505n 1.7v 1389.495n 1.7v 1389.505n 1.7v 1399.495n 1.7v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 1.7v 1449.495n 1.7v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 1.7v 1579.495n 1.7v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 1.7v 1619.495n 1.7v 1619.505n 1.7v 1629.495n 1.7v 1629.505n 1.7v 1639.495n 1.7v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 1.7v 1789.495n 1.7v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 1.7v 1869.495n 1.7v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 1.7v 1919.495n 1.7v 1919.505n 1.7v 1929.495n 1.7v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 1.7v 2029.495n 1.7v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 1), (30, 0), (40, 0), (50, 0), (60, 1), (70, 1), (80, 0), (90, 1), (100, 0), (110, 1), (120, 0), (130, 0), (140, 0), (150, 1), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 1), (240, 1), (250, 0), (260, 1), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 1), (340, 1), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 1), (410, 1), (420, 0), (430, 0), (440, 0), (450, 0), (460, 1), (470, 1), (480, 1), (490, 0), (500, 0), (510, 1), (520, 1), (530, 1), (540, 1), (550, 0), (560, 1), (570, 1), (580, 1), (590, 1), (600, 1), (610, 1), (620, 1), (630, 1), (640, 1), (650, 0), (660, 1), (670, 1), (680, 1), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 1), (750, 1), (760, 1), (770, 0), (780, 0), (790, 0), (800, 0), (810, 1), (820, 0), (830, 1), (840, 1), (850, 1), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 1), (930, 0), (940, 0), (950, 1), (960, 1), (970, 1), (980, 1), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 1), (1160, 1), (1170, 1), (1180, 1), (1190, 0), (1200, 1), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 1), (1260, 1), (1270, 1), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 0), (1390, 0), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 0), (1550, 0), (1560, 0), (1570, 1), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 0), (1860, 1), (1870, 1), (1880, 0), (1890, 0), (1900, 0), (1910, 1), (1920, 1), (1930, 0), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 1), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_3  din0_3  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 1.7v 29.495n 1.7v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 1.7v 69.495n 1.7v 69.505n 1.7v 79.495n 1.7v 79.505n 0.0v 89.495n 0.0v 89.505n 1.7v 99.495n 1.7v 99.505n 0.0v 109.495n 0.0v 109.505n 1.7v 119.495n 1.7v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 1.7v 159.495n 1.7v 159.505n 0.0v 169.495n 0.0v 169.505n 1.7v 179.495n 1.7v 179.505n 1.7v 189.495n 1.7v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 1.7v 219.495n 1.7v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 0.0v 259.495n 0.0v 259.505n 1.7v 269.495n 1.7v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 1.7v 339.495n 1.7v 339.505n 1.7v 349.495n 1.7v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 1.7v 539.495n 1.7v 539.505n 1.7v 549.495n 1.7v 549.505n 0.0v 559.495n 0.0v 559.505n 1.7v 569.495n 1.7v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 1.7v 619.495n 1.7v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 0.0v 659.495n 0.0v 659.505n 1.7v 669.495n 1.7v 669.505n 1.7v 679.495n 1.7v 679.505n 1.7v 689.495n 1.7v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 0.0v 729.495n 0.0v 729.505n 0.0v 739.495n 0.0v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 1.7v 769.495n 1.7v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 1.7v 819.495n 1.7v 819.505n 0.0v 829.495n 0.0v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 1.7v 859.495n 1.7v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 1.7v 929.495n 1.7v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 1.7v 959.495n 1.7v 959.505n 1.7v 969.495n 1.7v 969.505n 1.7v 979.495n 1.7v 979.505n 1.7v 989.495n 1.7v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 1.7v 1089.495n 1.7v 1089.505n 1.7v 1099.495n 1.7v 1099.505n 1.7v 1109.495n 1.7v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 1.7v 1129.495n 1.7v 1129.505n 1.7v 1139.495n 1.7v 1139.505n 1.7v 1149.495n 1.7v 1149.505n 1.7v 1159.495n 1.7v 1159.505n 1.7v 1169.495n 1.7v 1169.505n 1.7v 1179.495n 1.7v 1179.505n 1.7v 1189.495n 1.7v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 1.7v 1209.495n 1.7v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 1.7v 1259.495n 1.7v 1259.505n 1.7v 1269.495n 1.7v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 1.7v 1329.495n 1.7v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 1.7v 1349.495n 1.7v 1349.505n 1.7v 1359.495n 1.7v 1359.505n 1.7v 1369.495n 1.7v 1369.505n 1.7v 1379.495n 1.7v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 1.7v 1409.495n 1.7v 1409.505n 1.7v 1419.495n 1.7v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 1.7v 1439.495n 1.7v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 1.7v 1509.495n 1.7v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 1.7v 1579.495n 1.7v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 1.7v 1639.495n 1.7v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 1.7v 1689.495n 1.7v 1689.505n 1.7v 1699.495n 1.7v 1699.505n 1.7v 1709.495n 1.7v 1709.505n 1.7v 1719.495n 1.7v 1719.505n 1.7v 1729.495n 1.7v 1729.505n 1.7v 1739.495n 1.7v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 1.7v 1869.495n 1.7v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 1.7v 1919.495n 1.7v 1919.505n 1.7v 1929.495n 1.7v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 1.7v 1949.495n 1.7v 1949.505n 1.7v 1959.495n 1.7v 1959.505n 1.7v 1969.495n 1.7v 1969.505n 1.7v 1979.495n 1.7v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 1.7v 2029.495n 1.7v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 0.0v 2049.495n 0.0v 2049.505n 0.0v )
* (time, data): [(0, 0), (10, 0), (20, 1), (30, 1), (40, 1), (50, 1), (60, 1), (70, 1), (80, 0), (90, 1), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 1), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 1), (240, 1), (250, 1), (260, 0), (270, 1), (280, 0), (290, 1), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 0), (410, 0), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 1), (490, 0), (500, 0), (510, 1), (520, 1), (530, 1), (540, 1), (550, 1), (560, 0), (570, 1), (580, 1), (590, 1), (600, 1), (610, 0), (620, 1), (630, 1), (640, 1), (650, 1), (660, 1), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 1), (750, 1), (760, 0), (770, 1), (780, 1), (790, 1), (800, 1), (810, 0), (820, 0), (830, 1), (840, 1), (850, 0), (860, 1), (870, 1), (880, 0), (890, 0), (900, 0), (910, 0), (920, 1), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 1), (1060, 1), (1070, 1), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 1), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 1), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 0), (1330, 0), (1340, 1), (1350, 1), (1360, 1), (1370, 0), (1380, 1), (1390, 1), (1400, 0), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 1), (1580, 0), (1590, 0), (1600, 0), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 1), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 0), (1860, 1), (1870, 1), (1880, 0), (1890, 0), (1900, 0), (1910, 1), (1920, 1), (1930, 1), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_4  din0_4  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 1.7v 29.495n 1.7v 29.505n 1.7v 39.495n 1.7v 39.505n 1.7v 49.495n 1.7v 49.505n 1.7v 59.495n 1.7v 59.505n 1.7v 69.495n 1.7v 69.505n 1.7v 79.495n 1.7v 79.505n 0.0v 89.495n 0.0v 89.505n 1.7v 99.495n 1.7v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 1.7v 159.495n 1.7v 159.505n 0.0v 169.495n 0.0v 169.505n 1.7v 179.495n 1.7v 179.505n 1.7v 189.495n 1.7v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 1.7v 219.495n 1.7v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 1.7v 259.495n 1.7v 259.505n 0.0v 269.495n 0.0v 269.505n 1.7v 279.495n 1.7v 279.505n 0.0v 289.495n 0.0v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 1.7v 319.495n 1.7v 319.505n 1.7v 329.495n 1.7v 329.505n 1.7v 339.495n 1.7v 339.505n 1.7v 349.495n 1.7v 349.505n 1.7v 359.495n 1.7v 359.505n 1.7v 369.495n 1.7v 369.505n 1.7v 379.495n 1.7v 379.505n 1.7v 389.495n 1.7v 389.505n 1.7v 399.495n 1.7v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 1.7v 539.495n 1.7v 539.505n 1.7v 549.495n 1.7v 549.505n 1.7v 559.495n 1.7v 559.505n 0.0v 569.495n 0.0v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 0.0v 619.495n 0.0v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 1.7v 659.495n 1.7v 659.505n 1.7v 669.495n 1.7v 669.505n 1.7v 679.495n 1.7v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 0.0v 769.495n 0.0v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 1.7v 799.495n 1.7v 799.505n 1.7v 809.495n 1.7v 809.505n 0.0v 819.495n 0.0v 819.505n 0.0v 829.495n 0.0v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 0.0v 859.495n 0.0v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 1.7v 929.495n 1.7v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 1.7v 1059.495n 1.7v 1059.505n 1.7v 1069.495n 1.7v 1069.505n 1.7v 1079.495n 1.7v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 1.7v 1139.495n 1.7v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 1.7v 1229.495n 1.7v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 1.7v 1259.495n 1.7v 1259.505n 1.7v 1269.495n 1.7v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 1.7v 1309.495n 1.7v 1309.505n 1.7v 1319.495n 1.7v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 1.7v 1349.495n 1.7v 1349.505n 1.7v 1359.495n 1.7v 1359.505n 1.7v 1369.495n 1.7v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 1.7v 1389.495n 1.7v 1389.505n 1.7v 1399.495n 1.7v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 1.7v 1419.495n 1.7v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 1.7v 1439.495n 1.7v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 1.7v 1579.495n 1.7v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 1.7v 1619.495n 1.7v 1619.505n 1.7v 1629.495n 1.7v 1629.505n 1.7v 1639.495n 1.7v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 1.7v 1699.495n 1.7v 1699.505n 1.7v 1709.495n 1.7v 1709.505n 1.7v 1719.495n 1.7v 1719.505n 1.7v 1729.495n 1.7v 1729.505n 1.7v 1739.495n 1.7v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 1.7v 1789.495n 1.7v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 1.7v 1869.495n 1.7v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 1.7v 1919.495n 1.7v 1919.505n 1.7v 1929.495n 1.7v 1929.505n 1.7v 1939.495n 1.7v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 1), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 1), (90, 1), (100, 0), (110, 0), (120, 0), (130, 1), (140, 1), (150, 0), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 1), (280, 1), (290, 0), (300, 0), (310, 0), (320, 0), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 0), (390, 0), (400, 0), (410, 0), (420, 0), (430, 0), (440, 0), (450, 0), (460, 1), (470, 1), (480, 1), (490, 1), (500, 1), (510, 1), (520, 1), (530, 1), (540, 1), (550, 0), (560, 1), (570, 1), (580, 1), (590, 1), (600, 1), (610, 0), (620, 1), (630, 1), (640, 1), (650, 0), (660, 1), (670, 0), (680, 0), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 0), (750, 0), (760, 1), (770, 0), (780, 0), (790, 0), (800, 0), (810, 1), (820, 0), (830, 0), (840, 0), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 0), (930, 1), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 1), (1060, 1), (1070, 1), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 1), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 1), (1180, 1), (1190, 0), (1200, 0), (1210, 0), (1220, 1), (1230, 1), (1240, 1), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 1), (1330, 1), (1340, 0), (1350, 0), (1360, 0), (1370, 1), (1380, 1), (1390, 1), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 0), (1550, 0), (1560, 0), (1570, 1), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 1), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 1), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 1), (1860, 1), (1870, 1), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_5  din0_5  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 1.7v 19.495n 1.7v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 1.7v 89.495n 1.7v 89.505n 1.7v 99.495n 1.7v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 1.7v 139.495n 1.7v 139.505n 1.7v 149.495n 1.7v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 1.7v 179.495n 1.7v 179.505n 1.7v 189.495n 1.7v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 1.7v 219.495n 1.7v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 1.7v 339.495n 1.7v 339.505n 1.7v 349.495n 1.7v 349.505n 1.7v 359.495n 1.7v 359.505n 1.7v 369.495n 1.7v 369.505n 1.7v 379.495n 1.7v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 1.7v 499.495n 1.7v 499.505n 1.7v 509.495n 1.7v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 1.7v 539.495n 1.7v 539.505n 1.7v 549.495n 1.7v 549.505n 0.0v 559.495n 0.0v 559.505n 1.7v 569.495n 1.7v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 0.0v 619.495n 0.0v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 0.0v 659.495n 0.0v 659.505n 1.7v 669.495n 1.7v 669.505n 0.0v 679.495n 0.0v 679.505n 0.0v 689.495n 0.0v 689.505n 1.7v 699.495n 1.7v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 1.7v 769.495n 1.7v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 1.7v 819.495n 1.7v 819.505n 0.0v 829.495n 0.0v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 1.7v 859.495n 1.7v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 1.7v 889.495n 1.7v 889.505n 1.7v 899.495n 1.7v 899.505n 1.7v 909.495n 1.7v 909.505n 1.7v 919.495n 1.7v 919.505n 0.0v 929.495n 0.0v 929.505n 1.7v 939.495n 1.7v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 1.7v 1059.495n 1.7v 1059.505n 1.7v 1069.495n 1.7v 1069.505n 1.7v 1079.495n 1.7v 1079.505n 1.7v 1089.495n 1.7v 1089.505n 1.7v 1099.495n 1.7v 1099.505n 1.7v 1109.495n 1.7v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 1.7v 1129.495n 1.7v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 1.7v 1179.495n 1.7v 1179.505n 1.7v 1189.495n 1.7v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 1.7v 1229.495n 1.7v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 1.7v 1309.495n 1.7v 1309.505n 1.7v 1319.495n 1.7v 1319.505n 1.7v 1329.495n 1.7v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 1.7v 1379.495n 1.7v 1379.505n 1.7v 1389.495n 1.7v 1389.505n 1.7v 1399.495n 1.7v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 1.7v 1449.495n 1.7v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 1.7v 1509.495n 1.7v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 1.7v 1579.495n 1.7v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 1.7v 1639.495n 1.7v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 1.7v 1699.495n 1.7v 1699.505n 1.7v 1709.495n 1.7v 1709.505n 1.7v 1719.495n 1.7v 1719.505n 1.7v 1729.495n 1.7v 1729.505n 1.7v 1739.495n 1.7v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 1.7v 1849.495n 1.7v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 1.7v 1869.495n 1.7v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 1.7v 1939.495n 1.7v 1939.505n 1.7v 1949.495n 1.7v 1949.505n 1.7v 1959.495n 1.7v 1959.505n 1.7v 1969.495n 1.7v 1969.505n 1.7v 1979.495n 1.7v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 0.0v 2049.495n 0.0v 2049.505n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 0), (30, 1), (40, 1), (50, 0), (60, 1), (70, 0), (80, 1), (90, 0), (100, 0), (110, 1), (120, 0), (130, 1), (140, 1), (150, 0), (160, 1), (170, 0), (180, 0), (190, 1), (200, 1), (210, 1), (220, 0), (230, 1), (240, 1), (250, 0), (260, 0), (270, 1), (280, 1), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 1), (390, 1), (400, 0), (410, 0), (420, 0), (430, 0), (440, 0), (450, 0), (460, 1), (470, 1), (480, 1), (490, 1), (500, 1), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 1), (580, 1), (590, 1), (600, 1), (610, 0), (620, 1), (630, 1), (640, 1), (650, 0), (660, 1), (670, 0), (680, 0), (690, 1), (700, 1), (710, 1), (720, 0), (730, 0), (740, 0), (750, 0), (760, 1), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 1), (840, 1), (850, 1), (860, 1), (870, 1), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 1), (940, 1), (950, 1), (960, 1), (970, 1), (980, 1), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 1), (1160, 1), (1170, 1), (1180, 1), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 0), (1380, 1), (1390, 1), (1400, 1), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 1), (1770, 0), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 1), (1920, 1), (1930, 1), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 1), (2020, 1), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_6  din0_6  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 1.7v 19.495n 1.7v 19.505n 0.0v 29.495n 0.0v 29.505n 1.7v 39.495n 1.7v 39.505n 1.7v 49.495n 1.7v 49.505n 0.0v 59.495n 0.0v 59.505n 1.7v 69.495n 1.7v 69.505n 0.0v 79.495n 0.0v 79.505n 1.7v 89.495n 1.7v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 1.7v 119.495n 1.7v 119.505n 0.0v 129.495n 0.0v 129.505n 1.7v 139.495n 1.7v 139.505n 1.7v 149.495n 1.7v 149.505n 0.0v 159.495n 0.0v 159.505n 1.7v 169.495n 1.7v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 1.7v 219.495n 1.7v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 1.7v 389.495n 1.7v 389.505n 1.7v 399.495n 1.7v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 1.7v 499.495n 1.7v 499.505n 1.7v 509.495n 1.7v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 0.0v 619.495n 0.0v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 0.0v 659.495n 0.0v 659.505n 1.7v 669.495n 1.7v 669.505n 0.0v 679.495n 0.0v 679.505n 0.0v 689.495n 0.0v 689.505n 1.7v 699.495n 1.7v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 0.0v 729.495n 0.0v 729.505n 0.0v 739.495n 0.0v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 1.7v 769.495n 1.7v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 1.7v 859.495n 1.7v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 1.7v 939.495n 1.7v 939.505n 1.7v 949.495n 1.7v 949.505n 1.7v 959.495n 1.7v 959.505n 1.7v 969.495n 1.7v 969.505n 1.7v 979.495n 1.7v 979.505n 1.7v 989.495n 1.7v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 1.7v 1089.495n 1.7v 1089.505n 1.7v 1099.495n 1.7v 1099.505n 1.7v 1109.495n 1.7v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 1.7v 1129.495n 1.7v 1129.505n 1.7v 1139.495n 1.7v 1139.505n 1.7v 1149.495n 1.7v 1149.505n 1.7v 1159.495n 1.7v 1159.505n 1.7v 1169.495n 1.7v 1169.505n 1.7v 1179.495n 1.7v 1179.505n 1.7v 1189.495n 1.7v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 1.7v 1309.495n 1.7v 1309.505n 1.7v 1319.495n 1.7v 1319.505n 1.7v 1329.495n 1.7v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 1.7v 1349.495n 1.7v 1349.505n 1.7v 1359.495n 1.7v 1359.505n 1.7v 1369.495n 1.7v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 1.7v 1389.495n 1.7v 1389.505n 1.7v 1399.495n 1.7v 1399.505n 1.7v 1409.495n 1.7v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 1.7v 1689.495n 1.7v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 1.7v 1919.495n 1.7v 1919.505n 1.7v 1929.495n 1.7v 1929.505n 1.7v 1939.495n 1.7v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 1.7v 2019.495n 1.7v 2019.505n 1.7v 2029.495n 1.7v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 0.0v 2049.495n 0.0v 2049.505n 0.0v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 1), (40, 1), (50, 1), (60, 1), (70, 0), (80, 1), (90, 0), (100, 0), (110, 0), (120, 1), (130, 1), (140, 1), (150, 1), (160, 1), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 1), (230, 1), (240, 1), (250, 1), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 1), (330, 1), (340, 1), (350, 0), (360, 0), (370, 0), (380, 1), (390, 1), (400, 1), (410, 1), (420, 0), (430, 0), (440, 0), (450, 0), (460, 0), (470, 0), (480, 0), (490, 1), (500, 1), (510, 1), (520, 1), (530, 1), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 1), (600, 1), (610, 0), (620, 1), (630, 1), (640, 1), (650, 0), (660, 0), (670, 1), (680, 0), (690, 1), (700, 1), (710, 1), (720, 0), (730, 0), (740, 1), (750, 1), (760, 1), (770, 1), (780, 1), (790, 1), (800, 1), (810, 1), (820, 0), (830, 1), (840, 1), (850, 0), (860, 1), (870, 1), (880, 0), (890, 0), (900, 0), (910, 0), (920, 1), (930, 1), (940, 1), (950, 1), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 1), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 1), (1130, 1), (1140, 0), (1150, 0), (1160, 0), (1170, 1), (1180, 1), (1190, 0), (1200, 0), (1210, 1), (1220, 1), (1230, 1), (1240, 1), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 1), (1550, 1), (1560, 1), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 1), (1620, 1), (1630, 0), (1640, 1), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 1), (1780, 1), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 1), (1860, 1), (1870, 1), (1880, 1), (1890, 1), (1900, 1), (1910, 0), (1920, 0), (1930, 0), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_7  din0_7  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 1.7v 39.495n 1.7v 39.505n 1.7v 49.495n 1.7v 49.505n 1.7v 59.495n 1.7v 59.505n 1.7v 69.495n 1.7v 69.505n 0.0v 79.495n 0.0v 79.505n 1.7v 89.495n 1.7v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 1.7v 129.495n 1.7v 129.505n 1.7v 139.495n 1.7v 139.505n 1.7v 149.495n 1.7v 149.505n 1.7v 159.495n 1.7v 159.505n 1.7v 169.495n 1.7v 169.505n 1.7v 179.495n 1.7v 179.505n 1.7v 189.495n 1.7v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 1.7v 219.495n 1.7v 219.505n 1.7v 229.495n 1.7v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 1.7v 259.495n 1.7v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 1.7v 329.495n 1.7v 329.505n 1.7v 339.495n 1.7v 339.505n 1.7v 349.495n 1.7v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 1.7v 389.495n 1.7v 389.505n 1.7v 399.495n 1.7v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 0.0v 469.495n 0.0v 469.505n 0.0v 479.495n 0.0v 479.505n 0.0v 489.495n 0.0v 489.505n 1.7v 499.495n 1.7v 499.505n 1.7v 509.495n 1.7v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 1.7v 539.495n 1.7v 539.505n 1.7v 549.495n 1.7v 549.505n 1.7v 559.495n 1.7v 559.505n 1.7v 569.495n 1.7v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 0.0v 619.495n 0.0v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 0.0v 659.495n 0.0v 659.505n 0.0v 669.495n 0.0v 669.505n 1.7v 679.495n 1.7v 679.505n 0.0v 689.495n 0.0v 689.505n 1.7v 699.495n 1.7v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 0.0v 729.495n 0.0v 729.505n 0.0v 739.495n 0.0v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 1.7v 769.495n 1.7v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 1.7v 799.495n 1.7v 799.505n 1.7v 809.495n 1.7v 809.505n 1.7v 819.495n 1.7v 819.505n 0.0v 829.495n 0.0v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 0.0v 859.495n 0.0v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 1.7v 929.495n 1.7v 929.505n 1.7v 939.495n 1.7v 939.505n 1.7v 949.495n 1.7v 949.505n 1.7v 959.495n 1.7v 959.505n 1.7v 969.495n 1.7v 969.505n 1.7v 979.495n 1.7v 979.505n 1.7v 989.495n 1.7v 989.505n 1.7v 999.495n 1.7v 999.505n 1.7v 1009.495n 1.7v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 1.7v 1039.495n 1.7v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 1.7v 1059.495n 1.7v 1059.505n 1.7v 1069.495n 1.7v 1069.505n 1.7v 1079.495n 1.7v 1079.505n 1.7v 1089.495n 1.7v 1089.505n 1.7v 1099.495n 1.7v 1099.505n 1.7v 1109.495n 1.7v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 1.7v 1129.495n 1.7v 1129.505n 1.7v 1139.495n 1.7v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 1.7v 1179.495n 1.7v 1179.505n 1.7v 1189.495n 1.7v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 1.7v 1219.495n 1.7v 1219.505n 1.7v 1229.495n 1.7v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 1.7v 1389.495n 1.7v 1389.505n 1.7v 1399.495n 1.7v 1399.505n 1.7v 1409.495n 1.7v 1409.505n 1.7v 1419.495n 1.7v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 1.7v 1439.495n 1.7v 1439.505n 1.7v 1449.495n 1.7v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 1.7v 1549.495n 1.7v 1549.505n 1.7v 1559.495n 1.7v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 1.7v 1619.495n 1.7v 1619.505n 1.7v 1629.495n 1.7v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 1.7v 1699.495n 1.7v 1699.505n 1.7v 1709.495n 1.7v 1709.505n 1.7v 1719.495n 1.7v 1719.505n 1.7v 1729.495n 1.7v 1729.505n 1.7v 1739.495n 1.7v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 1.7v 1789.495n 1.7v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 1.7v 1849.495n 1.7v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 1.7v 1869.495n 1.7v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 1.7v 1889.495n 1.7v 1889.505n 1.7v 1899.495n 1.7v 1899.505n 1.7v 1909.495n 1.7v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 1.7v 1949.495n 1.7v 1949.505n 1.7v 1959.495n 1.7v 1959.505n 1.7v 1969.495n 1.7v 1969.505n 1.7v 1979.495n 1.7v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 1), (40, 1), (50, 0), (60, 0), (70, 1), (80, 0), (90, 1), (100, 0), (110, 0), (120, 1), (130, 1), (140, 1), (150, 1), (160, 1), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 1), (240, 1), (250, 0), (260, 0), (270, 0), (280, 0), (290, 1), (300, 1), (310, 1), (320, 1), (330, 0), (340, 0), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 1), (490, 0), (500, 0), (510, 1), (520, 1), (530, 1), (540, 1), (550, 1), (560, 0), (570, 1), (580, 1), (590, 1), (600, 1), (610, 1), (620, 1), (630, 1), (640, 1), (650, 0), (660, 1), (670, 0), (680, 0), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 1), (750, 1), (760, 0), (770, 1), (780, 1), (790, 1), (800, 1), (810, 0), (820, 1), (830, 0), (840, 0), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 1), (930, 1), (940, 1), (950, 1), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 1), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 1), (1210, 0), (1220, 1), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 1), (1290, 1), (1300, 1), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 1), (1400, 0), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 1), (1590, 1), (1600, 1), (1610, 0), (1620, 0), (1630, 1), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 1), (1770, 1), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 1), (1860, 1), (1870, 1), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_8  din0_8  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 1.7v 39.495n 1.7v 39.505n 1.7v 49.495n 1.7v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 1.7v 79.495n 1.7v 79.505n 0.0v 89.495n 0.0v 89.505n 1.7v 99.495n 1.7v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 1.7v 129.495n 1.7v 129.505n 1.7v 139.495n 1.7v 139.505n 1.7v 149.495n 1.7v 149.505n 1.7v 159.495n 1.7v 159.505n 1.7v 169.495n 1.7v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 1.7v 319.495n 1.7v 319.505n 1.7v 329.495n 1.7v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 1.7v 359.495n 1.7v 359.505n 1.7v 369.495n 1.7v 369.505n 1.7v 379.495n 1.7v 379.505n 1.7v 389.495n 1.7v 389.505n 1.7v 399.495n 1.7v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 1.7v 539.495n 1.7v 539.505n 1.7v 549.495n 1.7v 549.505n 1.7v 559.495n 1.7v 559.505n 0.0v 569.495n 0.0v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 1.7v 619.495n 1.7v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 0.0v 659.495n 0.0v 659.505n 1.7v 669.495n 1.7v 669.505n 0.0v 679.495n 0.0v 679.505n 0.0v 689.495n 0.0v 689.505n 1.7v 699.495n 1.7v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 0.0v 769.495n 0.0v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 1.7v 799.495n 1.7v 799.505n 1.7v 809.495n 1.7v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 0.0v 859.495n 0.0v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 1.7v 929.495n 1.7v 929.505n 1.7v 939.495n 1.7v 939.505n 1.7v 949.495n 1.7v 949.505n 1.7v 959.495n 1.7v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 1.7v 1139.495n 1.7v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 1.7v 1209.495n 1.7v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 1.7v 1229.495n 1.7v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 1.7v 1259.495n 1.7v 1259.505n 1.7v 1269.495n 1.7v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 1.7v 1309.495n 1.7v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 1.7v 1389.495n 1.7v 1389.505n 1.7v 1399.495n 1.7v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 1.7v 1419.495n 1.7v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 1.7v 1439.495n 1.7v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 1.7v 1509.495n 1.7v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 1.7v 1589.495n 1.7v 1589.505n 1.7v 1599.495n 1.7v 1599.505n 1.7v 1609.495n 1.7v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 1.7v 1639.495n 1.7v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 1.7v 1849.495n 1.7v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 1.7v 1869.495n 1.7v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 1.7v 1939.495n 1.7v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 1.7v 2019.495n 1.7v 2019.505n 1.7v 2029.495n 1.7v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 1), (40, 1), (50, 1), (60, 1), (70, 1), (80, 1), (90, 0), (100, 0), (110, 1), (120, 0), (130, 1), (140, 1), (150, 0), (160, 0), (170, 1), (180, 1), (190, 0), (200, 0), (210, 0), (220, 0), (230, 1), (240, 1), (250, 1), (260, 0), (270, 1), (280, 1), (290, 0), (300, 0), (310, 0), (320, 0), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 1), (490, 1), (500, 1), (510, 1), (520, 1), (530, 1), (540, 1), (550, 0), (560, 1), (570, 1), (580, 1), (590, 1), (600, 1), (610, 0), (620, 0), (630, 0), (640, 0), (650, 1), (660, 0), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 0), (730, 0), (740, 0), (750, 0), (760, 1), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 1), (840, 1), (850, 0), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 0), (930, 0), (940, 1), (950, 1), (960, 1), (970, 1), (980, 1), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 1), (1130, 0), (1140, 1), (1150, 1), (1160, 1), (1170, 0), (1180, 0), (1190, 0), (1200, 1), (1210, 1), (1220, 0), (1230, 0), (1240, 0), (1250, 1), (1260, 1), (1270, 1), (1280, 1), (1290, 1), (1300, 1), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 1), (1380, 0), (1390, 0), (1400, 0), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 1), (1550, 1), (1560, 1), (1570, 0), (1580, 1), (1590, 1), (1600, 1), (1610, 0), (1620, 0), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 0), (1860, 1), (1870, 1), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_9  din0_9  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 1.7v 39.495n 1.7v 39.505n 1.7v 49.495n 1.7v 49.505n 1.7v 59.495n 1.7v 59.505n 1.7v 69.495n 1.7v 69.505n 1.7v 79.495n 1.7v 79.505n 1.7v 89.495n 1.7v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 1.7v 119.495n 1.7v 119.505n 0.0v 129.495n 0.0v 129.505n 1.7v 139.495n 1.7v 139.505n 1.7v 149.495n 1.7v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 1.7v 179.495n 1.7v 179.505n 1.7v 189.495n 1.7v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 1.7v 259.495n 1.7v 259.505n 0.0v 269.495n 0.0v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 1.7v 339.495n 1.7v 339.505n 1.7v 349.495n 1.7v 349.505n 1.7v 359.495n 1.7v 359.505n 1.7v 369.495n 1.7v 369.505n 1.7v 379.495n 1.7v 379.505n 1.7v 389.495n 1.7v 389.505n 1.7v 399.495n 1.7v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 1.7v 499.495n 1.7v 499.505n 1.7v 509.495n 1.7v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 1.7v 539.495n 1.7v 539.505n 1.7v 549.495n 1.7v 549.505n 0.0v 559.495n 0.0v 559.505n 1.7v 569.495n 1.7v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 1.7v 659.495n 1.7v 659.505n 0.0v 669.495n 0.0v 669.505n 1.7v 679.495n 1.7v 679.505n 1.7v 689.495n 1.7v 689.505n 1.7v 699.495n 1.7v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 0.0v 729.495n 0.0v 729.505n 0.0v 739.495n 0.0v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 1.7v 769.495n 1.7v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 0.0v 859.495n 0.0v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 1.7v 889.495n 1.7v 889.505n 1.7v 899.495n 1.7v 899.505n 1.7v 909.495n 1.7v 909.505n 1.7v 919.495n 1.7v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 1.7v 949.495n 1.7v 949.505n 1.7v 959.495n 1.7v 959.505n 1.7v 969.495n 1.7v 969.505n 1.7v 979.495n 1.7v 979.505n 1.7v 989.495n 1.7v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 1.7v 1089.495n 1.7v 1089.505n 1.7v 1099.495n 1.7v 1099.505n 1.7v 1109.495n 1.7v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 1.7v 1129.495n 1.7v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 1.7v 1149.495n 1.7v 1149.505n 1.7v 1159.495n 1.7v 1159.505n 1.7v 1169.495n 1.7v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 1.7v 1209.495n 1.7v 1209.505n 1.7v 1219.495n 1.7v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 1.7v 1259.495n 1.7v 1259.505n 1.7v 1269.495n 1.7v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 1.7v 1309.495n 1.7v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 1.7v 1379.495n 1.7v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 1.7v 1419.495n 1.7v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 1.7v 1439.495n 1.7v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 1.7v 1549.495n 1.7v 1549.505n 1.7v 1559.495n 1.7v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 1.7v 1589.495n 1.7v 1589.505n 1.7v 1599.495n 1.7v 1599.505n 1.7v 1609.495n 1.7v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 1.7v 1639.495n 1.7v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 1.7v 1689.495n 1.7v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 1.7v 1869.495n 1.7v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 1.7v 1889.495n 1.7v 1889.505n 1.7v 1899.495n 1.7v 1899.505n 1.7v 1909.495n 1.7v 1909.505n 1.7v 1919.495n 1.7v 1919.505n 1.7v 1929.495n 1.7v 1929.505n 1.7v 1939.495n 1.7v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 1.7v 2019.495n 1.7v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 0.0v 2049.495n 0.0v 2049.505n 0.0v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 1), (40, 1), (50, 1), (60, 0), (70, 1), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 0), (160, 1), (170, 0), (180, 0), (190, 1), (200, 1), (210, 1), (220, 0), (230, 1), (240, 1), (250, 1), (260, 1), (270, 0), (280, 1), (290, 1), (300, 1), (310, 1), (320, 0), (330, 0), (340, 0), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 1), (410, 1), (420, 0), (430, 0), (440, 0), (450, 0), (460, 0), (470, 0), (480, 0), (490, 1), (500, 1), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 1), (570, 1), (580, 1), (590, 1), (600, 1), (610, 1), (620, 0), (630, 0), (640, 0), (650, 1), (660, 0), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 1), (750, 1), (760, 1), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 0), (840, 0), (850, 1), (860, 0), (870, 0), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 1), (1180, 1), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 0), (1330, 0), (1340, 1), (1350, 1), (1360, 1), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 1), (1550, 1), (1560, 1), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 1), (1620, 1), (1630, 1), (1640, 0), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 1), (1780, 1), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 0), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_10  din0_10  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 1.7v 39.495n 1.7v 39.505n 1.7v 49.495n 1.7v 49.505n 1.7v 59.495n 1.7v 59.505n 0.0v 69.495n 0.0v 69.505n 1.7v 79.495n 1.7v 79.505n 1.7v 89.495n 1.7v 89.505n 1.7v 99.495n 1.7v 99.505n 1.7v 109.495n 1.7v 109.505n 1.7v 119.495n 1.7v 119.505n 1.7v 129.495n 1.7v 129.505n 1.7v 139.495n 1.7v 139.505n 1.7v 149.495n 1.7v 149.505n 0.0v 159.495n 0.0v 159.505n 1.7v 169.495n 1.7v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 1.7v 219.495n 1.7v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 1.7v 259.495n 1.7v 259.505n 1.7v 269.495n 1.7v 269.505n 0.0v 279.495n 0.0v 279.505n 1.7v 289.495n 1.7v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 1.7v 319.495n 1.7v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 1.7v 359.495n 1.7v 359.505n 1.7v 369.495n 1.7v 369.505n 1.7v 379.495n 1.7v 379.505n 1.7v 389.495n 1.7v 389.505n 1.7v 399.495n 1.7v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 0.0v 469.495n 0.0v 469.505n 0.0v 479.495n 0.0v 479.505n 0.0v 489.495n 0.0v 489.505n 1.7v 499.495n 1.7v 499.505n 1.7v 509.495n 1.7v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 1.7v 569.495n 1.7v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 1.7v 619.495n 1.7v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 1.7v 659.495n 1.7v 659.505n 0.0v 669.495n 0.0v 669.505n 0.0v 679.495n 0.0v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 0.0v 729.495n 0.0v 729.505n 0.0v 739.495n 0.0v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 1.7v 769.495n 1.7v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 1.7v 859.495n 1.7v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 1.7v 889.495n 1.7v 889.505n 1.7v 899.495n 1.7v 899.505n 1.7v 909.495n 1.7v 909.505n 1.7v 919.495n 1.7v 919.505n 1.7v 929.495n 1.7v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 1.7v 1179.495n 1.7v 1179.505n 1.7v 1189.495n 1.7v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 1.7v 1309.495n 1.7v 1309.505n 1.7v 1319.495n 1.7v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 1.7v 1349.495n 1.7v 1349.505n 1.7v 1359.495n 1.7v 1359.505n 1.7v 1369.495n 1.7v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 1.7v 1449.495n 1.7v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 1.7v 1549.495n 1.7v 1549.505n 1.7v 1559.495n 1.7v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 1.7v 1619.495n 1.7v 1619.505n 1.7v 1629.495n 1.7v 1629.505n 1.7v 1639.495n 1.7v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 1.7v 1689.495n 1.7v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 1.7v 1789.495n 1.7v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 1.7v 1939.495n 1.7v 1939.505n 1.7v 1949.495n 1.7v 1949.505n 1.7v 1959.495n 1.7v 1959.505n 1.7v 1969.495n 1.7v 1969.505n 1.7v 1979.495n 1.7v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 1.7v 2029.495n 1.7v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 1), (60, 1), (70, 1), (80, 0), (90, 0), (100, 1), (110, 1), (120, 0), (130, 1), (140, 1), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 1), (280, 1), (290, 1), (300, 1), (310, 1), (320, 0), (330, 0), (340, 0), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 0), (410, 0), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 1), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 1), (560, 1), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 1), (630, 1), (640, 1), (650, 1), (660, 0), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 0), (750, 0), (760, 0), (770, 1), (780, 1), (790, 1), (800, 1), (810, 0), (820, 1), (830, 1), (840, 1), (850, 0), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 0), (930, 0), (940, 0), (950, 0), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 1), (1080, 1), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 1), (1140, 1), (1150, 1), (1160, 1), (1170, 1), (1180, 1), (1190, 1), (1200, 0), (1210, 1), (1220, 1), (1230, 1), (1240, 1), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 0), (1330, 0), (1340, 1), (1350, 1), (1360, 1), (1370, 0), (1380, 1), (1390, 1), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 0), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 0), (1640, 0), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 0), (1860, 1), (1870, 1), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_11  din0_11  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 1.7v 59.495n 1.7v 59.505n 1.7v 69.495n 1.7v 69.505n 1.7v 79.495n 1.7v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 1.7v 109.495n 1.7v 109.505n 1.7v 119.495n 1.7v 119.505n 0.0v 129.495n 0.0v 129.505n 1.7v 139.495n 1.7v 139.505n 1.7v 149.495n 1.7v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 1.7v 319.495n 1.7v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 1.7v 359.495n 1.7v 359.505n 1.7v 369.495n 1.7v 369.505n 1.7v 379.495n 1.7v 379.505n 1.7v 389.495n 1.7v 389.505n 1.7v 399.495n 1.7v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 1.7v 559.495n 1.7v 559.505n 1.7v 569.495n 1.7v 569.505n 0.0v 579.495n 0.0v 579.505n 0.0v 589.495n 0.0v 589.505n 0.0v 599.495n 0.0v 599.505n 0.0v 609.495n 0.0v 609.505n 0.0v 619.495n 0.0v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 1.7v 659.495n 1.7v 659.505n 0.0v 669.495n 0.0v 669.505n 0.0v 679.495n 0.0v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 0.0v 729.495n 0.0v 729.505n 0.0v 739.495n 0.0v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 0.0v 769.495n 0.0v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 1.7v 799.495n 1.7v 799.505n 1.7v 809.495n 1.7v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 0.0v 859.495n 0.0v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 1.7v 889.495n 1.7v 889.505n 1.7v 899.495n 1.7v 899.505n 1.7v 909.495n 1.7v 909.505n 1.7v 919.495n 1.7v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 1.7v 969.495n 1.7v 969.505n 1.7v 979.495n 1.7v 979.505n 1.7v 989.495n 1.7v 989.505n 1.7v 999.495n 1.7v 999.505n 1.7v 1009.495n 1.7v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 1.7v 1039.495n 1.7v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 1.7v 1059.495n 1.7v 1059.505n 1.7v 1069.495n 1.7v 1069.505n 1.7v 1079.495n 1.7v 1079.505n 1.7v 1089.495n 1.7v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 1.7v 1139.495n 1.7v 1139.505n 1.7v 1149.495n 1.7v 1149.505n 1.7v 1159.495n 1.7v 1159.505n 1.7v 1169.495n 1.7v 1169.505n 1.7v 1179.495n 1.7v 1179.505n 1.7v 1189.495n 1.7v 1189.505n 1.7v 1199.495n 1.7v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 1.7v 1219.495n 1.7v 1219.505n 1.7v 1229.495n 1.7v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 1.7v 1309.495n 1.7v 1309.505n 1.7v 1319.495n 1.7v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 1.7v 1349.495n 1.7v 1349.505n 1.7v 1359.495n 1.7v 1359.505n 1.7v 1369.495n 1.7v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 1.7v 1389.495n 1.7v 1389.505n 1.7v 1399.495n 1.7v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 1.7v 1509.495n 1.7v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 1.7v 1549.495n 1.7v 1549.505n 1.7v 1559.495n 1.7v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 1.7v 1589.495n 1.7v 1589.505n 1.7v 1599.495n 1.7v 1599.505n 1.7v 1609.495n 1.7v 1609.505n 1.7v 1619.495n 1.7v 1619.505n 1.7v 1629.495n 1.7v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 1.7v 1689.495n 1.7v 1689.505n 1.7v 1699.495n 1.7v 1699.505n 1.7v 1709.495n 1.7v 1709.505n 1.7v 1719.495n 1.7v 1719.505n 1.7v 1729.495n 1.7v 1729.505n 1.7v 1739.495n 1.7v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 1.7v 1869.495n 1.7v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 1.7v 1949.495n 1.7v 1949.505n 1.7v 1959.495n 1.7v 1959.505n 1.7v 1969.495n 1.7v 1969.505n 1.7v 1979.495n 1.7v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 0.0v 2049.495n 0.0v 2049.505n 0.0v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 1), (40, 1), (50, 0), (60, 0), (70, 0), (80, 1), (90, 0), (100, 1), (110, 0), (120, 1), (130, 1), (140, 1), (150, 1), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 1), (230, 0), (240, 0), (250, 0), (260, 1), (270, 0), (280, 1), (290, 1), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 1), (410, 1), (420, 0), (430, 0), (440, 0), (450, 0), (460, 1), (470, 1), (480, 1), (490, 0), (500, 0), (510, 1), (520, 1), (530, 1), (540, 1), (550, 1), (560, 1), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 1), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 0), (750, 0), (760, 1), (770, 0), (780, 0), (790, 0), (800, 0), (810, 1), (820, 1), (830, 0), (840, 0), (850, 0), (860, 1), (870, 1), (880, 0), (890, 0), (900, 0), (910, 0), (920, 1), (930, 1), (940, 0), (950, 1), (960, 0), (970, 0), (980, 0), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 1), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 1), (1210, 0), (1220, 1), (1230, 1), (1240, 1), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 0), (1320, 0), (1330, 0), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 0), (1390, 0), (1400, 0), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 1), (1620, 1), (1630, 0), (1640, 1), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 0), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 1), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 1), (1920, 1), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_12  din0_12  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 1.7v 39.495n 1.7v 39.505n 1.7v 49.495n 1.7v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 1.7v 89.495n 1.7v 89.505n 0.0v 99.495n 0.0v 99.505n 1.7v 109.495n 1.7v 109.505n 0.0v 119.495n 0.0v 119.505n 1.7v 129.495n 1.7v 129.505n 1.7v 139.495n 1.7v 139.505n 1.7v 149.495n 1.7v 149.505n 1.7v 159.495n 1.7v 159.505n 0.0v 169.495n 0.0v 169.505n 1.7v 179.495n 1.7v 179.505n 1.7v 189.495n 1.7v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 1.7v 219.495n 1.7v 219.505n 1.7v 229.495n 1.7v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 0.0v 259.495n 0.0v 259.505n 1.7v 269.495n 1.7v 269.505n 0.0v 279.495n 0.0v 279.505n 1.7v 289.495n 1.7v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 1.7v 319.495n 1.7v 319.505n 1.7v 329.495n 1.7v 329.505n 1.7v 339.495n 1.7v 339.505n 1.7v 349.495n 1.7v 349.505n 1.7v 359.495n 1.7v 359.505n 1.7v 369.495n 1.7v 369.505n 1.7v 379.495n 1.7v 379.505n 1.7v 389.495n 1.7v 389.505n 1.7v 399.495n 1.7v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 1.7v 539.495n 1.7v 539.505n 1.7v 549.495n 1.7v 549.505n 1.7v 559.495n 1.7v 559.505n 1.7v 569.495n 1.7v 569.505n 0.0v 579.495n 0.0v 579.505n 0.0v 589.495n 0.0v 589.505n 0.0v 599.495n 0.0v 599.505n 0.0v 609.495n 0.0v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 0.0v 659.495n 0.0v 659.505n 1.7v 669.495n 1.7v 669.505n 0.0v 679.495n 0.0v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 1.7v 769.495n 1.7v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 1.7v 819.495n 1.7v 819.505n 1.7v 829.495n 1.7v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 0.0v 859.495n 0.0v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 1.7v 929.495n 1.7v 929.505n 1.7v 939.495n 1.7v 939.505n 0.0v 949.495n 0.0v 949.505n 1.7v 959.495n 1.7v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 1.7v 999.495n 1.7v 999.505n 1.7v 1009.495n 1.7v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 1.7v 1039.495n 1.7v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 1.7v 1089.495n 1.7v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 1.7v 1209.495n 1.7v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 1.7v 1229.495n 1.7v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 1.7v 1309.495n 1.7v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 1.7v 1349.495n 1.7v 1349.505n 1.7v 1359.495n 1.7v 1359.505n 1.7v 1369.495n 1.7v 1369.505n 1.7v 1379.495n 1.7v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 1.7v 1419.495n 1.7v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 1.7v 1439.495n 1.7v 1439.505n 1.7v 1449.495n 1.7v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 1.7v 1619.495n 1.7v 1619.505n 1.7v 1629.495n 1.7v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 1.7v 1849.495n 1.7v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 1.7v 1919.495n 1.7v 1919.505n 1.7v 1929.495n 1.7v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 1), (30, 1), (40, 1), (50, 1), (60, 1), (70, 0), (80, 1), (90, 1), (100, 0), (110, 1), (120, 0), (130, 1), (140, 1), (150, 1), (160, 0), (170, 0), (180, 0), (190, 1), (200, 1), (210, 1), (220, 1), (230, 0), (240, 0), (250, 0), (260, 1), (270, 1), (280, 1), (290, 1), (300, 1), (310, 1), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 1), (390, 1), (400, 0), (410, 0), (420, 0), (430, 0), (440, 0), (450, 0), (460, 1), (470, 1), (480, 1), (490, 1), (500, 1), (510, 0), (520, 0), (530, 0), (540, 0), (550, 1), (560, 0), (570, 1), (580, 1), (590, 1), (600, 1), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 1), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 0), (750, 0), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 0), (840, 0), (850, 1), (860, 0), (870, 0), (880, 1), (890, 1), (900, 1), (910, 1), (920, 0), (930, 1), (940, 1), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 1), (1060, 1), (1070, 1), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 1), (1150, 1), (1160, 1), (1170, 0), (1180, 0), (1190, 1), (1200, 0), (1210, 0), (1220, 1), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 1), (1290, 1), (1300, 1), (1310, 0), (1320, 0), (1330, 0), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 1), (1390, 1), (1400, 1), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 1), (1640, 1), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 0), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 1), (1870, 1), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 1), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_13  din0_13  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 1.7v 29.495n 1.7v 29.505n 1.7v 39.495n 1.7v 39.505n 1.7v 49.495n 1.7v 49.505n 1.7v 59.495n 1.7v 59.505n 1.7v 69.495n 1.7v 69.505n 0.0v 79.495n 0.0v 79.505n 1.7v 89.495n 1.7v 89.505n 1.7v 99.495n 1.7v 99.505n 0.0v 109.495n 0.0v 109.505n 1.7v 119.495n 1.7v 119.505n 0.0v 129.495n 0.0v 129.505n 1.7v 139.495n 1.7v 139.505n 1.7v 149.495n 1.7v 149.505n 1.7v 159.495n 1.7v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 1.7v 219.495n 1.7v 219.505n 1.7v 229.495n 1.7v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 0.0v 259.495n 0.0v 259.505n 1.7v 269.495n 1.7v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 1.7v 319.495n 1.7v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 1.7v 389.495n 1.7v 389.505n 1.7v 399.495n 1.7v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 1.7v 499.495n 1.7v 499.505n 1.7v 509.495n 1.7v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 1.7v 559.495n 1.7v 559.505n 0.0v 569.495n 0.0v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 0.0v 659.495n 0.0v 659.505n 1.7v 669.495n 1.7v 669.505n 1.7v 679.495n 1.7v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 0.0v 769.495n 0.0v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 1.7v 859.495n 1.7v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 1.7v 889.495n 1.7v 889.505n 1.7v 899.495n 1.7v 899.505n 1.7v 909.495n 1.7v 909.505n 1.7v 919.495n 1.7v 919.505n 0.0v 929.495n 0.0v 929.505n 1.7v 939.495n 1.7v 939.505n 1.7v 949.495n 1.7v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 1.7v 1059.495n 1.7v 1059.505n 1.7v 1069.495n 1.7v 1069.505n 1.7v 1079.495n 1.7v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 1.7v 1149.495n 1.7v 1149.505n 1.7v 1159.495n 1.7v 1159.505n 1.7v 1169.495n 1.7v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 1.7v 1199.495n 1.7v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 1.7v 1229.495n 1.7v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 1.7v 1259.495n 1.7v 1259.505n 1.7v 1269.495n 1.7v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 1.7v 1309.495n 1.7v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 1.7v 1349.495n 1.7v 1349.505n 1.7v 1359.495n 1.7v 1359.505n 1.7v 1369.495n 1.7v 1369.505n 1.7v 1379.495n 1.7v 1379.505n 1.7v 1389.495n 1.7v 1389.505n 1.7v 1399.495n 1.7v 1399.505n 1.7v 1409.495n 1.7v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 1.7v 1449.495n 1.7v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 1.7v 1509.495n 1.7v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 1.7v 1549.495n 1.7v 1549.505n 1.7v 1559.495n 1.7v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 1.7v 1639.495n 1.7v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 1.7v 1869.495n 1.7v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 1.7v 1889.495n 1.7v 1889.505n 1.7v 1899.495n 1.7v 1899.505n 1.7v 1909.495n 1.7v 1909.505n 1.7v 1919.495n 1.7v 1919.505n 1.7v 1929.495n 1.7v 1929.505n 1.7v 1939.495n 1.7v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 1.7v 2019.495n 1.7v 2019.505n 1.7v 2029.495n 1.7v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 1), (30, 0), (40, 0), (50, 0), (60, 0), (70, 1), (80, 0), (90, 0), (100, 1), (110, 0), (120, 1), (130, 0), (140, 0), (150, 1), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 1), (230, 0), (240, 0), (250, 0), (260, 1), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 1), (390, 1), (400, 0), (410, 0), (420, 1), (430, 1), (440, 1), (450, 1), (460, 0), (470, 0), (480, 0), (490, 1), (500, 1), (510, 1), (520, 1), (530, 1), (540, 1), (550, 1), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 1), (620, 1), (630, 1), (640, 1), (650, 0), (660, 0), (670, 1), (680, 0), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 0), (750, 0), (760, 0), (770, 1), (780, 1), (790, 1), (800, 1), (810, 1), (820, 0), (830, 1), (840, 1), (850, 0), (860, 0), (870, 0), (880, 1), (890, 1), (900, 1), (910, 1), (920, 0), (930, 0), (940, 1), (950, 0), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 1), (1100, 1), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 1), (1160, 1), (1170, 0), (1180, 0), (1190, 0), (1200, 1), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 1), (1260, 1), (1270, 1), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 1), (1330, 1), (1340, 0), (1350, 0), (1360, 0), (1370, 1), (1380, 0), (1390, 0), (1400, 1), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 1), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 1), (1780, 1), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 1), (1850, 1), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 1), (1920, 1), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_14  din0_14  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 1.7v 29.495n 1.7v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 1.7v 79.495n 1.7v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 1.7v 109.495n 1.7v 109.505n 0.0v 119.495n 0.0v 119.505n 1.7v 129.495n 1.7v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 1.7v 159.495n 1.7v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 1.7v 229.495n 1.7v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 0.0v 259.495n 0.0v 259.505n 1.7v 269.495n 1.7v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 1.7v 389.495n 1.7v 389.505n 1.7v 399.495n 1.7v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 0.0v 469.495n 0.0v 469.505n 0.0v 479.495n 0.0v 479.505n 0.0v 489.495n 0.0v 489.505n 1.7v 499.495n 1.7v 499.505n 1.7v 509.495n 1.7v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 1.7v 539.495n 1.7v 539.505n 1.7v 549.495n 1.7v 549.505n 1.7v 559.495n 1.7v 559.505n 0.0v 569.495n 0.0v 569.505n 0.0v 579.495n 0.0v 579.505n 0.0v 589.495n 0.0v 589.505n 0.0v 599.495n 0.0v 599.505n 0.0v 609.495n 0.0v 609.505n 1.7v 619.495n 1.7v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 0.0v 659.495n 0.0v 659.505n 0.0v 669.495n 0.0v 669.505n 1.7v 679.495n 1.7v 679.505n 0.0v 689.495n 0.0v 689.505n 1.7v 699.495n 1.7v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 0.0v 769.495n 0.0v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 1.7v 799.495n 1.7v 799.505n 1.7v 809.495n 1.7v 809.505n 1.7v 819.495n 1.7v 819.505n 0.0v 829.495n 0.0v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 0.0v 859.495n 0.0v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 1.7v 889.495n 1.7v 889.505n 1.7v 899.495n 1.7v 899.505n 1.7v 909.495n 1.7v 909.505n 1.7v 919.495n 1.7v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 1.7v 949.495n 1.7v 949.505n 0.0v 959.495n 0.0v 959.505n 1.7v 969.495n 1.7v 969.505n 1.7v 979.495n 1.7v 979.505n 1.7v 989.495n 1.7v 989.505n 1.7v 999.495n 1.7v 999.505n 1.7v 1009.495n 1.7v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 1.7v 1039.495n 1.7v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 1.7v 1099.495n 1.7v 1099.505n 1.7v 1109.495n 1.7v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 1.7v 1129.495n 1.7v 1129.505n 1.7v 1139.495n 1.7v 1139.505n 1.7v 1149.495n 1.7v 1149.505n 1.7v 1159.495n 1.7v 1159.505n 1.7v 1169.495n 1.7v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 1.7v 1209.495n 1.7v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 1.7v 1259.495n 1.7v 1259.505n 1.7v 1269.495n 1.7v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 1.7v 1329.495n 1.7v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 1.7v 1379.495n 1.7v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 1.7v 1409.495n 1.7v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 1.7v 1449.495n 1.7v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 1.7v 1509.495n 1.7v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 1.7v 1639.495n 1.7v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 1.7v 1699.495n 1.7v 1699.505n 1.7v 1709.495n 1.7v 1709.505n 1.7v 1719.495n 1.7v 1719.505n 1.7v 1729.495n 1.7v 1729.505n 1.7v 1739.495n 1.7v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 1.7v 1789.495n 1.7v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 1.7v 1849.495n 1.7v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 1.7v 1919.495n 1.7v 1919.505n 1.7v 1929.495n 1.7v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 1.7v 2029.495n 1.7v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 1), (20, 0), (30, 0), (40, 0), (50, 1), (60, 1), (70, 0), (80, 0), (90, 1), (100, 0), (110, 1), (120, 0), (130, 0), (140, 0), (150, 1), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 1), (240, 1), (250, 1), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 1), (360, 1), (370, 1), (380, 0), (390, 0), (400, 0), (410, 0), (420, 0), (430, 0), (440, 0), (450, 0), (460, 1), (470, 1), (480, 1), (490, 0), (500, 0), (510, 1), (520, 1), (530, 1), (540, 1), (550, 0), (560, 0), (570, 1), (580, 1), (590, 1), (600, 1), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 1), (670, 1), (680, 1), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 1), (750, 1), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 0), (840, 0), (850, 1), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 1), (980, 1), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 1), (1060, 1), (1070, 1), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 1), (1160, 1), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 1), (1230, 1), (1240, 1), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 1), (1320, 1), (1330, 1), (1340, 0), (1350, 0), (1360, 0), (1370, 1), (1380, 0), (1390, 0), (1400, 1), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 0), (1640, 1), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 1), (1780, 1), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 1), (1870, 1), (1880, 1), (1890, 1), (1900, 1), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 0), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_15  din0_15  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 1.7v 19.495n 1.7v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 1.7v 59.495n 1.7v 59.505n 1.7v 69.495n 1.7v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 1.7v 99.495n 1.7v 99.505n 0.0v 109.495n 0.0v 109.505n 1.7v 119.495n 1.7v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 1.7v 159.495n 1.7v 159.505n 0.0v 169.495n 0.0v 169.505n 1.7v 179.495n 1.7v 179.505n 1.7v 189.495n 1.7v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 1.7v 219.495n 1.7v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 1.7v 259.495n 1.7v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 1.7v 359.495n 1.7v 359.505n 1.7v 369.495n 1.7v 369.505n 1.7v 379.495n 1.7v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 1.7v 539.495n 1.7v 539.505n 1.7v 549.495n 1.7v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 0.0v 659.495n 0.0v 659.505n 1.7v 669.495n 1.7v 669.505n 1.7v 679.495n 1.7v 679.505n 1.7v 689.495n 1.7v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 0.0v 729.495n 0.0v 729.505n 0.0v 739.495n 0.0v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 0.0v 769.495n 0.0v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 1.7v 859.495n 1.7v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 1.7v 959.495n 1.7v 959.505n 1.7v 969.495n 1.7v 969.505n 1.7v 979.495n 1.7v 979.505n 1.7v 989.495n 1.7v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 1.7v 1059.495n 1.7v 1059.505n 1.7v 1069.495n 1.7v 1069.505n 1.7v 1079.495n 1.7v 1079.505n 1.7v 1089.495n 1.7v 1089.505n 1.7v 1099.495n 1.7v 1099.505n 1.7v 1109.495n 1.7v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 1.7v 1129.495n 1.7v 1129.505n 1.7v 1139.495n 1.7v 1139.505n 1.7v 1149.495n 1.7v 1149.505n 1.7v 1159.495n 1.7v 1159.505n 1.7v 1169.495n 1.7v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 1.7v 1229.495n 1.7v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 1.7v 1319.495n 1.7v 1319.505n 1.7v 1329.495n 1.7v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 1.7v 1379.495n 1.7v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 1.7v 1409.495n 1.7v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 1.7v 1449.495n 1.7v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 1.7v 1589.495n 1.7v 1589.505n 1.7v 1599.495n 1.7v 1599.505n 1.7v 1609.495n 1.7v 1609.505n 1.7v 1619.495n 1.7v 1619.505n 1.7v 1629.495n 1.7v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 1.7v 1699.495n 1.7v 1699.505n 1.7v 1709.495n 1.7v 1709.505n 1.7v 1719.495n 1.7v 1719.505n 1.7v 1729.495n 1.7v 1729.505n 1.7v 1739.495n 1.7v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 1.7v 1789.495n 1.7v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 1.7v 1869.495n 1.7v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 1.7v 1889.495n 1.7v 1889.505n 1.7v 1899.495n 1.7v 1899.505n 1.7v 1909.495n 1.7v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 1.7v 2029.495n 1.7v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 0), (410, 0), (420, 0), (430, 0), (440, 0), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 0), (750, 0), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_16  din0_16  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 0.0v 469.495n 0.0v 469.505n 0.0v 479.495n 0.0v 479.505n 0.0v 489.495n 0.0v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 0.0v 579.495n 0.0v 579.505n 0.0v 589.495n 0.0v 589.505n 0.0v 599.495n 0.0v 599.505n 0.0v 609.495n 0.0v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 0.0v 659.495n 0.0v 659.505n 0.0v 669.495n 0.0v 669.505n 0.0v 679.495n 0.0v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 0.0v 729.495n 0.0v 729.505n 0.0v 739.495n 0.0v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 0.0v 769.495n 0.0v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 0.0v 829.495n 0.0v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 0.0v 859.495n 0.0v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 0.0v 2049.495n 0.0v 2049.505n 0.0v )
* (time, data): [(0, 0), (10, 0), (20, 1), (30, 1), (40, 1), (50, 1), (60, 0), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 0), (130, 0), (140, 0), (150, 1), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 1), (240, 1), (250, 1), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 1), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 0), (410, 0), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 1), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 1), (580, 1), (590, 1), (600, 1), (610, 1), (620, 1), (630, 1), (640, 1), (650, 0), (660, 0), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 0), (750, 0), (760, 1), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 1), (840, 1), (850, 1), (860, 1), (870, 1), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 1), (950, 0), (960, 0), (970, 0), (980, 0), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 1), (1080, 1), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 1), (1140, 0), (1150, 0), (1160, 0), (1170, 1), (1180, 1), (1190, 1), (1200, 1), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 1), (1260, 1), (1270, 1), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 0), (1380, 1), (1390, 1), (1400, 0), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 0), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 0), (1640, 0), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 0), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 1), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 1), (1920, 1), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Va0_0  a0_0  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 1.7v 29.495n 1.7v 29.505n 1.7v 39.495n 1.7v 39.505n 1.7v 49.495n 1.7v 49.505n 1.7v 59.495n 1.7v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 1.7v 89.495n 1.7v 89.505n 1.7v 99.495n 1.7v 99.505n 1.7v 109.495n 1.7v 109.505n 1.7v 119.495n 1.7v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 1.7v 159.495n 1.7v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 1.7v 259.495n 1.7v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 1.7v 329.495n 1.7v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 1.7v 619.495n 1.7v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 0.0v 659.495n 0.0v 659.505n 0.0v 669.495n 0.0v 669.505n 1.7v 679.495n 1.7v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 1.7v 769.495n 1.7v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 1.7v 859.495n 1.7v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 1.7v 949.495n 1.7v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 1.7v 999.495n 1.7v 999.505n 1.7v 1009.495n 1.7v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 1.7v 1039.495n 1.7v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 1.7v 1059.495n 1.7v 1059.505n 1.7v 1069.495n 1.7v 1069.505n 1.7v 1079.495n 1.7v 1079.505n 1.7v 1089.495n 1.7v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 1.7v 1139.495n 1.7v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 1.7v 1179.495n 1.7v 1179.505n 1.7v 1189.495n 1.7v 1189.505n 1.7v 1199.495n 1.7v 1199.505n 1.7v 1209.495n 1.7v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 1.7v 1259.495n 1.7v 1259.505n 1.7v 1269.495n 1.7v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 1.7v 1329.495n 1.7v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 1.7v 1349.495n 1.7v 1349.505n 1.7v 1359.495n 1.7v 1359.505n 1.7v 1369.495n 1.7v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 1.7v 1389.495n 1.7v 1389.505n 1.7v 1399.495n 1.7v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 1.7v 1419.495n 1.7v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 1.7v 1439.495n 1.7v 1439.505n 1.7v 1449.495n 1.7v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 1.7v 1509.495n 1.7v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 1.7v 1549.495n 1.7v 1549.505n 1.7v 1559.495n 1.7v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 1.7v 1589.495n 1.7v 1589.505n 1.7v 1599.495n 1.7v 1599.505n 1.7v 1609.495n 1.7v 1609.505n 1.7v 1619.495n 1.7v 1619.505n 1.7v 1629.495n 1.7v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 1.7v 1689.495n 1.7v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 1.7v 1849.495n 1.7v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 1.7v 1919.495n 1.7v 1919.505n 1.7v 1929.495n 1.7v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 1.7v 2019.495n 1.7v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 1), (240, 1), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 1), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 0), (410, 0), (420, 0), (430, 0), (440, 0), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 1), (580, 1), (590, 1), (600, 1), (610, 1), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 0), (750, 0), (760, 1), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 0), (840, 0), (850, 0), (860, 1), (870, 1), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 1), (1330, 1), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 0), (1580, 1), (1590, 1), (1600, 1), (1610, 0), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 0), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Va0_1  a0_1  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 1.7v 329.495n 1.7v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 0.0v 469.495n 0.0v 469.505n 0.0v 479.495n 0.0v 479.505n 0.0v 489.495n 0.0v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 1.7v 619.495n 1.7v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 0.0v 659.495n 0.0v 659.505n 0.0v 669.495n 0.0v 669.505n 1.7v 679.495n 1.7v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 1.7v 769.495n 1.7v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 0.0v 859.495n 0.0v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 1.7v 999.495n 1.7v 999.505n 1.7v 1009.495n 1.7v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 1.7v 1039.495n 1.7v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 1.7v 1329.495n 1.7v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 1.7v 1509.495n 1.7v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 1.7v 1549.495n 1.7v 1549.505n 1.7v 1559.495n 1.7v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 1.7v 1589.495n 1.7v 1589.505n 1.7v 1599.495n 1.7v 1599.505n 1.7v 1609.495n 1.7v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 1.7v 2019.495n 1.7v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 1), (240, 1), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 1), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 0), (410, 0), (420, 0), (430, 0), (440, 0), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 1), (580, 1), (590, 1), (600, 1), (610, 1), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 0), (750, 0), (760, 1), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 0), (840, 0), (850, 0), (860, 1), (870, 1), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 1), (1330, 1), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 0), (1580, 1), (1590, 1), (1600, 1), (1610, 0), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 0), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Va0_2  a0_2  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 1.7v 329.495n 1.7v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 0.0v 469.495n 0.0v 469.505n 0.0v 479.495n 0.0v 479.505n 0.0v 489.495n 0.0v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 1.7v 619.495n 1.7v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 0.0v 659.495n 0.0v 659.505n 0.0v 669.495n 0.0v 669.505n 1.7v 679.495n 1.7v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 1.7v 769.495n 1.7v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 0.0v 859.495n 0.0v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 1.7v 999.495n 1.7v 999.505n 1.7v 1009.495n 1.7v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 1.7v 1039.495n 1.7v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 1.7v 1329.495n 1.7v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 1.7v 1509.495n 1.7v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 1.7v 1549.495n 1.7v 1549.505n 1.7v 1559.495n 1.7v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 1.7v 1589.495n 1.7v 1589.505n 1.7v 1599.495n 1.7v 1599.505n 1.7v 1609.495n 1.7v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 1.7v 2019.495n 1.7v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 1), (240, 1), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 1), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 0), (410, 0), (420, 0), (430, 0), (440, 0), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 1), (580, 1), (590, 1), (600, 1), (610, 1), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 0), (750, 0), (760, 1), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 0), (840, 0), (850, 0), (860, 1), (870, 1), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 1), (1330, 1), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 0), (1580, 1), (1590, 1), (1600, 1), (1610, 0), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 0), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Va0_3  a0_3  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 1.7v 329.495n 1.7v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 0.0v 469.495n 0.0v 469.505n 0.0v 479.495n 0.0v 479.505n 0.0v 489.495n 0.0v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 1.7v 619.495n 1.7v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 0.0v 659.495n 0.0v 659.505n 0.0v 669.495n 0.0v 669.505n 1.7v 679.495n 1.7v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 1.7v 769.495n 1.7v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 0.0v 859.495n 0.0v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 1.7v 999.495n 1.7v 999.505n 1.7v 1009.495n 1.7v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 1.7v 1039.495n 1.7v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 1.7v 1329.495n 1.7v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 1.7v 1509.495n 1.7v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 1.7v 1549.495n 1.7v 1549.505n 1.7v 1559.495n 1.7v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 1.7v 1589.495n 1.7v 1589.505n 1.7v 1599.495n 1.7v 1599.505n 1.7v 1609.495n 1.7v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 1.7v 2019.495n 1.7v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 1), (240, 1), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 1), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 0), (410, 0), (420, 0), (430, 0), (440, 0), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 1), (580, 1), (590, 1), (600, 1), (610, 1), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 0), (750, 0), (760, 1), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 0), (840, 0), (850, 0), (860, 1), (870, 1), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 1), (1330, 1), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 0), (1580, 1), (1590, 1), (1600, 1), (1610, 0), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 0), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Va0_4  a0_4  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 1.7v 329.495n 1.7v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 0.0v 469.495n 0.0v 469.505n 0.0v 479.495n 0.0v 479.505n 0.0v 489.495n 0.0v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 1.7v 619.495n 1.7v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 0.0v 659.495n 0.0v 659.505n 0.0v 669.495n 0.0v 669.505n 1.7v 679.495n 1.7v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 1.7v 769.495n 1.7v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 0.0v 859.495n 0.0v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 1.7v 999.495n 1.7v 999.505n 1.7v 1009.495n 1.7v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 1.7v 1039.495n 1.7v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 1.7v 1329.495n 1.7v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 1.7v 1509.495n 1.7v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 1.7v 1549.495n 1.7v 1549.505n 1.7v 1559.495n 1.7v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 1.7v 1589.495n 1.7v 1589.505n 1.7v 1599.495n 1.7v 1599.505n 1.7v 1609.495n 1.7v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 1.7v 2019.495n 1.7v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 1), (240, 1), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 1), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 0), (410, 0), (420, 0), (430, 0), (440, 0), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 1), (580, 1), (590, 1), (600, 1), (610, 1), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 0), (750, 0), (760, 1), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 0), (840, 0), (850, 0), (860, 1), (870, 1), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 1), (1330, 1), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 0), (1580, 1), (1590, 1), (1600, 1), (1610, 0), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 0), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Va0_5  a0_5  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 1.7v 239.495n 1.7v 239.505n 1.7v 249.495n 1.7v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 1.7v 329.495n 1.7v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 0.0v 469.495n 0.0v 469.505n 0.0v 479.495n 0.0v 479.505n 0.0v 489.495n 0.0v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 1.7v 619.495n 1.7v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 0.0v 659.495n 0.0v 659.505n 0.0v 669.495n 0.0v 669.505n 1.7v 679.495n 1.7v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 1.7v 769.495n 1.7v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 0.0v 859.495n 0.0v 859.505n 1.7v 869.495n 1.7v 869.505n 1.7v 879.495n 1.7v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 1.7v 999.495n 1.7v 999.505n 1.7v 1009.495n 1.7v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 1.7v 1039.495n 1.7v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 1.7v 1329.495n 1.7v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 1.7v 1509.495n 1.7v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 1.7v 1549.495n 1.7v 1549.505n 1.7v 1559.495n 1.7v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 1.7v 1589.495n 1.7v 1589.505n 1.7v 1599.495n 1.7v 1599.505n 1.7v 1609.495n 1.7v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 1.7v 1989.495n 1.7v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 1.7v 2019.495n 1.7v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 1.7v 2039.495n 1.7v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 1), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 1), (200, 1), (210, 1), (220, 1), (230, 0), (240, 0), (250, 0), (260, 1), (270, 1), (280, 1), (290, 1), (300, 1), (310, 1), (320, 0), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 0), (390, 0), (400, 1), (410, 1), (420, 0), (430, 0), (440, 0), (450, 0), (460, 0), (470, 0), (480, 0), (490, 1), (500, 1), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 1), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 1), (750, 1), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 0), (860, 0), (870, 0), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 1), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 1), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Va0_6  a0_6  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 1.7v 129.495n 1.7v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 1.7v 219.495n 1.7v 219.505n 1.7v 229.495n 1.7v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 0.0v 259.495n 0.0v 259.505n 1.7v 269.495n 1.7v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 1.7v 319.495n 1.7v 319.505n 0.0v 329.495n 0.0v 329.505n 1.7v 339.495n 1.7v 339.505n 1.7v 349.495n 1.7v 349.505n 1.7v 359.495n 1.7v 359.505n 1.7v 369.495n 1.7v 369.505n 1.7v 379.495n 1.7v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 0.0v 469.495n 0.0v 469.505n 0.0v 479.495n 0.0v 479.505n 0.0v 489.495n 0.0v 489.505n 1.7v 499.495n 1.7v 499.505n 1.7v 509.495n 1.7v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 0.0v 579.495n 0.0v 579.505n 0.0v 589.495n 0.0v 589.505n 0.0v 599.495n 0.0v 599.505n 0.0v 609.495n 0.0v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 0.0v 659.495n 0.0v 659.505n 1.7v 669.495n 1.7v 669.505n 0.0v 679.495n 0.0v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 0.0v 729.495n 0.0v 729.505n 0.0v 739.495n 0.0v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 0.0v 769.495n 0.0v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 0.0v 829.495n 0.0v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 0.0v 859.495n 0.0v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 1.7v 889.495n 1.7v 889.505n 1.7v 899.495n 1.7v 899.505n 1.7v 909.495n 1.7v 909.505n 1.7v 919.495n 1.7v 919.505n 1.7v 929.495n 1.7v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 1.7v 1309.495n 1.7v 1309.505n 1.7v 1319.495n 1.7v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 1.7v 1409.495n 1.7v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 1.7v 1699.495n 1.7v 1699.505n 1.7v 1709.495n 1.7v 1709.505n 1.7v 1719.495n 1.7v 1719.505n 1.7v 1729.495n 1.7v 1729.505n 1.7v 1739.495n 1.7v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 1.7v 1789.495n 1.7v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 1.7v 1939.495n 1.7v 1939.505n 1.7v 1949.495n 1.7v 1949.505n 1.7v 1959.495n 1.7v 1959.505n 1.7v 1969.495n 1.7v 1969.505n 1.7v 1979.495n 1.7v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 0.0v 2049.495n 0.0v 2049.505n 0.0v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 1), (50, 1), (60, 1), (70, 1), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 1), (310, 0), (320, 0), (330, 1), (340, 0), (350, 0), (360, 0), (370, 0), (380, 1), (390, 0), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 1), (580, 1), (590, 1), (600, 1), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 1), (750, 1), (760, 1), (770, 1), (780, 1), (790, 0), (800, 0), (810, 0), (820, 0), (830, 1), (840, 1), (850, 1), (860, 1), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 1), (930, 1), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 1), (1020, 1), (1030, 0), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 0), (1260, 0), (1270, 1), (1280, 1), (1290, 1), (1300, 0), (1310, 0), (1320, 0), (1330, 1), (1340, 1), (1350, 0), (1360, 1), (1370, 0), (1380, 0), (1390, 0), (1400, 1), (1410, 1), (1420, 1), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 1), (1480, 1), (1490, 1), (1500, 0), (1510, 1), (1520, 1), (1530, 0), (1540, 0), (1550, 0), (1560, 1), (1570, 1), (1580, 1), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 0), (1690, 0), (1700, 1), (1710, 0), (1720, 0), (1730, 0), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 1), (1790, 1), (1800, 1), (1810, 0), (1820, 0), (1830, 1), (1840, 1), (1850, 1), (1860, 0), (1870, 0), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 1), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 1), (2030, 0), (2040, 1), (2050, 1)]
Va1_0  a1_0  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 1.7v 49.495n 1.7v 49.505n 1.7v 59.495n 1.7v 59.505n 1.7v 69.495n 1.7v 69.505n 1.7v 79.495n 1.7v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 1.7v 259.495n 1.7v 259.505n 1.7v 269.495n 1.7v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 1.7v 339.495n 1.7v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 1.7v 389.495n 1.7v 389.505n 0.0v 399.495n 0.0v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 0.0v 489.495n 0.0v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 1.7v 579.495n 1.7v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 1.7v 619.495n 1.7v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 1.7v 659.495n 1.7v 659.505n 1.7v 669.495n 1.7v 669.505n 1.7v 679.495n 1.7v 679.505n 1.7v 689.495n 1.7v 689.505n 1.7v 699.495n 1.7v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 1.7v 769.495n 1.7v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 0.0v 829.495n 0.0v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 1.7v 859.495n 1.7v 859.505n 1.7v 869.495n 1.7v 869.505n 0.0v 879.495n 0.0v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 1.7v 929.495n 1.7v 929.505n 1.7v 939.495n 1.7v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 1.7v 1349.495n 1.7v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 1.7v 1369.495n 1.7v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 1.7v 1409.495n 1.7v 1409.505n 1.7v 1419.495n 1.7v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 1.7v 1579.495n 1.7v 1579.505n 1.7v 1589.495n 1.7v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 1.7v 1709.495n 1.7v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 1.7v 1789.495n 1.7v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 1.7v 1849.495n 1.7v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 1.7v 1889.495n 1.7v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 1.7v 1959.495n 1.7v 1959.505n 1.7v 1969.495n 1.7v 1969.505n 1.7v 1979.495n 1.7v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 1.7v 2029.495n 1.7v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 1), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 1), (390, 0), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 0), (630, 0), (640, 1), (650, 1), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 1), (750, 1), (760, 1), (770, 1), (780, 1), (790, 0), (800, 0), (810, 0), (820, 0), (830, 1), (840, 1), (850, 1), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 1), (1020, 1), (1030, 0), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 0), (1260, 0), (1270, 1), (1280, 1), (1290, 1), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 1), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 1), (1480, 0), (1490, 1), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 0), (1870, 0), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 1), (2050, 1)]
Va1_1  a1_1  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 1.7v 259.495n 1.7v 259.505n 1.7v 269.495n 1.7v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 1.7v 389.495n 1.7v 389.505n 0.0v 399.495n 0.0v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 0.0v 489.495n 0.0v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 0.0v 579.495n 0.0v 579.505n 0.0v 589.495n 0.0v 589.505n 0.0v 599.495n 0.0v 599.505n 0.0v 609.495n 0.0v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 1.7v 649.495n 1.7v 649.505n 1.7v 659.495n 1.7v 659.505n 1.7v 669.495n 1.7v 669.505n 1.7v 679.495n 1.7v 679.505n 1.7v 689.495n 1.7v 689.505n 1.7v 699.495n 1.7v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 1.7v 769.495n 1.7v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 0.0v 829.495n 0.0v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 1.7v 859.495n 1.7v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 1.7v 1889.495n 1.7v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 1), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 1), (390, 0), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 0), (630, 0), (640, 1), (650, 1), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 1), (750, 1), (760, 1), (770, 1), (780, 1), (790, 0), (800, 0), (810, 0), (820, 0), (830, 1), (840, 1), (850, 1), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 1), (1020, 1), (1030, 0), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 0), (1260, 0), (1270, 1), (1280, 1), (1290, 1), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 1), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 1), (1480, 0), (1490, 1), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 0), (1870, 0), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 1), (2050, 1)]
Va1_2  a1_2  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 1.7v 259.495n 1.7v 259.505n 1.7v 269.495n 1.7v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 1.7v 389.495n 1.7v 389.505n 0.0v 399.495n 0.0v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 0.0v 489.495n 0.0v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 0.0v 579.495n 0.0v 579.505n 0.0v 589.495n 0.0v 589.505n 0.0v 599.495n 0.0v 599.505n 0.0v 609.495n 0.0v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 1.7v 649.495n 1.7v 649.505n 1.7v 659.495n 1.7v 659.505n 1.7v 669.495n 1.7v 669.505n 1.7v 679.495n 1.7v 679.505n 1.7v 689.495n 1.7v 689.505n 1.7v 699.495n 1.7v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 1.7v 769.495n 1.7v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 0.0v 829.495n 0.0v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 1.7v 859.495n 1.7v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 1.7v 1889.495n 1.7v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 1), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 1), (390, 0), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 0), (630, 0), (640, 1), (650, 1), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 1), (750, 1), (760, 1), (770, 1), (780, 1), (790, 0), (800, 0), (810, 0), (820, 0), (830, 1), (840, 1), (850, 1), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 1), (1020, 1), (1030, 0), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 0), (1260, 0), (1270, 1), (1280, 1), (1290, 1), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 1), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 1), (1480, 0), (1490, 1), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 0), (1870, 0), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 1), (2050, 1)]
Va1_3  a1_3  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 1.7v 259.495n 1.7v 259.505n 1.7v 269.495n 1.7v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 1.7v 389.495n 1.7v 389.505n 0.0v 399.495n 0.0v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 0.0v 489.495n 0.0v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 0.0v 579.495n 0.0v 579.505n 0.0v 589.495n 0.0v 589.505n 0.0v 599.495n 0.0v 599.505n 0.0v 609.495n 0.0v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 1.7v 649.495n 1.7v 649.505n 1.7v 659.495n 1.7v 659.505n 1.7v 669.495n 1.7v 669.505n 1.7v 679.495n 1.7v 679.505n 1.7v 689.495n 1.7v 689.505n 1.7v 699.495n 1.7v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 1.7v 769.495n 1.7v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 0.0v 829.495n 0.0v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 1.7v 859.495n 1.7v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 1.7v 1889.495n 1.7v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 1), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 1), (390, 0), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 0), (630, 0), (640, 1), (650, 1), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 1), (750, 1), (760, 1), (770, 1), (780, 1), (790, 0), (800, 0), (810, 0), (820, 0), (830, 1), (840, 1), (850, 1), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 1), (1020, 1), (1030, 0), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 0), (1260, 0), (1270, 1), (1280, 1), (1290, 1), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 1), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 1), (1480, 0), (1490, 1), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 0), (1870, 0), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 1), (2050, 1)]
Va1_4  a1_4  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 1.7v 259.495n 1.7v 259.505n 1.7v 269.495n 1.7v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 1.7v 389.495n 1.7v 389.505n 0.0v 399.495n 0.0v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 0.0v 489.495n 0.0v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 0.0v 579.495n 0.0v 579.505n 0.0v 589.495n 0.0v 589.505n 0.0v 599.495n 0.0v 599.505n 0.0v 609.495n 0.0v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 1.7v 649.495n 1.7v 649.505n 1.7v 659.495n 1.7v 659.505n 1.7v 669.495n 1.7v 669.505n 1.7v 679.495n 1.7v 679.505n 1.7v 689.495n 1.7v 689.505n 1.7v 699.495n 1.7v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 1.7v 769.495n 1.7v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 0.0v 829.495n 0.0v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 1.7v 859.495n 1.7v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 1.7v 1889.495n 1.7v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 1), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 1), (390, 0), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 0), (630, 0), (640, 1), (650, 1), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 1), (750, 1), (760, 1), (770, 1), (780, 1), (790, 0), (800, 0), (810, 0), (820, 0), (830, 1), (840, 1), (850, 1), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 1), (1020, 1), (1030, 0), (1040, 1), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 0), (1260, 0), (1270, 1), (1280, 1), (1290, 1), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 1), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 1), (1480, 0), (1490, 1), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 0), (1870, 0), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 1), (2050, 1)]
Va1_5  a1_5  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 1.7v 259.495n 1.7v 259.505n 1.7v 269.495n 1.7v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 1.7v 299.495n 1.7v 299.505n 1.7v 309.495n 1.7v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 1.7v 389.495n 1.7v 389.505n 0.0v 399.495n 0.0v 399.505n 1.7v 409.495n 1.7v 409.505n 1.7v 419.495n 1.7v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 0.0v 489.495n 0.0v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 0.0v 579.495n 0.0v 579.505n 0.0v 589.495n 0.0v 589.505n 0.0v 599.495n 0.0v 599.505n 0.0v 609.495n 0.0v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 1.7v 649.495n 1.7v 649.505n 1.7v 659.495n 1.7v 659.505n 1.7v 669.495n 1.7v 669.505n 1.7v 679.495n 1.7v 679.505n 1.7v 689.495n 1.7v 689.505n 1.7v 699.495n 1.7v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 1.7v 749.495n 1.7v 749.505n 1.7v 759.495n 1.7v 759.505n 1.7v 769.495n 1.7v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 0.0v 829.495n 0.0v 829.505n 1.7v 839.495n 1.7v 839.505n 1.7v 849.495n 1.7v 849.505n 1.7v 859.495n 1.7v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 1.7v 1649.495n 1.7v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 1.7v 1889.495n 1.7v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 1), (140, 1), (150, 1), (160, 1), (170, 1), (180, 1), (190, 1), (200, 1), (210, 0), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 1), (350, 1), (360, 0), (370, 0), (380, 0), (390, 0), (400, 0), (410, 0), (420, 0), (430, 0), (440, 0), (450, 0), (460, 0), (470, 0), (480, 1), (490, 1), (500, 1), (510, 1), (520, 1), (530, 0), (540, 1), (550, 1), (560, 1), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 0), (750, 0), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 0), (840, 0), (850, 0), (860, 0), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 1), (1060, 1), (1070, 1), (1080, 1), (1090, 1), (1100, 1), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 1), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 1), (1360, 0), (1370, 1), (1380, 1), (1390, 1), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 1), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 1), (1720, 1), (1730, 1), (1740, 0), (1750, 0), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 1), (1830, 0), (1840, 0), (1850, 0), (1860, 1), (1870, 1), (1880, 0), (1890, 1), (1900, 1), (1910, 1), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 1), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Va1_6  a1_6  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 1.7v 139.495n 1.7v 139.505n 1.7v 149.495n 1.7v 149.505n 1.7v 159.495n 1.7v 159.505n 1.7v 169.495n 1.7v 169.505n 1.7v 179.495n 1.7v 179.505n 1.7v 189.495n 1.7v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 1.7v 349.495n 1.7v 349.505n 1.7v 359.495n 1.7v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 0.0v 469.495n 0.0v 469.505n 0.0v 479.495n 0.0v 479.505n 1.7v 489.495n 1.7v 489.505n 1.7v 499.495n 1.7v 499.505n 1.7v 509.495n 1.7v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 0.0v 539.495n 0.0v 539.505n 1.7v 549.495n 1.7v 549.505n 1.7v 559.495n 1.7v 559.505n 1.7v 569.495n 1.7v 569.505n 0.0v 579.495n 0.0v 579.505n 0.0v 589.495n 0.0v 589.505n 0.0v 599.495n 0.0v 599.505n 0.0v 609.495n 0.0v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 0.0v 659.495n 0.0v 659.505n 0.0v 669.495n 0.0v 669.505n 0.0v 679.495n 0.0v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 0.0v 729.495n 0.0v 729.505n 0.0v 739.495n 0.0v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 0.0v 769.495n 0.0v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 1.7v 829.495n 1.7v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 0.0v 859.495n 0.0v 859.505n 0.0v 869.495n 0.0v 869.505n 1.7v 879.495n 1.7v 879.505n 1.7v 889.495n 1.7v 889.505n 1.7v 899.495n 1.7v 899.505n 1.7v 909.495n 1.7v 909.505n 1.7v 919.495n 1.7v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 1.7v 959.495n 1.7v 959.505n 1.7v 969.495n 1.7v 969.505n 1.7v 979.495n 1.7v 979.505n 1.7v 989.495n 1.7v 989.505n 1.7v 999.495n 1.7v 999.505n 1.7v 1009.495n 1.7v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 1.7v 1059.495n 1.7v 1059.505n 1.7v 1069.495n 1.7v 1069.505n 1.7v 1079.495n 1.7v 1079.505n 1.7v 1089.495n 1.7v 1089.505n 1.7v 1099.495n 1.7v 1099.505n 1.7v 1109.495n 1.7v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 1.7v 1179.495n 1.7v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 1.7v 1359.495n 1.7v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 1.7v 1379.495n 1.7v 1379.505n 1.7v 1389.495n 1.7v 1389.505n 1.7v 1399.495n 1.7v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 1.7v 1639.495n 1.7v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 1.7v 1719.495n 1.7v 1719.505n 1.7v 1729.495n 1.7v 1729.505n 1.7v 1739.495n 1.7v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 1.7v 1869.495n 1.7v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 1.7v 1899.495n 1.7v 1899.505n 1.7v 1909.495n 1.7v 1909.505n 1.7v 1919.495n 1.7v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 0.0v 2049.495n 0.0v 2049.505n 0.0v )

 * Generation of control signals
* (time, data): [(0, 1), (10, 0), (20, 0), (30, 0), (40, 1), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 1), (150, 0), (160, 0), (170, 0), (180, 1), (190, 0), (200, 1), (210, 1), (220, 0), (230, 0), (240, 1), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 1), (310, 1), (320, 0), (330, 0), (340, 1), (350, 0), (360, 1), (370, 1), (380, 0), (390, 1), (400, 0), (410, 1), (420, 0), (430, 1), (440, 1), (450, 1), (460, 0), (470, 1), (480, 1), (490, 0), (500, 1), (510, 0), (520, 1), (530, 1), (540, 1), (550, 0), (560, 0), (570, 0), (580, 1), (590, 1), (600, 1), (610, 0), (620, 0), (630, 1), (640, 1), (650, 0), (660, 0), (670, 0), (680, 0), (690, 0), (700, 1), (710, 1), (720, 0), (730, 1), (740, 0), (750, 1), (760, 0), (770, 0), (780, 1), (790, 1), (800, 1), (810, 0), (820, 0), (830, 0), (840, 1), (850, 0), (860, 0), (870, 1), (880, 0), (890, 1), (900, 1), (910, 1), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 1), (980, 1), (990, 0), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 0), (1060, 1), (1070, 1), (1080, 0), (1090, 0), (1100, 1), (1110, 1), (1120, 1), (1130, 0), (1140, 0), (1150, 1), (1160, 1), (1170, 0), (1180, 1), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 0), (1260, 1), (1270, 1), (1280, 0), (1290, 1), (1300, 1), (1310, 0), (1320, 0), (1330, 1), (1340, 0), (1350, 1), (1360, 1), (1370, 0), (1380, 0), (1390, 1), (1400, 0), (1410, 0), (1420, 1), (1430, 1), (1440, 0), (1450, 0), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 0), (1510, 1), (1520, 1), (1530, 1), (1540, 0), (1550, 1), (1560, 1), (1570, 0), (1580, 0), (1590, 1), (1600, 1), (1610, 0), (1620, 1), (1630, 0), (1640, 0), (1650, 0), (1660, 1), (1670, 1), (1680, 1), (1690, 0), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 1), (1860, 0), (1870, 1), (1880, 0), (1890, 1), (1900, 1), (1910, 0), (1920, 1), (1930, 0), (1940, 0), (1950, 1), (1960, 1), (1970, 1), (1980, 0), (1990, 1), (2000, 1), (2010, 0), (2020, 0), (2030, 0), (2040, 1), (2050, 1)]
VCSB0 CSB0 0 PWL (0n 1.7v 9.495n 1.7v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 1.7v 49.495n 1.7v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 1.7v 149.495n 1.7v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 1.7v 189.495n 1.7v 189.505n 0.0v 199.495n 0.0v 199.505n 1.7v 209.495n 1.7v 209.505n 1.7v 219.495n 1.7v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 1.7v 249.495n 1.7v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 1.7v 309.495n 1.7v 309.505n 1.7v 319.495n 1.7v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 1.7v 349.495n 1.7v 349.505n 0.0v 359.495n 0.0v 359.505n 1.7v 369.495n 1.7v 369.505n 1.7v 379.495n 1.7v 379.505n 0.0v 389.495n 0.0v 389.505n 1.7v 399.495n 1.7v 399.505n 0.0v 409.495n 0.0v 409.505n 1.7v 419.495n 1.7v 419.505n 0.0v 429.495n 0.0v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 1.7v 459.495n 1.7v 459.505n 0.0v 469.495n 0.0v 469.505n 1.7v 479.495n 1.7v 479.505n 1.7v 489.495n 1.7v 489.505n 0.0v 499.495n 0.0v 499.505n 1.7v 509.495n 1.7v 509.505n 0.0v 519.495n 0.0v 519.505n 1.7v 529.495n 1.7v 529.505n 1.7v 539.495n 1.7v 539.505n 1.7v 549.495n 1.7v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 0.0v 579.495n 0.0v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 1.7v 639.495n 1.7v 639.505n 1.7v 649.495n 1.7v 649.505n 0.0v 659.495n 0.0v 659.505n 0.0v 669.495n 0.0v 669.505n 0.0v 679.495n 0.0v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 0.0v 729.495n 0.0v 729.505n 1.7v 739.495n 1.7v 739.505n 0.0v 749.495n 0.0v 749.505n 1.7v 759.495n 1.7v 759.505n 0.0v 769.495n 0.0v 769.505n 0.0v 779.495n 0.0v 779.505n 1.7v 789.495n 1.7v 789.505n 1.7v 799.495n 1.7v 799.505n 1.7v 809.495n 1.7v 809.505n 0.0v 819.495n 0.0v 819.505n 0.0v 829.495n 0.0v 829.505n 0.0v 839.495n 0.0v 839.505n 1.7v 849.495n 1.7v 849.505n 0.0v 859.495n 0.0v 859.505n 0.0v 869.495n 0.0v 869.505n 1.7v 879.495n 1.7v 879.505n 0.0v 889.495n 0.0v 889.505n 1.7v 899.495n 1.7v 899.505n 1.7v 909.495n 1.7v 909.505n 1.7v 919.495n 1.7v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 1.7v 979.495n 1.7v 979.505n 1.7v 989.495n 1.7v 989.505n 0.0v 999.495n 0.0v 999.505n 1.7v 1009.495n 1.7v 1009.505n 1.7v 1019.495n 1.7v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 1.7v 1039.495n 1.7v 1039.505n 1.7v 1049.495n 1.7v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 1.7v 1069.495n 1.7v 1069.505n 1.7v 1079.495n 1.7v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 1.7v 1109.495n 1.7v 1109.505n 1.7v 1119.495n 1.7v 1119.505n 1.7v 1129.495n 1.7v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 1.7v 1159.495n 1.7v 1159.505n 1.7v 1169.495n 1.7v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 1.7v 1189.495n 1.7v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 1.7v 1239.495n 1.7v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 1.7v 1269.495n 1.7v 1269.505n 1.7v 1279.495n 1.7v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 1.7v 1299.495n 1.7v 1299.505n 1.7v 1309.495n 1.7v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 1.7v 1339.495n 1.7v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 1.7v 1359.495n 1.7v 1359.505n 1.7v 1369.495n 1.7v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 1.7v 1399.495n 1.7v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 1.7v 1429.495n 1.7v 1429.505n 1.7v 1439.495n 1.7v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 1.7v 1479.495n 1.7v 1479.505n 1.7v 1489.495n 1.7v 1489.505n 1.7v 1499.495n 1.7v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 1.7v 1519.495n 1.7v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 1.7v 1539.495n 1.7v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 1.7v 1559.495n 1.7v 1559.505n 1.7v 1569.495n 1.7v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 1.7v 1599.495n 1.7v 1599.505n 1.7v 1609.495n 1.7v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 1.7v 1629.495n 1.7v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 1.7v 1689.495n 1.7v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 1.7v 1709.495n 1.7v 1709.505n 1.7v 1719.495n 1.7v 1719.505n 1.7v 1729.495n 1.7v 1729.505n 1.7v 1739.495n 1.7v 1739.505n 1.7v 1749.495n 1.7v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 1.7v 1819.495n 1.7v 1819.505n 1.7v 1829.495n 1.7v 1829.505n 1.7v 1839.495n 1.7v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 1.7v 1859.495n 1.7v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 1.7v 1899.495n 1.7v 1899.505n 1.7v 1909.495n 1.7v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 1.7v 1929.495n 1.7v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 1.7v 1959.495n 1.7v 1959.505n 1.7v 1969.495n 1.7v 1969.505n 1.7v 1979.495n 1.7v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 1.7v 2009.495n 1.7v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 1.7v 2049.495n 1.7v 2049.505n 1.7v )
* (time, data): [(0, 1), (10, 1), (20, 1), (30, 1), (40, 0), (50, 1), (60, 1), (70, 0), (80, 0), (90, 1), (100, 1), (110, 1), (120, 1), (130, 0), (140, 0), (150, 1), (160, 1), (170, 1), (180, 1), (190, 1), (200, 1), (210, 0), (220, 1), (230, 1), (240, 0), (250, 0), (260, 0), (270, 1), (280, 1), (290, 1), (300, 0), (310, 0), (320, 1), (330, 0), (340, 0), (350, 1), (360, 0), (370, 1), (380, 0), (390, 0), (400, 0), (410, 1), (420, 1), (430, 1), (440, 1), (450, 0), (460, 1), (470, 1), (480, 0), (490, 1), (500, 1), (510, 1), (520, 1), (530, 0), (540, 0), (550, 1), (560, 1), (570, 0), (580, 1), (590, 1), (600, 1), (610, 1), (620, 1), (630, 1), (640, 0), (650, 0), (660, 1), (670, 1), (680, 1), (690, 0), (700, 1), (710, 1), (720, 1), (730, 1), (740, 1), (750, 0), (760, 1), (770, 1), (780, 1), (790, 0), (800, 1), (810, 1), (820, 0), (830, 0), (840, 1), (850, 1), (860, 0), (870, 0), (880, 1), (890, 1), (900, 0), (910, 0), (920, 0), (930, 1), (940, 0), (950, 0), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 0), (1010, 0), (1020, 1), (1030, 0), (1040, 0), (1050, 0), (1060, 1), (1070, 1), (1080, 1), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 1), (1140, 1), (1150, 1), (1160, 0), (1170, 0), (1180, 0), (1190, 1), (1200, 1), (1210, 1), (1220, 1), (1230, 0), (1240, 1), (1250, 0), (1260, 1), (1270, 0), (1280, 1), (1290, 0), (1300, 0), (1310, 0), (1320, 1), (1330, 0), (1340, 1), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 0), (1400, 0), (1410, 1), (1420, 0), (1430, 0), (1440, 1), (1450, 1), (1460, 1), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 1), (1530, 0), (1540, 1), (1550, 0), (1560, 0), (1570, 1), (1580, 1), (1590, 0), (1600, 1), (1610, 1), (1620, 0), (1630, 0), (1640, 0), (1650, 1), (1660, 1), (1670, 1), (1680, 0), (1690, 1), (1700, 0), (1710, 0), (1720, 1), (1730, 0), (1740, 0), (1750, 1), (1760, 1), (1770, 1), (1780, 0), (1790, 1), (1800, 1), (1810, 0), (1820, 0), (1830, 0), (1840, 1), (1850, 0), (1860, 0), (1870, 1), (1880, 0), (1890, 0), (1900, 1), (1910, 1), (1920, 0), (1930, 1), (1940, 1), (1950, 0), (1960, 1), (1970, 1), (1980, 0), (1990, 1), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 1)]
VCSB1 CSB1 0 PWL (0n 1.7v 9.495n 1.7v 9.505n 1.7v 19.495n 1.7v 19.505n 1.7v 29.495n 1.7v 29.505n 1.7v 39.495n 1.7v 39.505n 0.0v 49.495n 0.0v 49.505n 1.7v 59.495n 1.7v 59.505n 1.7v 69.495n 1.7v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 1.7v 99.495n 1.7v 99.505n 1.7v 109.495n 1.7v 109.505n 1.7v 119.495n 1.7v 119.505n 1.7v 129.495n 1.7v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 1.7v 159.495n 1.7v 159.505n 1.7v 169.495n 1.7v 169.505n 1.7v 179.495n 1.7v 179.505n 1.7v 189.495n 1.7v 189.505n 1.7v 199.495n 1.7v 199.505n 1.7v 209.495n 1.7v 209.505n 0.0v 219.495n 0.0v 219.505n 1.7v 229.495n 1.7v 229.505n 1.7v 239.495n 1.7v 239.505n 0.0v 249.495n 0.0v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 1.7v 279.495n 1.7v 279.505n 1.7v 289.495n 1.7v 289.505n 1.7v 299.495n 1.7v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 1.7v 329.495n 1.7v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 1.7v 359.495n 1.7v 359.505n 0.0v 369.495n 0.0v 369.505n 1.7v 379.495n 1.7v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 0.0v 409.495n 0.0v 409.505n 1.7v 419.495n 1.7v 419.505n 1.7v 429.495n 1.7v 429.505n 1.7v 439.495n 1.7v 439.505n 1.7v 449.495n 1.7v 449.505n 0.0v 459.495n 0.0v 459.505n 1.7v 469.495n 1.7v 469.505n 1.7v 479.495n 1.7v 479.505n 0.0v 489.495n 0.0v 489.505n 1.7v 499.495n 1.7v 499.505n 1.7v 509.495n 1.7v 509.505n 1.7v 519.495n 1.7v 519.505n 1.7v 529.495n 1.7v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 1.7v 559.495n 1.7v 559.505n 1.7v 569.495n 1.7v 569.505n 0.0v 579.495n 0.0v 579.505n 1.7v 589.495n 1.7v 589.505n 1.7v 599.495n 1.7v 599.505n 1.7v 609.495n 1.7v 609.505n 1.7v 619.495n 1.7v 619.505n 1.7v 629.495n 1.7v 629.505n 1.7v 639.495n 1.7v 639.505n 0.0v 649.495n 0.0v 649.505n 0.0v 659.495n 0.0v 659.505n 1.7v 669.495n 1.7v 669.505n 1.7v 679.495n 1.7v 679.505n 1.7v 689.495n 1.7v 689.505n 0.0v 699.495n 0.0v 699.505n 1.7v 709.495n 1.7v 709.505n 1.7v 719.495n 1.7v 719.505n 1.7v 729.495n 1.7v 729.505n 1.7v 739.495n 1.7v 739.505n 1.7v 749.495n 1.7v 749.505n 0.0v 759.495n 0.0v 759.505n 1.7v 769.495n 1.7v 769.505n 1.7v 779.495n 1.7v 779.505n 1.7v 789.495n 1.7v 789.505n 0.0v 799.495n 0.0v 799.505n 1.7v 809.495n 1.7v 809.505n 1.7v 819.495n 1.7v 819.505n 0.0v 829.495n 0.0v 829.505n 0.0v 839.495n 0.0v 839.505n 1.7v 849.495n 1.7v 849.505n 1.7v 859.495n 1.7v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 1.7v 889.495n 1.7v 889.505n 1.7v 899.495n 1.7v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 1.7v 939.495n 1.7v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 1.7v 969.495n 1.7v 969.505n 1.7v 979.495n 1.7v 979.505n 1.7v 989.495n 1.7v 989.505n 1.7v 999.495n 1.7v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 1.7v 1029.495n 1.7v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 1.7v 1069.495n 1.7v 1069.505n 1.7v 1079.495n 1.7v 1079.505n 1.7v 1089.495n 1.7v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 1.7v 1139.495n 1.7v 1139.505n 1.7v 1149.495n 1.7v 1149.505n 1.7v 1159.495n 1.7v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 1.7v 1199.495n 1.7v 1199.505n 1.7v 1209.495n 1.7v 1209.505n 1.7v 1219.495n 1.7v 1219.505n 1.7v 1229.495n 1.7v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 1.7v 1249.495n 1.7v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 1.7v 1269.495n 1.7v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 1.7v 1289.495n 1.7v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 1.7v 1329.495n 1.7v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 1.7v 1349.495n 1.7v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 1.7v 1389.495n 1.7v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 1.7v 1419.495n 1.7v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 1.7v 1449.495n 1.7v 1449.505n 1.7v 1459.495n 1.7v 1459.505n 1.7v 1469.495n 1.7v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 1.7v 1529.495n 1.7v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 1.7v 1549.495n 1.7v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 1.7v 1579.495n 1.7v 1579.505n 1.7v 1589.495n 1.7v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 1.7v 1609.495n 1.7v 1609.505n 1.7v 1619.495n 1.7v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 1.7v 1659.495n 1.7v 1659.505n 1.7v 1669.495n 1.7v 1669.505n 1.7v 1679.495n 1.7v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 1.7v 1699.495n 1.7v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 1.7v 1729.495n 1.7v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 1.7v 1759.495n 1.7v 1759.505n 1.7v 1769.495n 1.7v 1769.505n 1.7v 1779.495n 1.7v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 1.7v 1799.495n 1.7v 1799.505n 1.7v 1809.495n 1.7v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 1.7v 1849.495n 1.7v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 1.7v 1879.495n 1.7v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 1.7v 1909.495n 1.7v 1909.505n 1.7v 1919.495n 1.7v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 1.7v 1939.495n 1.7v 1939.505n 1.7v 1949.495n 1.7v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 1.7v 1969.495n 1.7v 1969.505n 1.7v 1979.495n 1.7v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 1.7v 1999.495n 1.7v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 0.0v 2049.495n 0.0v 2049.505n 1.7v )

* Generation of spare enable signals
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 0), (410, 0), (420, 0), (430, 0), (440, 0), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 0), (750, 0), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
VSPARE_WEN0_0  SPARE_WEN0_0  0 PWL (0n 0.0v 9.495n 0.0v 9.505n 0.0v 19.495n 0.0v 19.505n 0.0v 29.495n 0.0v 29.505n 0.0v 39.495n 0.0v 39.505n 0.0v 49.495n 0.0v 49.505n 0.0v 59.495n 0.0v 59.505n 0.0v 69.495n 0.0v 69.505n 0.0v 79.495n 0.0v 79.505n 0.0v 89.495n 0.0v 89.505n 0.0v 99.495n 0.0v 99.505n 0.0v 109.495n 0.0v 109.505n 0.0v 119.495n 0.0v 119.505n 0.0v 129.495n 0.0v 129.505n 0.0v 139.495n 0.0v 139.505n 0.0v 149.495n 0.0v 149.505n 0.0v 159.495n 0.0v 159.505n 0.0v 169.495n 0.0v 169.505n 0.0v 179.495n 0.0v 179.505n 0.0v 189.495n 0.0v 189.505n 0.0v 199.495n 0.0v 199.505n 0.0v 209.495n 0.0v 209.505n 0.0v 219.495n 0.0v 219.505n 0.0v 229.495n 0.0v 229.505n 0.0v 239.495n 0.0v 239.505n 0.0v 249.495n 0.0v 249.505n 0.0v 259.495n 0.0v 259.505n 0.0v 269.495n 0.0v 269.505n 0.0v 279.495n 0.0v 279.505n 0.0v 289.495n 0.0v 289.505n 0.0v 299.495n 0.0v 299.505n 0.0v 309.495n 0.0v 309.505n 0.0v 319.495n 0.0v 319.505n 0.0v 329.495n 0.0v 329.505n 0.0v 339.495n 0.0v 339.505n 0.0v 349.495n 0.0v 349.505n 0.0v 359.495n 0.0v 359.505n 0.0v 369.495n 0.0v 369.505n 0.0v 379.495n 0.0v 379.505n 0.0v 389.495n 0.0v 389.505n 0.0v 399.495n 0.0v 399.505n 0.0v 409.495n 0.0v 409.505n 0.0v 419.495n 0.0v 419.505n 0.0v 429.495n 0.0v 429.505n 0.0v 439.495n 0.0v 439.505n 0.0v 449.495n 0.0v 449.505n 0.0v 459.495n 0.0v 459.505n 0.0v 469.495n 0.0v 469.505n 0.0v 479.495n 0.0v 479.505n 0.0v 489.495n 0.0v 489.505n 0.0v 499.495n 0.0v 499.505n 0.0v 509.495n 0.0v 509.505n 0.0v 519.495n 0.0v 519.505n 0.0v 529.495n 0.0v 529.505n 0.0v 539.495n 0.0v 539.505n 0.0v 549.495n 0.0v 549.505n 0.0v 559.495n 0.0v 559.505n 0.0v 569.495n 0.0v 569.505n 0.0v 579.495n 0.0v 579.505n 0.0v 589.495n 0.0v 589.505n 0.0v 599.495n 0.0v 599.505n 0.0v 609.495n 0.0v 609.505n 0.0v 619.495n 0.0v 619.505n 0.0v 629.495n 0.0v 629.505n 0.0v 639.495n 0.0v 639.505n 0.0v 649.495n 0.0v 649.505n 0.0v 659.495n 0.0v 659.505n 0.0v 669.495n 0.0v 669.505n 0.0v 679.495n 0.0v 679.505n 0.0v 689.495n 0.0v 689.505n 0.0v 699.495n 0.0v 699.505n 0.0v 709.495n 0.0v 709.505n 0.0v 719.495n 0.0v 719.505n 0.0v 729.495n 0.0v 729.505n 0.0v 739.495n 0.0v 739.505n 0.0v 749.495n 0.0v 749.505n 0.0v 759.495n 0.0v 759.505n 0.0v 769.495n 0.0v 769.505n 0.0v 779.495n 0.0v 779.505n 0.0v 789.495n 0.0v 789.505n 0.0v 799.495n 0.0v 799.505n 0.0v 809.495n 0.0v 809.505n 0.0v 819.495n 0.0v 819.505n 0.0v 829.495n 0.0v 829.505n 0.0v 839.495n 0.0v 839.505n 0.0v 849.495n 0.0v 849.505n 0.0v 859.495n 0.0v 859.505n 0.0v 869.495n 0.0v 869.505n 0.0v 879.495n 0.0v 879.505n 0.0v 889.495n 0.0v 889.505n 0.0v 899.495n 0.0v 899.505n 0.0v 909.495n 0.0v 909.505n 0.0v 919.495n 0.0v 919.505n 0.0v 929.495n 0.0v 929.505n 0.0v 939.495n 0.0v 939.505n 0.0v 949.495n 0.0v 949.505n 0.0v 959.495n 0.0v 959.505n 0.0v 969.495n 0.0v 969.505n 0.0v 979.495n 0.0v 979.505n 0.0v 989.495n 0.0v 989.505n 0.0v 999.495n 0.0v 999.505n 0.0v 1009.495n 0.0v 1009.505n 0.0v 1019.495n 0.0v 1019.505n 0.0v 1029.495n 0.0v 1029.505n 0.0v 1039.495n 0.0v 1039.505n 0.0v 1049.495n 0.0v 1049.505n 0.0v 1059.495n 0.0v 1059.505n 0.0v 1069.495n 0.0v 1069.505n 0.0v 1079.495n 0.0v 1079.505n 0.0v 1089.495n 0.0v 1089.505n 0.0v 1099.495n 0.0v 1099.505n 0.0v 1109.495n 0.0v 1109.505n 0.0v 1119.495n 0.0v 1119.505n 0.0v 1129.495n 0.0v 1129.505n 0.0v 1139.495n 0.0v 1139.505n 0.0v 1149.495n 0.0v 1149.505n 0.0v 1159.495n 0.0v 1159.505n 0.0v 1169.495n 0.0v 1169.505n 0.0v 1179.495n 0.0v 1179.505n 0.0v 1189.495n 0.0v 1189.505n 0.0v 1199.495n 0.0v 1199.505n 0.0v 1209.495n 0.0v 1209.505n 0.0v 1219.495n 0.0v 1219.505n 0.0v 1229.495n 0.0v 1229.505n 0.0v 1239.495n 0.0v 1239.505n 0.0v 1249.495n 0.0v 1249.505n 0.0v 1259.495n 0.0v 1259.505n 0.0v 1269.495n 0.0v 1269.505n 0.0v 1279.495n 0.0v 1279.505n 0.0v 1289.495n 0.0v 1289.505n 0.0v 1299.495n 0.0v 1299.505n 0.0v 1309.495n 0.0v 1309.505n 0.0v 1319.495n 0.0v 1319.505n 0.0v 1329.495n 0.0v 1329.505n 0.0v 1339.495n 0.0v 1339.505n 0.0v 1349.495n 0.0v 1349.505n 0.0v 1359.495n 0.0v 1359.505n 0.0v 1369.495n 0.0v 1369.505n 0.0v 1379.495n 0.0v 1379.505n 0.0v 1389.495n 0.0v 1389.505n 0.0v 1399.495n 0.0v 1399.505n 0.0v 1409.495n 0.0v 1409.505n 0.0v 1419.495n 0.0v 1419.505n 0.0v 1429.495n 0.0v 1429.505n 0.0v 1439.495n 0.0v 1439.505n 0.0v 1449.495n 0.0v 1449.505n 0.0v 1459.495n 0.0v 1459.505n 0.0v 1469.495n 0.0v 1469.505n 0.0v 1479.495n 0.0v 1479.505n 0.0v 1489.495n 0.0v 1489.505n 0.0v 1499.495n 0.0v 1499.505n 0.0v 1509.495n 0.0v 1509.505n 0.0v 1519.495n 0.0v 1519.505n 0.0v 1529.495n 0.0v 1529.505n 0.0v 1539.495n 0.0v 1539.505n 0.0v 1549.495n 0.0v 1549.505n 0.0v 1559.495n 0.0v 1559.505n 0.0v 1569.495n 0.0v 1569.505n 0.0v 1579.495n 0.0v 1579.505n 0.0v 1589.495n 0.0v 1589.505n 0.0v 1599.495n 0.0v 1599.505n 0.0v 1609.495n 0.0v 1609.505n 0.0v 1619.495n 0.0v 1619.505n 0.0v 1629.495n 0.0v 1629.505n 0.0v 1639.495n 0.0v 1639.505n 0.0v 1649.495n 0.0v 1649.505n 0.0v 1659.495n 0.0v 1659.505n 0.0v 1669.495n 0.0v 1669.505n 0.0v 1679.495n 0.0v 1679.505n 0.0v 1689.495n 0.0v 1689.505n 0.0v 1699.495n 0.0v 1699.505n 0.0v 1709.495n 0.0v 1709.505n 0.0v 1719.495n 0.0v 1719.505n 0.0v 1729.495n 0.0v 1729.505n 0.0v 1739.495n 0.0v 1739.505n 0.0v 1749.495n 0.0v 1749.505n 0.0v 1759.495n 0.0v 1759.505n 0.0v 1769.495n 0.0v 1769.505n 0.0v 1779.495n 0.0v 1779.505n 0.0v 1789.495n 0.0v 1789.505n 0.0v 1799.495n 0.0v 1799.505n 0.0v 1809.495n 0.0v 1809.505n 0.0v 1819.495n 0.0v 1819.505n 0.0v 1829.495n 0.0v 1829.505n 0.0v 1839.495n 0.0v 1839.505n 0.0v 1849.495n 0.0v 1849.505n 0.0v 1859.495n 0.0v 1859.505n 0.0v 1869.495n 0.0v 1869.505n 0.0v 1879.495n 0.0v 1879.505n 0.0v 1889.495n 0.0v 1889.505n 0.0v 1899.495n 0.0v 1899.505n 0.0v 1909.495n 0.0v 1909.505n 0.0v 1919.495n 0.0v 1919.505n 0.0v 1929.495n 0.0v 1929.505n 0.0v 1939.495n 0.0v 1939.505n 0.0v 1949.495n 0.0v 1949.505n 0.0v 1959.495n 0.0v 1959.505n 0.0v 1969.495n 0.0v 1969.505n 0.0v 1979.495n 0.0v 1979.505n 0.0v 1989.495n 0.0v 1989.505n 0.0v 1999.495n 0.0v 1999.505n 0.0v 2009.495n 0.0v 2009.505n 0.0v 2019.495n 0.0v 2019.505n 0.0v 2029.495n 0.0v 2029.505n 0.0v 2039.495n 0.0v 2039.505n 0.0v 2049.495n 0.0v 2049.505n 0.0v )
* PULSE: period=10
Vclk0 clk0 0 PULSE (0 1.7 9.995n 0.01n 0.01n 4.99n 10n)
* PULSE: period=10
Vclk1 clk1 0 PULSE (0 1.7 9.995n 0.01n 0.01n 4.99n 10n)

 * Generation of dout measurements
* CHECK dout1_0 vdout1_0ck4 = 1.7 time = 50
* CHECK dout1_1 vdout1_1ck4 = 1.7 time = 50
* CHECK dout1_2 vdout1_2ck4 = 1.7 time = 50
* CHECK dout1_3 vdout1_3ck4 = 0 time = 50
* CHECK dout1_4 vdout1_4ck4 = 1.7 time = 50
* CHECK dout1_5 vdout1_5ck4 = 0 time = 50
* CHECK dout1_6 vdout1_6ck4 = 1.7 time = 50
* CHECK dout1_7 vdout1_7ck4 = 1.7 time = 50
* CHECK dout1_8 vdout1_8ck4 = 1.7 time = 50
* CHECK dout1_9 vdout1_9ck4 = 1.7 time = 50
* CHECK dout1_10 vdout1_10ck4 = 1.7 time = 50
* CHECK dout1_11 vdout1_11ck4 = 0 time = 50
* CHECK dout1_12 vdout1_12ck4 = 1.7 time = 50
* CHECK dout1_13 vdout1_13ck4 = 1.7 time = 50
* CHECK dout1_14 vdout1_14ck4 = 0 time = 50
* CHECK dout1_15 vdout1_15ck4 = 0 time = 50
* CHECK dout1_16 vdout1_16ck4 = 0 time = 50
* CHECK dout1_0 vdout1_0ck7 = 0 time = 80
* CHECK dout1_1 vdout1_1ck7 = 1.7 time = 80
* CHECK dout1_2 vdout1_2ck7 = 1.7 time = 80
* CHECK dout1_3 vdout1_3ck7 = 0 time = 80
* CHECK dout1_4 vdout1_4ck7 = 1.7 time = 80
* CHECK dout1_5 vdout1_5ck7 = 0 time = 80
* CHECK dout1_6 vdout1_6ck7 = 0 time = 80
* CHECK dout1_7 vdout1_7ck7 = 1.7 time = 80
* CHECK dout1_8 vdout1_8ck7 = 0 time = 80
* CHECK dout1_9 vdout1_9ck7 = 1.7 time = 80
* CHECK dout1_10 vdout1_10ck7 = 1.7 time = 80
* CHECK dout1_11 vdout1_11ck7 = 1.7 time = 80
* CHECK dout1_12 vdout1_12ck7 = 0 time = 80
* CHECK dout1_13 vdout1_13ck7 = 1.7 time = 80
* CHECK dout1_14 vdout1_14ck7 = 0 time = 80
* CHECK dout1_15 vdout1_15ck7 = 1.7 time = 80
* CHECK dout1_16 vdout1_16ck7 = 0 time = 80
* CHECK dout1_0 vdout1_0ck8 = 1.7 time = 90
* CHECK dout1_1 vdout1_1ck8 = 1.7 time = 90
* CHECK dout1_2 vdout1_2ck8 = 1.7 time = 90
* CHECK dout1_3 vdout1_3ck8 = 1.7 time = 90
* CHECK dout1_4 vdout1_4ck8 = 1.7 time = 90
* CHECK dout1_5 vdout1_5ck8 = 0 time = 90
* CHECK dout1_6 vdout1_6ck8 = 0 time = 90
* CHECK dout1_7 vdout1_7ck8 = 0 time = 90
* CHECK dout1_8 vdout1_8ck8 = 1.7 time = 90
* CHECK dout1_9 vdout1_9ck8 = 1.7 time = 90
* CHECK dout1_10 vdout1_10ck8 = 1.7 time = 90
* CHECK dout1_11 vdout1_11ck8 = 1.7 time = 90
* CHECK dout1_12 vdout1_12ck8 = 0 time = 90
* CHECK dout1_13 vdout1_13ck8 = 0 time = 90
* CHECK dout1_14 vdout1_14ck8 = 1.7 time = 90
* CHECK dout1_15 vdout1_15ck8 = 0 time = 90
* CHECK dout1_16 vdout1_16ck8 = 0 time = 90
* CHECK dout1_0 vdout1_0ck13 = 1.7 time = 140
* CHECK dout1_1 vdout1_1ck13 = 1.7 time = 140
* CHECK dout1_2 vdout1_2ck13 = 1.7 time = 140
* CHECK dout1_3 vdout1_3ck13 = 0 time = 140
* CHECK dout1_4 vdout1_4ck13 = 0 time = 140
* CHECK dout1_5 vdout1_5ck13 = 0 time = 140
* CHECK dout1_6 vdout1_6ck13 = 0 time = 140
* CHECK dout1_7 vdout1_7ck13 = 1.7 time = 140
* CHECK dout1_8 vdout1_8ck13 = 1.7 time = 140
* CHECK dout1_9 vdout1_9ck13 = 0 time = 140
* CHECK dout1_10 vdout1_10ck13 = 1.7 time = 140
* CHECK dout1_11 vdout1_11ck13 = 0 time = 140
* CHECK dout1_12 vdout1_12ck13 = 1.7 time = 140
* CHECK dout1_13 vdout1_13ck13 = 0 time = 140
* CHECK dout1_14 vdout1_14ck13 = 1.7 time = 140
* CHECK dout1_15 vdout1_15ck13 = 0 time = 140
* CHECK dout1_16 vdout1_16ck13 = 0 time = 140
* CHECK dout1_0 vdout1_0ck14 = 1.7 time = 150
* CHECK dout1_1 vdout1_1ck14 = 1.7 time = 150
* CHECK dout1_2 vdout1_2ck14 = 1.7 time = 150
* CHECK dout1_3 vdout1_3ck14 = 0 time = 150
* CHECK dout1_4 vdout1_4ck14 = 0 time = 150
* CHECK dout1_5 vdout1_5ck14 = 0 time = 150
* CHECK dout1_6 vdout1_6ck14 = 0 time = 150
* CHECK dout1_7 vdout1_7ck14 = 1.7 time = 150
* CHECK dout1_8 vdout1_8ck14 = 1.7 time = 150
* CHECK dout1_9 vdout1_9ck14 = 0 time = 150
* CHECK dout1_10 vdout1_10ck14 = 1.7 time = 150
* CHECK dout1_11 vdout1_11ck14 = 0 time = 150
* CHECK dout1_12 vdout1_12ck14 = 1.7 time = 150
* CHECK dout1_13 vdout1_13ck14 = 0 time = 150
* CHECK dout1_14 vdout1_14ck14 = 1.7 time = 150
* CHECK dout1_15 vdout1_15ck14 = 0 time = 150
* CHECK dout1_16 vdout1_16ck14 = 0 time = 150
* CHECK dout1_0 vdout1_0ck21 = 0 time = 220
* CHECK dout1_1 vdout1_1ck21 = 1.7 time = 220
* CHECK dout1_2 vdout1_2ck21 = 0 time = 220
* CHECK dout1_3 vdout1_3ck21 = 1.7 time = 220
* CHECK dout1_4 vdout1_4ck21 = 1.7 time = 220
* CHECK dout1_5 vdout1_5ck21 = 1.7 time = 220
* CHECK dout1_6 vdout1_6ck21 = 0 time = 220
* CHECK dout1_7 vdout1_7ck21 = 1.7 time = 220
* CHECK dout1_8 vdout1_8ck21 = 0 time = 220
* CHECK dout1_9 vdout1_9ck21 = 1.7 time = 220
* CHECK dout1_10 vdout1_10ck21 = 0 time = 220
* CHECK dout1_11 vdout1_11ck21 = 0 time = 220
* CHECK dout1_12 vdout1_12ck21 = 1.7 time = 220
* CHECK dout1_13 vdout1_13ck21 = 0 time = 220
* CHECK dout1_14 vdout1_14ck21 = 0 time = 220
* CHECK dout1_15 vdout1_15ck21 = 1.7 time = 220
* CHECK dout1_16 vdout1_16ck21 = 0 time = 220
* CHECK dout1_0 vdout1_0ck24 = 0 time = 250
* CHECK dout1_1 vdout1_1ck24 = 1.7 time = 250
* CHECK dout1_2 vdout1_2ck24 = 0 time = 250
* CHECK dout1_3 vdout1_3ck24 = 1.7 time = 250
* CHECK dout1_4 vdout1_4ck24 = 1.7 time = 250
* CHECK dout1_5 vdout1_5ck24 = 1.7 time = 250
* CHECK dout1_6 vdout1_6ck24 = 0 time = 250
* CHECK dout1_7 vdout1_7ck24 = 1.7 time = 250
* CHECK dout1_8 vdout1_8ck24 = 0 time = 250
* CHECK dout1_9 vdout1_9ck24 = 1.7 time = 250
* CHECK dout1_10 vdout1_10ck24 = 0 time = 250
* CHECK dout1_11 vdout1_11ck24 = 0 time = 250
* CHECK dout1_12 vdout1_12ck24 = 1.7 time = 250
* CHECK dout1_13 vdout1_13ck24 = 0 time = 250
* CHECK dout1_14 vdout1_14ck24 = 0 time = 250
* CHECK dout1_15 vdout1_15ck24 = 1.7 time = 250
* CHECK dout1_16 vdout1_16ck24 = 0 time = 250
* CHECK dout1_0 vdout1_0ck25 = 0 time = 260
* CHECK dout1_1 vdout1_1ck25 = 0 time = 260
* CHECK dout1_2 vdout1_2ck25 = 1.7 time = 260
* CHECK dout1_3 vdout1_3ck25 = 1.7 time = 260
* CHECK dout1_4 vdout1_4ck25 = 1.7 time = 260
* CHECK dout1_5 vdout1_5ck25 = 0 time = 260
* CHECK dout1_6 vdout1_6ck25 = 1.7 time = 260
* CHECK dout1_7 vdout1_7ck25 = 1.7 time = 260
* CHECK dout1_8 vdout1_8ck25 = 1.7 time = 260
* CHECK dout1_9 vdout1_9ck25 = 1.7 time = 260
* CHECK dout1_10 vdout1_10ck25 = 1.7 time = 260
* CHECK dout1_11 vdout1_11ck25 = 0 time = 260
* CHECK dout1_12 vdout1_12ck25 = 0 time = 260
* CHECK dout1_13 vdout1_13ck25 = 0 time = 260
* CHECK dout1_14 vdout1_14ck25 = 0 time = 260
* CHECK dout1_15 vdout1_15ck25 = 1.7 time = 260
* CHECK dout1_16 vdout1_16ck25 = 0 time = 260
* CHECK dout1_0 vdout1_0ck26 = 0 time = 270
* CHECK dout1_1 vdout1_1ck26 = 0 time = 270
* CHECK dout1_2 vdout1_2ck26 = 1.7 time = 270
* CHECK dout1_3 vdout1_3ck26 = 1.7 time = 270
* CHECK dout1_4 vdout1_4ck26 = 1.7 time = 270
* CHECK dout1_5 vdout1_5ck26 = 0 time = 270
* CHECK dout1_6 vdout1_6ck26 = 1.7 time = 270
* CHECK dout1_7 vdout1_7ck26 = 1.7 time = 270
* CHECK dout1_8 vdout1_8ck26 = 1.7 time = 270
* CHECK dout1_9 vdout1_9ck26 = 1.7 time = 270
* CHECK dout1_10 vdout1_10ck26 = 1.7 time = 270
* CHECK dout1_11 vdout1_11ck26 = 0 time = 270
* CHECK dout1_12 vdout1_12ck26 = 0 time = 270
* CHECK dout1_13 vdout1_13ck26 = 0 time = 270
* CHECK dout1_14 vdout1_14ck26 = 0 time = 270
* CHECK dout1_15 vdout1_15ck26 = 1.7 time = 270
* CHECK dout1_16 vdout1_16ck26 = 0 time = 270
* CHECK dout1_0 vdout1_0ck30 = 0 time = 310
* CHECK dout1_1 vdout1_1ck30 = 0 time = 310
* CHECK dout1_2 vdout1_2ck30 = 1.7 time = 310
* CHECK dout1_3 vdout1_3ck30 = 1.7 time = 310
* CHECK dout1_4 vdout1_4ck30 = 1.7 time = 310
* CHECK dout1_5 vdout1_5ck30 = 0 time = 310
* CHECK dout1_6 vdout1_6ck30 = 1.7 time = 310
* CHECK dout1_7 vdout1_7ck30 = 1.7 time = 310
* CHECK dout1_8 vdout1_8ck30 = 1.7 time = 310
* CHECK dout1_9 vdout1_9ck30 = 1.7 time = 310
* CHECK dout1_10 vdout1_10ck30 = 1.7 time = 310
* CHECK dout1_11 vdout1_11ck30 = 0 time = 310
* CHECK dout1_12 vdout1_12ck30 = 0 time = 310
* CHECK dout1_13 vdout1_13ck30 = 0 time = 310
* CHECK dout1_14 vdout1_14ck30 = 0 time = 310
* CHECK dout1_15 vdout1_15ck30 = 1.7 time = 310
* CHECK dout1_16 vdout1_16ck30 = 0 time = 310
* CHECK dout1_0 vdout1_0ck31 = 0 time = 320
* CHECK dout1_1 vdout1_1ck31 = 1.7 time = 320
* CHECK dout1_2 vdout1_2ck31 = 0 time = 320
* CHECK dout1_3 vdout1_3ck31 = 1.7 time = 320
* CHECK dout1_4 vdout1_4ck31 = 1.7 time = 320
* CHECK dout1_5 vdout1_5ck31 = 1.7 time = 320
* CHECK dout1_6 vdout1_6ck31 = 0 time = 320
* CHECK dout1_7 vdout1_7ck31 = 1.7 time = 320
* CHECK dout1_8 vdout1_8ck31 = 0 time = 320
* CHECK dout1_9 vdout1_9ck31 = 1.7 time = 320
* CHECK dout1_10 vdout1_10ck31 = 0 time = 320
* CHECK dout1_11 vdout1_11ck31 = 0 time = 320
* CHECK dout1_12 vdout1_12ck31 = 1.7 time = 320
* CHECK dout1_13 vdout1_13ck31 = 0 time = 320
* CHECK dout1_14 vdout1_14ck31 = 0 time = 320
* CHECK dout1_15 vdout1_15ck31 = 1.7 time = 320
* CHECK dout1_16 vdout1_16ck31 = 0 time = 320
* CHECK dout1_0 vdout1_0ck33 = 0 time = 340
* CHECK dout1_1 vdout1_1ck33 = 1.7 time = 340
* CHECK dout1_2 vdout1_2ck33 = 1.7 time = 340
* CHECK dout1_3 vdout1_3ck33 = 0 time = 340
* CHECK dout1_4 vdout1_4ck33 = 1.7 time = 340
* CHECK dout1_5 vdout1_5ck33 = 0 time = 340
* CHECK dout1_6 vdout1_6ck33 = 0 time = 340
* CHECK dout1_7 vdout1_7ck33 = 1.7 time = 340
* CHECK dout1_8 vdout1_8ck33 = 0 time = 340
* CHECK dout1_9 vdout1_9ck33 = 1.7 time = 340
* CHECK dout1_10 vdout1_10ck33 = 1.7 time = 340
* CHECK dout1_11 vdout1_11ck33 = 0 time = 340
* CHECK dout1_12 vdout1_12ck33 = 0 time = 340
* CHECK dout1_13 vdout1_13ck33 = 0 time = 340
* CHECK dout1_14 vdout1_14ck33 = 0 time = 340
* CHECK dout1_15 vdout1_15ck33 = 1.7 time = 340
* CHECK dout1_16 vdout1_16ck33 = 0 time = 340
* CHECK dout1_0 vdout1_0ck34 = 0 time = 350
* CHECK dout1_1 vdout1_1ck34 = 0 time = 350
* CHECK dout1_2 vdout1_2ck34 = 0 time = 350
* CHECK dout1_3 vdout1_3ck34 = 1.7 time = 350
* CHECK dout1_4 vdout1_4ck34 = 1.7 time = 350
* CHECK dout1_5 vdout1_5ck34 = 1.7 time = 350
* CHECK dout1_6 vdout1_6ck34 = 0 time = 350
* CHECK dout1_7 vdout1_7ck34 = 1.7 time = 350
* CHECK dout1_8 vdout1_8ck34 = 0 time = 350
* CHECK dout1_9 vdout1_9ck34 = 1.7 time = 350
* CHECK dout1_10 vdout1_10ck34 = 0 time = 350
* CHECK dout1_11 vdout1_11ck34 = 0 time = 350
* CHECK dout1_12 vdout1_12ck34 = 1.7 time = 350
* CHECK dout1_13 vdout1_13ck34 = 0 time = 350
* CHECK dout1_14 vdout1_14ck34 = 0 time = 350
* CHECK dout1_15 vdout1_15ck34 = 0 time = 350
* CHECK dout1_16 vdout1_16ck34 = 0 time = 350
* CHECK dout1_0 vdout1_0ck36 = 0 time = 370
* CHECK dout1_1 vdout1_1ck36 = 1.7 time = 370
* CHECK dout1_2 vdout1_2ck36 = 0 time = 370
* CHECK dout1_3 vdout1_3ck36 = 1.7 time = 370
* CHECK dout1_4 vdout1_4ck36 = 1.7 time = 370
* CHECK dout1_5 vdout1_5ck36 = 1.7 time = 370
* CHECK dout1_6 vdout1_6ck36 = 0 time = 370
* CHECK dout1_7 vdout1_7ck36 = 1.7 time = 370
* CHECK dout1_8 vdout1_8ck36 = 0 time = 370
* CHECK dout1_9 vdout1_9ck36 = 1.7 time = 370
* CHECK dout1_10 vdout1_10ck36 = 0 time = 370
* CHECK dout1_11 vdout1_11ck36 = 0 time = 370
* CHECK dout1_12 vdout1_12ck36 = 1.7 time = 370
* CHECK dout1_13 vdout1_13ck36 = 0 time = 370
* CHECK dout1_14 vdout1_14ck36 = 0 time = 370
* CHECK dout1_15 vdout1_15ck36 = 1.7 time = 370
* CHECK dout1_16 vdout1_16ck36 = 0 time = 370
* CHECK dout1_0 vdout1_0ck38 = 1.7 time = 390
* CHECK dout1_1 vdout1_1ck38 = 1.7 time = 390
* CHECK dout1_2 vdout1_2ck38 = 1.7 time = 390
* CHECK dout1_3 vdout1_3ck38 = 0 time = 390
* CHECK dout1_4 vdout1_4ck38 = 1.7 time = 390
* CHECK dout1_5 vdout1_5ck38 = 0 time = 390
* CHECK dout1_6 vdout1_6ck38 = 0 time = 390
* CHECK dout1_7 vdout1_7ck38 = 1.7 time = 390
* CHECK dout1_8 vdout1_8ck38 = 1.7 time = 390
* CHECK dout1_9 vdout1_9ck38 = 0 time = 390
* CHECK dout1_10 vdout1_10ck38 = 0 time = 390
* CHECK dout1_11 vdout1_11ck38 = 0 time = 390
* CHECK dout1_12 vdout1_12ck38 = 1.7 time = 390
* CHECK dout1_13 vdout1_13ck38 = 0 time = 390
* CHECK dout1_14 vdout1_14ck38 = 0 time = 390
* CHECK dout1_15 vdout1_15ck38 = 0 time = 390
* CHECK dout1_16 vdout1_16ck38 = 0 time = 390
* CHECK dout1_0 vdout1_0ck39 = 1.7 time = 400
* CHECK dout1_1 vdout1_1ck39 = 0 time = 400
* CHECK dout1_2 vdout1_2ck39 = 1.7 time = 400
* CHECK dout1_3 vdout1_3ck39 = 0 time = 400
* CHECK dout1_4 vdout1_4ck39 = 1.7 time = 400
* CHECK dout1_5 vdout1_5ck39 = 0 time = 400
* CHECK dout1_6 vdout1_6ck39 = 1.7 time = 400
* CHECK dout1_7 vdout1_7ck39 = 1.7 time = 400
* CHECK dout1_8 vdout1_8ck39 = 1.7 time = 400
* CHECK dout1_9 vdout1_9ck39 = 1.7 time = 400
* CHECK dout1_10 vdout1_10ck39 = 1.7 time = 400
* CHECK dout1_11 vdout1_11ck39 = 1.7 time = 400
* CHECK dout1_12 vdout1_12ck39 = 1.7 time = 400
* CHECK dout1_13 vdout1_13ck39 = 1.7 time = 400
* CHECK dout1_14 vdout1_14ck39 = 1.7 time = 400
* CHECK dout1_15 vdout1_15ck39 = 0 time = 400
* CHECK dout1_16 vdout1_16ck39 = 0 time = 400
* CHECK dout1_0 vdout1_0ck40 = 1.7 time = 410
* CHECK dout1_1 vdout1_1ck40 = 1.7 time = 410
* CHECK dout1_2 vdout1_2ck40 = 1.7 time = 410
* CHECK dout1_3 vdout1_3ck40 = 0 time = 410
* CHECK dout1_4 vdout1_4ck40 = 1.7 time = 410
* CHECK dout1_5 vdout1_5ck40 = 0 time = 410
* CHECK dout1_6 vdout1_6ck40 = 0 time = 410
* CHECK dout1_7 vdout1_7ck40 = 1.7 time = 410
* CHECK dout1_8 vdout1_8ck40 = 1.7 time = 410
* CHECK dout1_9 vdout1_9ck40 = 0 time = 410
* CHECK dout1_10 vdout1_10ck40 = 0 time = 410
* CHECK dout1_11 vdout1_11ck40 = 0 time = 410
* CHECK dout1_12 vdout1_12ck40 = 1.7 time = 410
* CHECK dout1_13 vdout1_13ck40 = 0 time = 410
* CHECK dout1_14 vdout1_14ck40 = 0 time = 410
* CHECK dout1_15 vdout1_15ck40 = 0 time = 410
* CHECK dout1_16 vdout1_16ck40 = 0 time = 410
* CHECK dout1_0 vdout1_0ck45 = 1.7 time = 460
* CHECK dout1_1 vdout1_1ck45 = 1.7 time = 460
* CHECK dout1_2 vdout1_2ck45 = 1.7 time = 460
* CHECK dout1_3 vdout1_3ck45 = 0 time = 460
* CHECK dout1_4 vdout1_4ck45 = 1.7 time = 460
* CHECK dout1_5 vdout1_5ck45 = 0 time = 460
* CHECK dout1_6 vdout1_6ck45 = 0 time = 460
* CHECK dout1_7 vdout1_7ck45 = 1.7 time = 460
* CHECK dout1_8 vdout1_8ck45 = 1.7 time = 460
* CHECK dout1_9 vdout1_9ck45 = 0 time = 460
* CHECK dout1_10 vdout1_10ck45 = 0 time = 460
* CHECK dout1_11 vdout1_11ck45 = 0 time = 460
* CHECK dout1_12 vdout1_12ck45 = 1.7 time = 460
* CHECK dout1_13 vdout1_13ck45 = 0 time = 460
* CHECK dout1_14 vdout1_14ck45 = 0 time = 460
* CHECK dout1_15 vdout1_15ck45 = 0 time = 460
* CHECK dout1_16 vdout1_16ck45 = 0 time = 460
* CHECK dout1_0 vdout1_0ck48 = 0 time = 490
* CHECK dout1_1 vdout1_1ck48 = 1.7 time = 490
* CHECK dout1_2 vdout1_2ck48 = 0 time = 490
* CHECK dout1_3 vdout1_3ck48 = 1.7 time = 490
* CHECK dout1_4 vdout1_4ck48 = 0 time = 490
* CHECK dout1_5 vdout1_5ck48 = 0 time = 490
* CHECK dout1_6 vdout1_6ck48 = 0 time = 490
* CHECK dout1_7 vdout1_7ck48 = 1.7 time = 490
* CHECK dout1_8 vdout1_8ck48 = 1.7 time = 490
* CHECK dout1_9 vdout1_9ck48 = 1.7 time = 490
* CHECK dout1_10 vdout1_10ck48 = 1.7 time = 490
* CHECK dout1_11 vdout1_11ck48 = 0 time = 490
* CHECK dout1_12 vdout1_12ck48 = 1.7 time = 490
* CHECK dout1_13 vdout1_13ck48 = 0 time = 490
* CHECK dout1_14 vdout1_14ck48 = 0 time = 490
* CHECK dout1_15 vdout1_15ck48 = 0 time = 490
* CHECK dout1_16 vdout1_16ck48 = 0 time = 490
* CHECK dout1_0 vdout1_0ck53 = 1.7 time = 540
* CHECK dout1_1 vdout1_1ck53 = 1.7 time = 540
* CHECK dout1_2 vdout1_2ck53 = 1.7 time = 540
* CHECK dout1_3 vdout1_3ck53 = 1.7 time = 540
* CHECK dout1_4 vdout1_4ck53 = 1.7 time = 540
* CHECK dout1_5 vdout1_5ck53 = 1.7 time = 540
* CHECK dout1_6 vdout1_6ck53 = 0 time = 540
* CHECK dout1_7 vdout1_7ck53 = 1.7 time = 540
* CHECK dout1_8 vdout1_8ck53 = 1.7 time = 540
* CHECK dout1_9 vdout1_9ck53 = 1.7 time = 540
* CHECK dout1_10 vdout1_10ck53 = 0 time = 540
* CHECK dout1_11 vdout1_11ck53 = 0 time = 540
* CHECK dout1_12 vdout1_12ck53 = 1.7 time = 540
* CHECK dout1_13 vdout1_13ck53 = 0 time = 540
* CHECK dout1_14 vdout1_14ck53 = 1.7 time = 540
* CHECK dout1_15 vdout1_15ck53 = 1.7 time = 540
* CHECK dout1_16 vdout1_16ck53 = 0 time = 540
* CHECK dout1_0 vdout1_0ck54 = 1.7 time = 550
* CHECK dout1_1 vdout1_1ck54 = 1.7 time = 550
* CHECK dout1_2 vdout1_2ck54 = 0 time = 550
* CHECK dout1_3 vdout1_3ck54 = 0 time = 550
* CHECK dout1_4 vdout1_4ck54 = 0 time = 550
* CHECK dout1_5 vdout1_5ck54 = 1.7 time = 550
* CHECK dout1_6 vdout1_6ck54 = 1.7 time = 550
* CHECK dout1_7 vdout1_7ck54 = 1.7 time = 550
* CHECK dout1_8 vdout1_8ck54 = 0 time = 550
* CHECK dout1_9 vdout1_9ck54 = 1.7 time = 550
* CHECK dout1_10 vdout1_10ck54 = 1.7 time = 550
* CHECK dout1_11 vdout1_11ck54 = 0 time = 550
* CHECK dout1_12 vdout1_12ck54 = 0 time = 550
* CHECK dout1_13 vdout1_13ck54 = 1.7 time = 550
* CHECK dout1_14 vdout1_14ck54 = 1.7 time = 550
* CHECK dout1_15 vdout1_15ck54 = 0 time = 550
* CHECK dout1_16 vdout1_16ck54 = 0 time = 550
* CHECK dout1_0 vdout1_0ck57 = 0 time = 580
* CHECK dout1_1 vdout1_1ck57 = 1.7 time = 580
* CHECK dout1_2 vdout1_2ck57 = 1.7 time = 580
* CHECK dout1_3 vdout1_3ck57 = 1.7 time = 580
* CHECK dout1_4 vdout1_4ck57 = 1.7 time = 580
* CHECK dout1_5 vdout1_5ck57 = 1.7 time = 580
* CHECK dout1_6 vdout1_6ck57 = 1.7 time = 580
* CHECK dout1_7 vdout1_7ck57 = 0 time = 580
* CHECK dout1_8 vdout1_8ck57 = 1.7 time = 580
* CHECK dout1_9 vdout1_9ck57 = 1.7 time = 580
* CHECK dout1_10 vdout1_10ck57 = 0 time = 580
* CHECK dout1_11 vdout1_11ck57 = 1.7 time = 580
* CHECK dout1_12 vdout1_12ck57 = 1.7 time = 580
* CHECK dout1_13 vdout1_13ck57 = 1.7 time = 580
* CHECK dout1_14 vdout1_14ck57 = 0 time = 580
* CHECK dout1_15 vdout1_15ck57 = 1.7 time = 580
* CHECK dout1_16 vdout1_16ck57 = 0 time = 580
* CHECK dout1_0 vdout1_0ck64 = 0 time = 650
* CHECK dout1_1 vdout1_1ck64 = 1.7 time = 650
* CHECK dout1_2 vdout1_2ck64 = 0 time = 650
* CHECK dout1_3 vdout1_3ck64 = 1.7 time = 650
* CHECK dout1_4 vdout1_4ck64 = 0 time = 650
* CHECK dout1_5 vdout1_5ck64 = 0 time = 650
* CHECK dout1_6 vdout1_6ck64 = 0 time = 650
* CHECK dout1_7 vdout1_7ck64 = 0 time = 650
* CHECK dout1_8 vdout1_8ck64 = 1.7 time = 650
* CHECK dout1_9 vdout1_9ck64 = 0 time = 650
* CHECK dout1_10 vdout1_10ck64 = 1.7 time = 650
* CHECK dout1_11 vdout1_11ck64 = 0 time = 650
* CHECK dout1_12 vdout1_12ck64 = 0 time = 650
* CHECK dout1_13 vdout1_13ck64 = 0 time = 650
* CHECK dout1_14 vdout1_14ck64 = 1.7 time = 650
* CHECK dout1_15 vdout1_15ck64 = 0 time = 650
* CHECK dout1_16 vdout1_16ck64 = 0 time = 650
* CHECK dout1_0 vdout1_0ck65 = 0 time = 660
* CHECK dout1_1 vdout1_1ck65 = 1.7 time = 660
* CHECK dout1_2 vdout1_2ck65 = 0 time = 660
* CHECK dout1_3 vdout1_3ck65 = 1.7 time = 660
* CHECK dout1_4 vdout1_4ck65 = 0 time = 660
* CHECK dout1_5 vdout1_5ck65 = 0 time = 660
* CHECK dout1_6 vdout1_6ck65 = 0 time = 660
* CHECK dout1_7 vdout1_7ck65 = 0 time = 660
* CHECK dout1_8 vdout1_8ck65 = 1.7 time = 660
* CHECK dout1_9 vdout1_9ck65 = 0 time = 660
* CHECK dout1_10 vdout1_10ck65 = 1.7 time = 660
* CHECK dout1_11 vdout1_11ck65 = 0 time = 660
* CHECK dout1_12 vdout1_12ck65 = 0 time = 660
* CHECK dout1_13 vdout1_13ck65 = 0 time = 660
* CHECK dout1_14 vdout1_14ck65 = 1.7 time = 660
* CHECK dout1_15 vdout1_15ck65 = 0 time = 660
* CHECK dout1_16 vdout1_16ck65 = 0 time = 660
* CHECK dout1_0 vdout1_0ck69 = 0 time = 700
* CHECK dout1_1 vdout1_1ck69 = 1.7 time = 700
* CHECK dout1_2 vdout1_2ck69 = 1.7 time = 700
* CHECK dout1_3 vdout1_3ck69 = 1.7 time = 700
* CHECK dout1_4 vdout1_4ck69 = 1.7 time = 700
* CHECK dout1_5 vdout1_5ck69 = 0 time = 700
* CHECK dout1_6 vdout1_6ck69 = 0 time = 700
* CHECK dout1_7 vdout1_7ck69 = 1.7 time = 700
* CHECK dout1_8 vdout1_8ck69 = 0 time = 700
* CHECK dout1_9 vdout1_9ck69 = 1.7 time = 700
* CHECK dout1_10 vdout1_10ck69 = 0 time = 700
* CHECK dout1_11 vdout1_11ck69 = 0 time = 700
* CHECK dout1_12 vdout1_12ck69 = 0 time = 700
* CHECK dout1_13 vdout1_13ck69 = 1.7 time = 700
* CHECK dout1_14 vdout1_14ck69 = 1.7 time = 700
* CHECK dout1_15 vdout1_15ck69 = 1.7 time = 700
* CHECK dout1_16 vdout1_16ck69 = 0 time = 700
* CHECK dout1_0 vdout1_0ck75 = 1.7 time = 760
* CHECK dout1_1 vdout1_1ck75 = 0 time = 760
* CHECK dout1_2 vdout1_2ck75 = 0 time = 760
* CHECK dout1_3 vdout1_3ck75 = 0 time = 760
* CHECK dout1_4 vdout1_4ck75 = 1.7 time = 760
* CHECK dout1_5 vdout1_5ck75 = 1.7 time = 760
* CHECK dout1_6 vdout1_6ck75 = 0 time = 760
* CHECK dout1_7 vdout1_7ck75 = 0 time = 760
* CHECK dout1_8 vdout1_8ck75 = 1.7 time = 760
* CHECK dout1_9 vdout1_9ck75 = 0 time = 760
* CHECK dout1_10 vdout1_10ck75 = 0 time = 760
* CHECK dout1_11 vdout1_11ck75 = 0 time = 760
* CHECK dout1_12 vdout1_12ck75 = 1.7 time = 760
* CHECK dout1_13 vdout1_13ck75 = 1.7 time = 760
* CHECK dout1_14 vdout1_14ck75 = 1.7 time = 760
* CHECK dout1_15 vdout1_15ck75 = 0 time = 760
* CHECK dout1_16 vdout1_16ck75 = 0 time = 760
* CHECK dout1_0 vdout1_0ck79 = 1.7 time = 800
* CHECK dout1_1 vdout1_1ck79 = 0 time = 800
* CHECK dout1_2 vdout1_2ck79 = 1.7 time = 800
* CHECK dout1_3 vdout1_3ck79 = 0 time = 800
* CHECK dout1_4 vdout1_4ck79 = 1.7 time = 800
* CHECK dout1_5 vdout1_5ck79 = 0 time = 800
* CHECK dout1_6 vdout1_6ck79 = 0 time = 800
* CHECK dout1_7 vdout1_7ck79 = 1.7 time = 800
* CHECK dout1_8 vdout1_8ck79 = 1.7 time = 800
* CHECK dout1_9 vdout1_9ck79 = 0 time = 800
* CHECK dout1_10 vdout1_10ck79 = 0 time = 800
* CHECK dout1_11 vdout1_11ck79 = 1.7 time = 800
* CHECK dout1_12 vdout1_12ck79 = 0 time = 800
* CHECK dout1_13 vdout1_13ck79 = 0 time = 800
* CHECK dout1_14 vdout1_14ck79 = 1.7 time = 800
* CHECK dout1_15 vdout1_15ck79 = 0 time = 800
* CHECK dout1_16 vdout1_16ck79 = 0 time = 800
* CHECK dout1_0 vdout1_0ck82 = 1.7 time = 830
* CHECK dout1_1 vdout1_1ck82 = 1.7 time = 830
* CHECK dout1_2 vdout1_2ck82 = 1.7 time = 830
* CHECK dout1_3 vdout1_3ck82 = 1.7 time = 830
* CHECK dout1_4 vdout1_4ck82 = 1.7 time = 830
* CHECK dout1_5 vdout1_5ck82 = 0 time = 830
* CHECK dout1_6 vdout1_6ck82 = 0 time = 830
* CHECK dout1_7 vdout1_7ck82 = 1.7 time = 830
* CHECK dout1_8 vdout1_8ck82 = 1.7 time = 830
* CHECK dout1_9 vdout1_9ck82 = 0 time = 830
* CHECK dout1_10 vdout1_10ck82 = 1.7 time = 830
* CHECK dout1_11 vdout1_11ck82 = 0 time = 830
* CHECK dout1_12 vdout1_12ck82 = 0 time = 830
* CHECK dout1_13 vdout1_13ck82 = 0 time = 830
* CHECK dout1_14 vdout1_14ck82 = 0 time = 830
* CHECK dout1_15 vdout1_15ck82 = 1.7 time = 830
* CHECK dout1_16 vdout1_16ck82 = 0 time = 830
* CHECK dout1_0 vdout1_0ck83 = 0 time = 840
* CHECK dout1_1 vdout1_1ck83 = 1.7 time = 840
* CHECK dout1_2 vdout1_2ck83 = 1.7 time = 840
* CHECK dout1_3 vdout1_3ck83 = 0 time = 840
* CHECK dout1_4 vdout1_4ck83 = 0 time = 840
* CHECK dout1_5 vdout1_5ck83 = 0 time = 840
* CHECK dout1_6 vdout1_6ck83 = 1.7 time = 840
* CHECK dout1_7 vdout1_7ck83 = 0 time = 840
* CHECK dout1_8 vdout1_8ck83 = 1.7 time = 840
* CHECK dout1_9 vdout1_9ck83 = 1.7 time = 840
* CHECK dout1_10 vdout1_10ck83 = 1.7 time = 840
* CHECK dout1_11 vdout1_11ck83 = 1.7 time = 840
* CHECK dout1_12 vdout1_12ck83 = 1.7 time = 840
* CHECK dout1_13 vdout1_13ck83 = 1.7 time = 840
* CHECK dout1_14 vdout1_14ck83 = 0 time = 840
* CHECK dout1_15 vdout1_15ck83 = 1.7 time = 840
* CHECK dout1_16 vdout1_16ck83 = 0 time = 840
* CHECK dout1_0 vdout1_0ck86 = 1.7 time = 870
* CHECK dout1_1 vdout1_1ck86 = 1.7 time = 870
* CHECK dout1_2 vdout1_2ck86 = 1.7 time = 870
* CHECK dout1_3 vdout1_3ck86 = 1.7 time = 870
* CHECK dout1_4 vdout1_4ck86 = 0 time = 870
* CHECK dout1_5 vdout1_5ck86 = 1.7 time = 870
* CHECK dout1_6 vdout1_6ck86 = 1.7 time = 870
* CHECK dout1_7 vdout1_7ck86 = 0 time = 870
* CHECK dout1_8 vdout1_8ck86 = 0 time = 870
* CHECK dout1_9 vdout1_9ck86 = 0 time = 870
* CHECK dout1_10 vdout1_10ck86 = 1.7 time = 870
* CHECK dout1_11 vdout1_11ck86 = 0 time = 870
* CHECK dout1_12 vdout1_12ck86 = 0 time = 870
* CHECK dout1_13 vdout1_13ck86 = 1.7 time = 870
* CHECK dout1_14 vdout1_14ck86 = 0 time = 870
* CHECK dout1_15 vdout1_15ck86 = 1.7 time = 870
* CHECK dout1_16 vdout1_16ck86 = 0 time = 870
* CHECK dout1_0 vdout1_0ck87 = 1.7 time = 880
* CHECK dout1_1 vdout1_1ck87 = 1.7 time = 880
* CHECK dout1_2 vdout1_2ck87 = 1.7 time = 880
* CHECK dout1_3 vdout1_3ck87 = 1.7 time = 880
* CHECK dout1_4 vdout1_4ck87 = 1.7 time = 880
* CHECK dout1_5 vdout1_5ck87 = 0 time = 880
* CHECK dout1_6 vdout1_6ck87 = 0 time = 880
* CHECK dout1_7 vdout1_7ck87 = 1.7 time = 880
* CHECK dout1_8 vdout1_8ck87 = 1.7 time = 880
* CHECK dout1_9 vdout1_9ck87 = 0 time = 880
* CHECK dout1_10 vdout1_10ck87 = 1.7 time = 880
* CHECK dout1_11 vdout1_11ck87 = 0 time = 880
* CHECK dout1_12 vdout1_12ck87 = 0 time = 880
* CHECK dout1_13 vdout1_13ck87 = 0 time = 880
* CHECK dout1_14 vdout1_14ck87 = 0 time = 880
* CHECK dout1_15 vdout1_15ck87 = 1.7 time = 880
* CHECK dout1_16 vdout1_16ck87 = 0 time = 880
* CHECK dout1_0 vdout1_0ck90 = 0 time = 910
* CHECK dout1_1 vdout1_1ck90 = 0 time = 910
* CHECK dout1_2 vdout1_2ck90 = 0 time = 910
* CHECK dout1_3 vdout1_3ck90 = 0 time = 910
* CHECK dout1_4 vdout1_4ck90 = 0 time = 910
* CHECK dout1_5 vdout1_5ck90 = 1.7 time = 910
* CHECK dout1_6 vdout1_6ck90 = 0 time = 910
* CHECK dout1_7 vdout1_7ck90 = 0 time = 910
* CHECK dout1_8 vdout1_8ck90 = 0 time = 910
* CHECK dout1_9 vdout1_9ck90 = 1.7 time = 910
* CHECK dout1_10 vdout1_10ck90 = 1.7 time = 910
* CHECK dout1_11 vdout1_11ck90 = 1.7 time = 910
* CHECK dout1_12 vdout1_12ck90 = 0 time = 910
* CHECK dout1_13 vdout1_13ck90 = 1.7 time = 910
* CHECK dout1_14 vdout1_14ck90 = 1.7 time = 910
* CHECK dout1_15 vdout1_15ck90 = 0 time = 910
* CHECK dout1_16 vdout1_16ck90 = 0 time = 910
* CHECK dout1_0 vdout1_0ck91 = 0 time = 920
* CHECK dout1_1 vdout1_1ck91 = 0 time = 920
* CHECK dout1_2 vdout1_2ck91 = 0 time = 920
* CHECK dout1_3 vdout1_3ck91 = 0 time = 920
* CHECK dout1_4 vdout1_4ck91 = 0 time = 920
* CHECK dout1_5 vdout1_5ck91 = 1.7 time = 920
* CHECK dout1_6 vdout1_6ck91 = 0 time = 920
* CHECK dout1_7 vdout1_7ck91 = 0 time = 920
* CHECK dout1_8 vdout1_8ck91 = 0 time = 920
* CHECK dout1_9 vdout1_9ck91 = 1.7 time = 920
* CHECK dout1_10 vdout1_10ck91 = 1.7 time = 920
* CHECK dout1_11 vdout1_11ck91 = 1.7 time = 920
* CHECK dout1_12 vdout1_12ck91 = 0 time = 920
* CHECK dout1_13 vdout1_13ck91 = 1.7 time = 920
* CHECK dout1_14 vdout1_14ck91 = 1.7 time = 920
* CHECK dout1_15 vdout1_15ck91 = 0 time = 920
* CHECK dout1_16 vdout1_16ck91 = 0 time = 920
* CHECK dout1_0 vdout1_0ck92 = 1.7 time = 930
* CHECK dout1_1 vdout1_1ck92 = 1.7 time = 930
* CHECK dout1_2 vdout1_2ck92 = 1.7 time = 930
* CHECK dout1_3 vdout1_3ck92 = 1.7 time = 930
* CHECK dout1_4 vdout1_4ck92 = 0 time = 930
* CHECK dout1_5 vdout1_5ck92 = 1.7 time = 930
* CHECK dout1_6 vdout1_6ck92 = 1.7 time = 930
* CHECK dout1_7 vdout1_7ck92 = 0 time = 930
* CHECK dout1_8 vdout1_8ck92 = 0 time = 930
* CHECK dout1_9 vdout1_9ck92 = 0 time = 930
* CHECK dout1_10 vdout1_10ck92 = 1.7 time = 930
* CHECK dout1_11 vdout1_11ck92 = 0 time = 930
* CHECK dout1_12 vdout1_12ck92 = 0 time = 930
* CHECK dout1_13 vdout1_13ck92 = 1.7 time = 930
* CHECK dout1_14 vdout1_14ck92 = 0 time = 930
* CHECK dout1_15 vdout1_15ck92 = 1.7 time = 930
* CHECK dout1_16 vdout1_16ck92 = 0 time = 930
* CHECK dout1_0 vdout1_0ck94 = 1.7 time = 950
* CHECK dout1_1 vdout1_1ck94 = 0 time = 950
* CHECK dout1_2 vdout1_2ck94 = 1.7 time = 950
* CHECK dout1_3 vdout1_3ck94 = 0 time = 950
* CHECK dout1_4 vdout1_4ck94 = 0 time = 950
* CHECK dout1_5 vdout1_5ck94 = 1.7 time = 950
* CHECK dout1_6 vdout1_6ck94 = 1.7 time = 950
* CHECK dout1_7 vdout1_7ck94 = 1.7 time = 950
* CHECK dout1_8 vdout1_8ck94 = 1.7 time = 950
* CHECK dout1_9 vdout1_9ck94 = 0 time = 950
* CHECK dout1_10 vdout1_10ck94 = 0 time = 950
* CHECK dout1_11 vdout1_11ck94 = 0 time = 950
* CHECK dout1_12 vdout1_12ck94 = 1.7 time = 950
* CHECK dout1_13 vdout1_13ck94 = 1.7 time = 950
* CHECK dout1_14 vdout1_14ck94 = 0 time = 950
* CHECK dout1_15 vdout1_15ck94 = 0 time = 950
* CHECK dout1_16 vdout1_16ck94 = 0 time = 950
* CHECK dout1_0 vdout1_0ck95 = 1.7 time = 960
* CHECK dout1_1 vdout1_1ck95 = 1.7 time = 960
* CHECK dout1_2 vdout1_2ck95 = 1.7 time = 960
* CHECK dout1_3 vdout1_3ck95 = 1.7 time = 960
* CHECK dout1_4 vdout1_4ck95 = 1.7 time = 960
* CHECK dout1_5 vdout1_5ck95 = 0 time = 960
* CHECK dout1_6 vdout1_6ck95 = 0 time = 960
* CHECK dout1_7 vdout1_7ck95 = 1.7 time = 960
* CHECK dout1_8 vdout1_8ck95 = 1.7 time = 960
* CHECK dout1_9 vdout1_9ck95 = 0 time = 960
* CHECK dout1_10 vdout1_10ck95 = 1.7 time = 960
* CHECK dout1_11 vdout1_11ck95 = 0 time = 960
* CHECK dout1_12 vdout1_12ck95 = 1.7 time = 960
* CHECK dout1_13 vdout1_13ck95 = 0 time = 960
* CHECK dout1_14 vdout1_14ck95 = 0 time = 960
* CHECK dout1_15 vdout1_15ck95 = 0 time = 960
* CHECK dout1_16 vdout1_16ck95 = 0 time = 960
* CHECK dout1_0 vdout1_0ck100 = 1.7 time = 1010
* CHECK dout1_1 vdout1_1ck100 = 1.7 time = 1010
* CHECK dout1_2 vdout1_2ck100 = 1.7 time = 1010
* CHECK dout1_3 vdout1_3ck100 = 1.7 time = 1010
* CHECK dout1_4 vdout1_4ck100 = 1.7 time = 1010
* CHECK dout1_5 vdout1_5ck100 = 0 time = 1010
* CHECK dout1_6 vdout1_6ck100 = 0 time = 1010
* CHECK dout1_7 vdout1_7ck100 = 1.7 time = 1010
* CHECK dout1_8 vdout1_8ck100 = 1.7 time = 1010
* CHECK dout1_9 vdout1_9ck100 = 0 time = 1010
* CHECK dout1_10 vdout1_10ck100 = 1.7 time = 1010
* CHECK dout1_11 vdout1_11ck100 = 0 time = 1010
* CHECK dout1_12 vdout1_12ck100 = 1.7 time = 1010
* CHECK dout1_13 vdout1_13ck100 = 0 time = 1010
* CHECK dout1_14 vdout1_14ck100 = 0 time = 1010
* CHECK dout1_15 vdout1_15ck100 = 0 time = 1010
* CHECK dout1_16 vdout1_16ck100 = 0 time = 1010
* CHECK dout1_0 vdout1_0ck101 = 1.7 time = 1020
* CHECK dout1_1 vdout1_1ck101 = 1.7 time = 1020
* CHECK dout1_2 vdout1_2ck101 = 0 time = 1020
* CHECK dout1_3 vdout1_3ck101 = 0 time = 1020
* CHECK dout1_4 vdout1_4ck101 = 0 time = 1020
* CHECK dout1_5 vdout1_5ck101 = 0 time = 1020
* CHECK dout1_6 vdout1_6ck101 = 0 time = 1020
* CHECK dout1_7 vdout1_7ck101 = 1.7 time = 1020
* CHECK dout1_8 vdout1_8ck101 = 0 time = 1020
* CHECK dout1_9 vdout1_9ck101 = 0 time = 1020
* CHECK dout1_10 vdout1_10ck101 = 0 time = 1020
* CHECK dout1_11 vdout1_11ck101 = 1.7 time = 1020
* CHECK dout1_12 vdout1_12ck101 = 1.7 time = 1020
* CHECK dout1_13 vdout1_13ck101 = 0 time = 1020
* CHECK dout1_14 vdout1_14ck101 = 1.7 time = 1020
* CHECK dout1_15 vdout1_15ck101 = 0 time = 1020
* CHECK dout1_16 vdout1_16ck101 = 0 time = 1020
* CHECK dout1_0 vdout1_0ck103 = 1.7 time = 1040
* CHECK dout1_1 vdout1_1ck103 = 0 time = 1040
* CHECK dout1_2 vdout1_2ck103 = 0 time = 1040
* CHECK dout1_3 vdout1_3ck103 = 1.7 time = 1040
* CHECK dout1_4 vdout1_4ck103 = 0 time = 1040
* CHECK dout1_5 vdout1_5ck103 = 0 time = 1040
* CHECK dout1_6 vdout1_6ck103 = 1.7 time = 1040
* CHECK dout1_7 vdout1_7ck103 = 1.7 time = 1040
* CHECK dout1_8 vdout1_8ck103 = 0 time = 1040
* CHECK dout1_9 vdout1_9ck103 = 1.7 time = 1040
* CHECK dout1_10 vdout1_10ck103 = 0 time = 1040
* CHECK dout1_11 vdout1_11ck103 = 1.7 time = 1040
* CHECK dout1_12 vdout1_12ck103 = 0 time = 1040
* CHECK dout1_13 vdout1_13ck103 = 0 time = 1040
* CHECK dout1_14 vdout1_14ck103 = 1.7 time = 1040
* CHECK dout1_15 vdout1_15ck103 = 1.7 time = 1040
* CHECK dout1_16 vdout1_16ck103 = 0 time = 1040
* CHECK dout1_0 vdout1_0ck104 = 1.7 time = 1050
* CHECK dout1_1 vdout1_1ck104 = 1.7 time = 1050
* CHECK dout1_2 vdout1_2ck104 = 0 time = 1050
* CHECK dout1_3 vdout1_3ck104 = 0 time = 1050
* CHECK dout1_4 vdout1_4ck104 = 0 time = 1050
* CHECK dout1_5 vdout1_5ck104 = 0 time = 1050
* CHECK dout1_6 vdout1_6ck104 = 0 time = 1050
* CHECK dout1_7 vdout1_7ck104 = 1.7 time = 1050
* CHECK dout1_8 vdout1_8ck104 = 0 time = 1050
* CHECK dout1_9 vdout1_9ck104 = 0 time = 1050
* CHECK dout1_10 vdout1_10ck104 = 0 time = 1050
* CHECK dout1_11 vdout1_11ck104 = 1.7 time = 1050
* CHECK dout1_12 vdout1_12ck104 = 1.7 time = 1050
* CHECK dout1_13 vdout1_13ck104 = 0 time = 1050
* CHECK dout1_14 vdout1_14ck104 = 1.7 time = 1050
* CHECK dout1_15 vdout1_15ck104 = 0 time = 1050
* CHECK dout1_16 vdout1_16ck104 = 0 time = 1050
* CHECK dout1_0 vdout1_0ck105 = 1.7 time = 1060
* CHECK dout1_1 vdout1_1ck105 = 1.7 time = 1060
* CHECK dout1_2 vdout1_2ck105 = 1.7 time = 1060
* CHECK dout1_3 vdout1_3ck105 = 1.7 time = 1060
* CHECK dout1_4 vdout1_4ck105 = 1.7 time = 1060
* CHECK dout1_5 vdout1_5ck105 = 0 time = 1060
* CHECK dout1_6 vdout1_6ck105 = 0 time = 1060
* CHECK dout1_7 vdout1_7ck105 = 1.7 time = 1060
* CHECK dout1_8 vdout1_8ck105 = 1.7 time = 1060
* CHECK dout1_9 vdout1_9ck105 = 0 time = 1060
* CHECK dout1_10 vdout1_10ck105 = 1.7 time = 1060
* CHECK dout1_11 vdout1_11ck105 = 0 time = 1060
* CHECK dout1_12 vdout1_12ck105 = 1.7 time = 1060
* CHECK dout1_13 vdout1_13ck105 = 0 time = 1060
* CHECK dout1_14 vdout1_14ck105 = 0 time = 1060
* CHECK dout1_15 vdout1_15ck105 = 0 time = 1060
* CHECK dout1_16 vdout1_16ck105 = 0 time = 1060
* CHECK dout1_0 vdout1_0ck109 = 1.7 time = 1100
* CHECK dout1_1 vdout1_1ck109 = 1.7 time = 1100
* CHECK dout1_2 vdout1_2ck109 = 1.7 time = 1100
* CHECK dout1_3 vdout1_3ck109 = 1.7 time = 1100
* CHECK dout1_4 vdout1_4ck109 = 1.7 time = 1100
* CHECK dout1_5 vdout1_5ck109 = 0 time = 1100
* CHECK dout1_6 vdout1_6ck109 = 0 time = 1100
* CHECK dout1_7 vdout1_7ck109 = 1.7 time = 1100
* CHECK dout1_8 vdout1_8ck109 = 1.7 time = 1100
* CHECK dout1_9 vdout1_9ck109 = 0 time = 1100
* CHECK dout1_10 vdout1_10ck109 = 1.7 time = 1100
* CHECK dout1_11 vdout1_11ck109 = 0 time = 1100
* CHECK dout1_12 vdout1_12ck109 = 1.7 time = 1100
* CHECK dout1_13 vdout1_13ck109 = 0 time = 1100
* CHECK dout1_14 vdout1_14ck109 = 0 time = 1100
* CHECK dout1_15 vdout1_15ck109 = 0 time = 1100
* CHECK dout1_16 vdout1_16ck109 = 0 time = 1100
* CHECK dout1_0 vdout1_0ck110 = 1.7 time = 1110
* CHECK dout1_1 vdout1_1ck110 = 1.7 time = 1110
* CHECK dout1_2 vdout1_2ck110 = 1.7 time = 1110
* CHECK dout1_3 vdout1_3ck110 = 1.7 time = 1110
* CHECK dout1_4 vdout1_4ck110 = 1.7 time = 1110
* CHECK dout1_5 vdout1_5ck110 = 0 time = 1110
* CHECK dout1_6 vdout1_6ck110 = 0 time = 1110
* CHECK dout1_7 vdout1_7ck110 = 1.7 time = 1110
* CHECK dout1_8 vdout1_8ck110 = 1.7 time = 1110
* CHECK dout1_9 vdout1_9ck110 = 0 time = 1110
* CHECK dout1_10 vdout1_10ck110 = 1.7 time = 1110
* CHECK dout1_11 vdout1_11ck110 = 0 time = 1110
* CHECK dout1_12 vdout1_12ck110 = 1.7 time = 1110
* CHECK dout1_13 vdout1_13ck110 = 0 time = 1110
* CHECK dout1_14 vdout1_14ck110 = 0 time = 1110
* CHECK dout1_15 vdout1_15ck110 = 0 time = 1110
* CHECK dout1_16 vdout1_16ck110 = 0 time = 1110
* CHECK dout1_0 vdout1_0ck111 = 1.7 time = 1120
* CHECK dout1_1 vdout1_1ck111 = 1.7 time = 1120
* CHECK dout1_2 vdout1_2ck111 = 0 time = 1120
* CHECK dout1_3 vdout1_3ck111 = 0 time = 1120
* CHECK dout1_4 vdout1_4ck111 = 0 time = 1120
* CHECK dout1_5 vdout1_5ck111 = 0 time = 1120
* CHECK dout1_6 vdout1_6ck111 = 0 time = 1120
* CHECK dout1_7 vdout1_7ck111 = 1.7 time = 1120
* CHECK dout1_8 vdout1_8ck111 = 0 time = 1120
* CHECK dout1_9 vdout1_9ck111 = 0 time = 1120
* CHECK dout1_10 vdout1_10ck111 = 0 time = 1120
* CHECK dout1_11 vdout1_11ck111 = 1.7 time = 1120
* CHECK dout1_12 vdout1_12ck111 = 1.7 time = 1120
* CHECK dout1_13 vdout1_13ck111 = 0 time = 1120
* CHECK dout1_14 vdout1_14ck111 = 1.7 time = 1120
* CHECK dout1_15 vdout1_15ck111 = 0 time = 1120
* CHECK dout1_16 vdout1_16ck111 = 0 time = 1120
* CHECK dout1_0 vdout1_0ck112 = 1.7 time = 1130
* CHECK dout1_1 vdout1_1ck112 = 0 time = 1130
* CHECK dout1_2 vdout1_2ck112 = 0 time = 1130
* CHECK dout1_3 vdout1_3ck112 = 1.7 time = 1130
* CHECK dout1_4 vdout1_4ck112 = 0 time = 1130
* CHECK dout1_5 vdout1_5ck112 = 1.7 time = 1130
* CHECK dout1_6 vdout1_6ck112 = 1.7 time = 1130
* CHECK dout1_7 vdout1_7ck112 = 1.7 time = 1130
* CHECK dout1_8 vdout1_8ck112 = 0 time = 1130
* CHECK dout1_9 vdout1_9ck112 = 1.7 time = 1130
* CHECK dout1_10 vdout1_10ck112 = 0 time = 1130
* CHECK dout1_11 vdout1_11ck112 = 0 time = 1130
* CHECK dout1_12 vdout1_12ck112 = 0 time = 1130
* CHECK dout1_13 vdout1_13ck112 = 0 time = 1130
* CHECK dout1_14 vdout1_14ck112 = 1.7 time = 1130
* CHECK dout1_15 vdout1_15ck112 = 1.7 time = 1130
* CHECK dout1_16 vdout1_16ck112 = 0 time = 1130
* CHECK dout1_0 vdout1_0ck116 = 0 time = 1170
* CHECK dout1_1 vdout1_1ck116 = 0 time = 1170
* CHECK dout1_2 vdout1_2ck116 = 1.7 time = 1170
* CHECK dout1_3 vdout1_3ck116 = 1.7 time = 1170
* CHECK dout1_4 vdout1_4ck116 = 0 time = 1170
* CHECK dout1_5 vdout1_5ck116 = 0 time = 1170
* CHECK dout1_6 vdout1_6ck116 = 1.7 time = 1170
* CHECK dout1_7 vdout1_7ck116 = 0 time = 1170
* CHECK dout1_8 vdout1_8ck116 = 0 time = 1170
* CHECK dout1_9 vdout1_9ck116 = 1.7 time = 1170
* CHECK dout1_10 vdout1_10ck116 = 0 time = 1170
* CHECK dout1_11 vdout1_11ck116 = 1.7 time = 1170
* CHECK dout1_12 vdout1_12ck116 = 0 time = 1170
* CHECK dout1_13 vdout1_13ck116 = 1.7 time = 1170
* CHECK dout1_14 vdout1_14ck116 = 1.7 time = 1170
* CHECK dout1_15 vdout1_15ck116 = 1.7 time = 1170
* CHECK dout1_16 vdout1_16ck116 = 0 time = 1170
* CHECK dout1_0 vdout1_0ck117 = 1.7 time = 1180
* CHECK dout1_1 vdout1_1ck117 = 1.7 time = 1180
* CHECK dout1_2 vdout1_2ck117 = 1.7 time = 1180
* CHECK dout1_3 vdout1_3ck117 = 1.7 time = 1180
* CHECK dout1_4 vdout1_4ck117 = 1.7 time = 1180
* CHECK dout1_5 vdout1_5ck117 = 0 time = 1180
* CHECK dout1_6 vdout1_6ck117 = 0 time = 1180
* CHECK dout1_7 vdout1_7ck117 = 1.7 time = 1180
* CHECK dout1_8 vdout1_8ck117 = 1.7 time = 1180
* CHECK dout1_9 vdout1_9ck117 = 0 time = 1180
* CHECK dout1_10 vdout1_10ck117 = 1.7 time = 1180
* CHECK dout1_11 vdout1_11ck117 = 0 time = 1180
* CHECK dout1_12 vdout1_12ck117 = 1.7 time = 1180
* CHECK dout1_13 vdout1_13ck117 = 0 time = 1180
* CHECK dout1_14 vdout1_14ck117 = 0 time = 1180
* CHECK dout1_15 vdout1_15ck117 = 0 time = 1180
* CHECK dout1_16 vdout1_16ck117 = 0 time = 1180
* CHECK dout1_0 vdout1_0ck118 = 0 time = 1190
* CHECK dout1_1 vdout1_1ck118 = 0 time = 1190
* CHECK dout1_2 vdout1_2ck118 = 1.7 time = 1190
* CHECK dout1_3 vdout1_3ck118 = 1.7 time = 1190
* CHECK dout1_4 vdout1_4ck118 = 0 time = 1190
* CHECK dout1_5 vdout1_5ck118 = 0 time = 1190
* CHECK dout1_6 vdout1_6ck118 = 1.7 time = 1190
* CHECK dout1_7 vdout1_7ck118 = 0 time = 1190
* CHECK dout1_8 vdout1_8ck118 = 0 time = 1190
* CHECK dout1_9 vdout1_9ck118 = 1.7 time = 1190
* CHECK dout1_10 vdout1_10ck118 = 0 time = 1190
* CHECK dout1_11 vdout1_11ck118 = 1.7 time = 1190
* CHECK dout1_12 vdout1_12ck118 = 0 time = 1190
* CHECK dout1_13 vdout1_13ck118 = 1.7 time = 1190
* CHECK dout1_14 vdout1_14ck118 = 1.7 time = 1190
* CHECK dout1_15 vdout1_15ck118 = 1.7 time = 1190
* CHECK dout1_16 vdout1_16ck118 = 0 time = 1190
* CHECK dout1_0 vdout1_0ck123 = 1.7 time = 1240
* CHECK dout1_1 vdout1_1ck123 = 1.7 time = 1240
* CHECK dout1_2 vdout1_2ck123 = 0 time = 1240
* CHECK dout1_3 vdout1_3ck123 = 0 time = 1240
* CHECK dout1_4 vdout1_4ck123 = 0 time = 1240
* CHECK dout1_5 vdout1_5ck123 = 0 time = 1240
* CHECK dout1_6 vdout1_6ck123 = 0 time = 1240
* CHECK dout1_7 vdout1_7ck123 = 1.7 time = 1240
* CHECK dout1_8 vdout1_8ck123 = 0 time = 1240
* CHECK dout1_9 vdout1_9ck123 = 0 time = 1240
* CHECK dout1_10 vdout1_10ck123 = 0 time = 1240
* CHECK dout1_11 vdout1_11ck123 = 1.7 time = 1240
* CHECK dout1_12 vdout1_12ck123 = 1.7 time = 1240
* CHECK dout1_13 vdout1_13ck123 = 0 time = 1240
* CHECK dout1_14 vdout1_14ck123 = 1.7 time = 1240
* CHECK dout1_15 vdout1_15ck123 = 0 time = 1240
* CHECK dout1_16 vdout1_16ck123 = 0 time = 1240
* CHECK dout1_0 vdout1_0ck125 = 1.7 time = 1260
* CHECK dout1_1 vdout1_1ck125 = 1.7 time = 1260
* CHECK dout1_2 vdout1_2ck125 = 1.7 time = 1260
* CHECK dout1_3 vdout1_3ck125 = 0 time = 1260
* CHECK dout1_4 vdout1_4ck125 = 1.7 time = 1260
* CHECK dout1_5 vdout1_5ck125 = 1.7 time = 1260
* CHECK dout1_6 vdout1_6ck125 = 0 time = 1260
* CHECK dout1_7 vdout1_7ck125 = 1.7 time = 1260
* CHECK dout1_8 vdout1_8ck125 = 1.7 time = 1260
* CHECK dout1_9 vdout1_9ck125 = 0 time = 1260
* CHECK dout1_10 vdout1_10ck125 = 0 time = 1260
* CHECK dout1_11 vdout1_11ck125 = 1.7 time = 1260
* CHECK dout1_12 vdout1_12ck125 = 1.7 time = 1260
* CHECK dout1_13 vdout1_13ck125 = 1.7 time = 1260
* CHECK dout1_14 vdout1_14ck125 = 0 time = 1260
* CHECK dout1_15 vdout1_15ck125 = 1.7 time = 1260
* CHECK dout1_16 vdout1_16ck125 = 0 time = 1260
* CHECK dout1_0 vdout1_0ck127 = 1.7 time = 1280
* CHECK dout1_1 vdout1_1ck127 = 1.7 time = 1280
* CHECK dout1_2 vdout1_2ck127 = 0 time = 1280
* CHECK dout1_3 vdout1_3ck127 = 0 time = 1280
* CHECK dout1_4 vdout1_4ck127 = 0 time = 1280
* CHECK dout1_5 vdout1_5ck127 = 0 time = 1280
* CHECK dout1_6 vdout1_6ck127 = 0 time = 1280
* CHECK dout1_7 vdout1_7ck127 = 1.7 time = 1280
* CHECK dout1_8 vdout1_8ck127 = 0 time = 1280
* CHECK dout1_9 vdout1_9ck127 = 0 time = 1280
* CHECK dout1_10 vdout1_10ck127 = 0 time = 1280
* CHECK dout1_11 vdout1_11ck127 = 1.7 time = 1280
* CHECK dout1_12 vdout1_12ck127 = 1.7 time = 1280
* CHECK dout1_13 vdout1_13ck127 = 0 time = 1280
* CHECK dout1_14 vdout1_14ck127 = 1.7 time = 1280
* CHECK dout1_15 vdout1_15ck127 = 0 time = 1280
* CHECK dout1_16 vdout1_16ck127 = 0 time = 1280
* CHECK dout1_0 vdout1_0ck129 = 1.7 time = 1300
* CHECK dout1_1 vdout1_1ck129 = 1.7 time = 1300
* CHECK dout1_2 vdout1_2ck129 = 0 time = 1300
* CHECK dout1_3 vdout1_3ck129 = 0 time = 1300
* CHECK dout1_4 vdout1_4ck129 = 0 time = 1300
* CHECK dout1_5 vdout1_5ck129 = 0 time = 1300
* CHECK dout1_6 vdout1_6ck129 = 0 time = 1300
* CHECK dout1_7 vdout1_7ck129 = 1.7 time = 1300
* CHECK dout1_8 vdout1_8ck129 = 0 time = 1300
* CHECK dout1_9 vdout1_9ck129 = 0 time = 1300
* CHECK dout1_10 vdout1_10ck129 = 0 time = 1300
* CHECK dout1_11 vdout1_11ck129 = 1.7 time = 1300
* CHECK dout1_12 vdout1_12ck129 = 1.7 time = 1300
* CHECK dout1_13 vdout1_13ck129 = 0 time = 1300
* CHECK dout1_14 vdout1_14ck129 = 1.7 time = 1300
* CHECK dout1_15 vdout1_15ck129 = 0 time = 1300
* CHECK dout1_16 vdout1_16ck129 = 0 time = 1300
* CHECK dout1_0 vdout1_0ck130 = 1.7 time = 1310
* CHECK dout1_1 vdout1_1ck130 = 1.7 time = 1310
* CHECK dout1_2 vdout1_2ck130 = 1.7 time = 1310
* CHECK dout1_3 vdout1_3ck130 = 0 time = 1310
* CHECK dout1_4 vdout1_4ck130 = 1.7 time = 1310
* CHECK dout1_5 vdout1_5ck130 = 1.7 time = 1310
* CHECK dout1_6 vdout1_6ck130 = 0 time = 1310
* CHECK dout1_7 vdout1_7ck130 = 1.7 time = 1310
* CHECK dout1_8 vdout1_8ck130 = 1.7 time = 1310
* CHECK dout1_9 vdout1_9ck130 = 0 time = 1310
* CHECK dout1_10 vdout1_10ck130 = 0 time = 1310
* CHECK dout1_11 vdout1_11ck130 = 1.7 time = 1310
* CHECK dout1_12 vdout1_12ck130 = 1.7 time = 1310
* CHECK dout1_13 vdout1_13ck130 = 1.7 time = 1310
* CHECK dout1_14 vdout1_14ck130 = 0 time = 1310
* CHECK dout1_15 vdout1_15ck130 = 1.7 time = 1310
* CHECK dout1_16 vdout1_16ck130 = 0 time = 1310
* CHECK dout1_0 vdout1_0ck131 = 1.7 time = 1320
* CHECK dout1_1 vdout1_1ck131 = 1.7 time = 1320
* CHECK dout1_2 vdout1_2ck131 = 1.7 time = 1320
* CHECK dout1_3 vdout1_3ck131 = 0 time = 1320
* CHECK dout1_4 vdout1_4ck131 = 1.7 time = 1320
* CHECK dout1_5 vdout1_5ck131 = 1.7 time = 1320
* CHECK dout1_6 vdout1_6ck131 = 0 time = 1320
* CHECK dout1_7 vdout1_7ck131 = 1.7 time = 1320
* CHECK dout1_8 vdout1_8ck131 = 1.7 time = 1320
* CHECK dout1_9 vdout1_9ck131 = 0 time = 1320
* CHECK dout1_10 vdout1_10ck131 = 0 time = 1320
* CHECK dout1_11 vdout1_11ck131 = 1.7 time = 1320
* CHECK dout1_12 vdout1_12ck131 = 1.7 time = 1320
* CHECK dout1_13 vdout1_13ck131 = 1.7 time = 1320
* CHECK dout1_14 vdout1_14ck131 = 0 time = 1320
* CHECK dout1_15 vdout1_15ck131 = 1.7 time = 1320
* CHECK dout1_16 vdout1_16ck131 = 0 time = 1320
* CHECK dout1_0 vdout1_0ck133 = 0 time = 1340
* CHECK dout1_1 vdout1_1ck133 = 1.7 time = 1340
* CHECK dout1_2 vdout1_2ck133 = 0 time = 1340
* CHECK dout1_3 vdout1_3ck133 = 1.7 time = 1340
* CHECK dout1_4 vdout1_4ck133 = 1.7 time = 1340
* CHECK dout1_5 vdout1_5ck133 = 0 time = 1340
* CHECK dout1_6 vdout1_6ck133 = 0 time = 1340
* CHECK dout1_7 vdout1_7ck133 = 0 time = 1340
* CHECK dout1_8 vdout1_8ck133 = 1.7 time = 1340
* CHECK dout1_9 vdout1_9ck133 = 1.7 time = 1340
* CHECK dout1_10 vdout1_10ck133 = 0 time = 1340
* CHECK dout1_11 vdout1_11ck133 = 0 time = 1340
* CHECK dout1_12 vdout1_12ck133 = 0 time = 1340
* CHECK dout1_13 vdout1_13ck133 = 1.7 time = 1340
* CHECK dout1_14 vdout1_14ck133 = 1.7 time = 1340
* CHECK dout1_15 vdout1_15ck133 = 0 time = 1340
* CHECK dout1_16 vdout1_16ck133 = 0 time = 1340
* CHECK dout1_0 vdout1_0ck135 = 0 time = 1360
* CHECK dout1_1 vdout1_1ck135 = 1.7 time = 1360
* CHECK dout1_2 vdout1_2ck135 = 0 time = 1360
* CHECK dout1_3 vdout1_3ck135 = 0 time = 1360
* CHECK dout1_4 vdout1_4ck135 = 1.7 time = 1360
* CHECK dout1_5 vdout1_5ck135 = 1.7 time = 1360
* CHECK dout1_6 vdout1_6ck135 = 1.7 time = 1360
* CHECK dout1_7 vdout1_7ck135 = 0 time = 1360
* CHECK dout1_8 vdout1_8ck135 = 0 time = 1360
* CHECK dout1_9 vdout1_9ck135 = 0 time = 1360
* CHECK dout1_10 vdout1_10ck135 = 1.7 time = 1360
* CHECK dout1_11 vdout1_11ck135 = 1.7 time = 1360
* CHECK dout1_12 vdout1_12ck135 = 0 time = 1360
* CHECK dout1_13 vdout1_13ck135 = 0 time = 1360
* CHECK dout1_14 vdout1_14ck135 = 0 time = 1360
* CHECK dout1_15 vdout1_15ck135 = 1.7 time = 1360
* CHECK dout1_16 vdout1_16ck135 = 0 time = 1360
* CHECK dout1_0 vdout1_0ck136 = 0 time = 1370
* CHECK dout1_1 vdout1_1ck136 = 0 time = 1370
* CHECK dout1_2 vdout1_2ck136 = 0 time = 1370
* CHECK dout1_3 vdout1_3ck136 = 1.7 time = 1370
* CHECK dout1_4 vdout1_4ck136 = 1.7 time = 1370
* CHECK dout1_5 vdout1_5ck136 = 0 time = 1370
* CHECK dout1_6 vdout1_6ck136 = 1.7 time = 1370
* CHECK dout1_7 vdout1_7ck136 = 0 time = 1370
* CHECK dout1_8 vdout1_8ck136 = 0 time = 1370
* CHECK dout1_9 vdout1_9ck136 = 0 time = 1370
* CHECK dout1_10 vdout1_10ck136 = 1.7 time = 1370
* CHECK dout1_11 vdout1_11ck136 = 1.7 time = 1370
* CHECK dout1_12 vdout1_12ck136 = 1.7 time = 1370
* CHECK dout1_13 vdout1_13ck136 = 1.7 time = 1370
* CHECK dout1_14 vdout1_14ck136 = 0 time = 1370
* CHECK dout1_15 vdout1_15ck136 = 0 time = 1370
* CHECK dout1_16 vdout1_16ck136 = 0 time = 1370
* CHECK dout1_0 vdout1_0ck137 = 0 time = 1380
* CHECK dout1_1 vdout1_1ck137 = 1.7 time = 1380
* CHECK dout1_2 vdout1_2ck137 = 0 time = 1380
* CHECK dout1_3 vdout1_3ck137 = 0 time = 1380
* CHECK dout1_4 vdout1_4ck137 = 1.7 time = 1380
* CHECK dout1_5 vdout1_5ck137 = 1.7 time = 1380
* CHECK dout1_6 vdout1_6ck137 = 1.7 time = 1380
* CHECK dout1_7 vdout1_7ck137 = 0 time = 1380
* CHECK dout1_8 vdout1_8ck137 = 0 time = 1380
* CHECK dout1_9 vdout1_9ck137 = 0 time = 1380
* CHECK dout1_10 vdout1_10ck137 = 1.7 time = 1380
* CHECK dout1_11 vdout1_11ck137 = 1.7 time = 1380
* CHECK dout1_12 vdout1_12ck137 = 0 time = 1380
* CHECK dout1_13 vdout1_13ck137 = 0 time = 1380
* CHECK dout1_14 vdout1_14ck137 = 0 time = 1380
* CHECK dout1_15 vdout1_15ck137 = 1.7 time = 1380
* CHECK dout1_16 vdout1_16ck137 = 0 time = 1380
* CHECK dout1_0 vdout1_0ck139 = 0 time = 1400
* CHECK dout1_1 vdout1_1ck139 = 1.7 time = 1400
* CHECK dout1_2 vdout1_2ck139 = 0 time = 1400
* CHECK dout1_3 vdout1_3ck139 = 0 time = 1400
* CHECK dout1_4 vdout1_4ck139 = 1.7 time = 1400
* CHECK dout1_5 vdout1_5ck139 = 1.7 time = 1400
* CHECK dout1_6 vdout1_6ck139 = 1.7 time = 1400
* CHECK dout1_7 vdout1_7ck139 = 0 time = 1400
* CHECK dout1_8 vdout1_8ck139 = 0 time = 1400
* CHECK dout1_9 vdout1_9ck139 = 0 time = 1400
* CHECK dout1_10 vdout1_10ck139 = 1.7 time = 1400
* CHECK dout1_11 vdout1_11ck139 = 1.7 time = 1400
* CHECK dout1_12 vdout1_12ck139 = 0 time = 1400
* CHECK dout1_13 vdout1_13ck139 = 0 time = 1400
* CHECK dout1_14 vdout1_14ck139 = 0 time = 1400
* CHECK dout1_15 vdout1_15ck139 = 1.7 time = 1400
* CHECK dout1_16 vdout1_16ck139 = 0 time = 1400
* CHECK dout1_0 vdout1_0ck140 = 1.7 time = 1410
* CHECK dout1_1 vdout1_1ck140 = 0 time = 1410
* CHECK dout1_2 vdout1_2ck140 = 1.7 time = 1410
* CHECK dout1_3 vdout1_3ck140 = 0 time = 1410
* CHECK dout1_4 vdout1_4ck140 = 1.7 time = 1410
* CHECK dout1_5 vdout1_5ck140 = 1.7 time = 1410
* CHECK dout1_6 vdout1_6ck140 = 1.7 time = 1410
* CHECK dout1_7 vdout1_7ck140 = 1.7 time = 1410
* CHECK dout1_8 vdout1_8ck140 = 1.7 time = 1410
* CHECK dout1_9 vdout1_9ck140 = 0 time = 1410
* CHECK dout1_10 vdout1_10ck140 = 0 time = 1410
* CHECK dout1_11 vdout1_11ck140 = 1.7 time = 1410
* CHECK dout1_12 vdout1_12ck140 = 0 time = 1410
* CHECK dout1_13 vdout1_13ck140 = 1.7 time = 1410
* CHECK dout1_14 vdout1_14ck140 = 0 time = 1410
* CHECK dout1_15 vdout1_15ck140 = 0 time = 1410
* CHECK dout1_16 vdout1_16ck140 = 0 time = 1410
* CHECK dout1_0 vdout1_0ck142 = 1.7 time = 1430
* CHECK dout1_1 vdout1_1ck142 = 0 time = 1430
* CHECK dout1_2 vdout1_2ck142 = 0 time = 1430
* CHECK dout1_3 vdout1_3ck142 = 1.7 time = 1430
* CHECK dout1_4 vdout1_4ck142 = 0 time = 1430
* CHECK dout1_5 vdout1_5ck142 = 1.7 time = 1430
* CHECK dout1_6 vdout1_6ck142 = 1.7 time = 1430
* CHECK dout1_7 vdout1_7ck142 = 0 time = 1430
* CHECK dout1_8 vdout1_8ck142 = 0 time = 1430
* CHECK dout1_9 vdout1_9ck142 = 0 time = 1430
* CHECK dout1_10 vdout1_10ck142 = 0 time = 1430
* CHECK dout1_11 vdout1_11ck142 = 0 time = 1430
* CHECK dout1_12 vdout1_12ck142 = 0 time = 1430
* CHECK dout1_13 vdout1_13ck142 = 0 time = 1430
* CHECK dout1_14 vdout1_14ck142 = 1.7 time = 1430
* CHECK dout1_15 vdout1_15ck142 = 1.7 time = 1430
* CHECK dout1_16 vdout1_16ck142 = 0 time = 1430
* CHECK dout1_0 vdout1_0ck143 = 0 time = 1440
* CHECK dout1_1 vdout1_1ck143 = 1.7 time = 1440
* CHECK dout1_2 vdout1_2ck143 = 1.7 time = 1440
* CHECK dout1_3 vdout1_3ck143 = 1.7 time = 1440
* CHECK dout1_4 vdout1_4ck143 = 0 time = 1440
* CHECK dout1_5 vdout1_5ck143 = 1.7 time = 1440
* CHECK dout1_6 vdout1_6ck143 = 0 time = 1440
* CHECK dout1_7 vdout1_7ck143 = 0 time = 1440
* CHECK dout1_8 vdout1_8ck143 = 0 time = 1440
* CHECK dout1_9 vdout1_9ck143 = 1.7 time = 1440
* CHECK dout1_10 vdout1_10ck143 = 0 time = 1440
* CHECK dout1_11 vdout1_11ck143 = 0 time = 1440
* CHECK dout1_12 vdout1_12ck143 = 1.7 time = 1440
* CHECK dout1_13 vdout1_13ck143 = 1.7 time = 1440
* CHECK dout1_14 vdout1_14ck143 = 1.7 time = 1440
* CHECK dout1_15 vdout1_15ck143 = 1.7 time = 1440
* CHECK dout1_16 vdout1_16ck143 = 0 time = 1440
* CHECK dout1_0 vdout1_0ck147 = 1.7 time = 1480
* CHECK dout1_1 vdout1_1ck147 = 0 time = 1480
* CHECK dout1_2 vdout1_2ck147 = 0 time = 1480
* CHECK dout1_3 vdout1_3ck147 = 0 time = 1480
* CHECK dout1_4 vdout1_4ck147 = 1.7 time = 1480
* CHECK dout1_5 vdout1_5ck147 = 0 time = 1480
* CHECK dout1_6 vdout1_6ck147 = 1.7 time = 1480
* CHECK dout1_7 vdout1_7ck147 = 0 time = 1480
* CHECK dout1_8 vdout1_8ck147 = 1.7 time = 1480
* CHECK dout1_9 vdout1_9ck147 = 0 time = 1480
* CHECK dout1_10 vdout1_10ck147 = 1.7 time = 1480
* CHECK dout1_11 vdout1_11ck147 = 0 time = 1480
* CHECK dout1_12 vdout1_12ck147 = 1.7 time = 1480
* CHECK dout1_13 vdout1_13ck147 = 1.7 time = 1480
* CHECK dout1_14 vdout1_14ck147 = 0 time = 1480
* CHECK dout1_15 vdout1_15ck147 = 0 time = 1480
* CHECK dout1_16 vdout1_16ck147 = 0 time = 1480
* CHECK dout1_0 vdout1_0ck148 = 1.7 time = 1490
* CHECK dout1_1 vdout1_1ck148 = 1.7 time = 1490
* CHECK dout1_2 vdout1_2ck148 = 1.7 time = 1490
* CHECK dout1_3 vdout1_3ck148 = 0 time = 1490
* CHECK dout1_4 vdout1_4ck148 = 0 time = 1490
* CHECK dout1_5 vdout1_5ck148 = 1.7 time = 1490
* CHECK dout1_6 vdout1_6ck148 = 0 time = 1490
* CHECK dout1_7 vdout1_7ck148 = 1.7 time = 1490
* CHECK dout1_8 vdout1_8ck148 = 0 time = 1490
* CHECK dout1_9 vdout1_9ck148 = 0 time = 1490
* CHECK dout1_10 vdout1_10ck148 = 1.7 time = 1490
* CHECK dout1_11 vdout1_11ck148 = 0 time = 1490
* CHECK dout1_12 vdout1_12ck148 = 1.7 time = 1490
* CHECK dout1_13 vdout1_13ck148 = 1.7 time = 1490
* CHECK dout1_14 vdout1_14ck148 = 1.7 time = 1490
* CHECK dout1_15 vdout1_15ck148 = 1.7 time = 1490
* CHECK dout1_16 vdout1_16ck148 = 0 time = 1490
* CHECK dout1_0 vdout1_0ck149 = 1.7 time = 1500
* CHECK dout1_1 vdout1_1ck149 = 0 time = 1500
* CHECK dout1_2 vdout1_2ck149 = 0 time = 1500
* CHECK dout1_3 vdout1_3ck149 = 0 time = 1500
* CHECK dout1_4 vdout1_4ck149 = 1.7 time = 1500
* CHECK dout1_5 vdout1_5ck149 = 0 time = 1500
* CHECK dout1_6 vdout1_6ck149 = 1.7 time = 1500
* CHECK dout1_7 vdout1_7ck149 = 0 time = 1500
* CHECK dout1_8 vdout1_8ck149 = 1.7 time = 1500
* CHECK dout1_9 vdout1_9ck149 = 0 time = 1500
* CHECK dout1_10 vdout1_10ck149 = 1.7 time = 1500
* CHECK dout1_11 vdout1_11ck149 = 0 time = 1500
* CHECK dout1_12 vdout1_12ck149 = 1.7 time = 1500
* CHECK dout1_13 vdout1_13ck149 = 1.7 time = 1500
* CHECK dout1_14 vdout1_14ck149 = 0 time = 1500
* CHECK dout1_15 vdout1_15ck149 = 0 time = 1500
* CHECK dout1_16 vdout1_16ck149 = 0 time = 1500
* CHECK dout1_0 vdout1_0ck150 = 0 time = 1510
* CHECK dout1_1 vdout1_1ck150 = 1.7 time = 1510
* CHECK dout1_2 vdout1_2ck150 = 1.7 time = 1510
* CHECK dout1_3 vdout1_3ck150 = 1.7 time = 1510
* CHECK dout1_4 vdout1_4ck150 = 0 time = 1510
* CHECK dout1_5 vdout1_5ck150 = 1.7 time = 1510
* CHECK dout1_6 vdout1_6ck150 = 0 time = 1510
* CHECK dout1_7 vdout1_7ck150 = 0 time = 1510
* CHECK dout1_8 vdout1_8ck150 = 0 time = 1510
* CHECK dout1_9 vdout1_9ck150 = 1.7 time = 1510
* CHECK dout1_10 vdout1_10ck150 = 0 time = 1510
* CHECK dout1_11 vdout1_11ck150 = 0 time = 1510
* CHECK dout1_12 vdout1_12ck150 = 1.7 time = 1510
* CHECK dout1_13 vdout1_13ck150 = 1.7 time = 1510
* CHECK dout1_14 vdout1_14ck150 = 1.7 time = 1510
* CHECK dout1_15 vdout1_15ck150 = 1.7 time = 1510
* CHECK dout1_16 vdout1_16ck150 = 0 time = 1510
* CHECK dout1_0 vdout1_0ck151 = 1.7 time = 1520
* CHECK dout1_1 vdout1_1ck151 = 1.7 time = 1520
* CHECK dout1_2 vdout1_2ck151 = 1.7 time = 1520
* CHECK dout1_3 vdout1_3ck151 = 0 time = 1520
* CHECK dout1_4 vdout1_4ck151 = 0 time = 1520
* CHECK dout1_5 vdout1_5ck151 = 1.7 time = 1520
* CHECK dout1_6 vdout1_6ck151 = 0 time = 1520
* CHECK dout1_7 vdout1_7ck151 = 1.7 time = 1520
* CHECK dout1_8 vdout1_8ck151 = 0 time = 1520
* CHECK dout1_9 vdout1_9ck151 = 0 time = 1520
* CHECK dout1_10 vdout1_10ck151 = 1.7 time = 1520
* CHECK dout1_11 vdout1_11ck151 = 0 time = 1520
* CHECK dout1_12 vdout1_12ck151 = 1.7 time = 1520
* CHECK dout1_13 vdout1_13ck151 = 1.7 time = 1520
* CHECK dout1_14 vdout1_14ck151 = 1.7 time = 1520
* CHECK dout1_15 vdout1_15ck151 = 1.7 time = 1520
* CHECK dout1_16 vdout1_16ck151 = 0 time = 1520
* CHECK dout1_0 vdout1_0ck153 = 0 time = 1540
* CHECK dout1_1 vdout1_1ck153 = 1.7 time = 1540
* CHECK dout1_2 vdout1_2ck153 = 1.7 time = 1540
* CHECK dout1_3 vdout1_3ck153 = 1.7 time = 1540
* CHECK dout1_4 vdout1_4ck153 = 0 time = 1540
* CHECK dout1_5 vdout1_5ck153 = 1.7 time = 1540
* CHECK dout1_6 vdout1_6ck153 = 0 time = 1540
* CHECK dout1_7 vdout1_7ck153 = 0 time = 1540
* CHECK dout1_8 vdout1_8ck153 = 0 time = 1540
* CHECK dout1_9 vdout1_9ck153 = 1.7 time = 1540
* CHECK dout1_10 vdout1_10ck153 = 0 time = 1540
* CHECK dout1_11 vdout1_11ck153 = 0 time = 1540
* CHECK dout1_12 vdout1_12ck153 = 1.7 time = 1540
* CHECK dout1_13 vdout1_13ck153 = 1.7 time = 1540
* CHECK dout1_14 vdout1_14ck153 = 1.7 time = 1540
* CHECK dout1_15 vdout1_15ck153 = 1.7 time = 1540
* CHECK dout1_16 vdout1_16ck153 = 0 time = 1540
* CHECK dout1_0 vdout1_0ck155 = 0 time = 1560
* CHECK dout1_1 vdout1_1ck155 = 1.7 time = 1560
* CHECK dout1_2 vdout1_2ck155 = 1.7 time = 1560
* CHECK dout1_3 vdout1_3ck155 = 1.7 time = 1560
* CHECK dout1_4 vdout1_4ck155 = 0 time = 1560
* CHECK dout1_5 vdout1_5ck155 = 1.7 time = 1560
* CHECK dout1_6 vdout1_6ck155 = 0 time = 1560
* CHECK dout1_7 vdout1_7ck155 = 0 time = 1560
* CHECK dout1_8 vdout1_8ck155 = 0 time = 1560
* CHECK dout1_9 vdout1_9ck155 = 1.7 time = 1560
* CHECK dout1_10 vdout1_10ck155 = 0 time = 1560
* CHECK dout1_11 vdout1_11ck155 = 0 time = 1560
* CHECK dout1_12 vdout1_12ck155 = 1.7 time = 1560
* CHECK dout1_13 vdout1_13ck155 = 1.7 time = 1560
* CHECK dout1_14 vdout1_14ck155 = 1.7 time = 1560
* CHECK dout1_15 vdout1_15ck155 = 1.7 time = 1560
* CHECK dout1_16 vdout1_16ck155 = 0 time = 1560
* CHECK dout1_0 vdout1_0ck156 = 1.7 time = 1570
* CHECK dout1_1 vdout1_1ck156 = 1.7 time = 1570
* CHECK dout1_2 vdout1_2ck156 = 1.7 time = 1570
* CHECK dout1_3 vdout1_3ck156 = 0 time = 1570
* CHECK dout1_4 vdout1_4ck156 = 0 time = 1570
* CHECK dout1_5 vdout1_5ck156 = 1.7 time = 1570
* CHECK dout1_6 vdout1_6ck156 = 0 time = 1570
* CHECK dout1_7 vdout1_7ck156 = 1.7 time = 1570
* CHECK dout1_8 vdout1_8ck156 = 0 time = 1570
* CHECK dout1_9 vdout1_9ck156 = 0 time = 1570
* CHECK dout1_10 vdout1_10ck156 = 1.7 time = 1570
* CHECK dout1_11 vdout1_11ck156 = 0 time = 1570
* CHECK dout1_12 vdout1_12ck156 = 1.7 time = 1570
* CHECK dout1_13 vdout1_13ck156 = 1.7 time = 1570
* CHECK dout1_14 vdout1_14ck156 = 1.7 time = 1570
* CHECK dout1_15 vdout1_15ck156 = 1.7 time = 1570
* CHECK dout1_16 vdout1_16ck156 = 0 time = 1570
* CHECK dout1_0 vdout1_0ck159 = 1.7 time = 1600
* CHECK dout1_1 vdout1_1ck159 = 0 time = 1600
* CHECK dout1_2 vdout1_2ck159 = 1.7 time = 1600
* CHECK dout1_3 vdout1_3ck159 = 1.7 time = 1600
* CHECK dout1_4 vdout1_4ck159 = 1.7 time = 1600
* CHECK dout1_5 vdout1_5ck159 = 1.7 time = 1600
* CHECK dout1_6 vdout1_6ck159 = 0 time = 1600
* CHECK dout1_7 vdout1_7ck159 = 0 time = 1600
* CHECK dout1_8 vdout1_8ck159 = 0 time = 1600
* CHECK dout1_9 vdout1_9ck159 = 0 time = 1600
* CHECK dout1_10 vdout1_10ck159 = 0 time = 1600
* CHECK dout1_11 vdout1_11ck159 = 0 time = 1600
* CHECK dout1_12 vdout1_12ck159 = 0 time = 1600
* CHECK dout1_13 vdout1_13ck159 = 0 time = 1600
* CHECK dout1_14 vdout1_14ck159 = 0 time = 1600
* CHECK dout1_15 vdout1_15ck159 = 0 time = 1600
* CHECK dout1_16 vdout1_16ck159 = 0 time = 1600
* CHECK dout1_0 vdout1_0ck162 = 1.7 time = 1630
* CHECK dout1_1 vdout1_1ck162 = 0 time = 1630
* CHECK dout1_2 vdout1_2ck162 = 1.7 time = 1630
* CHECK dout1_3 vdout1_3ck162 = 1.7 time = 1630
* CHECK dout1_4 vdout1_4ck162 = 1.7 time = 1630
* CHECK dout1_5 vdout1_5ck162 = 1.7 time = 1630
* CHECK dout1_6 vdout1_6ck162 = 0 time = 1630
* CHECK dout1_7 vdout1_7ck162 = 0 time = 1630
* CHECK dout1_8 vdout1_8ck162 = 0 time = 1630
* CHECK dout1_9 vdout1_9ck162 = 0 time = 1630
* CHECK dout1_10 vdout1_10ck162 = 0 time = 1630
* CHECK dout1_11 vdout1_11ck162 = 0 time = 1630
* CHECK dout1_12 vdout1_12ck162 = 0 time = 1630
* CHECK dout1_13 vdout1_13ck162 = 0 time = 1630
* CHECK dout1_14 vdout1_14ck162 = 0 time = 1630
* CHECK dout1_15 vdout1_15ck162 = 0 time = 1630
* CHECK dout1_16 vdout1_16ck162 = 0 time = 1630
* CHECK dout1_0 vdout1_0ck163 = 0 time = 1640
* CHECK dout1_1 vdout1_1ck163 = 1.7 time = 1640
* CHECK dout1_2 vdout1_2ck163 = 0 time = 1640
* CHECK dout1_3 vdout1_3ck163 = 1.7 time = 1640
* CHECK dout1_4 vdout1_4ck163 = 0 time = 1640
* CHECK dout1_5 vdout1_5ck163 = 0 time = 1640
* CHECK dout1_6 vdout1_6ck163 = 1.7 time = 1640
* CHECK dout1_7 vdout1_7ck163 = 1.7 time = 1640
* CHECK dout1_8 vdout1_8ck163 = 0 time = 1640
* CHECK dout1_9 vdout1_9ck163 = 0 time = 1640
* CHECK dout1_10 vdout1_10ck163 = 0 time = 1640
* CHECK dout1_11 vdout1_11ck163 = 0 time = 1640
* CHECK dout1_12 vdout1_12ck163 = 0 time = 1640
* CHECK dout1_13 vdout1_13ck163 = 1.7 time = 1640
* CHECK dout1_14 vdout1_14ck163 = 1.7 time = 1640
* CHECK dout1_15 vdout1_15ck163 = 1.7 time = 1640
* CHECK dout1_16 vdout1_16ck163 = 0 time = 1640
* CHECK dout1_0 vdout1_0ck164 = 1.7 time = 1650
* CHECK dout1_1 vdout1_1ck164 = 0 time = 1650
* CHECK dout1_2 vdout1_2ck164 = 0 time = 1650
* CHECK dout1_3 vdout1_3ck164 = 0 time = 1650
* CHECK dout1_4 vdout1_4ck164 = 0 time = 1650
* CHECK dout1_5 vdout1_5ck164 = 0 time = 1650
* CHECK dout1_6 vdout1_6ck164 = 0 time = 1650
* CHECK dout1_7 vdout1_7ck164 = 0 time = 1650
* CHECK dout1_8 vdout1_8ck164 = 1.7 time = 1650
* CHECK dout1_9 vdout1_9ck164 = 1.7 time = 1650
* CHECK dout1_10 vdout1_10ck164 = 0 time = 1650
* CHECK dout1_11 vdout1_11ck164 = 1.7 time = 1650
* CHECK dout1_12 vdout1_12ck164 = 0 time = 1650
* CHECK dout1_13 vdout1_13ck164 = 0 time = 1650
* CHECK dout1_14 vdout1_14ck164 = 0 time = 1650
* CHECK dout1_15 vdout1_15ck164 = 1.7 time = 1650
* CHECK dout1_16 vdout1_16ck164 = 0 time = 1650
* CHECK dout1_0 vdout1_0ck168 = 1.7 time = 1690
* CHECK dout1_1 vdout1_1ck168 = 0 time = 1690
* CHECK dout1_2 vdout1_2ck168 = 1.7 time = 1690
* CHECK dout1_3 vdout1_3ck168 = 1.7 time = 1690
* CHECK dout1_4 vdout1_4ck168 = 1.7 time = 1690
* CHECK dout1_5 vdout1_5ck168 = 1.7 time = 1690
* CHECK dout1_6 vdout1_6ck168 = 0 time = 1690
* CHECK dout1_7 vdout1_7ck168 = 0 time = 1690
* CHECK dout1_8 vdout1_8ck168 = 1.7 time = 1690
* CHECK dout1_9 vdout1_9ck168 = 1.7 time = 1690
* CHECK dout1_10 vdout1_10ck168 = 1.7 time = 1690
* CHECK dout1_11 vdout1_11ck168 = 0 time = 1690
* CHECK dout1_12 vdout1_12ck168 = 0 time = 1690
* CHECK dout1_13 vdout1_13ck168 = 1.7 time = 1690
* CHECK dout1_14 vdout1_14ck168 = 1.7 time = 1690
* CHECK dout1_15 vdout1_15ck168 = 0 time = 1690
* CHECK dout1_16 vdout1_16ck168 = 0 time = 1690
* CHECK dout1_0 vdout1_0ck170 = 0 time = 1710
* CHECK dout1_1 vdout1_1ck170 = 1.7 time = 1710
* CHECK dout1_2 vdout1_2ck170 = 0 time = 1710
* CHECK dout1_3 vdout1_3ck170 = 1.7 time = 1710
* CHECK dout1_4 vdout1_4ck170 = 0 time = 1710
* CHECK dout1_5 vdout1_5ck170 = 0 time = 1710
* CHECK dout1_6 vdout1_6ck170 = 1.7 time = 1710
* CHECK dout1_7 vdout1_7ck170 = 0 time = 1710
* CHECK dout1_8 vdout1_8ck170 = 0 time = 1710
* CHECK dout1_9 vdout1_9ck170 = 1.7 time = 1710
* CHECK dout1_10 vdout1_10ck170 = 1.7 time = 1710
* CHECK dout1_11 vdout1_11ck170 = 1.7 time = 1710
* CHECK dout1_12 vdout1_12ck170 = 0 time = 1710
* CHECK dout1_13 vdout1_13ck170 = 0 time = 1710
* CHECK dout1_14 vdout1_14ck170 = 0 time = 1710
* CHECK dout1_15 vdout1_15ck170 = 0 time = 1710
* CHECK dout1_16 vdout1_16ck170 = 0 time = 1710
* CHECK dout1_0 vdout1_0ck171 = 1.7 time = 1720
* CHECK dout1_1 vdout1_1ck171 = 0 time = 1720
* CHECK dout1_2 vdout1_2ck171 = 0 time = 1720
* CHECK dout1_3 vdout1_3ck171 = 1.7 time = 1720
* CHECK dout1_4 vdout1_4ck171 = 1.7 time = 1720
* CHECK dout1_5 vdout1_5ck171 = 1.7 time = 1720
* CHECK dout1_6 vdout1_6ck171 = 0 time = 1720
* CHECK dout1_7 vdout1_7ck171 = 1.7 time = 1720
* CHECK dout1_8 vdout1_8ck171 = 0 time = 1720
* CHECK dout1_9 vdout1_9ck171 = 0 time = 1720
* CHECK dout1_10 vdout1_10ck171 = 0 time = 1720
* CHECK dout1_11 vdout1_11ck171 = 1.7 time = 1720
* CHECK dout1_12 vdout1_12ck171 = 0 time = 1720
* CHECK dout1_13 vdout1_13ck171 = 0 time = 1720
* CHECK dout1_14 vdout1_14ck171 = 1.7 time = 1720
* CHECK dout1_15 vdout1_15ck171 = 1.7 time = 1720
* CHECK dout1_16 vdout1_16ck171 = 0 time = 1720
* CHECK dout1_0 vdout1_0ck173 = 1.7 time = 1740
* CHECK dout1_1 vdout1_1ck173 = 0 time = 1740
* CHECK dout1_2 vdout1_2ck173 = 0 time = 1740
* CHECK dout1_3 vdout1_3ck173 = 1.7 time = 1740
* CHECK dout1_4 vdout1_4ck173 = 1.7 time = 1740
* CHECK dout1_5 vdout1_5ck173 = 1.7 time = 1740
* CHECK dout1_6 vdout1_6ck173 = 0 time = 1740
* CHECK dout1_7 vdout1_7ck173 = 1.7 time = 1740
* CHECK dout1_8 vdout1_8ck173 = 0 time = 1740
* CHECK dout1_9 vdout1_9ck173 = 0 time = 1740
* CHECK dout1_10 vdout1_10ck173 = 0 time = 1740
* CHECK dout1_11 vdout1_11ck173 = 1.7 time = 1740
* CHECK dout1_12 vdout1_12ck173 = 0 time = 1740
* CHECK dout1_13 vdout1_13ck173 = 0 time = 1740
* CHECK dout1_14 vdout1_14ck173 = 1.7 time = 1740
* CHECK dout1_15 vdout1_15ck173 = 1.7 time = 1740
* CHECK dout1_16 vdout1_16ck173 = 0 time = 1740
* CHECK dout1_0 vdout1_0ck174 = 1.7 time = 1750
* CHECK dout1_1 vdout1_1ck174 = 0 time = 1750
* CHECK dout1_2 vdout1_2ck174 = 0 time = 1750
* CHECK dout1_3 vdout1_3ck174 = 0 time = 1750
* CHECK dout1_4 vdout1_4ck174 = 0 time = 1750
* CHECK dout1_5 vdout1_5ck174 = 0 time = 1750
* CHECK dout1_6 vdout1_6ck174 = 0 time = 1750
* CHECK dout1_7 vdout1_7ck174 = 0 time = 1750
* CHECK dout1_8 vdout1_8ck174 = 1.7 time = 1750
* CHECK dout1_9 vdout1_9ck174 = 1.7 time = 1750
* CHECK dout1_10 vdout1_10ck174 = 0 time = 1750
* CHECK dout1_11 vdout1_11ck174 = 1.7 time = 1750
* CHECK dout1_12 vdout1_12ck174 = 0 time = 1750
* CHECK dout1_13 vdout1_13ck174 = 0 time = 1750
* CHECK dout1_14 vdout1_14ck174 = 0 time = 1750
* CHECK dout1_15 vdout1_15ck174 = 1.7 time = 1750
* CHECK dout1_16 vdout1_16ck174 = 0 time = 1750
* CHECK dout1_0 vdout1_0ck178 = 0 time = 1790
* CHECK dout1_1 vdout1_1ck178 = 1.7 time = 1790
* CHECK dout1_2 vdout1_2ck178 = 0 time = 1790
* CHECK dout1_3 vdout1_3ck178 = 1.7 time = 1790
* CHECK dout1_4 vdout1_4ck178 = 0 time = 1790
* CHECK dout1_5 vdout1_5ck178 = 0 time = 1790
* CHECK dout1_6 vdout1_6ck178 = 1.7 time = 1790
* CHECK dout1_7 vdout1_7ck178 = 0 time = 1790
* CHECK dout1_8 vdout1_8ck178 = 0 time = 1790
* CHECK dout1_9 vdout1_9ck178 = 1.7 time = 1790
* CHECK dout1_10 vdout1_10ck178 = 1.7 time = 1790
* CHECK dout1_11 vdout1_11ck178 = 1.7 time = 1790
* CHECK dout1_12 vdout1_12ck178 = 0 time = 1790
* CHECK dout1_13 vdout1_13ck178 = 0 time = 1790
* CHECK dout1_14 vdout1_14ck178 = 0 time = 1790
* CHECK dout1_15 vdout1_15ck178 = 0 time = 1790
* CHECK dout1_16 vdout1_16ck178 = 0 time = 1790
* CHECK dout1_0 vdout1_0ck181 = 1.7 time = 1820
* CHECK dout1_1 vdout1_1ck181 = 0 time = 1820
* CHECK dout1_2 vdout1_2ck181 = 1.7 time = 1820
* CHECK dout1_3 vdout1_3ck181 = 1.7 time = 1820
* CHECK dout1_4 vdout1_4ck181 = 1.7 time = 1820
* CHECK dout1_5 vdout1_5ck181 = 1.7 time = 1820
* CHECK dout1_6 vdout1_6ck181 = 0 time = 1820
* CHECK dout1_7 vdout1_7ck181 = 0 time = 1820
* CHECK dout1_8 vdout1_8ck181 = 1.7 time = 1820
* CHECK dout1_9 vdout1_9ck181 = 1.7 time = 1820
* CHECK dout1_10 vdout1_10ck181 = 1.7 time = 1820
* CHECK dout1_11 vdout1_11ck181 = 0 time = 1820
* CHECK dout1_12 vdout1_12ck181 = 0 time = 1820
* CHECK dout1_13 vdout1_13ck181 = 1.7 time = 1820
* CHECK dout1_14 vdout1_14ck181 = 1.7 time = 1820
* CHECK dout1_15 vdout1_15ck181 = 0 time = 1820
* CHECK dout1_16 vdout1_16ck181 = 0 time = 1820
* CHECK dout1_0 vdout1_0ck182 = 0 time = 1830
* CHECK dout1_1 vdout1_1ck182 = 1.7 time = 1830
* CHECK dout1_2 vdout1_2ck182 = 1.7 time = 1830
* CHECK dout1_3 vdout1_3ck182 = 0 time = 1830
* CHECK dout1_4 vdout1_4ck182 = 1.7 time = 1830
* CHECK dout1_5 vdout1_5ck182 = 0 time = 1830
* CHECK dout1_6 vdout1_6ck182 = 0 time = 1830
* CHECK dout1_7 vdout1_7ck182 = 1.7 time = 1830
* CHECK dout1_8 vdout1_8ck182 = 0 time = 1830
* CHECK dout1_9 vdout1_9ck182 = 0 time = 1830
* CHECK dout1_10 vdout1_10ck182 = 1.7 time = 1830
* CHECK dout1_11 vdout1_11ck182 = 0 time = 1830
* CHECK dout1_12 vdout1_12ck182 = 0 time = 1830
* CHECK dout1_13 vdout1_13ck182 = 0 time = 1830
* CHECK dout1_14 vdout1_14ck182 = 1.7 time = 1830
* CHECK dout1_15 vdout1_15ck182 = 1.7 time = 1830
* CHECK dout1_16 vdout1_16ck182 = 0 time = 1830
* CHECK dout1_0 vdout1_0ck183 = 0 time = 1840
* CHECK dout1_1 vdout1_1ck183 = 1.7 time = 1840
* CHECK dout1_2 vdout1_2ck183 = 0 time = 1840
* CHECK dout1_3 vdout1_3ck183 = 1.7 time = 1840
* CHECK dout1_4 vdout1_4ck183 = 0 time = 1840
* CHECK dout1_5 vdout1_5ck183 = 0 time = 1840
* CHECK dout1_6 vdout1_6ck183 = 1.7 time = 1840
* CHECK dout1_7 vdout1_7ck183 = 0 time = 1840
* CHECK dout1_8 vdout1_8ck183 = 0 time = 1840
* CHECK dout1_9 vdout1_9ck183 = 1.7 time = 1840
* CHECK dout1_10 vdout1_10ck183 = 1.7 time = 1840
* CHECK dout1_11 vdout1_11ck183 = 1.7 time = 1840
* CHECK dout1_12 vdout1_12ck183 = 0 time = 1840
* CHECK dout1_13 vdout1_13ck183 = 0 time = 1840
* CHECK dout1_14 vdout1_14ck183 = 0 time = 1840
* CHECK dout1_15 vdout1_15ck183 = 0 time = 1840
* CHECK dout1_16 vdout1_16ck183 = 0 time = 1840
* CHECK dout1_0 vdout1_0ck185 = 1.7 time = 1860
* CHECK dout1_1 vdout1_1ck185 = 1.7 time = 1860
* CHECK dout1_2 vdout1_2ck185 = 1.7 time = 1860
* CHECK dout1_3 vdout1_3ck185 = 0 time = 1860
* CHECK dout1_4 vdout1_4ck185 = 0 time = 1860
* CHECK dout1_5 vdout1_5ck185 = 1.7 time = 1860
* CHECK dout1_6 vdout1_6ck185 = 1.7 time = 1860
* CHECK dout1_7 vdout1_7ck185 = 1.7 time = 1860
* CHECK dout1_8 vdout1_8ck185 = 1.7 time = 1860
* CHECK dout1_9 vdout1_9ck185 = 0 time = 1860
* CHECK dout1_10 vdout1_10ck185 = 1.7 time = 1860
* CHECK dout1_11 vdout1_11ck185 = 0 time = 1860
* CHECK dout1_12 vdout1_12ck185 = 1.7 time = 1860
* CHECK dout1_13 vdout1_13ck185 = 1.7 time = 1860
* CHECK dout1_14 vdout1_14ck185 = 0 time = 1860
* CHECK dout1_15 vdout1_15ck185 = 1.7 time = 1860
* CHECK dout1_16 vdout1_16ck185 = 0 time = 1860
* CHECK dout1_0 vdout1_0ck186 = 0 time = 1870
* CHECK dout1_1 vdout1_1ck186 = 1.7 time = 1870
* CHECK dout1_2 vdout1_2ck186 = 1.7 time = 1870
* CHECK dout1_3 vdout1_3ck186 = 0 time = 1870
* CHECK dout1_4 vdout1_4ck186 = 1.7 time = 1870
* CHECK dout1_5 vdout1_5ck186 = 0 time = 1870
* CHECK dout1_6 vdout1_6ck186 = 0 time = 1870
* CHECK dout1_7 vdout1_7ck186 = 1.7 time = 1870
* CHECK dout1_8 vdout1_8ck186 = 0 time = 1870
* CHECK dout1_9 vdout1_9ck186 = 0 time = 1870
* CHECK dout1_10 vdout1_10ck186 = 1.7 time = 1870
* CHECK dout1_11 vdout1_11ck186 = 0 time = 1870
* CHECK dout1_12 vdout1_12ck186 = 0 time = 1870
* CHECK dout1_13 vdout1_13ck186 = 0 time = 1870
* CHECK dout1_14 vdout1_14ck186 = 1.7 time = 1870
* CHECK dout1_15 vdout1_15ck186 = 1.7 time = 1870
* CHECK dout1_16 vdout1_16ck186 = 0 time = 1870
* CHECK dout1_0 vdout1_0ck188 = 1.7 time = 1890
* CHECK dout1_1 vdout1_1ck188 = 1.7 time = 1890
* CHECK dout1_2 vdout1_2ck188 = 1.7 time = 1890
* CHECK dout1_3 vdout1_3ck188 = 0 time = 1890
* CHECK dout1_4 vdout1_4ck188 = 0 time = 1890
* CHECK dout1_5 vdout1_5ck188 = 1.7 time = 1890
* CHECK dout1_6 vdout1_6ck188 = 1.7 time = 1890
* CHECK dout1_7 vdout1_7ck188 = 1.7 time = 1890
* CHECK dout1_8 vdout1_8ck188 = 1.7 time = 1890
* CHECK dout1_9 vdout1_9ck188 = 0 time = 1890
* CHECK dout1_10 vdout1_10ck188 = 1.7 time = 1890
* CHECK dout1_11 vdout1_11ck188 = 0 time = 1890
* CHECK dout1_12 vdout1_12ck188 = 1.7 time = 1890
* CHECK dout1_13 vdout1_13ck188 = 1.7 time = 1890
* CHECK dout1_14 vdout1_14ck188 = 0 time = 1890
* CHECK dout1_15 vdout1_15ck188 = 1.7 time = 1890
* CHECK dout1_16 vdout1_16ck188 = 0 time = 1890
* CHECK dout1_0 vdout1_0ck189 = 0 time = 1900
* CHECK dout1_1 vdout1_1ck189 = 1.7 time = 1900
* CHECK dout1_2 vdout1_2ck189 = 1.7 time = 1900
* CHECK dout1_3 vdout1_3ck189 = 0 time = 1900
* CHECK dout1_4 vdout1_4ck189 = 1.7 time = 1900
* CHECK dout1_5 vdout1_5ck189 = 0 time = 1900
* CHECK dout1_6 vdout1_6ck189 = 0 time = 1900
* CHECK dout1_7 vdout1_7ck189 = 1.7 time = 1900
* CHECK dout1_8 vdout1_8ck189 = 0 time = 1900
* CHECK dout1_9 vdout1_9ck189 = 0 time = 1900
* CHECK dout1_10 vdout1_10ck189 = 1.7 time = 1900
* CHECK dout1_11 vdout1_11ck189 = 0 time = 1900
* CHECK dout1_12 vdout1_12ck189 = 0 time = 1900
* CHECK dout1_13 vdout1_13ck189 = 0 time = 1900
* CHECK dout1_14 vdout1_14ck189 = 1.7 time = 1900
* CHECK dout1_15 vdout1_15ck189 = 1.7 time = 1900
* CHECK dout1_16 vdout1_16ck189 = 0 time = 1900
* CHECK dout1_0 vdout1_0ck192 = 0 time = 1930
* CHECK dout1_1 vdout1_1ck192 = 0 time = 1930
* CHECK dout1_2 vdout1_2ck192 = 0 time = 1930
* CHECK dout1_3 vdout1_3ck192 = 0 time = 1930
* CHECK dout1_4 vdout1_4ck192 = 0 time = 1930
* CHECK dout1_5 vdout1_5ck192 = 0 time = 1930
* CHECK dout1_6 vdout1_6ck192 = 0 time = 1930
* CHECK dout1_7 vdout1_7ck192 = 1.7 time = 1930
* CHECK dout1_8 vdout1_8ck192 = 0 time = 1930
* CHECK dout1_9 vdout1_9ck192 = 1.7 time = 1930
* CHECK dout1_10 vdout1_10ck192 = 0 time = 1930
* CHECK dout1_11 vdout1_11ck192 = 0 time = 1930
* CHECK dout1_12 vdout1_12ck192 = 0 time = 1930
* CHECK dout1_13 vdout1_13ck192 = 1.7 time = 1930
* CHECK dout1_14 vdout1_14ck192 = 0 time = 1930
* CHECK dout1_15 vdout1_15ck192 = 1.7 time = 1930
* CHECK dout1_16 vdout1_16ck192 = 0 time = 1930
* CHECK dout1_0 vdout1_0ck195 = 1.7 time = 1960
* CHECK dout1_1 vdout1_1ck195 = 1.7 time = 1960
* CHECK dout1_2 vdout1_2ck195 = 1.7 time = 1960
* CHECK dout1_3 vdout1_3ck195 = 1.7 time = 1960
* CHECK dout1_4 vdout1_4ck195 = 1.7 time = 1960
* CHECK dout1_5 vdout1_5ck195 = 0 time = 1960
* CHECK dout1_6 vdout1_6ck195 = 1.7 time = 1960
* CHECK dout1_7 vdout1_7ck195 = 0 time = 1960
* CHECK dout1_8 vdout1_8ck195 = 0 time = 1960
* CHECK dout1_9 vdout1_9ck195 = 1.7 time = 1960
* CHECK dout1_10 vdout1_10ck195 = 0 time = 1960
* CHECK dout1_11 vdout1_11ck195 = 0 time = 1960
* CHECK dout1_12 vdout1_12ck195 = 1.7 time = 1960
* CHECK dout1_13 vdout1_13ck195 = 1.7 time = 1960
* CHECK dout1_14 vdout1_14ck195 = 1.7 time = 1960
* CHECK dout1_15 vdout1_15ck195 = 0 time = 1960
* CHECK dout1_16 vdout1_16ck195 = 0 time = 1960
* CHECK dout1_0 vdout1_0ck198 = 0 time = 1990
* CHECK dout1_1 vdout1_1ck198 = 0 time = 1990
* CHECK dout1_2 vdout1_2ck198 = 0 time = 1990
* CHECK dout1_3 vdout1_3ck198 = 0 time = 1990
* CHECK dout1_4 vdout1_4ck198 = 0 time = 1990
* CHECK dout1_5 vdout1_5ck198 = 0 time = 1990
* CHECK dout1_6 vdout1_6ck198 = 0 time = 1990
* CHECK dout1_7 vdout1_7ck198 = 1.7 time = 1990
* CHECK dout1_8 vdout1_8ck198 = 0 time = 1990
* CHECK dout1_9 vdout1_9ck198 = 1.7 time = 1990
* CHECK dout1_10 vdout1_10ck198 = 0 time = 1990
* CHECK dout1_11 vdout1_11ck198 = 0 time = 1990
* CHECK dout1_12 vdout1_12ck198 = 0 time = 1990
* CHECK dout1_13 vdout1_13ck198 = 1.7 time = 1990
* CHECK dout1_14 vdout1_14ck198 = 0 time = 1990
* CHECK dout1_15 vdout1_15ck198 = 1.7 time = 1990
* CHECK dout1_16 vdout1_16ck198 = 0 time = 1990
* CHECK dout1_0 vdout1_0ck200 = 1.7 time = 2010
* CHECK dout1_1 vdout1_1ck200 = 0 time = 2010
* CHECK dout1_2 vdout1_2ck200 = 0 time = 2010
* CHECK dout1_3 vdout1_3ck200 = 1.7 time = 2010
* CHECK dout1_4 vdout1_4ck200 = 0 time = 2010
* CHECK dout1_5 vdout1_5ck200 = 1.7 time = 2010
* CHECK dout1_6 vdout1_6ck200 = 0 time = 2010
* CHECK dout1_7 vdout1_7ck200 = 1.7 time = 2010
* CHECK dout1_8 vdout1_8ck200 = 0 time = 2010
* CHECK dout1_9 vdout1_9ck200 = 0 time = 2010
* CHECK dout1_10 vdout1_10ck200 = 1.7 time = 2010
* CHECK dout1_11 vdout1_11ck200 = 1.7 time = 2010
* CHECK dout1_12 vdout1_12ck200 = 0 time = 2010
* CHECK dout1_13 vdout1_13ck200 = 0 time = 2010
* CHECK dout1_14 vdout1_14ck200 = 0 time = 2010
* CHECK dout1_15 vdout1_15ck200 = 0 time = 2010
* CHECK dout1_16 vdout1_16ck200 = 0 time = 2010
* CHECK dout1_0 vdout1_0ck201 = 0 time = 2020
* CHECK dout1_1 vdout1_1ck201 = 0 time = 2020
* CHECK dout1_2 vdout1_2ck201 = 0 time = 2020
* CHECK dout1_3 vdout1_3ck201 = 0 time = 2020
* CHECK dout1_4 vdout1_4ck201 = 0 time = 2020
* CHECK dout1_5 vdout1_5ck201 = 0 time = 2020
* CHECK dout1_6 vdout1_6ck201 = 0 time = 2020
* CHECK dout1_7 vdout1_7ck201 = 1.7 time = 2020
* CHECK dout1_8 vdout1_8ck201 = 0 time = 2020
* CHECK dout1_9 vdout1_9ck201 = 1.7 time = 2020
* CHECK dout1_10 vdout1_10ck201 = 0 time = 2020
* CHECK dout1_11 vdout1_11ck201 = 0 time = 2020
* CHECK dout1_12 vdout1_12ck201 = 0 time = 2020
* CHECK dout1_13 vdout1_13ck201 = 1.7 time = 2020
* CHECK dout1_14 vdout1_14ck201 = 0 time = 2020
* CHECK dout1_15 vdout1_15ck201 = 1.7 time = 2020
* CHECK dout1_16 vdout1_16ck201 = 0 time = 2020
* CHECK dout1_0 vdout1_0ck202 = 1.7 time = 2030
* CHECK dout1_1 vdout1_1ck202 = 1.7 time = 2030
* CHECK dout1_2 vdout1_2ck202 = 1.7 time = 2030
* CHECK dout1_3 vdout1_3ck202 = 1.7 time = 2030
* CHECK dout1_4 vdout1_4ck202 = 1.7 time = 2030
* CHECK dout1_5 vdout1_5ck202 = 0 time = 2030
* CHECK dout1_6 vdout1_6ck202 = 1.7 time = 2030
* CHECK dout1_7 vdout1_7ck202 = 0 time = 2030
* CHECK dout1_8 vdout1_8ck202 = 0 time = 2030
* CHECK dout1_9 vdout1_9ck202 = 1.7 time = 2030
* CHECK dout1_10 vdout1_10ck202 = 0 time = 2030
* CHECK dout1_11 vdout1_11ck202 = 0 time = 2030
* CHECK dout1_12 vdout1_12ck202 = 1.7 time = 2030
* CHECK dout1_13 vdout1_13ck202 = 1.7 time = 2030
* CHECK dout1_14 vdout1_14ck202 = 1.7 time = 2030
* CHECK dout1_15 vdout1_15ck202 = 0 time = 2030
* CHECK dout1_16 vdout1_16ck202 = 0 time = 2030
* CHECK dout1_0 vdout1_0ck203 = 0 time = 2040
* CHECK dout1_1 vdout1_1ck203 = 1.7 time = 2040
* CHECK dout1_2 vdout1_2ck203 = 1.7 time = 2040
* CHECK dout1_3 vdout1_3ck203 = 1.7 time = 2040
* CHECK dout1_4 vdout1_4ck203 = 0 time = 2040
* CHECK dout1_5 vdout1_5ck203 = 0 time = 2040
* CHECK dout1_6 vdout1_6ck203 = 1.7 time = 2040
* CHECK dout1_7 vdout1_7ck203 = 0 time = 2040
* CHECK dout1_8 vdout1_8ck203 = 1.7 time = 2040
* CHECK dout1_9 vdout1_9ck203 = 0 time = 2040
* CHECK dout1_10 vdout1_10ck203 = 1.7 time = 2040
* CHECK dout1_11 vdout1_11ck203 = 0 time = 2040
* CHECK dout1_12 vdout1_12ck203 = 0 time = 2040
* CHECK dout1_13 vdout1_13ck203 = 1.7 time = 2040
* CHECK dout1_14 vdout1_14ck203 = 1.7 time = 2040
* CHECK dout1_15 vdout1_15ck203 = 1.7 time = 2040
* CHECK dout1_16 vdout1_16ck203 = 0 time = 2040
* CHECK dout1_0 vdout1_0ck204 = 1.7 time = 2050
* CHECK dout1_1 vdout1_1ck204 = 0 time = 2050
* CHECK dout1_2 vdout1_2ck204 = 1.7 time = 2050
* CHECK dout1_3 vdout1_3ck204 = 0 time = 2050
* CHECK dout1_4 vdout1_4ck204 = 1.7 time = 2050
* CHECK dout1_5 vdout1_5ck204 = 0 time = 2050
* CHECK dout1_6 vdout1_6ck204 = 0 time = 2050
* CHECK dout1_7 vdout1_7ck204 = 1.7 time = 2050
* CHECK dout1_8 vdout1_8ck204 = 1.7 time = 2050
* CHECK dout1_9 vdout1_9ck204 = 0 time = 2050
* CHECK dout1_10 vdout1_10ck204 = 1.7 time = 2050
* CHECK dout1_11 vdout1_11ck204 = 0 time = 2050
* CHECK dout1_12 vdout1_12ck204 = 1.7 time = 2050
* CHECK dout1_13 vdout1_13ck204 = 1.7 time = 2050
* CHECK dout1_14 vdout1_14ck204 = 1.7 time = 2050
* CHECK dout1_15 vdout1_15ck204 = 1.7 time = 2050
* CHECK dout1_16 vdout1_16ck204 = 0 time = 2050
.include /Sky130_memory/work/openram_builds/v20260612_1r1w_full/sky130_sram_128bytes_1r1w_16x64/functional_meas.sp
.TEMP 0
.TRAN 10p 2060n 0n 10p UIC
.OPTIONS POST=1 RELTOL=0.001 PROBE method=gear ACCT
* probe is used for hspice/xa, while plot is used in ngspice
*.probe V(*)
*.plot V(*)
.end

