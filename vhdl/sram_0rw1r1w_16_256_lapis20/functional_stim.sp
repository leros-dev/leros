* Functional test stimulus file for 50ns period

* TT process corner
.include "/ldisk/home/etc/tuankiet/Documents/teehw-vlsi-master/tech/lapis200/lib/OpenRAM/lapis20/tech/models/T.inc"
.include "sram_0rw1r1w_16_256_lapis20.sp"

* Global Power Supplies
Vvdd vdd 0 1.8

*Nodes gnd and 0 are the same global ground node in ngspice/hspice/xa. Otherwise, this source may be needed.
*Vgnd gnd 0 0.0

* Instantiation of the SRAM
Xsram_0rw1r1w_16_256_lapis20 din0_0 din0_1 din0_2 din0_3 din0_4 din0_5 din0_6 din0_7 din0_8 din0_9 din0_10 din0_11 din0_12 din0_13 din0_14 din0_15 a0_0 a0_1 a0_2 a0_3 a0_4 a0_5 a0_6 a0_7 a1_0 a1_1 a1_2 a1_3 a1_4 a1_5 a1_6 a1_7 CSB0 CSB1 clk0 clk1 dout1_0 dout1_1 dout1_2 dout1_3 dout1_4 dout1_5 dout1_6 dout1_7 dout1_8 dout1_9 dout1_10 dout1_11 dout1_12 dout1_13 dout1_14 dout1_15 vdd gnd sram_0rw1r1w_16_256_lapis20

* SRAM output loads
CD10 dout1_0  0 0.8364f
CD11 dout1_1  0 0.8364f
CD12 dout1_2  0 0.8364f
CD13 dout1_3  0 0.8364f
CD14 dout1_4  0 0.8364f
CD15 dout1_5  0 0.8364f
CD16 dout1_6  0 0.8364f
CD17 dout1_7  0 0.8364f
CD18 dout1_8  0 0.8364f
CD19 dout1_9  0 0.8364f
CD110 dout1_10  0 0.8364f
CD111 dout1_11  0 0.8364f
CD112 dout1_12  0 0.8364f
CD113 dout1_13  0 0.8364f
CD114 dout1_14  0 0.8364f
CD115 dout1_15  0 0.8364f


* Important signals for debug
* bl:	xsram_0rw1r1w_16_256_lapis20.xbank0.bl_1_0
* br:	xsram_0rw1r1w_16_256_lapis20.xbank0.br_1_0
* s_en:	xsram_0rw1r1w_16_256_lapis20.s_en
* q:	xsram_0rw1r1w_16_256_lapis20.xbank0.xbitcell_array.xbitcell_array.xbit_r0_c0.Q
* qbar:	xsram_0rw1r1w_16_256_lapis20.xbank0.xbitcell_array.xbitcell_array.xbit_r0_c0.Q_bar


* Sequence of operations
*	Idle during cycle 0 (0ns - 50ns)
*	Writing 0111001100011101  to  address 11111100 (from port 0) during cycle 1 (50ns - 100ns)
*	Writing 0100111111011001  to  address 00000000 (from port 0) during cycle 2 (100ns - 150ns)
*	Writing 1010010110100110  to  address 00000010 (from port 0) during cycle 3 (150ns - 200ns)
*	Reading 1010010110100110 from address 00000010 (from port 1) during cycle 4 (200ns - 250ns)
*	Writing 0000110000001001  to  address 00000011 (from port 0) during cycle 5 (250ns - 300ns)
*	Reading 1010010110100110 from address 00000010 (from port 1) during cycle 5 (250ns - 300ns)
*	Writing 0001001011010101  to  address 00000000 (from port 0) during cycle 6 (300ns - 350ns)
*	Reading 0111001100011101 from address 11111100 (from port 1) during cycle 6 (300ns - 350ns)
*	Writing 0100000010000110  to  address 00000000 (from port 0) during cycle 7 (350ns - 400ns)
*	Reading 0111001100011101 from address 11111100 (from port 1) during cycle 8 (400ns - 450ns)
*	Writing 0001100100001110  to  address 11111100 (from port 0) during cycle 10 (500ns - 550ns)
*	Reading 0000110000001001 from address 00000011 (from port 1) during cycle 10 (500ns - 550ns)
*	Writing 0000010101101010  to  address 11111011 (from port 0) during cycle 11 (550ns - 600ns)
*	Reading 1010010110100110 from address 00000010 (from port 1) during cycle 13 (650ns - 700ns)
*	Reading 0001100100001110 from address 11111100 (from port 1) during cycle 14 (700ns - 750ns)
*	Reading 0000010101101010 from address 11111011 (from port 1) during cycle 16 (800ns - 850ns)
*	Writing 0011101111100110  to  address 11111011 (from port 0) during cycle 19 (950ns - 1000ns)
*	Writing 0011010101110101  to  address 00000001 (from port 0) during cycle 20 (1000ns - 1050ns)
*	Reading 0100000010000110 from address 00000000 (from port 1) during cycle 21 (1050ns - 1100ns)
*	Writing 0001010100101001  to  address 00000010 (from port 0) during cycle 22 (1100ns - 1150ns)
*	Writing 1010101000001011  to  address 00000000 (from port 0) during cycle 24 (1200ns - 1250ns)
*	Reading 0001100100001110 from address 11111100 (from port 1) during cycle 24 (1200ns - 1250ns)
*	Reading 1010101000001011 from address 00000000 (from port 1) during cycle 25 (1250ns - 1300ns)
*	Reading 0011101111100110 from address 11111011 (from port 1) during cycle 26 (1300ns - 1350ns)
*	Writing 1100001100001101  to  address 00000001 (from port 0) during cycle 28 (1400ns - 1450ns)
*	Reading 0000110000001001 from address 00000011 (from port 1) during cycle 28 (1400ns - 1450ns)
*	Writing 1011010011101011  to  address 00000010 (from port 0) during cycle 29 (1450ns - 1500ns)
*	Reading 0011101111100110 from address 11111011 (from port 1) during cycle 29 (1450ns - 1500ns)
*	Writing 0100011100110101  to  address 11111100 (from port 0) during cycle 32 (1600ns - 1650ns)
*	Writing 0000100111100010  to  address 00000001 (from port 0) during cycle 33 (1650ns - 1700ns)
*	Writing 1011110100010100  to  address 11111100 (from port 0) during cycle 34 (1700ns - 1750ns)
*	Writing 0110001101001100  to  address 11111110 (from port 0) during cycle 35 (1750ns - 1800ns)
*	Reading 1011010011101011 from address 00000010 (from port 1) during cycle 35 (1750ns - 1800ns)
*	Reading 0110001101001100 from address 11111110 (from port 1) during cycle 36 (1800ns - 1850ns)
*	Writing 0110000000111110  to  address 00000010 (from port 0) during cycle 37 (1850ns - 1900ns)
*	Reading 1010101000001011 from address 00000000 (from port 1) during cycle 38 (1900ns - 1950ns)
*	Writing 1010111111101010  to  address 00000000 (from port 0) during cycle 39 (1950ns - 2000ns)
*	Reading 0110000000111110 from address 00000010 (from port 1) during cycle 39 (1950ns - 2000ns)
*	Writing 1111101111100110  to  address 11111101 (from port 0) during cycle 40 (2000ns - 2050ns)
*	Writing 0110011101000111  to  address 00000000 (from port 0) during cycle 42 (2100ns - 2150ns)
*	Reading 0000110000001001 from address 00000011 (from port 1) during cycle 42 (2100ns - 2150ns)
*	Writing 1001101111111100  to  address 00000001 (from port 0) during cycle 43 (2150ns - 2200ns)
*	Reading 0011101111100110 from address 11111011 (from port 1) during cycle 45 (2250ns - 2300ns)
*	Reading 0000110000001001 from address 00000011 (from port 1) during cycle 46 (2300ns - 2350ns)
*	Writing 0100111100110110  to  address 11111011 (from port 0) during cycle 47 (2350ns - 2400ns)
*	Reading 0110001101001100 from address 11111110 (from port 1) during cycle 48 (2400ns - 2450ns)
*	Writing 1110010000001111  to  address 00000001 (from port 0) during cycle 49 (2450ns - 2500ns)
*	Reading 1110010000001111 from address 00000001 (from port 1) during cycle 50 (2500ns - 2550ns)
*	Writing 1100011100110101  to  address 11111011 (from port 0) during cycle 51 (2550ns - 2600ns)
*	Reading 1100011100110101 from address 11111011 (from port 1) during cycle 55 (2750ns - 2800ns)
*	Reading 1100011100110101 from address 11111011 (from port 1) during cycle 56 (2800ns - 2850ns)
*	Writing 1101001010110011  to  address 00000011 (from port 0) during cycle 57 (2850ns - 2900ns)
*	Reading 0110001101001100 from address 11111110 (from port 1) during cycle 57 (2850ns - 2900ns)
*	Reading 0110011101000111 from address 00000000 (from port 1) during cycle 59 (2950ns - 3000ns)
*	Writing 1110001011110000  to  address 00000000 (from port 0) during cycle 60 (3000ns - 3050ns)
*	Reading 1111101111100110 from address 11111101 (from port 1) during cycle 60 (3000ns - 3050ns)
*	Reading 1110001011110000 from address 00000000 (from port 1) during cycle 62 (3100ns - 3150ns)
*	Reading 0110000000111110 from address 00000010 (from port 1) during cycle 63 (3150ns - 3200ns)
*	Writing 1011111111010011  to  address 11111100 (from port 0) during cycle 64 (3200ns - 3250ns)
*	Writing 0110100111111101  to  address 11111110 (from port 0) during cycle 66 (3300ns - 3350ns)
*	Reading 1011111111010011 from address 11111100 (from port 1) during cycle 66 (3300ns - 3350ns)
*	Writing 0111000010010111  to  address 00000001 (from port 0) during cycle 67 (3350ns - 3400ns)
*	Reading 1101001010110011 from address 00000011 (from port 1) during cycle 67 (3350ns - 3400ns)
*	Reading 0110100111111101 from address 11111110 (from port 1) during cycle 68 (3400ns - 3450ns)
*	Writing 0101001111100100  to  address 00000011 (from port 0) during cycle 69 (3450ns - 3500ns)
*	Reading 0110100111111101 from address 11111110 (from port 1) during cycle 70 (3500ns - 3550ns)
*	Writing 0101110111010010  to  address 00000010 (from port 0) during cycle 71 (3550ns - 3600ns)
*	Writing 0101101000111100  to  address 11111101 (from port 0) during cycle 73 (3650ns - 3700ns)
*	Reading 0101110111010010 from address 00000010 (from port 1) during cycle 73 (3650ns - 3700ns)
*	Writing 0101100011101011  to  address 00000000 (from port 0) during cycle 76 (3800ns - 3850ns)
*	Reading 0101101000111100 from address 11111101 (from port 1) during cycle 76 (3800ns - 3850ns)
*	Writing 0001101011000111  to  address 00000010 (from port 0) during cycle 77 (3850ns - 3900ns)
*	Reading 0101101000111100 from address 11111101 (from port 1) during cycle 77 (3850ns - 3900ns)
*	Reading 0001101011000111 from address 00000010 (from port 1) during cycle 79 (3950ns - 4000ns)
*	Writing 1111111101110001  to  address 00000001 (from port 0) during cycle 80 (4000ns - 4050ns)
*	Reading 1100011100110101 from address 11111011 (from port 1) during cycle 80 (4000ns - 4050ns)
*	Writing 0101001000001000  to  address 00000010 (from port 0) during cycle 81 (4050ns - 4100ns)
*	Writing 0110010001001111  to  address 00000010 (from port 0) during cycle 82 (4100ns - 4150ns)
*	Reading 1100011100110101 from address 11111011 (from port 1) during cycle 83 (4150ns - 4200ns)
*	Reading 1111111101110001 from address 00000001 (from port 1) during cycle 84 (4200ns - 4250ns)
*	Writing 0110000100010111  to  address 11111101 (from port 0) during cycle 87 (4350ns - 4400ns)
*	Writing 1010111100000001  to  address 00000001 (from port 0) during cycle 88 (4400ns - 4450ns)
*	Reading 0110010001001111 from address 00000010 (from port 1) during cycle 88 (4400ns - 4450ns)
*	Writing 1000000101001111  to  address 11111011 (from port 0) during cycle 89 (4450ns - 4500ns)
*	Writing 0110101101101111  to  address 00000010 (from port 0) during cycle 90 (4500ns - 4550ns)
*	Reading 0110100111111101 from address 11111110 (from port 1) during cycle 90 (4500ns - 4550ns)
*	Writing 1001011101010010  to  address 11111100 (from port 0) during cycle 91 (4550ns - 4600ns)
*	Writing 0001110100001101  to  address 11111101 (from port 0) during cycle 92 (4600ns - 4650ns)
*	Reading 0001110100001101 from address 11111101 (from port 1) during cycle 93 (4650ns - 4700ns)
*	Reading 0101001111100100 from address 00000011 (from port 1) during cycle 94 (4700ns - 4750ns)
*	Writing 0100100000101010  to  address 11111101 (from port 0) during cycle 95 (4750ns - 4800ns)
*	Reading 1010111100000001 from address 00000001 (from port 1) during cycle 95 (4750ns - 4800ns)
*	Writing 1001011110111101  to  address 00000010 (from port 0) during cycle 99 (4950ns - 5000ns)
*	Reading 0101100011101011 from address 00000000 (from port 1) during cycle 99 (4950ns - 5000ns)
*	Writing 1001001010000111  to  address 11111110 (from port 0) during cycle 100 (5000ns - 5050ns)
*	Reading 0101001111100100 from address 00000011 (from port 1) during cycle 100 (5000ns - 5050ns)
*	Writing 1000110011001010  to  address 11111100 (from port 0) during cycle 101 (5050ns - 5100ns)
*	Writing 0001000110001101  to  address 11111100 (from port 0) during cycle 102 (5100ns - 5150ns)
*	Writing 0110110111000100  to  address 00000011 (from port 0) during cycle 103 (5150ns - 5200ns)
*	Reading 0100100000101010 from address 11111101 (from port 1) during cycle 103 (5150ns - 5200ns)
*	Writing 0100001110101100  to  address 11111100 (from port 0) during cycle 104 (5200ns - 5250ns)
*	Reading 1001001010000111 from address 11111110 (from port 1) during cycle 104 (5200ns - 5250ns)
*	Writing 1001001010001000  to  address 00000001 (from port 0) during cycle 105 (5250ns - 5300ns)
*	Writing 0110101100101101  to  address 00000000 (from port 0) during cycle 106 (5300ns - 5350ns)
*	Writing 0011101110111011  to  address 00000010 (from port 0) during cycle 107 (5350ns - 5400ns)
*	Reading 1001001010000111 from address 11111110 (from port 1) during cycle 107 (5350ns - 5400ns)
*	Reading 0100001110101100 from address 11111100 (from port 1) during cycle 108 (5400ns - 5450ns)
*	Writing 1111111111010001  to  address 11111100 (from port 0) during cycle 109 (5450ns - 5500ns)
*	Writing 1101011010111011  to  address 11111110 (from port 0) during cycle 111 (5550ns - 5600ns)
*	Writing 0110000111011000  to  address 11111011 (from port 0) during cycle 112 (5600ns - 5650ns)
*	Writing 0010100101101001  to  address 11111100 (from port 0) during cycle 113 (5650ns - 5700ns)
*	Writing 0111011100111110  to  address 11111110 (from port 0) during cycle 115 (5750ns - 5800ns)
*	Writing 1010000011101111  to  address 11111101 (from port 0) during cycle 116 (5800ns - 5850ns)
*	Reading 0111011100111110 from address 11111110 (from port 1) during cycle 116 (5800ns - 5850ns)
*	Writing 0011001111100110  to  address 11111011 (from port 0) during cycle 117 (5850ns - 5900ns)
*	Reading 0110101100101101 from address 00000000 (from port 1) during cycle 117 (5850ns - 5900ns)
*	Writing 1000101001001101  to  address 00000000 (from port 0) during cycle 119 (5950ns - 6000ns)
*	Reading 0010100101101001 from address 11111100 (from port 1) during cycle 119 (5950ns - 6000ns)
*	Writing 1100110000000100  to  address 11111100 (from port 0) during cycle 120 (6000ns - 6050ns)
*	Reading 1100110000000100 from address 11111100 (from port 1) during cycle 121 (6050ns - 6100ns)
*	Reading 1100110000000100 from address 11111100 (from port 1) during cycle 122 (6100ns - 6150ns)
*	Reading 0110110111000100 from address 00000011 (from port 1) during cycle 123 (6150ns - 6200ns)
*	Writing 1100111101100100  to  address 11111011 (from port 0) during cycle 124 (6200ns - 6250ns)
*	Writing 1111000110011011  to  address 11111011 (from port 0) during cycle 125 (6250ns - 6300ns)
*	Writing 0111000101011101  to  address 11111100 (from port 0) during cycle 126 (6300ns - 6350ns)
*	Reading 0110110111000100 from address 00000011 (from port 1) during cycle 128 (6400ns - 6450ns)
*	Reading 0011101110111011 from address 00000010 (from port 1) during cycle 130 (6500ns - 6550ns)
*	Reading 1111000110011011 from address 11111011 (from port 1) during cycle 131 (6550ns - 6600ns)
*	Reading 0111011100111110 from address 11111110 (from port 1) during cycle 132 (6600ns - 6650ns)
*	Writing 0100100101011000  to  address 11111110 (from port 0) during cycle 133 (6650ns - 6700ns)
*	Reading 1001001010001000 from address 00000001 (from port 1) during cycle 133 (6650ns - 6700ns)
*	Reading 0100100101011000 from address 11111110 (from port 1) during cycle 134 (6700ns - 6750ns)
*	Writing 0011011100000000  to  address 11111101 (from port 0) during cycle 135 (6750ns - 6800ns)
*	Writing 1001110111001100  to  address 00000000 (from port 0) during cycle 136 (6800ns - 6850ns)
*	Reading 0110110111000100 from address 00000011 (from port 1) during cycle 137 (6850ns - 6900ns)
*	Reading 1111000110011011 from address 11111011 (from port 1) during cycle 138 (6900ns - 6950ns)
*	Reading 0011011100000000 from address 11111101 (from port 1) during cycle 139 (6950ns - 7000ns)
*	Writing 0111010011001110  to  address 11111011 (from port 0) during cycle 140 (7000ns - 7050ns)
*	Reading 0011011100000000 from address 11111101 (from port 1) during cycle 140 (7000ns - 7050ns)
*	Writing 1000011001110101  to  address 00000000 (from port 0) during cycle 141 (7050ns - 7100ns)
*	Reading 1000011001110101 from address 00000000 (from port 1) during cycle 142 (7100ns - 7150ns)
*	Reading 0100100101011000 from address 11111110 (from port 1) during cycle 144 (7200ns - 7250ns)
*	Writing 1100000100110100  to  address 11111110 (from port 0) during cycle 145 (7250ns - 7300ns)
*	Reading 0011101110111011 from address 00000010 (from port 1) during cycle 145 (7250ns - 7300ns)
*	Writing 1111011111111000  to  address 00000001 (from port 0) during cycle 149 (7450ns - 7500ns)
*	Reading 0111000101011101 from address 11111100 (from port 1) during cycle 149 (7450ns - 7500ns)
*	Writing 0100111101111010  to  address 11111100 (from port 0) during cycle 151 (7550ns - 7600ns)
*	Writing 1110100101000011  to  address 11111101 (from port 0) during cycle 152 (7600ns - 7650ns)
*	Reading 0111010011001110 from address 11111011 (from port 1) during cycle 152 (7600ns - 7650ns)
*	Writing 1110011000111101  to  address 00000010 (from port 0) during cycle 153 (7650ns - 7700ns)
*	Writing 0111110110110011  to  address 11111110 (from port 0) during cycle 154 (7700ns - 7750ns)
*	Writing 1101001010000010  to  address 00000010 (from port 0) during cycle 155 (7750ns - 7800ns)
*	Writing 0010010011100101  to  address 00000000 (from port 0) during cycle 157 (7850ns - 7900ns)
*	Writing 1110000100110011  to  address 11111110 (from port 0) during cycle 158 (7900ns - 7950ns)
*	Reading 0111010011001110 from address 11111011 (from port 1) during cycle 158 (7900ns - 7950ns)
*	Writing 1101101011111011  to  address 00000001 (from port 0) during cycle 159 (7950ns - 8000ns)
*	Writing 1101100110111101  to  address 00000000 (from port 0) during cycle 160 (8000ns - 8050ns)
*	Writing 1101010010111001  to  address 00000010 (from port 0) during cycle 161 (8050ns - 8100ns)
*	Writing 1101010011000000  to  address 00000001 (from port 0) during cycle 162 (8100ns - 8150ns)
*	Writing 1100000000111100  to  address 11111100 (from port 0) during cycle 163 (8150ns - 8200ns)
*	Reading 0110110111000100 from address 00000011 (from port 1) during cycle 164 (8200ns - 8250ns)
*	Writing 0001010101000101  to  address 00000000 (from port 0) during cycle 165 (8250ns - 8300ns)
*	Reading 1100000000111100 from address 11111100 (from port 1) during cycle 165 (8250ns - 8300ns)
*	Writing 0010010011100000  to  address 11111100 (from port 0) during cycle 166 (8300ns - 8350ns)
*	Reading 1110100101000011 from address 11111101 (from port 1) during cycle 166 (8300ns - 8350ns)
*	Writing 1100000001000001  to  address 00000010 (from port 0) during cycle 167 (8350ns - 8400ns)
*	Writing 1000111010001101  to  address 11111110 (from port 0) during cycle 168 (8400ns - 8450ns)
*	Reading 1110100101000011 from address 11111101 (from port 1) during cycle 168 (8400ns - 8450ns)
*	Writing 1010110000010001  to  address 11111011 (from port 0) during cycle 169 (8450ns - 8500ns)
*	Reading 0010010011100000 from address 11111100 (from port 1) during cycle 169 (8450ns - 8500ns)
*	Writing 0101011010011100  to  address 11111011 (from port 0) during cycle 171 (8550ns - 8600ns)
*	Reading 1100000001000001 from address 00000010 (from port 1) during cycle 171 (8550ns - 8600ns)
*	Writing 1010010100100000  to  address 11111011 (from port 0) during cycle 172 (8600ns - 8650ns)
*	Reading 1110100101000011 from address 11111101 (from port 1) during cycle 172 (8600ns - 8650ns)
*	Writing 1101100100000101  to  address 11111110 (from port 0) during cycle 174 (8700ns - 8750ns)
*	Writing 0000100000010110  to  address 00000011 (from port 0) during cycle 175 (8750ns - 8800ns)
*	Writing 1001011101011111  to  address 00000000 (from port 0) during cycle 176 (8800ns - 8850ns)
*	Writing 0000000101000110  to  address 11111100 (from port 0) during cycle 177 (8850ns - 8900ns)
*	Reading 1101010011000000 from address 00000001 (from port 1) during cycle 177 (8850ns - 8900ns)
*	Reading 1010010100100000 from address 11111011 (from port 1) during cycle 178 (8900ns - 8950ns)
*	Writing 0010100110110101  to  address 00000001 (from port 0) during cycle 179 (8950ns - 9000ns)
*	Reading 1110100101000011 from address 11111101 (from port 1) during cycle 179 (8950ns - 9000ns)
*	Reading 0000100000010110 from address 00000011 (from port 1) during cycle 180 (9000ns - 9050ns)
*	Writing 1011000111010100  to  address 11111101 (from port 0) during cycle 181 (9050ns - 9100ns)
*	Writing 1110100001111100  to  address 00000000 (from port 0) during cycle 182 (9100ns - 9150ns)
*	Reading 0010100110110101 from address 00000001 (from port 1) during cycle 182 (9100ns - 9150ns)
*	Reading 0000000101000110 from address 11111100 (from port 1) during cycle 183 (9150ns - 9200ns)
*	Writing 1101011101011111  to  address 00000000 (from port 0) during cycle 184 (9200ns - 9250ns)
*	Reading 1011000111010100 from address 11111101 (from port 1) during cycle 184 (9200ns - 9250ns)
*	Writing 1001110101001100  to  address 11111110 (from port 0) during cycle 185 (9250ns - 9300ns)
*	Writing 1011010101010100  to  address 11111110 (from port 0) during cycle 186 (9300ns - 9350ns)
*	Writing 1010000010101010  to  address 00000011 (from port 0) during cycle 187 (9350ns - 9400ns)
*	Writing 0101011010010100  to  address 11111100 (from port 0) during cycle 189 (9450ns - 9500ns)
*	Reading 0010100110110101 from address 00000001 (from port 1) during cycle 189 (9450ns - 9500ns)
*	Writing 1000001010001110  to  address 00000000 (from port 0) during cycle 190 (9500ns - 9550ns)
*	Reading 1010010100100000 from address 11111011 (from port 1) during cycle 190 (9500ns - 9550ns)
*	Reading 1010010100100000 from address 11111011 (from port 1) during cycle 191 (9550ns - 9600ns)
*	Reading 1100000001000001 from address 00000010 (from port 1) during cycle 192 (9600ns - 9650ns)
*	Reading 1010010100100000 from address 11111011 (from port 1) during cycle 193 (9650ns - 9700ns)
*	Writing 0011001100000001  to  address 11111101 (from port 0) during cycle 194 (9700ns - 9750ns)
*	Writing 0100110110010111  to  address 11111101 (from port 0) during cycle 195 (9750ns - 9800ns)
*	Reading 1000001010001110 from address 00000000 (from port 1) during cycle 195 (9750ns - 9800ns)
*	Reading 0100110110010111 from address 11111101 (from port 1) during cycle 197 (9850ns - 9900ns)
*	Reading 1000001010001110 from address 00000000 (from port 1) during cycle 198 (9900ns - 9950ns)
*	Writing 0010110101111110  to  address 11111011 (from port 0) during cycle 200 (10000ns - 10050ns)
*	Reading 0101011010010100 from address 11111100 (from port 1) during cycle 200 (10000ns - 10050ns)
*	Writing 1010011010100110  to  address 00000010 (from port 0) during cycle 202 (10100ns - 10150ns)
*	Reading 0101011010010100 from address 11111100 (from port 1) during cycle 202 (10100ns - 10150ns)
*	Writing 0100011100111010  to  address 00000010 (from port 0) during cycle 203 (10150ns - 10200ns)
*	Reading 0100110110010111 from address 11111101 (from port 1) during cycle 203 (10150ns - 10200ns)
*	Writing 0010101100000100  to  address 00000001 (from port 0) during cycle 204 (10200ns - 10250ns)
*	Idle during cycle 205 (10250ns - 10300ns)

* Generation of data and address signals
* (time, data): [(0, 0), (50, 1), (100, 1), (150, 0), (200, 0), (250, 1), (300, 1), (350, 0), (400, 0), (450, 0), (500, 0), (550, 0), (600, 0), (650, 0), (700, 0), (750, 0), (800, 0), (850, 0), (900, 0), (950, 0), (1000, 1), (1050, 1), (1100, 1), (1150, 1), (1200, 1), (1250, 1), (1300, 1), (1350, 1), (1400, 1), (1450, 1), (1500, 1), (1550, 1), (1600, 1), (1650, 0), (1700, 0), (1750, 0), (1800, 0), (1850, 0), (1900, 0), (1950, 0), (2000, 0), (2050, 0), (2100, 1), (2150, 0), (2200, 0), (2250, 0), (2300, 0), (2350, 0), (2400, 0), (2450, 1), (2500, 1), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 1), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 1), (3250, 1), (3300, 1), (3350, 1), (3400, 1), (3450, 0), (3500, 0), (3550, 0), (3600, 0), (3650, 0), (3700, 0), (3750, 0), (3800, 1), (3850, 1), (3900, 1), (3950, 1), (4000, 1), (4050, 0), (4100, 1), (4150, 1), (4200, 1), (4250, 1), (4300, 1), (4350, 1), (4400, 1), (4450, 1), (4500, 1), (4550, 0), (4600, 1), (4650, 1), (4700, 1), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 1), (5000, 1), (5050, 0), (5100, 1), (5150, 0), (5200, 0), (5250, 0), (5300, 1), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 1), (5600, 0), (5650, 1), (5700, 1), (5750, 0), (5800, 1), (5850, 0), (5900, 0), (5950, 1), (6000, 0), (6050, 0), (6100, 0), (6150, 0), (6200, 0), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 0), (6700, 0), (6750, 0), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 0), (7050, 1), (7100, 1), (7150, 1), (7200, 1), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 0), (7500, 0), (7550, 0), (7600, 1), (7650, 1), (7700, 1), (7750, 0), (7800, 0), (7850, 1), (7900, 1), (7950, 1), (8000, 1), (8050, 1), (8100, 0), (8150, 0), (8200, 0), (8250, 1), (8300, 0), (8350, 1), (8400, 1), (8450, 1), (8500, 1), (8550, 0), (8600, 0), (8650, 0), (8700, 1), (8750, 0), (8800, 1), (8850, 0), (8900, 0), (8950, 1), (9000, 1), (9050, 0), (9100, 0), (9150, 0), (9200, 1), (9250, 0), (9300, 0), (9350, 0), (9400, 0), (9450, 0), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 1), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 0), (10050, 0), (10100, 0), (10150, 0), (10200, 0), (10250, 0)]
Vdin0_0  din0_0  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 1.8v 147.49n 1.8v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 1.8v 297.49n 1.8v 297.51n 1.8v 347.49n 1.8v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 0.0v 747.49n 0.0v 747.51n 0.0v 797.49n 0.0v 797.51n 0.0v 847.49n 0.0v 847.51n 0.0v 897.49n 0.0v 897.51n 0.0v 947.49n 0.0v 947.51n 0.0v 997.49n 0.0v 997.51n 1.8v 1047.49n 1.8v 1047.51n 1.8v 1097.49n 1.8v 1097.51n 1.8v 1147.49n 1.8v 1147.51n 1.8v 1197.49n 1.8v 1197.51n 1.8v 1247.49n 1.8v 1247.51n 1.8v 1297.49n 1.8v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 1.8v 1447.49n 1.8v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 0.0v 1747.49n 0.0v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 0.0v 1847.49n 0.0v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 0.0v 2047.49n 0.0v 2047.51n 0.0v 2097.49n 0.0v 2097.51n 1.8v 2147.49n 1.8v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 0.0v 2447.49n 0.0v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 1.8v 2547.49n 1.8v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 1.8v 2997.49n 1.8v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 1.8v 3397.49n 1.8v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 1.8v 3997.49n 1.8v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 1.8v 4247.49n 1.8v 4247.51n 1.8v 4297.49n 1.8v 4297.51n 1.8v 4347.49n 1.8v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 1.8v 4447.49n 1.8v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 0.0v 4597.49n 0.0v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 1.8v 4997.49n 1.8v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 0.0v 5647.49n 0.0v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 0.0v 5797.49n 0.0v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 1.8v 5997.49n 1.8v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 0.0v 6747.49n 0.0v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 0.0v 7047.49n 0.0v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 1.8v 7147.49n 1.8v 7147.51n 1.8v 7197.49n 1.8v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 0.0v 7547.49n 0.0v 7547.51n 0.0v 7597.49n 0.0v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 1.8v 8297.49n 1.8v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 1.8v 8397.49n 1.8v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 0.0v 8697.49n 0.0v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 1.8v 9047.49n 1.8v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 0.0v 9297.49n 0.0v 9297.51n 0.0v 9347.49n 0.0v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 0.0v 10047.49n 0.0v 10047.51n 0.0v 10097.49n 0.0v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 0), (100, 0), (150, 1), (200, 1), (250, 0), (300, 0), (350, 1), (400, 1), (450, 1), (500, 1), (550, 1), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 0), (1050, 0), (1100, 0), (1150, 0), (1200, 1), (1250, 1), (1300, 1), (1350, 1), (1400, 0), (1450, 1), (1500, 1), (1550, 1), (1600, 0), (1650, 1), (1700, 0), (1750, 0), (1800, 0), (1850, 1), (1900, 1), (1950, 1), (2000, 1), (2050, 1), (2100, 1), (2150, 0), (2200, 0), (2250, 0), (2300, 0), (2350, 1), (2400, 1), (2450, 1), (2500, 1), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 0), (2800, 0), (2850, 1), (2900, 1), (2950, 1), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 1), (3250, 1), (3300, 0), (3350, 1), (3400, 1), (3450, 0), (3500, 0), (3550, 1), (3600, 1), (3650, 0), (3700, 0), (3750, 0), (3800, 1), (3850, 1), (3900, 1), (3950, 1), (4000, 0), (4050, 0), (4100, 1), (4150, 1), (4200, 1), (4250, 1), (4300, 1), (4350, 1), (4400, 0), (4450, 1), (4500, 1), (4550, 1), (4600, 0), (4650, 0), (4700, 0), (4750, 1), (4800, 1), (4850, 1), (4900, 1), (4950, 0), (5000, 1), (5050, 1), (5100, 0), (5150, 0), (5200, 0), (5250, 0), (5300, 0), (5350, 1), (5400, 1), (5450, 0), (5500, 0), (5550, 1), (5600, 0), (5650, 0), (5700, 0), (5750, 1), (5800, 1), (5850, 1), (5900, 1), (5950, 0), (6000, 0), (6050, 0), (6100, 0), (6150, 0), (6200, 0), (6250, 1), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 0), (6600, 0), (6650, 0), (6700, 0), (6750, 0), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 1), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 0), (7500, 0), (7550, 1), (7600, 1), (7650, 0), (7700, 1), (7750, 1), (7800, 1), (7850, 0), (7900, 1), (7950, 1), (8000, 0), (8050, 0), (8100, 0), (8150, 0), (8200, 0), (8250, 0), (8300, 0), (8350, 0), (8400, 0), (8450, 0), (8500, 0), (8550, 0), (8600, 0), (8650, 0), (8700, 0), (8750, 1), (8800, 1), (8850, 1), (8900, 1), (8950, 0), (9000, 0), (9050, 0), (9100, 0), (9150, 0), (9200, 1), (9250, 0), (9300, 0), (9350, 1), (9400, 1), (9450, 0), (9500, 1), (9550, 1), (9600, 1), (9650, 1), (9700, 0), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 1), (10050, 1), (10100, 1), (10150, 1), (10200, 0), (10250, 0)]
Vdin0_1  din0_1  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 1.8v 197.49n 1.8v 197.51n 1.8v 247.49n 1.8v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 1.8v 397.49n 1.8v 397.51n 1.8v 447.49n 1.8v 447.51n 1.8v 497.49n 1.8v 497.51n 1.8v 547.49n 1.8v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 1.8v 1247.49n 1.8v 1247.51n 1.8v 1297.49n 1.8v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 0.0v 1647.49n 0.0v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 0.0v 1747.49n 0.0v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 0.0v 1847.49n 0.0v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 1.8v 1947.49n 1.8v 1947.51n 1.8v 1997.49n 1.8v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 1.8v 2147.49n 1.8v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 1.8v 2547.49n 1.8v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 0.0v 2797.49n 0.0v 2797.51n 0.0v 2847.49n 0.0v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 1.8v 2997.49n 1.8v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 0.0v 3347.49n 0.0v 3347.51n 1.8v 3397.49n 1.8v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 1.8v 3997.49n 1.8v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 1.8v 4247.49n 1.8v 4247.51n 1.8v 4297.49n 1.8v 4297.51n 1.8v 4347.49n 1.8v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 0.0v 4647.49n 0.0v 4647.51n 0.0v 4697.49n 0.0v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 1.8v 4797.49n 1.8v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 0.0v 5497.49n 0.0v 5497.51n 0.0v 5547.49n 0.0v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 0.0v 5647.49n 0.0v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 0.0v 5747.49n 0.0v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 0.0v 6597.49n 0.0v 6597.51n 0.0v 6647.49n 0.0v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 0.0v 6747.49n 0.0v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 0.0v 7547.49n 0.0v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 0.0v 8447.49n 0.0v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 0.0v 8547.49n 0.0v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 0.0v 8697.49n 0.0v 8697.51n 0.0v 8747.49n 0.0v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 1.8v 8897.49n 1.8v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 0.0v 9297.49n 0.0v 9297.51n 0.0v 9347.49n 0.0v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 1.8v 9547.49n 1.8v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 1.8v 9647.49n 1.8v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 1), (100, 0), (150, 1), (200, 1), (250, 0), (300, 1), (350, 1), (400, 1), (450, 1), (500, 1), (550, 0), (600, 0), (650, 0), (700, 0), (750, 0), (800, 0), (850, 0), (900, 0), (950, 1), (1000, 1), (1050, 1), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 1), (1450, 0), (1500, 0), (1550, 0), (1600, 1), (1650, 0), (1700, 1), (1750, 1), (1800, 1), (1850, 1), (1900, 1), (1950, 0), (2000, 1), (2050, 1), (2100, 1), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 1), (2400, 1), (2450, 1), (2500, 1), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 0), (2900, 0), (2950, 0), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 0), (3250, 0), (3300, 1), (3350, 1), (3400, 1), (3450, 1), (3500, 1), (3550, 0), (3600, 0), (3650, 1), (3700, 1), (3750, 1), (3800, 0), (3850, 1), (3900, 1), (3950, 1), (4000, 0), (4050, 0), (4100, 1), (4150, 1), (4200, 1), (4250, 1), (4300, 1), (4350, 1), (4400, 0), (4450, 1), (4500, 1), (4550, 0), (4600, 1), (4650, 1), (4700, 1), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 1), (5000, 1), (5050, 0), (5100, 1), (5150, 1), (5200, 1), (5250, 0), (5300, 1), (5350, 0), (5400, 0), (5450, 0), (5500, 0), (5550, 0), (5600, 0), (5650, 0), (5700, 0), (5750, 1), (5800, 1), (5850, 1), (5900, 1), (5950, 1), (6000, 1), (6050, 1), (6100, 1), (6150, 1), (6200, 1), (6250, 0), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 0), (6700, 0), (6750, 0), (6800, 1), (6850, 1), (6900, 1), (6950, 1), (7000, 1), (7050, 1), (7100, 1), (7150, 1), (7200, 1), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 0), (7500, 0), (7550, 0), (7600, 0), (7650, 1), (7700, 0), (7750, 0), (7800, 0), (7850, 1), (7900, 0), (7950, 0), (8000, 1), (8050, 0), (8100, 0), (8150, 1), (8200, 1), (8250, 1), (8300, 0), (8350, 0), (8400, 1), (8450, 0), (8500, 0), (8550, 1), (8600, 0), (8650, 0), (8700, 1), (8750, 1), (8800, 1), (8850, 1), (8900, 1), (8950, 1), (9000, 1), (9050, 1), (9100, 1), (9150, 1), (9200, 1), (9250, 1), (9300, 1), (9350, 0), (9400, 0), (9450, 1), (9500, 1), (9550, 1), (9600, 1), (9650, 1), (9700, 0), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 1), (10050, 1), (10100, 1), (10150, 0), (10200, 1), (10250, 1)]
Vdin0_2  din0_2  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 0.0v 147.49n 0.0v 147.51n 1.8v 197.49n 1.8v 197.51n 1.8v 247.49n 1.8v 247.51n 0.0v 297.49n 0.0v 297.51n 1.8v 347.49n 1.8v 347.51n 1.8v 397.49n 1.8v 397.51n 1.8v 447.49n 1.8v 447.51n 1.8v 497.49n 1.8v 497.51n 1.8v 547.49n 1.8v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 0.0v 747.49n 0.0v 747.51n 0.0v 797.49n 0.0v 797.51n 0.0v 847.49n 0.0v 847.51n 0.0v 897.49n 0.0v 897.51n 0.0v 947.49n 0.0v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 1.8v 1097.49n 1.8v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 1.8v 1447.49n 1.8v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 1.8v 1947.49n 1.8v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 1.8v 2147.49n 1.8v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 1.8v 2547.49n 1.8v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 0.0v 3297.49n 0.0v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 1.8v 3397.49n 1.8v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 1.8v 3997.49n 1.8v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 1.8v 4247.49n 1.8v 4247.51n 1.8v 4297.49n 1.8v 4297.51n 1.8v 4347.49n 1.8v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 0.0v 4597.49n 0.0v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 1.8v 4997.49n 1.8v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 0.0v 5497.49n 0.0v 5497.51n 0.0v 5547.49n 0.0v 5547.51n 0.0v 5597.49n 0.0v 5597.51n 0.0v 5647.49n 0.0v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 0.0v 5747.49n 0.0v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 1.8v 5997.49n 1.8v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 0.0v 6747.49n 0.0v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 1.8v 6897.49n 1.8v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 1.8v 7147.49n 1.8v 7147.51n 1.8v 7197.49n 1.8v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 0.0v 7547.49n 0.0v 7547.51n 0.0v 7597.49n 0.0v 7597.51n 0.0v 7647.49n 0.0v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 0.0v 7747.49n 0.0v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 0.0v 7947.49n 0.0v 7947.51n 0.0v 7997.49n 0.0v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 1.8v 8297.49n 1.8v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 0.0v 8547.49n 0.0v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 0.0v 8697.49n 0.0v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 1.8v 8897.49n 1.8v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 1.8v 9047.49n 1.8v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 1.8v 9147.49n 1.8v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 1.8v 9547.49n 1.8v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 1.8v 9647.49n 1.8v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )
* (time, data): [(0, 0), (50, 1), (100, 1), (150, 0), (200, 0), (250, 1), (300, 0), (350, 0), (400, 0), (450, 0), (500, 1), (550, 1), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 0), (1000, 0), (1050, 0), (1100, 1), (1150, 1), (1200, 1), (1250, 1), (1300, 1), (1350, 1), (1400, 1), (1450, 1), (1500, 1), (1550, 1), (1600, 0), (1650, 0), (1700, 0), (1750, 1), (1800, 1), (1850, 1), (1900, 1), (1950, 1), (2000, 0), (2050, 0), (2100, 0), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 0), (2400, 0), (2450, 1), (2500, 1), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 0), (2800, 0), (2850, 0), (2900, 0), (2950, 0), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 0), (3250, 0), (3300, 1), (3350, 0), (3400, 0), (3450, 0), (3500, 0), (3550, 0), (3600, 0), (3650, 1), (3700, 1), (3750, 1), (3800, 1), (3850, 0), (3900, 0), (3950, 0), (4000, 0), (4050, 1), (4100, 1), (4150, 1), (4200, 1), (4250, 1), (4300, 1), (4350, 0), (4400, 0), (4450, 1), (4500, 1), (4550, 0), (4600, 1), (4650, 1), (4700, 1), (4750, 1), (4800, 1), (4850, 1), (4900, 1), (4950, 1), (5000, 0), (5050, 1), (5100, 1), (5150, 0), (5200, 1), (5250, 1), (5300, 1), (5350, 1), (5400, 1), (5450, 0), (5500, 0), (5550, 1), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 0), (5900, 0), (5950, 1), (6000, 0), (6050, 0), (6100, 0), (6150, 0), (6200, 0), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 1), (6700, 1), (6750, 0), (6800, 1), (6850, 1), (6900, 1), (6950, 1), (7000, 1), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 1), (7600, 0), (7650, 1), (7700, 0), (7750, 0), (7800, 0), (7850, 0), (7900, 0), (7950, 1), (8000, 1), (8050, 1), (8100, 0), (8150, 1), (8200, 1), (8250, 0), (8300, 0), (8350, 0), (8400, 1), (8450, 0), (8500, 0), (8550, 1), (8600, 0), (8650, 0), (8700, 0), (8750, 0), (8800, 1), (8850, 0), (8900, 0), (8950, 0), (9000, 0), (9050, 0), (9100, 1), (9150, 1), (9200, 1), (9250, 1), (9300, 0), (9350, 1), (9400, 1), (9450, 0), (9500, 1), (9550, 1), (9600, 1), (9650, 1), (9700, 0), (9750, 0), (9800, 0), (9850, 0), (9900, 0), (9950, 0), (10000, 1), (10050, 1), (10100, 0), (10150, 1), (10200, 0), (10250, 0)]
Vdin0_3  din0_3  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 1.8v 147.49n 1.8v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 1.8v 297.49n 1.8v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 1.8v 547.49n 1.8v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 0.0v 997.49n 0.0v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 1.8v 1147.49n 1.8v 1147.51n 1.8v 1197.49n 1.8v 1197.51n 1.8v 1247.49n 1.8v 1247.51n 1.8v 1297.49n 1.8v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 1.8v 1447.49n 1.8v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 0.0v 1647.49n 0.0v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 0.0v 1747.49n 0.0v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 1.8v 1947.49n 1.8v 1947.51n 1.8v 1997.49n 1.8v 1997.51n 0.0v 2047.49n 0.0v 2047.51n 0.0v 2097.49n 0.0v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 0.0v 2447.49n 0.0v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 1.8v 2547.49n 1.8v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 0.0v 2797.49n 0.0v 2797.51n 0.0v 2847.49n 0.0v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 0.0v 3297.49n 0.0v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 1.8v 4097.49n 1.8v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 1.8v 4247.49n 1.8v 4247.51n 1.8v 4297.49n 1.8v 4297.51n 1.8v 4347.49n 1.8v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 0.0v 4597.49n 0.0v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 1.8v 4797.49n 1.8v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 1.8v 4997.49n 1.8v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 0.0v 5497.49n 0.0v 5497.51n 0.0v 5547.49n 0.0v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 1.8v 5997.49n 1.8v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 1.8v 6897.49n 1.8v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 0.0v 7647.49n 0.0v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 0.0v 7747.49n 0.0v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 0.0v 7947.49n 0.0v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 0.0v 8547.49n 0.0v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 0.0v 8697.49n 0.0v 8697.51n 0.0v 8747.49n 0.0v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 1.8v 9147.49n 1.8v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 0.0v 9347.49n 0.0v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 1.8v 9547.49n 1.8v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 1.8v 9647.49n 1.8v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 0.0v 9897.49n 0.0v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 1), (100, 1), (150, 0), (200, 0), (250, 0), (300, 1), (350, 0), (400, 0), (450, 0), (500, 0), (550, 0), (600, 0), (650, 0), (700, 0), (750, 0), (800, 0), (850, 0), (900, 0), (950, 0), (1000, 1), (1050, 1), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 0), (1500, 0), (1550, 0), (1600, 1), (1650, 0), (1700, 1), (1750, 0), (1800, 0), (1850, 1), (1900, 1), (1950, 0), (2000, 0), (2050, 0), (2100, 0), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 1), (2400, 1), (2450, 0), (2500, 0), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 1), (3000, 1), (3050, 1), (3100, 1), (3150, 1), (3200, 1), (3250, 1), (3300, 1), (3350, 1), (3400, 1), (3450, 0), (3500, 0), (3550, 1), (3600, 1), (3650, 1), (3700, 1), (3750, 1), (3800, 0), (3850, 0), (3900, 0), (3950, 0), (4000, 1), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 1), (4400, 0), (4450, 0), (4500, 0), (4550, 1), (4600, 0), (4650, 0), (4700, 0), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 1), (5000, 0), (5050, 0), (5100, 0), (5150, 0), (5200, 0), (5250, 0), (5300, 0), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 0), (5700, 0), (5750, 1), (5800, 0), (5850, 0), (5900, 0), (5950, 0), (6000, 0), (6050, 0), (6100, 0), (6150, 0), (6200, 0), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 1), (6700, 1), (6750, 0), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 0), (7050, 1), (7100, 1), (7150, 1), (7200, 1), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 1), (7500, 1), (7550, 1), (7600, 0), (7650, 1), (7700, 1), (7750, 0), (7800, 0), (7850, 0), (7900, 1), (7950, 1), (8000, 1), (8050, 1), (8100, 0), (8150, 1), (8200, 1), (8250, 0), (8300, 0), (8350, 0), (8400, 0), (8450, 1), (8500, 1), (8550, 1), (8600, 0), (8650, 0), (8700, 0), (8750, 1), (8800, 1), (8850, 0), (8900, 0), (8950, 1), (9000, 1), (9050, 1), (9100, 1), (9150, 1), (9200, 1), (9250, 0), (9300, 1), (9350, 0), (9400, 0), (9450, 1), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 0), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 1), (10050, 1), (10100, 0), (10150, 1), (10200, 0), (10250, 0)]
Vdin0_4  din0_4  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 1.8v 147.49n 1.8v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 1.8v 347.49n 1.8v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 0.0v 747.49n 0.0v 747.51n 0.0v 797.49n 0.0v 797.51n 0.0v 847.49n 0.0v 847.51n 0.0v 897.49n 0.0v 897.51n 0.0v 947.49n 0.0v 947.51n 0.0v 997.49n 0.0v 997.51n 1.8v 1047.49n 1.8v 1047.51n 1.8v 1097.49n 1.8v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 0.0v 1847.49n 0.0v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 1.8v 1947.49n 1.8v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 0.0v 2047.49n 0.0v 2047.51n 0.0v 2097.49n 0.0v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 1.8v 2997.49n 1.8v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 1.8v 3147.49n 1.8v 3147.51n 1.8v 3197.49n 1.8v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 1.8v 3397.49n 1.8v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 0.0v 4647.49n 0.0v 4647.51n 0.0v 4697.49n 0.0v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 1.8v 4997.49n 1.8v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 0.0v 5747.49n 0.0v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 0.0v 5847.49n 0.0v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 0.0v 7047.49n 0.0v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 1.8v 7147.49n 1.8v 7147.51n 1.8v 7197.49n 1.8v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 0.0v 7647.49n 0.0v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 0.0v 8447.49n 0.0v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 0.0v 8697.49n 0.0v 8697.51n 0.0v 8747.49n 0.0v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 1.8v 9047.49n 1.8v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 1.8v 9147.49n 1.8v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 0.0v 9297.49n 0.0v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 0), (100, 0), (150, 1), (200, 1), (250, 0), (300, 0), (350, 0), (400, 0), (450, 0), (500, 0), (550, 1), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 1), (1050, 1), (1100, 1), (1150, 1), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 1), (1500, 1), (1550, 1), (1600, 1), (1650, 1), (1700, 0), (1750, 0), (1800, 0), (1850, 1), (1900, 1), (1950, 1), (2000, 1), (2050, 1), (2100, 0), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 1), (2400, 1), (2450, 0), (2500, 0), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 1), (3000, 1), (3050, 1), (3100, 1), (3150, 1), (3200, 0), (3250, 0), (3300, 1), (3350, 0), (3400, 0), (3450, 1), (3500, 1), (3550, 0), (3600, 0), (3650, 1), (3700, 1), (3750, 1), (3800, 1), (3850, 0), (3900, 0), (3950, 0), (4000, 1), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 0), (4400, 0), (4450, 0), (4500, 1), (4550, 0), (4600, 0), (4650, 0), (4700, 0), (4750, 1), (4800, 1), (4850, 1), (4900, 1), (4950, 1), (5000, 0), (5050, 0), (5100, 0), (5150, 0), (5200, 1), (5250, 0), (5300, 1), (5350, 1), (5400, 1), (5450, 0), (5500, 0), (5550, 1), (5600, 0), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 1), (5900, 1), (5950, 0), (6000, 0), (6050, 0), (6100, 0), (6150, 0), (6200, 1), (6250, 0), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 0), (6600, 0), (6650, 0), (6700, 0), (6750, 0), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 0), (7050, 1), (7100, 1), (7150, 1), (7200, 1), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 1), (7500, 1), (7550, 1), (7600, 0), (7650, 1), (7700, 1), (7750, 0), (7800, 0), (7850, 1), (7900, 1), (7950, 1), (8000, 1), (8050, 1), (8100, 0), (8150, 1), (8200, 1), (8250, 0), (8300, 1), (8350, 0), (8400, 0), (8450, 0), (8500, 0), (8550, 0), (8600, 1), (8650, 1), (8700, 0), (8750, 0), (8800, 0), (8850, 0), (8900, 0), (8950, 1), (9000, 1), (9050, 0), (9100, 1), (9150, 1), (9200, 0), (9250, 0), (9300, 0), (9350, 1), (9400, 1), (9450, 0), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 0), (9750, 0), (9800, 0), (9850, 0), (9900, 0), (9950, 0), (10000, 1), (10050, 1), (10100, 1), (10150, 1), (10200, 0), (10250, 0)]
Vdin0_5  din0_5  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 1.8v 197.49n 1.8v 197.51n 1.8v 247.49n 1.8v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 0.0v 547.49n 0.0v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 1.8v 1097.49n 1.8v 1097.51n 1.8v 1147.49n 1.8v 1147.51n 1.8v 1197.49n 1.8v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 0.0v 1747.49n 0.0v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 0.0v 1847.49n 0.0v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 1.8v 1947.49n 1.8v 1947.51n 1.8v 1997.49n 1.8v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 1.8v 2997.49n 1.8v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 1.8v 3147.49n 1.8v 3147.51n 1.8v 3197.49n 1.8v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 0.0v 3297.49n 0.0v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 0.0v 4597.49n 0.0v 4597.51n 0.0v 4647.49n 0.0v 4647.51n 0.0v 4697.49n 0.0v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 1.8v 4797.49n 1.8v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 1.8v 4997.49n 1.8v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 0.0v 5497.49n 0.0v 5497.51n 0.0v 5547.49n 0.0v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 0.0v 5647.49n 0.0v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 0.0v 6597.49n 0.0v 6597.51n 0.0v 6647.49n 0.0v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 0.0v 6747.49n 0.0v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 0.0v 7047.49n 0.0v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 1.8v 7147.49n 1.8v 7147.51n 1.8v 7197.49n 1.8v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 0.0v 7647.49n 0.0v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 0.0v 8447.49n 0.0v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 0.0v 8547.49n 0.0v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 0.0v 8747.49n 0.0v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 1.8v 9047.49n 1.8v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 1.8v 9147.49n 1.8v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 0.0v 9297.49n 0.0v 9297.51n 0.0v 9347.49n 0.0v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 0.0v 9897.49n 0.0v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 0), (100, 1), (150, 0), (200, 0), (250, 0), (300, 1), (350, 0), (400, 0), (450, 0), (500, 0), (550, 1), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 1), (1050, 1), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 1), (1500, 1), (1550, 1), (1600, 0), (1650, 1), (1700, 0), (1750, 1), (1800, 1), (1850, 0), (1900, 0), (1950, 1), (2000, 1), (2050, 1), (2100, 1), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 0), (2400, 0), (2450, 0), (2500, 0), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 0), (2800, 0), (2850, 0), (2900, 0), (2950, 0), (3000, 1), (3050, 1), (3100, 1), (3150, 1), (3200, 1), (3250, 1), (3300, 1), (3350, 0), (3400, 0), (3450, 1), (3500, 1), (3550, 1), (3600, 1), (3650, 0), (3700, 0), (3750, 0), (3800, 1), (3850, 1), (3900, 1), (3950, 1), (4000, 1), (4050, 0), (4100, 1), (4150, 1), (4200, 1), (4250, 1), (4300, 1), (4350, 0), (4400, 0), (4450, 1), (4500, 1), (4550, 1), (4600, 0), (4650, 0), (4700, 0), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 0), (5000, 0), (5050, 1), (5100, 0), (5150, 1), (5200, 0), (5250, 0), (5300, 0), (5350, 0), (5400, 0), (5450, 1), (5500, 1), (5550, 0), (5600, 1), (5650, 1), (5700, 1), (5750, 0), (5800, 1), (5850, 1), (5900, 1), (5950, 1), (6000, 0), (6050, 0), (6100, 0), (6150, 0), (6200, 1), (6250, 0), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 1), (6700, 1), (6750, 0), (6800, 1), (6850, 1), (6900, 1), (6950, 1), (7000, 1), (7050, 1), (7100, 1), (7150, 1), (7200, 1), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 1), (7600, 1), (7650, 0), (7700, 0), (7750, 0), (7800, 0), (7850, 1), (7900, 0), (7950, 1), (8000, 0), (8050, 0), (8100, 1), (8150, 0), (8200, 0), (8250, 1), (8300, 1), (8350, 1), (8400, 0), (8450, 0), (8500, 0), (8550, 0), (8600, 0), (8650, 0), (8700, 0), (8750, 0), (8800, 1), (8850, 1), (8900, 1), (8950, 0), (9000, 0), (9050, 1), (9100, 1), (9150, 1), (9200, 1), (9250, 1), (9300, 1), (9350, 0), (9400, 0), (9450, 0), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 0), (9750, 0), (9800, 0), (9850, 0), (9900, 0), (9950, 0), (10000, 1), (10050, 1), (10100, 0), (10150, 0), (10200, 0), (10250, 0)]
Vdin0_6  din0_6  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 1.8v 147.49n 1.8v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 1.8v 347.49n 1.8v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 0.0v 547.49n 0.0v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 1.8v 1097.49n 1.8v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 0.0v 1647.49n 0.0v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 0.0v 1747.49n 0.0v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 1.8v 1997.49n 1.8v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 1.8v 2147.49n 1.8v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 0.0v 2447.49n 0.0v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 0.0v 2797.49n 0.0v 2797.51n 0.0v 2847.49n 0.0v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 1.8v 3147.49n 1.8v 3147.51n 1.8v 3197.49n 1.8v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 1.8v 3997.49n 1.8v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 1.8v 4247.49n 1.8v 4247.51n 1.8v 4297.49n 1.8v 4297.51n 1.8v 4347.49n 1.8v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 0.0v 4647.49n 0.0v 4647.51n 0.0v 4697.49n 0.0v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 0.0v 5597.49n 0.0v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 0.0v 5797.49n 0.0v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 1.8v 5997.49n 1.8v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 1.8v 6897.49n 1.8v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 1.8v 7147.49n 1.8v 7147.51n 1.8v 7197.49n 1.8v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 0.0v 7747.49n 0.0v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 0.0v 7947.49n 0.0v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 1.8v 8297.49n 1.8v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 1.8v 8397.49n 1.8v 8397.51n 0.0v 8447.49n 0.0v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 0.0v 8547.49n 0.0v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 0.0v 8697.49n 0.0v 8697.51n 0.0v 8747.49n 0.0v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 1.8v 8897.49n 1.8v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 1.8v 9147.49n 1.8v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 0.0v 9897.49n 0.0v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 0), (100, 1), (150, 1), (200, 1), (250, 0), (300, 1), (350, 1), (400, 1), (450, 1), (500, 0), (550, 0), (600, 0), (650, 0), (700, 0), (750, 0), (800, 0), (850, 0), (900, 0), (950, 1), (1000, 0), (1050, 0), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 1), (1500, 1), (1550, 1), (1600, 0), (1650, 1), (1700, 0), (1750, 0), (1800, 0), (1850, 0), (1900, 0), (1950, 1), (2000, 1), (2050, 1), (2100, 0), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 0), (2400, 0), (2450, 0), (2500, 0), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 0), (2800, 0), (2850, 1), (2900, 1), (2950, 1), (3000, 1), (3050, 1), (3100, 1), (3150, 1), (3200, 1), (3250, 1), (3300, 1), (3350, 1), (3400, 1), (3450, 1), (3500, 1), (3550, 1), (3600, 1), (3650, 0), (3700, 0), (3750, 0), (3800, 1), (3850, 1), (3900, 1), (3950, 1), (4000, 0), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 0), (4400, 0), (4450, 0), (4500, 0), (4550, 0), (4600, 0), (4650, 0), (4700, 0), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 1), (5000, 1), (5050, 1), (5100, 1), (5150, 1), (5200, 1), (5250, 1), (5300, 0), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 0), (5700, 0), (5750, 0), (5800, 1), (5850, 1), (5900, 1), (5950, 0), (6000, 0), (6050, 0), (6100, 0), (6150, 0), (6200, 0), (6250, 1), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 0), (6600, 0), (6650, 0), (6700, 0), (6750, 0), (6800, 1), (6850, 1), (6900, 1), (6950, 1), (7000, 1), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 0), (7600, 0), (7650, 0), (7700, 1), (7750, 1), (7800, 1), (7850, 1), (7900, 0), (7950, 1), (8000, 1), (8050, 1), (8100, 1), (8150, 0), (8200, 0), (8250, 0), (8300, 1), (8350, 0), (8400, 1), (8450, 0), (8500, 0), (8550, 1), (8600, 0), (8650, 0), (8700, 0), (8750, 0), (8800, 0), (8850, 0), (8900, 0), (8950, 1), (9000, 1), (9050, 1), (9100, 0), (9150, 0), (9200, 0), (9250, 0), (9300, 0), (9350, 1), (9400, 1), (9450, 1), (9500, 1), (9550, 1), (9600, 1), (9650, 1), (9700, 0), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 0), (10050, 0), (10100, 1), (10150, 0), (10200, 0), (10250, 0)]
Vdin0_7  din0_7  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 1.8v 147.49n 1.8v 147.51n 1.8v 197.49n 1.8v 197.51n 1.8v 247.49n 1.8v 247.51n 0.0v 297.49n 0.0v 297.51n 1.8v 347.49n 1.8v 347.51n 1.8v 397.49n 1.8v 397.51n 1.8v 447.49n 1.8v 447.51n 1.8v 497.49n 1.8v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 0.0v 747.49n 0.0v 747.51n 0.0v 797.49n 0.0v 797.51n 0.0v 847.49n 0.0v 847.51n 0.0v 897.49n 0.0v 897.51n 0.0v 947.49n 0.0v 947.51n 1.8v 997.49n 1.8v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 0.0v 1647.49n 0.0v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 0.0v 1747.49n 0.0v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 0.0v 1847.49n 0.0v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 1.8v 1997.49n 1.8v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 0.0v 2447.49n 0.0v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 0.0v 2797.49n 0.0v 2797.51n 0.0v 2847.49n 0.0v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 1.8v 2997.49n 1.8v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 1.8v 3147.49n 1.8v 3147.51n 1.8v 3197.49n 1.8v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 1.8v 3397.49n 1.8v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 1.8v 3997.49n 1.8v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 0.0v 4597.49n 0.0v 4597.51n 0.0v 4647.49n 0.0v 4647.51n 0.0v 4697.49n 0.0v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 1.8v 4997.49n 1.8v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 0.0v 5747.49n 0.0v 5747.51n 0.0v 5797.49n 0.0v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 0.0v 6597.49n 0.0v 6597.51n 0.0v 6647.49n 0.0v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 0.0v 6747.49n 0.0v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 1.8v 6897.49n 1.8v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 0.0v 7597.49n 0.0v 7597.51n 0.0v 7647.49n 0.0v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 0.0v 7947.49n 0.0v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 0.0v 8547.49n 0.0v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 0.0v 8697.49n 0.0v 8697.51n 0.0v 8747.49n 0.0v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 1.8v 9047.49n 1.8v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 0.0v 9297.49n 0.0v 9297.51n 0.0v 9347.49n 0.0v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 1.8v 9547.49n 1.8v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 1.8v 9647.49n 1.8v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 0.0v 10047.49n 0.0v 10047.51n 0.0v 10097.49n 0.0v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 1), (100, 1), (150, 1), (200, 1), (250, 0), (300, 0), (350, 0), (400, 0), (450, 0), (500, 1), (550, 1), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 1), (1050, 1), (1100, 1), (1150, 1), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 1), (1450, 0), (1500, 0), (1550, 0), (1600, 1), (1650, 1), (1700, 1), (1750, 1), (1800, 1), (1850, 0), (1900, 0), (1950, 1), (2000, 1), (2050, 1), (2100, 1), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 1), (2400, 1), (2450, 0), (2500, 0), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 0), (2900, 0), (2950, 0), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 1), (3250, 1), (3300, 1), (3350, 0), (3400, 0), (3450, 1), (3500, 1), (3550, 1), (3600, 1), (3650, 0), (3700, 0), (3750, 0), (3800, 0), (3850, 0), (3900, 0), (3950, 0), (4000, 1), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 1), (4400, 1), (4450, 1), (4500, 1), (4550, 1), (4600, 1), (4650, 1), (4700, 1), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 1), (5000, 0), (5050, 0), (5100, 1), (5150, 1), (5200, 1), (5250, 0), (5300, 1), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 0), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 0), (5850, 1), (5900, 1), (5950, 0), (6000, 0), (6050, 0), (6100, 0), (6150, 0), (6200, 1), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 1), (6700, 1), (6750, 1), (6800, 1), (6850, 1), (6900, 1), (6950, 1), (7000, 0), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 1), (7500, 1), (7550, 1), (7600, 1), (7650, 0), (7700, 1), (7750, 0), (7800, 0), (7850, 0), (7900, 1), (7950, 0), (8000, 1), (8050, 0), (8100, 0), (8150, 0), (8200, 0), (8250, 1), (8300, 0), (8350, 0), (8400, 0), (8450, 0), (8500, 0), (8550, 0), (8600, 1), (8650, 1), (8700, 1), (8750, 0), (8800, 1), (8850, 1), (8900, 1), (8950, 1), (9000, 1), (9050, 1), (9100, 0), (9150, 0), (9200, 1), (9250, 1), (9300, 1), (9350, 0), (9400, 0), (9450, 0), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 1), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 1), (10050, 1), (10100, 0), (10150, 1), (10200, 1), (10250, 1)]
Vdin0_8  din0_8  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 1.8v 147.49n 1.8v 147.51n 1.8v 197.49n 1.8v 197.51n 1.8v 247.49n 1.8v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 1.8v 547.49n 1.8v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 1.8v 1097.49n 1.8v 1097.51n 1.8v 1147.49n 1.8v 1147.51n 1.8v 1197.49n 1.8v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 1.8v 1447.49n 1.8v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 1.8v 1997.49n 1.8v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 1.8v 2147.49n 1.8v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 1.8v 4447.49n 1.8v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 1.8v 4997.49n 1.8v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 0.0v 5597.49n 0.0v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 0.0v 5847.49n 0.0v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 1.8v 6897.49n 1.8v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 0.0v 7047.49n 0.0v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 0.0v 7997.49n 0.0v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 1.8v 8297.49n 1.8v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 0.0v 8447.49n 0.0v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 0.0v 8547.49n 0.0v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 1.8v 8897.49n 1.8v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 1.8v 9047.49n 1.8v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )
* (time, data): [(0, 0), (50, 1), (100, 1), (150, 0), (200, 0), (250, 0), (300, 1), (350, 0), (400, 0), (450, 0), (500, 0), (550, 0), (600, 0), (650, 0), (700, 0), (750, 0), (800, 0), (850, 0), (900, 0), (950, 1), (1000, 0), (1050, 0), (1100, 0), (1150, 0), (1200, 1), (1250, 1), (1300, 1), (1350, 1), (1400, 1), (1450, 0), (1500, 0), (1550, 0), (1600, 1), (1650, 0), (1700, 0), (1750, 1), (1800, 1), (1850, 0), (1900, 0), (1950, 1), (2000, 1), (2050, 1), (2100, 1), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 1), (2400, 1), (2450, 0), (2500, 0), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 1), (3000, 1), (3050, 1), (3100, 1), (3150, 1), (3200, 1), (3250, 1), (3300, 0), (3350, 0), (3400, 0), (3450, 1), (3500, 1), (3550, 0), (3600, 0), (3650, 1), (3700, 1), (3750, 1), (3800, 0), (3850, 1), (3900, 1), (3950, 1), (4000, 1), (4050, 1), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 0), (4400, 1), (4450, 0), (4500, 1), (4550, 1), (4600, 0), (4650, 0), (4700, 0), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 1), (5000, 1), (5050, 0), (5100, 0), (5150, 0), (5200, 1), (5250, 1), (5300, 1), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 1), (5600, 0), (5650, 0), (5700, 0), (5750, 1), (5800, 0), (5850, 1), (5900, 1), (5950, 1), (6000, 0), (6050, 0), (6100, 0), (6150, 0), (6200, 1), (6250, 0), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 0), (6600, 0), (6650, 0), (6700, 0), (6750, 1), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 0), (7050, 1), (7100, 1), (7150, 1), (7200, 1), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 1), (7600, 0), (7650, 1), (7700, 0), (7750, 1), (7800, 1), (7850, 0), (7900, 0), (7950, 1), (8000, 0), (8050, 0), (8100, 0), (8150, 0), (8200, 0), (8250, 0), (8300, 0), (8350, 0), (8400, 1), (8450, 0), (8500, 0), (8550, 1), (8600, 0), (8650, 0), (8700, 0), (8750, 0), (8800, 1), (8850, 0), (8900, 0), (8950, 0), (9000, 0), (9050, 0), (9100, 0), (9150, 0), (9200, 1), (9250, 0), (9300, 0), (9350, 0), (9400, 0), (9450, 1), (9500, 1), (9550, 1), (9600, 1), (9650, 1), (9700, 1), (9750, 0), (9800, 0), (9850, 0), (9900, 0), (9950, 0), (10000, 0), (10050, 0), (10100, 1), (10150, 1), (10200, 1), (10250, 1)]
Vdin0_9  din0_9  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 1.8v 147.49n 1.8v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 1.8v 347.49n 1.8v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 0.0v 747.49n 0.0v 747.51n 0.0v 797.49n 0.0v 797.51n 0.0v 847.49n 0.0v 847.51n 0.0v 897.49n 0.0v 897.51n 0.0v 947.49n 0.0v 947.51n 1.8v 997.49n 1.8v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 1.8v 1247.49n 1.8v 1247.51n 1.8v 1297.49n 1.8v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 1.8v 1447.49n 1.8v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 0.0v 1747.49n 0.0v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 1.8v 1997.49n 1.8v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 1.8v 2147.49n 1.8v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 1.8v 2997.49n 1.8v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 1.8v 3147.49n 1.8v 3147.51n 1.8v 3197.49n 1.8v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 0.0v 3347.49n 0.0v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 1.8v 3997.49n 1.8v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 1.8v 4097.49n 1.8v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 1.8v 4447.49n 1.8v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 0.0v 4647.49n 0.0v 4647.51n 0.0v 4697.49n 0.0v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 1.8v 4997.49n 1.8v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 0.0v 5647.49n 0.0v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 0.0v 5747.49n 0.0v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 0.0v 5847.49n 0.0v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 1.8v 5997.49n 1.8v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 0.0v 6597.49n 0.0v 6597.51n 0.0v 6647.49n 0.0v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 0.0v 6747.49n 0.0v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 0.0v 7047.49n 0.0v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 1.8v 7147.49n 1.8v 7147.51n 1.8v 7197.49n 1.8v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 0.0v 7647.49n 0.0v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 0.0v 7747.49n 0.0v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 0.0v 7947.49n 0.0v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 0.0v 8547.49n 0.0v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 0.0v 8697.49n 0.0v 8697.51n 0.0v 8747.49n 0.0v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 0.0v 9297.49n 0.0v 9297.51n 0.0v 9347.49n 0.0v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 1.8v 9547.49n 1.8v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 1.8v 9647.49n 1.8v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 0.0v 9897.49n 0.0v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 0.0v 10047.49n 0.0v 10047.51n 0.0v 10097.49n 0.0v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )
* (time, data): [(0, 0), (50, 0), (100, 1), (150, 1), (200, 1), (250, 1), (300, 0), (350, 0), (400, 0), (450, 0), (500, 0), (550, 1), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 0), (1000, 1), (1050, 1), (1100, 1), (1150, 1), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 1), (1500, 1), (1550, 1), (1600, 1), (1650, 0), (1700, 1), (1750, 0), (1800, 0), (1850, 0), (1900, 0), (1950, 1), (2000, 0), (2050, 0), (2100, 1), (2150, 0), (2200, 0), (2250, 0), (2300, 0), (2350, 1), (2400, 1), (2450, 1), (2500, 1), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 0), (2900, 0), (2950, 0), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 1), (3250, 1), (3300, 0), (3350, 0), (3400, 0), (3450, 0), (3500, 0), (3550, 1), (3600, 1), (3650, 0), (3700, 0), (3750, 0), (3800, 0), (3850, 0), (3900, 0), (3950, 0), (4000, 1), (4050, 0), (4100, 1), (4150, 1), (4200, 1), (4250, 1), (4300, 1), (4350, 0), (4400, 1), (4450, 0), (4500, 0), (4550, 1), (4600, 1), (4650, 1), (4700, 1), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 1), (5000, 0), (5050, 1), (5100, 0), (5150, 1), (5200, 0), (5250, 0), (5300, 0), (5350, 0), (5400, 0), (5450, 1), (5500, 1), (5550, 1), (5600, 0), (5650, 0), (5700, 0), (5750, 1), (5800, 0), (5850, 0), (5900, 0), (5950, 0), (6000, 1), (6050, 1), (6100, 1), (6150, 1), (6200, 1), (6250, 0), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 0), (6600, 0), (6650, 0), (6700, 0), (6750, 1), (6800, 1), (6850, 1), (6900, 1), (6950, 1), (7000, 1), (7050, 1), (7100, 1), (7150, 1), (7200, 1), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 1), (7600, 0), (7650, 1), (7700, 1), (7750, 0), (7800, 0), (7850, 1), (7900, 0), (7950, 0), (8000, 0), (8050, 1), (8100, 1), (8150, 0), (8200, 0), (8250, 1), (8300, 1), (8350, 0), (8400, 1), (8450, 1), (8500, 1), (8550, 1), (8600, 1), (8650, 1), (8700, 0), (8750, 0), (8800, 1), (8850, 0), (8900, 0), (8950, 0), (9000, 0), (9050, 0), (9100, 0), (9150, 0), (9200, 1), (9250, 1), (9300, 1), (9350, 0), (9400, 0), (9450, 1), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 0), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 1), (10050, 1), (10100, 1), (10150, 1), (10200, 0), (10250, 0)]
Vdin0_10  din0_10  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 1.8v 147.49n 1.8v 147.51n 1.8v 197.49n 1.8v 197.51n 1.8v 247.49n 1.8v 247.51n 1.8v 297.49n 1.8v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 0.0v 547.49n 0.0v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 0.0v 997.49n 0.0v 997.51n 1.8v 1047.49n 1.8v 1047.51n 1.8v 1097.49n 1.8v 1097.51n 1.8v 1147.49n 1.8v 1147.51n 1.8v 1197.49n 1.8v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 0.0v 1847.49n 0.0v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 1.8v 1997.49n 1.8v 1997.51n 0.0v 2047.49n 0.0v 2047.51n 0.0v 2097.49n 0.0v 2097.51n 1.8v 2147.49n 1.8v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 1.8v 2547.49n 1.8v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 0.0v 3347.49n 0.0v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 1.8v 4247.49n 1.8v 4247.51n 1.8v 4297.49n 1.8v 4297.51n 1.8v 4347.49n 1.8v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 1.8v 4447.49n 1.8v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 1.8v 4997.49n 1.8v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 0.0v 5647.49n 0.0v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 0.0v 5747.49n 0.0v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 0.0v 5847.49n 0.0v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 0.0v 6597.49n 0.0v 6597.51n 0.0v 6647.49n 0.0v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 0.0v 6747.49n 0.0v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 1.8v 6897.49n 1.8v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 1.8v 7147.49n 1.8v 7147.51n 1.8v 7197.49n 1.8v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 0.0v 7647.49n 0.0v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 0.0v 7947.49n 0.0v 7947.51n 0.0v 7997.49n 0.0v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 1.8v 8297.49n 1.8v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 0.0v 8747.49n 0.0v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 0), (100, 1), (150, 0), (200, 0), (250, 1), (300, 0), (350, 0), (400, 0), (450, 0), (500, 1), (550, 0), (600, 0), (650, 0), (700, 0), (750, 0), (800, 0), (850, 0), (900, 0), (950, 1), (1000, 0), (1050, 0), (1100, 0), (1150, 0), (1200, 1), (1250, 1), (1300, 1), (1350, 1), (1400, 0), (1450, 0), (1500, 0), (1550, 0), (1600, 0), (1650, 1), (1700, 1), (1750, 0), (1800, 0), (1850, 0), (1900, 0), (1950, 1), (2000, 1), (2050, 1), (2100, 0), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 1), (2400, 1), (2450, 0), (2500, 0), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 0), (2800, 0), (2850, 0), (2900, 0), (2950, 0), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 1), (3250, 1), (3300, 1), (3350, 0), (3400, 0), (3450, 0), (3500, 0), (3550, 1), (3600, 1), (3650, 1), (3700, 1), (3750, 1), (3800, 1), (3850, 1), (3900, 1), (3950, 1), (4000, 1), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 0), (4400, 1), (4450, 0), (4500, 1), (4550, 0), (4600, 1), (4650, 1), (4700, 1), (4750, 1), (4800, 1), (4850, 1), (4900, 1), (4950, 0), (5000, 0), (5050, 1), (5100, 0), (5150, 1), (5200, 0), (5250, 0), (5300, 1), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 0), (5600, 0), (5650, 1), (5700, 1), (5750, 0), (5800, 0), (5850, 0), (5900, 0), (5950, 1), (6000, 1), (6050, 1), (6100, 1), (6150, 1), (6200, 1), (6250, 0), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 0), (6600, 0), (6650, 1), (6700, 1), (6750, 0), (6800, 1), (6850, 1), (6900, 1), (6950, 1), (7000, 0), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 0), (7500, 0), (7550, 1), (7600, 1), (7650, 0), (7700, 1), (7750, 0), (7800, 0), (7850, 0), (7900, 0), (7950, 1), (8000, 1), (8050, 0), (8100, 0), (8150, 0), (8200, 0), (8250, 0), (8300, 0), (8350, 0), (8400, 1), (8450, 1), (8500, 1), (8550, 0), (8600, 0), (8650, 0), (8700, 1), (8750, 1), (8800, 0), (8850, 0), (8900, 0), (8950, 1), (9000, 1), (9050, 0), (9100, 1), (9150, 1), (9200, 0), (9250, 1), (9300, 0), (9350, 0), (9400, 0), (9450, 0), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 0), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 1), (10050, 1), (10100, 0), (10150, 0), (10200, 1), (10250, 1)]
Vdin0_11  din0_11  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 1.8v 147.49n 1.8v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 1.8v 297.49n 1.8v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 1.8v 547.49n 1.8v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 0.0v 747.49n 0.0v 747.51n 0.0v 797.49n 0.0v 797.51n 0.0v 847.49n 0.0v 847.51n 0.0v 897.49n 0.0v 897.51n 0.0v 947.49n 0.0v 947.51n 1.8v 997.49n 1.8v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 1.8v 1247.49n 1.8v 1247.51n 1.8v 1297.49n 1.8v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 0.0v 1647.49n 0.0v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 0.0v 1847.49n 0.0v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 1.8v 1997.49n 1.8v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 0.0v 2797.49n 0.0v 2797.51n 0.0v 2847.49n 0.0v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 1.8v 3997.49n 1.8v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 1.8v 4447.49n 1.8v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 0.0v 4597.49n 0.0v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 1.8v 4797.49n 1.8v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 0.0v 5597.49n 0.0v 5597.51n 0.0v 5647.49n 0.0v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 0.0v 5797.49n 0.0v 5797.51n 0.0v 5847.49n 0.0v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 1.8v 5997.49n 1.8v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 0.0v 6597.49n 0.0v 6597.51n 0.0v 6647.49n 0.0v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 1.8v 6897.49n 1.8v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 0.0v 7047.49n 0.0v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 0.0v 7547.49n 0.0v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 0.0v 7947.49n 0.0v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 0.0v 8697.49n 0.0v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 1.8v 9047.49n 1.8v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 1.8v 9147.49n 1.8v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 0.0v 9347.49n 0.0v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )
* (time, data): [(0, 0), (50, 1), (100, 0), (150, 0), (200, 0), (250, 0), (300, 1), (350, 0), (400, 0), (450, 0), (500, 1), (550, 0), (600, 0), (650, 0), (700, 0), (750, 0), (800, 0), (850, 0), (900, 0), (950, 1), (1000, 1), (1050, 1), (1100, 1), (1150, 1), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 1), (1500, 1), (1550, 1), (1600, 0), (1650, 0), (1700, 1), (1750, 0), (1800, 0), (1850, 0), (1900, 0), (1950, 0), (2000, 1), (2050, 1), (2100, 0), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 0), (2400, 0), (2450, 0), (2500, 0), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 0), (2800, 0), (2850, 1), (2900, 1), (2950, 1), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 1), (3250, 1), (3300, 0), (3350, 1), (3400, 1), (3450, 1), (3500, 1), (3550, 1), (3600, 1), (3650, 1), (3700, 1), (3750, 1), (3800, 1), (3850, 1), (3900, 1), (3950, 1), (4000, 1), (4050, 1), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 0), (4400, 0), (4450, 0), (4500, 0), (4550, 1), (4600, 1), (4650, 1), (4700, 1), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 1), (5000, 1), (5050, 0), (5100, 1), (5150, 0), (5200, 0), (5250, 1), (5300, 0), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 1), (5600, 0), (5650, 0), (5700, 0), (5750, 1), (5800, 0), (5850, 1), (5900, 1), (5950, 0), (6000, 0), (6050, 0), (6100, 0), (6150, 0), (6200, 0), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 0), (6700, 0), (6750, 1), (6800, 1), (6850, 1), (6900, 1), (6950, 1), (7000, 1), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 0), (7600, 0), (7650, 0), (7700, 1), (7750, 1), (7800, 1), (7850, 0), (7900, 0), (7950, 1), (8000, 1), (8050, 1), (8100, 1), (8150, 0), (8200, 0), (8250, 1), (8300, 0), (8350, 0), (8400, 0), (8450, 0), (8500, 0), (8550, 1), (8600, 0), (8650, 0), (8700, 1), (8750, 0), (8800, 1), (8850, 0), (8900, 0), (8950, 0), (9000, 0), (9050, 1), (9100, 0), (9150, 0), (9200, 1), (9250, 1), (9300, 1), (9350, 0), (9400, 0), (9450, 1), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 1), (9750, 0), (9800, 0), (9850, 0), (9900, 0), (9950, 0), (10000, 0), (10050, 0), (10100, 0), (10150, 0), (10200, 0), (10250, 0)]
Vdin0_12  din0_12  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 1.8v 347.49n 1.8v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 1.8v 547.49n 1.8v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 0.0v 747.49n 0.0v 747.51n 0.0v 797.49n 0.0v 797.51n 0.0v 847.49n 0.0v 847.51n 0.0v 897.49n 0.0v 897.51n 0.0v 947.49n 0.0v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 1.8v 1097.49n 1.8v 1097.51n 1.8v 1147.49n 1.8v 1147.51n 1.8v 1197.49n 1.8v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 0.0v 1647.49n 0.0v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 0.0v 1847.49n 0.0v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 0.0v 2447.49n 0.0v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 0.0v 2797.49n 0.0v 2797.51n 0.0v 2847.49n 0.0v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 1.8v 2997.49n 1.8v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 0.0v 3347.49n 0.0v 3347.51n 1.8v 3397.49n 1.8v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 1.8v 3997.49n 1.8v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 1.8v 4097.49n 1.8v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 1.8v 4997.49n 1.8v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 0.0v 5647.49n 0.0v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 0.0v 5747.49n 0.0v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 0.0v 5847.49n 0.0v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 0.0v 6747.49n 0.0v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 1.8v 6897.49n 1.8v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 0.0v 7597.49n 0.0v 7597.51n 0.0v 7647.49n 0.0v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 0.0v 7947.49n 0.0v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 1.8v 8297.49n 1.8v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 0.0v 8447.49n 0.0v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 0.0v 8547.49n 0.0v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 0.0v 8697.49n 0.0v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 0.0v 9897.49n 0.0v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 0.0v 10047.49n 0.0v 10047.51n 0.0v 10097.49n 0.0v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 1), (100, 0), (150, 1), (200, 1), (250, 0), (300, 0), (350, 0), (400, 0), (450, 0), (500, 0), (550, 0), (600, 0), (650, 0), (700, 0), (750, 0), (800, 0), (850, 0), (900, 0), (950, 1), (1000, 1), (1050, 1), (1100, 0), (1150, 0), (1200, 1), (1250, 1), (1300, 1), (1350, 1), (1400, 0), (1450, 1), (1500, 1), (1550, 1), (1600, 0), (1650, 0), (1700, 1), (1750, 1), (1800, 1), (1850, 1), (1900, 1), (1950, 1), (2000, 1), (2050, 1), (2100, 1), (2150, 0), (2200, 0), (2250, 0), (2300, 0), (2350, 0), (2400, 0), (2450, 1), (2500, 1), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 0), (2800, 0), (2850, 0), (2900, 0), (2950, 0), (3000, 1), (3050, 1), (3100, 1), (3150, 1), (3200, 1), (3250, 1), (3300, 1), (3350, 1), (3400, 1), (3450, 0), (3500, 0), (3550, 0), (3600, 0), (3650, 0), (3700, 0), (3750, 0), (3800, 0), (3850, 0), (3900, 0), (3950, 0), (4000, 1), (4050, 0), (4100, 1), (4150, 1), (4200, 1), (4250, 1), (4300, 1), (4350, 1), (4400, 1), (4450, 0), (4500, 1), (4550, 0), (4600, 0), (4650, 0), (4700, 0), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 0), (5000, 0), (5050, 0), (5100, 0), (5150, 1), (5200, 0), (5250, 0), (5300, 1), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 0), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 1), (5900, 1), (5950, 0), (6000, 0), (6050, 0), (6100, 0), (6150, 0), (6200, 0), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 0), (6700, 0), (6750, 1), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 1), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 0), (7600, 1), (7650, 1), (7700, 1), (7750, 0), (7800, 0), (7850, 1), (7900, 1), (7950, 0), (8000, 0), (8050, 0), (8100, 0), (8150, 0), (8200, 0), (8250, 0), (8300, 1), (8350, 0), (8400, 0), (8450, 1), (8500, 1), (8550, 0), (8600, 1), (8650, 1), (8700, 0), (8750, 0), (8800, 0), (8850, 0), (8900, 0), (8950, 1), (9000, 1), (9050, 1), (9100, 1), (9150, 1), (9200, 0), (9250, 0), (9300, 1), (9350, 1), (9400, 1), (9450, 0), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 1), (9750, 0), (9800, 0), (9850, 0), (9900, 0), (9950, 0), (10000, 1), (10050, 1), (10100, 1), (10150, 0), (10200, 1), (10250, 1)]
Vdin0_13  din0_13  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 0.0v 147.49n 0.0v 147.51n 1.8v 197.49n 1.8v 197.51n 1.8v 247.49n 1.8v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 0.0v 747.49n 0.0v 747.51n 0.0v 797.49n 0.0v 797.51n 0.0v 847.49n 0.0v 847.51n 0.0v 897.49n 0.0v 897.51n 0.0v 947.49n 0.0v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 1.8v 1097.49n 1.8v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 1.8v 1247.49n 1.8v 1247.51n 1.8v 1297.49n 1.8v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 0.0v 1647.49n 0.0v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 1.8v 1947.49n 1.8v 1947.51n 1.8v 1997.49n 1.8v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 1.8v 2147.49n 1.8v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 0.0v 2447.49n 0.0v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 1.8v 2547.49n 1.8v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 0.0v 2797.49n 0.0v 2797.51n 0.0v 2847.49n 0.0v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 1.8v 3147.49n 1.8v 3147.51n 1.8v 3197.49n 1.8v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 1.8v 3397.49n 1.8v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 1.8v 4247.49n 1.8v 4247.51n 1.8v 4297.49n 1.8v 4297.51n 1.8v 4347.49n 1.8v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 1.8v 4447.49n 1.8v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 0.0v 4597.49n 0.0v 4597.51n 0.0v 4647.49n 0.0v 4647.51n 0.0v 4697.49n 0.0v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 0.0v 5597.49n 0.0v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 0.0v 6747.49n 0.0v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 0.0v 7597.49n 0.0v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 0.0v 7997.49n 0.0v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 0.0v 8447.49n 0.0v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 0.0v 8747.49n 0.0v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 1.8v 9047.49n 1.8v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 1.8v 9147.49n 1.8v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 0.0v 9297.49n 0.0v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 0.0v 9897.49n 0.0v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )
* (time, data): [(0, 0), (50, 1), (100, 1), (150, 0), (200, 0), (250, 0), (300, 0), (350, 1), (400, 1), (450, 1), (500, 0), (550, 0), (600, 0), (650, 0), (700, 0), (750, 0), (800, 0), (850, 0), (900, 0), (950, 0), (1000, 0), (1050, 0), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 1), (1450, 0), (1500, 0), (1550, 0), (1600, 1), (1650, 0), (1700, 0), (1750, 1), (1800, 1), (1850, 1), (1900, 1), (1950, 0), (2000, 1), (2050, 1), (2100, 1), (2150, 0), (2200, 0), (2250, 0), (2300, 0), (2350, 1), (2400, 1), (2450, 1), (2500, 1), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 1), (3000, 1), (3050, 1), (3100, 1), (3150, 1), (3200, 0), (3250, 0), (3300, 1), (3350, 1), (3400, 1), (3450, 1), (3500, 1), (3550, 1), (3600, 1), (3650, 1), (3700, 1), (3750, 1), (3800, 1), (3850, 0), (3900, 0), (3950, 0), (4000, 1), (4050, 1), (4100, 1), (4150, 1), (4200, 1), (4250, 1), (4300, 1), (4350, 1), (4400, 0), (4450, 0), (4500, 1), (4550, 0), (4600, 0), (4650, 0), (4700, 0), (4750, 1), (4800, 1), (4850, 1), (4900, 1), (4950, 0), (5000, 0), (5050, 0), (5100, 0), (5150, 1), (5200, 1), (5250, 0), (5300, 1), (5350, 0), (5400, 0), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 0), (5700, 0), (5750, 1), (5800, 0), (5850, 0), (5900, 0), (5950, 0), (6000, 1), (6050, 1), (6100, 1), (6150, 1), (6200, 1), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 1), (6700, 1), (6750, 0), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 1), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 1), (7500, 1), (7550, 1), (7600, 1), (7650, 1), (7700, 1), (7750, 1), (7800, 1), (7850, 0), (7900, 1), (7950, 1), (8000, 1), (8050, 1), (8100, 1), (8150, 1), (8200, 1), (8250, 0), (8300, 0), (8350, 1), (8400, 0), (8450, 0), (8500, 0), (8550, 1), (8600, 0), (8650, 0), (8700, 1), (8750, 0), (8800, 0), (8850, 0), (8900, 0), (8950, 0), (9000, 0), (9050, 0), (9100, 1), (9150, 1), (9200, 1), (9250, 0), (9300, 0), (9350, 0), (9400, 0), (9450, 1), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 0), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 0), (10050, 0), (10100, 0), (10150, 1), (10200, 0), (10250, 0)]
Vdin0_14  din0_14  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 1.8v 147.49n 1.8v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 1.8v 397.49n 1.8v 397.51n 1.8v 447.49n 1.8v 447.51n 1.8v 497.49n 1.8v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 0.0v 747.49n 0.0v 747.51n 0.0v 797.49n 0.0v 797.51n 0.0v 847.49n 0.0v 847.51n 0.0v 897.49n 0.0v 897.51n 0.0v 947.49n 0.0v 947.51n 0.0v 997.49n 0.0v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 1.8v 1447.49n 1.8v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 0.0v 1747.49n 0.0v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 1.8v 1947.49n 1.8v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 1.8v 2147.49n 1.8v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 1.8v 2547.49n 1.8v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 1.8v 2997.49n 1.8v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 1.8v 3147.49n 1.8v 3147.51n 1.8v 3197.49n 1.8v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 0.0v 3297.49n 0.0v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 1.8v 3397.49n 1.8v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 1.8v 4097.49n 1.8v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 1.8v 4247.49n 1.8v 4247.51n 1.8v 4297.49n 1.8v 4297.51n 1.8v 4347.49n 1.8v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 0.0v 4597.49n 0.0v 4597.51n 0.0v 4647.49n 0.0v 4647.51n 0.0v 4697.49n 0.0v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 1.8v 4797.49n 1.8v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 0.0v 5747.49n 0.0v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 0.0v 5847.49n 0.0v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 1.8v 8397.49n 1.8v 8397.51n 0.0v 8447.49n 0.0v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 0.0v 8547.49n 0.0v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 0.0v 8697.49n 0.0v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 1.8v 9147.49n 1.8v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 0.0v 9297.49n 0.0v 9297.51n 0.0v 9347.49n 0.0v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 0.0v 10047.49n 0.0v 10047.51n 0.0v 10097.49n 0.0v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 0), (100, 0), (150, 1), (200, 1), (250, 0), (300, 0), (350, 0), (400, 0), (450, 0), (500, 0), (550, 0), (600, 0), (650, 0), (700, 0), (750, 0), (800, 0), (850, 0), (900, 0), (950, 0), (1000, 0), (1050, 0), (1100, 0), (1150, 0), (1200, 1), (1250, 1), (1300, 1), (1350, 1), (1400, 1), (1450, 1), (1500, 1), (1550, 1), (1600, 0), (1650, 0), (1700, 1), (1750, 0), (1800, 0), (1850, 0), (1900, 0), (1950, 1), (2000, 1), (2050, 1), (2100, 0), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 0), (2400, 0), (2450, 1), (2500, 1), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 1), (3000, 1), (3050, 1), (3100, 1), (3150, 1), (3200, 1), (3250, 1), (3300, 0), (3350, 0), (3400, 0), (3450, 0), (3500, 0), (3550, 0), (3600, 0), (3650, 0), (3700, 0), (3750, 0), (3800, 0), (3850, 0), (3900, 0), (3950, 0), (4000, 1), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 0), (4400, 1), (4450, 1), (4500, 0), (4550, 1), (4600, 0), (4650, 0), (4700, 0), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 1), (5000, 1), (5050, 1), (5100, 0), (5150, 0), (5200, 0), (5250, 1), (5300, 0), (5350, 0), (5400, 0), (5450, 1), (5500, 1), (5550, 1), (5600, 0), (5650, 0), (5700, 0), (5750, 0), (5800, 1), (5850, 0), (5900, 0), (5950, 1), (6000, 1), (6050, 1), (6100, 1), (6150, 1), (6200, 1), (6250, 1), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 0), (6600, 0), (6650, 0), (6700, 0), (6750, 0), (6800, 1), (6850, 1), (6900, 1), (6950, 1), (7000, 0), (7050, 1), (7100, 1), (7150, 1), (7200, 1), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 1), (7500, 1), (7550, 0), (7600, 1), (7650, 1), (7700, 0), (7750, 1), (7800, 1), (7850, 0), (7900, 1), (7950, 1), (8000, 1), (8050, 1), (8100, 1), (8150, 1), (8200, 1), (8250, 0), (8300, 0), (8350, 1), (8400, 1), (8450, 1), (8500, 1), (8550, 0), (8600, 1), (8650, 1), (8700, 1), (8750, 0), (8800, 1), (8850, 0), (8900, 0), (8950, 0), (9000, 0), (9050, 1), (9100, 1), (9150, 1), (9200, 1), (9250, 1), (9300, 1), (9350, 1), (9400, 1), (9450, 0), (9500, 1), (9550, 1), (9600, 1), (9650, 1), (9700, 0), (9750, 0), (9800, 0), (9850, 0), (9900, 0), (9950, 0), (10000, 0), (10050, 0), (10100, 1), (10150, 0), (10200, 0), (10250, 0)]
Vdin0_15  din0_15  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 1.8v 197.49n 1.8v 197.51n 1.8v 247.49n 1.8v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 0.0v 747.49n 0.0v 747.51n 0.0v 797.49n 0.0v 797.51n 0.0v 847.49n 0.0v 847.51n 0.0v 897.49n 0.0v 897.51n 0.0v 947.49n 0.0v 947.51n 0.0v 997.49n 0.0v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 1.8v 1247.49n 1.8v 1247.51n 1.8v 1297.49n 1.8v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 1.8v 1447.49n 1.8v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 0.0v 1647.49n 0.0v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 0.0v 1847.49n 0.0v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 1.8v 1997.49n 1.8v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 0.0v 2447.49n 0.0v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 1.8v 2547.49n 1.8v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 1.8v 2997.49n 1.8v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 1.8v 3147.49n 1.8v 3147.51n 1.8v 3197.49n 1.8v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 0.0v 3347.49n 0.0v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 1.8v 4447.49n 1.8v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 0.0v 4647.49n 0.0v 4647.51n 0.0v 4697.49n 0.0v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 1.8v 4997.49n 1.8v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 0.0v 5647.49n 0.0v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 0.0v 5747.49n 0.0v 5747.51n 0.0v 5797.49n 0.0v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 1.8v 5997.49n 1.8v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 0.0v 6597.49n 0.0v 6597.51n 0.0v 6647.49n 0.0v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 0.0v 6747.49n 0.0v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 1.8v 6897.49n 1.8v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 0.0v 7047.49n 0.0v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 1.8v 7147.49n 1.8v 7147.51n 1.8v 7197.49n 1.8v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 0.0v 7597.49n 0.0v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 0.0v 7747.49n 0.0v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 1.8v 8397.49n 1.8v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 1.8v 9147.49n 1.8v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 1.8v 9547.49n 1.8v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 1.8v 9647.49n 1.8v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 0.0v 9897.49n 0.0v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 0.0v 10047.49n 0.0v 10047.51n 0.0v 10097.49n 0.0v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 0), (100, 0), (150, 0), (200, 0), (250, 1), (300, 0), (350, 0), (400, 0), (450, 0), (500, 0), (550, 1), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 1), (1050, 1), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 1), (1450, 0), (1500, 0), (1550, 0), (1600, 0), (1650, 1), (1700, 0), (1750, 0), (1800, 0), (1850, 0), (1900, 0), (1950, 0), (2000, 1), (2050, 1), (2100, 0), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 1), (2400, 1), (2450, 1), (2500, 1), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 1), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 0), (3250, 0), (3300, 0), (3350, 1), (3400, 1), (3450, 1), (3500, 1), (3550, 0), (3600, 0), (3650, 1), (3700, 1), (3750, 1), (3800, 0), (3850, 0), (3900, 0), (3950, 0), (4000, 1), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 1), (4400, 1), (4450, 1), (4500, 0), (4550, 0), (4600, 1), (4650, 1), (4700, 1), (4750, 1), (4800, 1), (4850, 1), (4900, 1), (4950, 0), (5000, 0), (5050, 0), (5100, 0), (5150, 1), (5200, 0), (5250, 1), (5300, 0), (5350, 0), (5400, 0), (5450, 0), (5500, 0), (5550, 0), (5600, 1), (5650, 0), (5700, 0), (5750, 0), (5800, 1), (5850, 1), (5900, 1), (5950, 0), (6000, 0), (6050, 0), (6100, 0), (6150, 0), (6200, 1), (6250, 1), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 0), (6600, 0), (6650, 0), (6700, 0), (6750, 1), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 1), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 0), (7600, 1), (7650, 0), (7700, 0), (7750, 0), (7800, 0), (7850, 0), (7900, 0), (7950, 1), (8000, 0), (8050, 0), (8100, 1), (8150, 0), (8200, 0), (8250, 0), (8300, 0), (8350, 0), (8400, 0), (8450, 1), (8500, 1), (8550, 1), (8600, 1), (8650, 1), (8700, 0), (8750, 1), (8800, 0), (8850, 0), (8900, 0), (8950, 1), (9000, 1), (9050, 1), (9100, 0), (9150, 0), (9200, 0), (9250, 0), (9300, 0), (9350, 1), (9400, 1), (9450, 0), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 1), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 1), (10050, 1), (10100, 0), (10150, 0), (10200, 1), (10250, 1)]
Va0_0  a0_0  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 1.8v 297.49n 1.8v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 0.0v 547.49n 0.0v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 1.8v 1097.49n 1.8v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 1.8v 1447.49n 1.8v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 0.0v 1647.49n 0.0v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 0.0v 1747.49n 0.0v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 0.0v 1847.49n 0.0v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 1.8v 2547.49n 1.8v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 1.8v 2997.49n 1.8v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 0.0v 3297.49n 0.0v 3297.51n 0.0v 3347.49n 0.0v 3347.51n 1.8v 3397.49n 1.8v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 1.8v 4447.49n 1.8v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 0.0v 4597.49n 0.0v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 1.8v 4797.49n 1.8v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 0.0v 5497.49n 0.0v 5497.51n 0.0v 5547.49n 0.0v 5547.51n 0.0v 5597.49n 0.0v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 0.0v 5747.49n 0.0v 5747.51n 0.0v 5797.49n 0.0v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 0.0v 6597.49n 0.0v 6597.51n 0.0v 6647.49n 0.0v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 0.0v 6747.49n 0.0v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 0.0v 7597.49n 0.0v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 0.0v 7747.49n 0.0v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 0.0v 7947.49n 0.0v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 0.0v 8447.49n 0.0v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 0.0v 8747.49n 0.0v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 1.8v 9047.49n 1.8v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 0.0v 9297.49n 0.0v 9297.51n 0.0v 9347.49n 0.0v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )
* (time, data): [(0, 0), (50, 0), (100, 0), (150, 1), (200, 1), (250, 1), (300, 0), (350, 0), (400, 0), (450, 0), (500, 0), (550, 1), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 0), (1050, 0), (1100, 1), (1150, 1), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 1), (1500, 1), (1550, 1), (1600, 0), (1650, 0), (1700, 0), (1750, 1), (1800, 1), (1850, 1), (1900, 1), (1950, 0), (2000, 0), (2050, 0), (2100, 0), (2150, 0), (2200, 0), (2250, 0), (2300, 0), (2350, 1), (2400, 1), (2450, 0), (2500, 0), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 1), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 0), (3250, 0), (3300, 1), (3350, 0), (3400, 0), (3450, 1), (3500, 1), (3550, 1), (3600, 1), (3650, 0), (3700, 0), (3750, 0), (3800, 0), (3850, 1), (3900, 1), (3950, 1), (4000, 0), (4050, 1), (4100, 1), (4150, 1), (4200, 1), (4250, 1), (4300, 1), (4350, 0), (4400, 0), (4450, 1), (4500, 1), (4550, 0), (4600, 0), (4650, 0), (4700, 0), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 1), (5000, 1), (5050, 0), (5100, 0), (5150, 1), (5200, 0), (5250, 0), (5300, 0), (5350, 1), (5400, 1), (5450, 0), (5500, 0), (5550, 1), (5600, 1), (5650, 0), (5700, 0), (5750, 1), (5800, 0), (5850, 1), (5900, 1), (5950, 0), (6000, 0), (6050, 0), (6100, 0), (6150, 0), (6200, 1), (6250, 1), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 0), (6600, 0), (6650, 1), (6700, 1), (6750, 0), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 1), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 0), (7500, 0), (7550, 0), (7600, 0), (7650, 1), (7700, 1), (7750, 1), (7800, 1), (7850, 0), (7900, 1), (7950, 0), (8000, 0), (8050, 1), (8100, 0), (8150, 0), (8200, 0), (8250, 0), (8300, 0), (8350, 1), (8400, 1), (8450, 1), (8500, 1), (8550, 1), (8600, 1), (8650, 1), (8700, 1), (8750, 1), (8800, 0), (8850, 0), (8900, 0), (8950, 0), (9000, 0), (9050, 0), (9100, 0), (9150, 0), (9200, 0), (9250, 1), (9300, 1), (9350, 1), (9400, 1), (9450, 0), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 0), (9750, 0), (9800, 0), (9850, 0), (9900, 0), (9950, 0), (10000, 1), (10050, 1), (10100, 1), (10150, 1), (10200, 0), (10250, 0)]
Va0_1  a0_1  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 1.8v 197.49n 1.8v 197.51n 1.8v 247.49n 1.8v 247.51n 1.8v 297.49n 1.8v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 0.0v 547.49n 0.0v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 1.8v 1147.49n 1.8v 1147.51n 1.8v 1197.49n 1.8v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 0.0v 1647.49n 0.0v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 0.0v 1747.49n 0.0v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 1.8v 1947.49n 1.8v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 0.0v 2047.49n 0.0v 2047.51n 0.0v 2097.49n 0.0v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 1.8v 2997.49n 1.8v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 0.0v 3297.49n 0.0v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 1.8v 3997.49n 1.8v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 1.8v 4097.49n 1.8v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 1.8v 4247.49n 1.8v 4247.51n 1.8v 4297.49n 1.8v 4297.51n 1.8v 4347.49n 1.8v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 0.0v 4597.49n 0.0v 4597.51n 0.0v 4647.49n 0.0v 4647.51n 0.0v 4697.49n 0.0v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 1.8v 4997.49n 1.8v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 0.0v 5497.49n 0.0v 5497.51n 0.0v 5547.49n 0.0v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 0.0v 5747.49n 0.0v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 0.0v 5847.49n 0.0v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 0.0v 6597.49n 0.0v 6597.51n 0.0v 6647.49n 0.0v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 0.0v 7547.49n 0.0v 7547.51n 0.0v 7597.49n 0.0v 7597.51n 0.0v 7647.49n 0.0v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 0.0v 7997.49n 0.0v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 1.8v 8397.49n 1.8v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 0.0v 9897.49n 0.0v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 1), (100, 0), (150, 0), (200, 0), (250, 0), (300, 0), (350, 0), (400, 0), (450, 0), (500, 1), (550, 0), (600, 0), (650, 0), (700, 0), (750, 0), (800, 0), (850, 0), (900, 0), (950, 0), (1000, 0), (1050, 0), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 0), (1500, 0), (1550, 0), (1600, 1), (1650, 0), (1700, 1), (1750, 1), (1800, 1), (1850, 0), (1900, 0), (1950, 0), (2000, 1), (2050, 1), (2100, 0), (2150, 0), (2200, 0), (2250, 0), (2300, 0), (2350, 0), (2400, 0), (2450, 0), (2500, 0), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 0), (2800, 0), (2850, 0), (2900, 0), (2950, 0), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 1), (3250, 1), (3300, 1), (3350, 0), (3400, 0), (3450, 0), (3500, 0), (3550, 0), (3600, 0), (3650, 1), (3700, 1), (3750, 1), (3800, 0), (3850, 0), (3900, 0), (3950, 0), (4000, 0), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 1), (4400, 0), (4450, 0), (4500, 0), (4550, 1), (4600, 1), (4650, 1), (4700, 1), (4750, 1), (4800, 1), (4850, 1), (4900, 1), (4950, 0), (5000, 1), (5050, 1), (5100, 1), (5150, 0), (5200, 1), (5250, 0), (5300, 0), (5350, 0), (5400, 0), (5450, 1), (5500, 1), (5550, 1), (5600, 0), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 0), (5900, 0), (5950, 0), (6000, 1), (6050, 1), (6100, 1), (6150, 1), (6200, 0), (6250, 0), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 1), (6700, 1), (6750, 1), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 0), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 0), (7500, 0), (7550, 1), (7600, 1), (7650, 0), (7700, 1), (7750, 0), (7800, 0), (7850, 0), (7900, 1), (7950, 0), (8000, 0), (8050, 0), (8100, 0), (8150, 1), (8200, 1), (8250, 0), (8300, 1), (8350, 0), (8400, 1), (8450, 0), (8500, 0), (8550, 0), (8600, 0), (8650, 0), (8700, 1), (8750, 0), (8800, 0), (8850, 1), (8900, 1), (8950, 0), (9000, 0), (9050, 1), (9100, 0), (9150, 0), (9200, 0), (9250, 1), (9300, 1), (9350, 0), (9400, 0), (9450, 1), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 1), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 0), (10050, 0), (10100, 0), (10150, 0), (10200, 0), (10250, 0)]
Va0_2  a0_2  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 1.8v 547.49n 1.8v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 0.0v 747.49n 0.0v 747.51n 0.0v 797.49n 0.0v 797.51n 0.0v 847.49n 0.0v 847.51n 0.0v 897.49n 0.0v 897.51n 0.0v 947.49n 0.0v 947.51n 0.0v 997.49n 0.0v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 0.0v 2447.49n 0.0v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 0.0v 2797.49n 0.0v 2797.51n 0.0v 2847.49n 0.0v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 1.8v 4797.49n 1.8v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 0.0v 5647.49n 0.0v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 0.0v 7047.49n 0.0v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 0.0v 7547.49n 0.0v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 0.0v 7997.49n 0.0v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 0.0v 8547.49n 0.0v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 0.0v 8697.49n 0.0v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 1.8v 8897.49n 1.8v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 0.0v 10047.49n 0.0v 10047.51n 0.0v 10097.49n 0.0v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 1), (100, 0), (150, 0), (200, 0), (250, 0), (300, 0), (350, 0), (400, 0), (450, 0), (500, 1), (550, 1), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 0), (1050, 0), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 0), (1500, 0), (1550, 0), (1600, 1), (1650, 0), (1700, 1), (1750, 1), (1800, 1), (1850, 0), (1900, 0), (1950, 0), (2000, 1), (2050, 1), (2100, 0), (2150, 0), (2200, 0), (2250, 0), (2300, 0), (2350, 1), (2400, 1), (2450, 0), (2500, 0), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 0), (2900, 0), (2950, 0), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 1), (3250, 1), (3300, 1), (3350, 0), (3400, 0), (3450, 0), (3500, 0), (3550, 0), (3600, 0), (3650, 1), (3700, 1), (3750, 1), (3800, 0), (3850, 0), (3900, 0), (3950, 0), (4000, 0), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 1), (4400, 0), (4450, 1), (4500, 0), (4550, 1), (4600, 1), (4650, 1), (4700, 1), (4750, 1), (4800, 1), (4850, 1), (4900, 1), (4950, 0), (5000, 1), (5050, 1), (5100, 1), (5150, 0), (5200, 1), (5250, 0), (5300, 0), (5350, 0), (5400, 0), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 1), (5900, 1), (5950, 0), (6000, 1), (6050, 1), (6100, 1), (6150, 1), (6200, 1), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 1), (6700, 1), (6750, 1), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 1), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 0), (7500, 0), (7550, 1), (7600, 1), (7650, 0), (7700, 1), (7750, 0), (7800, 0), (7850, 0), (7900, 1), (7950, 0), (8000, 0), (8050, 0), (8100, 0), (8150, 1), (8200, 1), (8250, 0), (8300, 1), (8350, 0), (8400, 1), (8450, 1), (8500, 1), (8550, 1), (8600, 1), (8650, 1), (8700, 1), (8750, 0), (8800, 0), (8850, 1), (8900, 1), (8950, 0), (9000, 0), (9050, 1), (9100, 0), (9150, 0), (9200, 0), (9250, 1), (9300, 1), (9350, 0), (9400, 0), (9450, 1), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 1), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 1), (10050, 1), (10100, 0), (10150, 0), (10200, 0), (10250, 0)]
Va0_3  a0_3  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 1.8v 547.49n 1.8v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 1.8v 4797.49n 1.8v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 0.0v 7547.49n 0.0v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 0.0v 7997.49n 0.0v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 1.8v 8897.49n 1.8v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 1), (100, 0), (150, 0), (200, 0), (250, 0), (300, 0), (350, 0), (400, 0), (450, 0), (500, 1), (550, 1), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 0), (1050, 0), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 0), (1500, 0), (1550, 0), (1600, 1), (1650, 0), (1700, 1), (1750, 1), (1800, 1), (1850, 0), (1900, 0), (1950, 0), (2000, 1), (2050, 1), (2100, 0), (2150, 0), (2200, 0), (2250, 0), (2300, 0), (2350, 1), (2400, 1), (2450, 0), (2500, 0), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 0), (2900, 0), (2950, 0), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 1), (3250, 1), (3300, 1), (3350, 0), (3400, 0), (3450, 0), (3500, 0), (3550, 0), (3600, 0), (3650, 1), (3700, 1), (3750, 1), (3800, 0), (3850, 0), (3900, 0), (3950, 0), (4000, 0), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 1), (4400, 0), (4450, 1), (4500, 0), (4550, 1), (4600, 1), (4650, 1), (4700, 1), (4750, 1), (4800, 1), (4850, 1), (4900, 1), (4950, 0), (5000, 1), (5050, 1), (5100, 1), (5150, 0), (5200, 1), (5250, 0), (5300, 0), (5350, 0), (5400, 0), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 1), (5900, 1), (5950, 0), (6000, 1), (6050, 1), (6100, 1), (6150, 1), (6200, 1), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 1), (6700, 1), (6750, 1), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 1), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 0), (7500, 0), (7550, 1), (7600, 1), (7650, 0), (7700, 1), (7750, 0), (7800, 0), (7850, 0), (7900, 1), (7950, 0), (8000, 0), (8050, 0), (8100, 0), (8150, 1), (8200, 1), (8250, 0), (8300, 1), (8350, 0), (8400, 1), (8450, 1), (8500, 1), (8550, 1), (8600, 1), (8650, 1), (8700, 1), (8750, 0), (8800, 0), (8850, 1), (8900, 1), (8950, 0), (9000, 0), (9050, 1), (9100, 0), (9150, 0), (9200, 0), (9250, 1), (9300, 1), (9350, 0), (9400, 0), (9450, 1), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 1), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 1), (10050, 1), (10100, 0), (10150, 0), (10200, 0), (10250, 0)]
Va0_4  a0_4  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 1.8v 547.49n 1.8v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 1.8v 4797.49n 1.8v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 0.0v 7547.49n 0.0v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 0.0v 7997.49n 0.0v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 1.8v 8897.49n 1.8v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 1), (100, 0), (150, 0), (200, 0), (250, 0), (300, 0), (350, 0), (400, 0), (450, 0), (500, 1), (550, 1), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 0), (1050, 0), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 0), (1500, 0), (1550, 0), (1600, 1), (1650, 0), (1700, 1), (1750, 1), (1800, 1), (1850, 0), (1900, 0), (1950, 0), (2000, 1), (2050, 1), (2100, 0), (2150, 0), (2200, 0), (2250, 0), (2300, 0), (2350, 1), (2400, 1), (2450, 0), (2500, 0), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 0), (2900, 0), (2950, 0), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 1), (3250, 1), (3300, 1), (3350, 0), (3400, 0), (3450, 0), (3500, 0), (3550, 0), (3600, 0), (3650, 1), (3700, 1), (3750, 1), (3800, 0), (3850, 0), (3900, 0), (3950, 0), (4000, 0), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 1), (4400, 0), (4450, 1), (4500, 0), (4550, 1), (4600, 1), (4650, 1), (4700, 1), (4750, 1), (4800, 1), (4850, 1), (4900, 1), (4950, 0), (5000, 1), (5050, 1), (5100, 1), (5150, 0), (5200, 1), (5250, 0), (5300, 0), (5350, 0), (5400, 0), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 1), (5900, 1), (5950, 0), (6000, 1), (6050, 1), (6100, 1), (6150, 1), (6200, 1), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 1), (6700, 1), (6750, 1), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 1), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 0), (7500, 0), (7550, 1), (7600, 1), (7650, 0), (7700, 1), (7750, 0), (7800, 0), (7850, 0), (7900, 1), (7950, 0), (8000, 0), (8050, 0), (8100, 0), (8150, 1), (8200, 1), (8250, 0), (8300, 1), (8350, 0), (8400, 1), (8450, 1), (8500, 1), (8550, 1), (8600, 1), (8650, 1), (8700, 1), (8750, 0), (8800, 0), (8850, 1), (8900, 1), (8950, 0), (9000, 0), (9050, 1), (9100, 0), (9150, 0), (9200, 0), (9250, 1), (9300, 1), (9350, 0), (9400, 0), (9450, 1), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 1), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 1), (10050, 1), (10100, 0), (10150, 0), (10200, 0), (10250, 0)]
Va0_5  a0_5  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 1.8v 547.49n 1.8v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 1.8v 4797.49n 1.8v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 0.0v 7547.49n 0.0v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 0.0v 7997.49n 0.0v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 1.8v 8897.49n 1.8v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 1), (100, 0), (150, 0), (200, 0), (250, 0), (300, 0), (350, 0), (400, 0), (450, 0), (500, 1), (550, 1), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 0), (1050, 0), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 0), (1500, 0), (1550, 0), (1600, 1), (1650, 0), (1700, 1), (1750, 1), (1800, 1), (1850, 0), (1900, 0), (1950, 0), (2000, 1), (2050, 1), (2100, 0), (2150, 0), (2200, 0), (2250, 0), (2300, 0), (2350, 1), (2400, 1), (2450, 0), (2500, 0), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 0), (2900, 0), (2950, 0), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 1), (3250, 1), (3300, 1), (3350, 0), (3400, 0), (3450, 0), (3500, 0), (3550, 0), (3600, 0), (3650, 1), (3700, 1), (3750, 1), (3800, 0), (3850, 0), (3900, 0), (3950, 0), (4000, 0), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 1), (4400, 0), (4450, 1), (4500, 0), (4550, 1), (4600, 1), (4650, 1), (4700, 1), (4750, 1), (4800, 1), (4850, 1), (4900, 1), (4950, 0), (5000, 1), (5050, 1), (5100, 1), (5150, 0), (5200, 1), (5250, 0), (5300, 0), (5350, 0), (5400, 0), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 1), (5900, 1), (5950, 0), (6000, 1), (6050, 1), (6100, 1), (6150, 1), (6200, 1), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 1), (6700, 1), (6750, 1), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 1), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 0), (7500, 0), (7550, 1), (7600, 1), (7650, 0), (7700, 1), (7750, 0), (7800, 0), (7850, 0), (7900, 1), (7950, 0), (8000, 0), (8050, 0), (8100, 0), (8150, 1), (8200, 1), (8250, 0), (8300, 1), (8350, 0), (8400, 1), (8450, 1), (8500, 1), (8550, 1), (8600, 1), (8650, 1), (8700, 1), (8750, 0), (8800, 0), (8850, 1), (8900, 1), (8950, 0), (9000, 0), (9050, 1), (9100, 0), (9150, 0), (9200, 0), (9250, 1), (9300, 1), (9350, 0), (9400, 0), (9450, 1), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 1), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 1), (10050, 1), (10100, 0), (10150, 0), (10200, 0), (10250, 0)]
Va0_6  a0_6  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 1.8v 547.49n 1.8v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 1.8v 4797.49n 1.8v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 0.0v 7547.49n 0.0v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 0.0v 7997.49n 0.0v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 1.8v 8897.49n 1.8v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 1), (100, 0), (150, 0), (200, 0), (250, 0), (300, 0), (350, 0), (400, 0), (450, 0), (500, 1), (550, 1), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 0), (1050, 0), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 0), (1500, 0), (1550, 0), (1600, 1), (1650, 0), (1700, 1), (1750, 1), (1800, 1), (1850, 0), (1900, 0), (1950, 0), (2000, 1), (2050, 1), (2100, 0), (2150, 0), (2200, 0), (2250, 0), (2300, 0), (2350, 1), (2400, 1), (2450, 0), (2500, 0), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 0), (2900, 0), (2950, 0), (3000, 0), (3050, 0), (3100, 0), (3150, 0), (3200, 1), (3250, 1), (3300, 1), (3350, 0), (3400, 0), (3450, 0), (3500, 0), (3550, 0), (3600, 0), (3650, 1), (3700, 1), (3750, 1), (3800, 0), (3850, 0), (3900, 0), (3950, 0), (4000, 0), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 1), (4400, 0), (4450, 1), (4500, 0), (4550, 1), (4600, 1), (4650, 1), (4700, 1), (4750, 1), (4800, 1), (4850, 1), (4900, 1), (4950, 0), (5000, 1), (5050, 1), (5100, 1), (5150, 0), (5200, 1), (5250, 0), (5300, 0), (5350, 0), (5400, 0), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 1), (5900, 1), (5950, 0), (6000, 1), (6050, 1), (6100, 1), (6150, 1), (6200, 1), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 1), (6700, 1), (6750, 1), (6800, 0), (6850, 0), (6900, 0), (6950, 0), (7000, 1), (7050, 0), (7100, 0), (7150, 0), (7200, 0), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 0), (7500, 0), (7550, 1), (7600, 1), (7650, 0), (7700, 1), (7750, 0), (7800, 0), (7850, 0), (7900, 1), (7950, 0), (8000, 0), (8050, 0), (8100, 0), (8150, 1), (8200, 1), (8250, 0), (8300, 1), (8350, 0), (8400, 1), (8450, 1), (8500, 1), (8550, 1), (8600, 1), (8650, 1), (8700, 1), (8750, 0), (8800, 0), (8850, 1), (8900, 1), (8950, 0), (9000, 0), (9050, 1), (9100, 0), (9150, 0), (9200, 0), (9250, 1), (9300, 1), (9350, 0), (9400, 0), (9450, 1), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 1), (9750, 1), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 1), (10050, 1), (10100, 0), (10150, 0), (10200, 0), (10250, 0)]
Va0_7  a0_7  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 1.8v 97.49n 1.8v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 1.8v 547.49n 1.8v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 1.8v 4797.49n 1.8v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 1.8v 5897.49n 1.8v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 0.0v 7547.49n 0.0v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 0.0v 7997.49n 0.0v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 1.8v 8897.49n 1.8v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 1.8v 9797.49n 1.8v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 0), (100, 0), (150, 0), (200, 0), (250, 0), (300, 0), (350, 0), (400, 0), (450, 0), (500, 1), (550, 1), (600, 1), (650, 0), (700, 0), (750, 0), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 1), (1050, 0), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 1), (1350, 1), (1400, 1), (1450, 1), (1500, 1), (1550, 1), (1600, 1), (1650, 1), (1700, 1), (1750, 0), (1800, 0), (1850, 0), (1900, 0), (1950, 0), (2000, 0), (2050, 0), (2100, 1), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 1), (2400, 0), (2450, 0), (2500, 1), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 0), (2900, 0), (2950, 0), (3000, 1), (3050, 1), (3100, 0), (3150, 0), (3200, 0), (3250, 0), (3300, 0), (3350, 1), (3400, 0), (3450, 0), (3500, 0), (3550, 0), (3600, 0), (3650, 0), (3700, 0), (3750, 0), (3800, 1), (3850, 1), (3900, 1), (3950, 0), (4000, 1), (4050, 1), (4100, 1), (4150, 1), (4200, 1), (4250, 1), (4300, 1), (4350, 1), (4400, 0), (4450, 0), (4500, 0), (4550, 0), (4600, 0), (4650, 1), (4700, 1), (4750, 1), (4800, 1), (4850, 1), (4900, 1), (4950, 0), (5000, 1), (5050, 1), (5100, 1), (5150, 1), (5200, 0), (5250, 0), (5300, 0), (5350, 0), (5400, 0), (5450, 0), (5500, 0), (5550, 0), (5600, 0), (5650, 0), (5700, 0), (5750, 0), (5800, 0), (5850, 0), (5900, 0), (5950, 0), (6000, 0), (6050, 0), (6100, 0), (6150, 1), (6200, 1), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 0), (6550, 1), (6600, 0), (6650, 1), (6700, 0), (6750, 0), (6800, 0), (6850, 1), (6900, 1), (6950, 1), (7000, 1), (7050, 1), (7100, 0), (7150, 0), (7200, 0), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 0), (7500, 0), (7550, 0), (7600, 1), (7650, 1), (7700, 1), (7750, 1), (7800, 1), (7850, 1), (7900, 1), (7950, 1), (8000, 1), (8050, 1), (8100, 1), (8150, 1), (8200, 1), (8250, 0), (8300, 1), (8350, 1), (8400, 1), (8450, 0), (8500, 0), (8550, 0), (8600, 1), (8650, 1), (8700, 1), (8750, 1), (8800, 1), (8850, 1), (8900, 1), (8950, 1), (9000, 1), (9050, 1), (9100, 1), (9150, 0), (9200, 1), (9250, 1), (9300, 1), (9350, 1), (9400, 1), (9450, 1), (9500, 1), (9550, 1), (9600, 0), (9650, 1), (9700, 1), (9750, 0), (9800, 0), (9850, 1), (9900, 0), (9950, 0), (10000, 0), (10050, 0), (10100, 0), (10150, 1), (10200, 1), (10250, 1)]
Va1_0  a1_0  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 1.8v 547.49n 1.8v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 0.0v 697.49n 0.0v 697.51n 0.0v 747.49n 0.0v 747.51n 0.0v 797.49n 0.0v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 1.8v 1447.49n 1.8v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 0.0v 1847.49n 0.0v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 0.0v 2047.49n 0.0v 2047.51n 0.0v 2097.49n 0.0v 2097.51n 1.8v 2147.49n 1.8v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 0.0v 2447.49n 0.0v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 1.8v 2547.49n 1.8v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 0.0v 2947.49n 0.0v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 0.0v 3297.49n 0.0v 3297.51n 0.0v 3347.49n 0.0v 3347.51n 1.8v 3397.49n 1.8v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 0.0v 3647.49n 0.0v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 1.8v 4097.49n 1.8v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 1.8v 4247.49n 1.8v 4247.51n 1.8v 4297.49n 1.8v 4297.51n 1.8v 4347.49n 1.8v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 0.0v 4597.49n 0.0v 4597.51n 0.0v 4647.49n 0.0v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 1.8v 4797.49n 1.8v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 0.0v 5497.49n 0.0v 5497.51n 0.0v 5547.49n 0.0v 5547.51n 0.0v 5597.49n 0.0v 5597.51n 0.0v 5647.49n 0.0v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 0.0v 5747.49n 0.0v 5747.51n 0.0v 5797.49n 0.0v 5797.51n 0.0v 5847.49n 0.0v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 0.0v 6647.49n 0.0v 6647.51n 1.8v 6697.49n 1.8v 6697.51n 0.0v 6747.49n 0.0v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 1.8v 6897.49n 1.8v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 0.0v 7547.49n 0.0v 7547.51n 0.0v 7597.49n 0.0v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 1.8v 8397.49n 1.8v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 0.0v 8547.49n 0.0v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 1.8v 8897.49n 1.8v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 1.8v 9047.49n 1.8v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 1.8v 9147.49n 1.8v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 1.8v 9497.49n 1.8v 9497.51n 1.8v 9547.49n 1.8v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 0.0v 10047.49n 0.0v 10047.51n 0.0v 10097.49n 0.0v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )
* (time, data): [(0, 0), (50, 0), (100, 0), (150, 0), (200, 1), (250, 1), (300, 0), (350, 0), (400, 0), (450, 0), (500, 1), (550, 1), (600, 1), (650, 1), (700, 0), (750, 0), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 1), (1050, 0), (1100, 0), (1150, 0), (1200, 0), (1250, 0), (1300, 1), (1350, 1), (1400, 1), (1450, 1), (1500, 1), (1550, 1), (1600, 1), (1650, 1), (1700, 1), (1750, 1), (1800, 1), (1850, 1), (1900, 0), (1950, 1), (2000, 1), (2050, 1), (2100, 1), (2150, 1), (2200, 1), (2250, 1), (2300, 1), (2350, 1), (2400, 1), (2450, 1), (2500, 0), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 0), (3000, 0), (3050, 0), (3100, 0), (3150, 1), (3200, 1), (3250, 1), (3300, 0), (3350, 1), (3400, 1), (3450, 1), (3500, 1), (3550, 1), (3600, 1), (3650, 1), (3700, 1), (3750, 1), (3800, 0), (3850, 0), (3900, 0), (3950, 1), (4000, 1), (4050, 1), (4100, 1), (4150, 1), (4200, 0), (4250, 0), (4300, 0), (4350, 0), (4400, 1), (4450, 1), (4500, 1), (4550, 1), (4600, 1), (4650, 0), (4700, 1), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 0), (5000, 1), (5050, 1), (5100, 1), (5150, 0), (5200, 1), (5250, 1), (5300, 1), (5350, 1), (5400, 0), (5450, 0), (5500, 0), (5550, 0), (5600, 0), (5650, 0), (5700, 0), (5750, 0), (5800, 1), (5850, 0), (5900, 0), (5950, 0), (6000, 0), (6050, 0), (6100, 0), (6150, 1), (6200, 1), (6250, 1), (6300, 1), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 0), (6700, 1), (6750, 1), (6800, 1), (6850, 1), (6900, 1), (6950, 0), (7000, 0), (7050, 0), (7100, 0), (7150, 0), (7200, 1), (7250, 1), (7300, 1), (7350, 1), (7400, 1), (7450, 0), (7500, 0), (7550, 0), (7600, 1), (7650, 1), (7700, 1), (7750, 1), (7800, 1), (7850, 1), (7900, 1), (7950, 1), (8000, 1), (8050, 1), (8100, 1), (8150, 1), (8200, 1), (8250, 0), (8300, 0), (8350, 0), (8400, 0), (8450, 0), (8500, 0), (8550, 1), (8600, 0), (8650, 0), (8700, 0), (8750, 0), (8800, 0), (8850, 0), (8900, 1), (8950, 0), (9000, 1), (9050, 1), (9100, 0), (9150, 0), (9200, 0), (9250, 0), (9300, 0), (9350, 0), (9400, 0), (9450, 0), (9500, 1), (9550, 1), (9600, 1), (9650, 1), (9700, 1), (9750, 0), (9800, 0), (9850, 0), (9900, 0), (9950, 0), (10000, 0), (10050, 0), (10100, 0), (10150, 0), (10200, 0), (10250, 0)]
Va1_1  a1_1  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 1.8v 247.49n 1.8v 247.51n 1.8v 297.49n 1.8v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 0.0v 447.49n 0.0v 447.51n 0.0v 497.49n 0.0v 497.51n 1.8v 547.49n 1.8v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 0.0v 747.49n 0.0v 747.51n 0.0v 797.49n 0.0v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 1.8v 1447.49n 1.8v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 1.8v 1797.49n 1.8v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 1.8v 1997.49n 1.8v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 1.8v 2147.49n 1.8v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 0.0v 3097.49n 0.0v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 1.8v 3197.49n 1.8v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 0.0v 3347.49n 0.0v 3347.51n 1.8v 3397.49n 1.8v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 1.8v 3697.49n 1.8v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 0.0v 3947.49n 0.0v 3947.51n 1.8v 3997.49n 1.8v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 1.8v 4097.49n 1.8v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 1.8v 4447.49n 1.8v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 0.0v 4697.49n 0.0v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 1.8v 5047.49n 1.8v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 0.0v 5497.49n 0.0v 5497.51n 0.0v 5547.49n 0.0v 5547.51n 0.0v 5597.49n 0.0v 5597.51n 0.0v 5647.49n 0.0v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 0.0v 5747.49n 0.0v 5747.51n 0.0v 5797.49n 0.0v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 1.8v 6897.49n 1.8v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 0.0v 7047.49n 0.0v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 1.8v 7297.49n 1.8v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 0.0v 7547.49n 0.0v 7547.51n 0.0v 7597.49n 0.0v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 0.0v 8447.49n 0.0v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 0.0v 8547.49n 0.0v 8547.51n 1.8v 8597.49n 1.8v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 0.0v 8697.49n 0.0v 8697.51n 0.0v 8747.49n 0.0v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 1.8v 9047.49n 1.8v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 0.0v 9297.49n 0.0v 9297.51n 0.0v 9347.49n 0.0v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 0.0v 9447.49n 0.0v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 1.8v 9547.49n 1.8v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 1.8v 9647.49n 1.8v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 0.0v 9897.49n 0.0v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 0.0v 10047.49n 0.0v 10047.51n 0.0v 10097.49n 0.0v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 0.0v )
* (time, data): [(0, 0), (50, 0), (100, 0), (150, 0), (200, 0), (250, 0), (300, 1), (350, 1), (400, 1), (450, 1), (500, 0), (550, 0), (600, 0), (650, 0), (700, 1), (750, 1), (800, 0), (850, 0), (900, 0), (950, 0), (1000, 0), (1050, 0), (1100, 0), (1150, 0), (1200, 1), (1250, 0), (1300, 0), (1350, 0), (1400, 0), (1450, 0), (1500, 0), (1550, 0), (1600, 0), (1650, 0), (1700, 0), (1750, 0), (1800, 1), (1850, 1), (1900, 0), (1950, 0), (2000, 0), (2050, 0), (2100, 0), (2150, 0), (2200, 0), (2250, 0), (2300, 0), (2350, 0), (2400, 1), (2450, 1), (2500, 0), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 0), (2800, 0), (2850, 1), (2900, 1), (2950, 0), (3000, 1), (3050, 1), (3100, 0), (3150, 0), (3200, 0), (3250, 0), (3300, 1), (3350, 0), (3400, 1), (3450, 1), (3500, 1), (3550, 1), (3600, 1), (3650, 0), (3700, 0), (3750, 0), (3800, 1), (3850, 1), (3900, 1), (3950, 0), (4000, 0), (4050, 0), (4100, 0), (4150, 0), (4200, 0), (4250, 0), (4300, 0), (4350, 0), (4400, 0), (4450, 0), (4500, 1), (4550, 1), (4600, 1), (4650, 1), (4700, 0), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 0), (5000, 0), (5050, 0), (5100, 0), (5150, 1), (5200, 1), (5250, 1), (5300, 1), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 0), (5900, 0), (5950, 1), (6000, 1), (6050, 1), (6100, 1), (6150, 0), (6200, 0), (6250, 0), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 0), (6600, 1), (6650, 0), (6700, 1), (6750, 1), (6800, 1), (6850, 0), (6900, 0), (6950, 1), (7000, 1), (7050, 1), (7100, 0), (7150, 0), (7200, 1), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 1), (7600, 0), (7650, 0), (7700, 0), (7750, 0), (7800, 0), (7850, 0), (7900, 0), (7950, 0), (8000, 0), (8050, 0), (8100, 0), (8150, 0), (8200, 0), (8250, 1), (8300, 1), (8350, 1), (8400, 1), (8450, 1), (8500, 1), (8550, 0), (8600, 1), (8650, 1), (8700, 1), (8750, 1), (8800, 1), (8850, 0), (8900, 0), (8950, 1), (9000, 0), (9050, 0), (9100, 0), (9150, 1), (9200, 1), (9250, 1), (9300, 1), (9350, 1), (9400, 1), (9450, 0), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 0), (9750, 0), (9800, 0), (9850, 1), (9900, 0), (9950, 0), (10000, 1), (10050, 1), (10100, 1), (10150, 1), (10200, 1), (10250, 1)]
Va1_2  a1_2  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 1.8v 347.49n 1.8v 347.51n 1.8v 397.49n 1.8v 397.51n 1.8v 447.49n 1.8v 447.51n 1.8v 497.49n 1.8v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 0.0v 847.49n 0.0v 847.51n 0.0v 897.49n 0.0v 897.51n 0.0v 947.49n 0.0v 947.51n 0.0v 997.49n 0.0v 997.51n 0.0v 1047.49n 0.0v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 1.8v 1247.49n 1.8v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 0.0v 1397.49n 0.0v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 0.0v 1547.49n 0.0v 1547.51n 0.0v 1597.49n 0.0v 1597.51n 0.0v 1647.49n 0.0v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 0.0v 1747.49n 0.0v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 0.0v 2047.49n 0.0v 2047.51n 0.0v 2097.49n 0.0v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 0.0v 2797.49n 0.0v 2797.51n 0.0v 2847.49n 0.0v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 0.0v 3297.49n 0.0v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 1.8v 5997.49n 1.8v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 0.0v 6597.49n 0.0v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 0.0v 7647.49n 0.0v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 0.0v 7747.49n 0.0v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 0.0v 7847.49n 0.0v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 0.0v 7947.49n 0.0v 7947.51n 0.0v 7997.49n 0.0v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 1.8v 8297.49n 1.8v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 1.8v 8397.49n 1.8v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )
* (time, data): [(0, 0), (50, 0), (100, 0), (150, 0), (200, 0), (250, 0), (300, 1), (350, 1), (400, 1), (450, 1), (500, 0), (550, 0), (600, 0), (650, 0), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 1), (1050, 0), (1100, 0), (1150, 0), (1200, 1), (1250, 0), (1300, 1), (1350, 1), (1400, 0), (1450, 1), (1500, 1), (1550, 1), (1600, 1), (1650, 1), (1700, 1), (1750, 0), (1800, 1), (1850, 1), (1900, 0), (1950, 0), (2000, 0), (2050, 0), (2100, 0), (2150, 0), (2200, 0), (2250, 1), (2300, 0), (2350, 0), (2400, 1), (2450, 1), (2500, 0), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 0), (3000, 1), (3050, 1), (3100, 0), (3150, 0), (3200, 0), (3250, 0), (3300, 1), (3350, 0), (3400, 1), (3450, 1), (3500, 1), (3550, 1), (3600, 1), (3650, 0), (3700, 0), (3750, 0), (3800, 1), (3850, 1), (3900, 1), (3950, 0), (4000, 1), (4050, 1), (4100, 1), (4150, 1), (4200, 0), (4250, 0), (4300, 0), (4350, 0), (4400, 0), (4450, 0), (4500, 1), (4550, 1), (4600, 1), (4650, 1), (4700, 0), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 0), (5000, 0), (5050, 0), (5100, 0), (5150, 1), (5200, 1), (5250, 1), (5300, 1), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 0), (5900, 0), (5950, 1), (6000, 1), (6050, 1), (6100, 1), (6150, 0), (6200, 0), (6250, 0), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 1), (6600, 1), (6650, 0), (6700, 1), (6750, 1), (6800, 1), (6850, 0), (6900, 1), (6950, 1), (7000, 1), (7050, 1), (7100, 0), (7150, 0), (7200, 1), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 1), (7600, 1), (7650, 1), (7700, 1), (7750, 1), (7800, 1), (7850, 1), (7900, 1), (7950, 1), (8000, 1), (8050, 1), (8100, 1), (8150, 1), (8200, 0), (8250, 1), (8300, 1), (8350, 1), (8400, 1), (8450, 1), (8500, 1), (8550, 0), (8600, 1), (8650, 1), (8700, 1), (8750, 1), (8800, 1), (8850, 0), (8900, 1), (8950, 1), (9000, 0), (9050, 0), (9100, 0), (9150, 1), (9200, 1), (9250, 1), (9300, 1), (9350, 1), (9400, 1), (9450, 0), (9500, 1), (9550, 1), (9600, 0), (9650, 1), (9700, 1), (9750, 0), (9800, 0), (9850, 1), (9900, 0), (9950, 0), (10000, 1), (10050, 1), (10100, 1), (10150, 1), (10200, 1), (10250, 1)]
Va1_3  a1_3  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 1.8v 347.49n 1.8v 347.51n 1.8v 397.49n 1.8v 397.51n 1.8v 447.49n 1.8v 447.51n 1.8v 497.49n 1.8v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 1.8v 1247.49n 1.8v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 0.0v 2047.49n 0.0v 2047.51n 0.0v 2097.49n 0.0v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 0.0v 3297.49n 0.0v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 1.8v 4097.49n 1.8v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 1.8v 5997.49n 1.8v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 1.8v 8297.49n 1.8v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 1.8v 8397.49n 1.8v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 1.8v 9547.49n 1.8v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )
* (time, data): [(0, 0), (50, 0), (100, 0), (150, 0), (200, 0), (250, 0), (300, 1), (350, 1), (400, 1), (450, 1), (500, 0), (550, 0), (600, 0), (650, 0), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 1), (1050, 0), (1100, 0), (1150, 0), (1200, 1), (1250, 0), (1300, 1), (1350, 1), (1400, 0), (1450, 1), (1500, 1), (1550, 1), (1600, 1), (1650, 1), (1700, 1), (1750, 0), (1800, 1), (1850, 1), (1900, 0), (1950, 0), (2000, 0), (2050, 0), (2100, 0), (2150, 0), (2200, 0), (2250, 1), (2300, 0), (2350, 0), (2400, 1), (2450, 1), (2500, 0), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 0), (3000, 1), (3050, 1), (3100, 0), (3150, 0), (3200, 0), (3250, 0), (3300, 1), (3350, 0), (3400, 1), (3450, 1), (3500, 1), (3550, 1), (3600, 1), (3650, 0), (3700, 0), (3750, 0), (3800, 1), (3850, 1), (3900, 1), (3950, 0), (4000, 1), (4050, 1), (4100, 1), (4150, 1), (4200, 0), (4250, 0), (4300, 0), (4350, 0), (4400, 0), (4450, 0), (4500, 1), (4550, 1), (4600, 1), (4650, 1), (4700, 0), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 0), (5000, 0), (5050, 0), (5100, 0), (5150, 1), (5200, 1), (5250, 1), (5300, 1), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 0), (5900, 0), (5950, 1), (6000, 1), (6050, 1), (6100, 1), (6150, 0), (6200, 0), (6250, 0), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 1), (6600, 1), (6650, 0), (6700, 1), (6750, 1), (6800, 1), (6850, 0), (6900, 1), (6950, 1), (7000, 1), (7050, 1), (7100, 0), (7150, 0), (7200, 1), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 1), (7600, 1), (7650, 1), (7700, 1), (7750, 1), (7800, 1), (7850, 1), (7900, 1), (7950, 1), (8000, 1), (8050, 1), (8100, 1), (8150, 1), (8200, 0), (8250, 1), (8300, 1), (8350, 1), (8400, 1), (8450, 1), (8500, 1), (8550, 0), (8600, 1), (8650, 1), (8700, 1), (8750, 1), (8800, 1), (8850, 0), (8900, 1), (8950, 1), (9000, 0), (9050, 0), (9100, 0), (9150, 1), (9200, 1), (9250, 1), (9300, 1), (9350, 1), (9400, 1), (9450, 0), (9500, 1), (9550, 1), (9600, 0), (9650, 1), (9700, 1), (9750, 0), (9800, 0), (9850, 1), (9900, 0), (9950, 0), (10000, 1), (10050, 1), (10100, 1), (10150, 1), (10200, 1), (10250, 1)]
Va1_4  a1_4  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 1.8v 347.49n 1.8v 347.51n 1.8v 397.49n 1.8v 397.51n 1.8v 447.49n 1.8v 447.51n 1.8v 497.49n 1.8v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 1.8v 1247.49n 1.8v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 0.0v 2047.49n 0.0v 2047.51n 0.0v 2097.49n 0.0v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 0.0v 3297.49n 0.0v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 1.8v 4097.49n 1.8v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 1.8v 5997.49n 1.8v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 1.8v 8297.49n 1.8v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 1.8v 8397.49n 1.8v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 1.8v 9547.49n 1.8v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )
* (time, data): [(0, 0), (50, 0), (100, 0), (150, 0), (200, 0), (250, 0), (300, 1), (350, 1), (400, 1), (450, 1), (500, 0), (550, 0), (600, 0), (650, 0), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 1), (1050, 0), (1100, 0), (1150, 0), (1200, 1), (1250, 0), (1300, 1), (1350, 1), (1400, 0), (1450, 1), (1500, 1), (1550, 1), (1600, 1), (1650, 1), (1700, 1), (1750, 0), (1800, 1), (1850, 1), (1900, 0), (1950, 0), (2000, 0), (2050, 0), (2100, 0), (2150, 0), (2200, 0), (2250, 1), (2300, 0), (2350, 0), (2400, 1), (2450, 1), (2500, 0), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 0), (3000, 1), (3050, 1), (3100, 0), (3150, 0), (3200, 0), (3250, 0), (3300, 1), (3350, 0), (3400, 1), (3450, 1), (3500, 1), (3550, 1), (3600, 1), (3650, 0), (3700, 0), (3750, 0), (3800, 1), (3850, 1), (3900, 1), (3950, 0), (4000, 1), (4050, 1), (4100, 1), (4150, 1), (4200, 0), (4250, 0), (4300, 0), (4350, 0), (4400, 0), (4450, 0), (4500, 1), (4550, 1), (4600, 1), (4650, 1), (4700, 0), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 0), (5000, 0), (5050, 0), (5100, 0), (5150, 1), (5200, 1), (5250, 1), (5300, 1), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 0), (5900, 0), (5950, 1), (6000, 1), (6050, 1), (6100, 1), (6150, 0), (6200, 0), (6250, 0), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 1), (6600, 1), (6650, 0), (6700, 1), (6750, 1), (6800, 1), (6850, 0), (6900, 1), (6950, 1), (7000, 1), (7050, 1), (7100, 0), (7150, 0), (7200, 1), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 1), (7600, 1), (7650, 1), (7700, 1), (7750, 1), (7800, 1), (7850, 1), (7900, 1), (7950, 1), (8000, 1), (8050, 1), (8100, 1), (8150, 1), (8200, 0), (8250, 1), (8300, 1), (8350, 1), (8400, 1), (8450, 1), (8500, 1), (8550, 0), (8600, 1), (8650, 1), (8700, 1), (8750, 1), (8800, 1), (8850, 0), (8900, 1), (8950, 1), (9000, 0), (9050, 0), (9100, 0), (9150, 1), (9200, 1), (9250, 1), (9300, 1), (9350, 1), (9400, 1), (9450, 0), (9500, 1), (9550, 1), (9600, 0), (9650, 1), (9700, 1), (9750, 0), (9800, 0), (9850, 1), (9900, 0), (9950, 0), (10000, 1), (10050, 1), (10100, 1), (10150, 1), (10200, 1), (10250, 1)]
Va1_5  a1_5  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 1.8v 347.49n 1.8v 347.51n 1.8v 397.49n 1.8v 397.51n 1.8v 447.49n 1.8v 447.51n 1.8v 497.49n 1.8v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 1.8v 1247.49n 1.8v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 0.0v 2047.49n 0.0v 2047.51n 0.0v 2097.49n 0.0v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 0.0v 3297.49n 0.0v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 1.8v 4097.49n 1.8v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 1.8v 5997.49n 1.8v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 1.8v 8297.49n 1.8v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 1.8v 8397.49n 1.8v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 1.8v 9547.49n 1.8v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )
* (time, data): [(0, 0), (50, 0), (100, 0), (150, 0), (200, 0), (250, 0), (300, 1), (350, 1), (400, 1), (450, 1), (500, 0), (550, 0), (600, 0), (650, 0), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 1), (1050, 0), (1100, 0), (1150, 0), (1200, 1), (1250, 0), (1300, 1), (1350, 1), (1400, 0), (1450, 1), (1500, 1), (1550, 1), (1600, 1), (1650, 1), (1700, 1), (1750, 0), (1800, 1), (1850, 1), (1900, 0), (1950, 0), (2000, 0), (2050, 0), (2100, 0), (2150, 0), (2200, 0), (2250, 1), (2300, 0), (2350, 0), (2400, 1), (2450, 1), (2500, 0), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 0), (3000, 1), (3050, 1), (3100, 0), (3150, 0), (3200, 0), (3250, 0), (3300, 1), (3350, 0), (3400, 1), (3450, 1), (3500, 1), (3550, 1), (3600, 1), (3650, 0), (3700, 0), (3750, 0), (3800, 1), (3850, 1), (3900, 1), (3950, 0), (4000, 1), (4050, 1), (4100, 1), (4150, 1), (4200, 0), (4250, 0), (4300, 0), (4350, 0), (4400, 0), (4450, 0), (4500, 1), (4550, 1), (4600, 1), (4650, 1), (4700, 0), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 0), (5000, 0), (5050, 0), (5100, 0), (5150, 1), (5200, 1), (5250, 1), (5300, 1), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 0), (5900, 0), (5950, 1), (6000, 1), (6050, 1), (6100, 1), (6150, 0), (6200, 0), (6250, 0), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 1), (6600, 1), (6650, 0), (6700, 1), (6750, 1), (6800, 1), (6850, 0), (6900, 1), (6950, 1), (7000, 1), (7050, 1), (7100, 0), (7150, 0), (7200, 1), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 1), (7600, 1), (7650, 1), (7700, 1), (7750, 1), (7800, 1), (7850, 1), (7900, 1), (7950, 1), (8000, 1), (8050, 1), (8100, 1), (8150, 1), (8200, 0), (8250, 1), (8300, 1), (8350, 1), (8400, 1), (8450, 1), (8500, 1), (8550, 0), (8600, 1), (8650, 1), (8700, 1), (8750, 1), (8800, 1), (8850, 0), (8900, 1), (8950, 1), (9000, 0), (9050, 0), (9100, 0), (9150, 1), (9200, 1), (9250, 1), (9300, 1), (9350, 1), (9400, 1), (9450, 0), (9500, 1), (9550, 1), (9600, 0), (9650, 1), (9700, 1), (9750, 0), (9800, 0), (9850, 1), (9900, 0), (9950, 0), (10000, 1), (10050, 1), (10100, 1), (10150, 1), (10200, 1), (10250, 1)]
Va1_6  a1_6  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 1.8v 347.49n 1.8v 347.51n 1.8v 397.49n 1.8v 397.51n 1.8v 447.49n 1.8v 447.51n 1.8v 497.49n 1.8v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 1.8v 1247.49n 1.8v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 0.0v 2047.49n 0.0v 2047.51n 0.0v 2097.49n 0.0v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 0.0v 3297.49n 0.0v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 1.8v 4097.49n 1.8v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 1.8v 5997.49n 1.8v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 1.8v 8297.49n 1.8v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 1.8v 8397.49n 1.8v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 1.8v 9547.49n 1.8v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )
* (time, data): [(0, 0), (50, 0), (100, 0), (150, 0), (200, 0), (250, 0), (300, 1), (350, 1), (400, 1), (450, 1), (500, 0), (550, 0), (600, 0), (650, 0), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 1), (1000, 1), (1050, 0), (1100, 0), (1150, 0), (1200, 1), (1250, 0), (1300, 1), (1350, 1), (1400, 0), (1450, 1), (1500, 1), (1550, 1), (1600, 1), (1650, 1), (1700, 1), (1750, 0), (1800, 1), (1850, 1), (1900, 0), (1950, 0), (2000, 0), (2050, 0), (2100, 0), (2150, 0), (2200, 0), (2250, 1), (2300, 0), (2350, 0), (2400, 1), (2450, 1), (2500, 0), (2550, 0), (2600, 0), (2650, 0), (2700, 0), (2750, 1), (2800, 1), (2850, 1), (2900, 1), (2950, 0), (3000, 1), (3050, 1), (3100, 0), (3150, 0), (3200, 0), (3250, 0), (3300, 1), (3350, 0), (3400, 1), (3450, 1), (3500, 1), (3550, 1), (3600, 1), (3650, 0), (3700, 0), (3750, 0), (3800, 1), (3850, 1), (3900, 1), (3950, 0), (4000, 1), (4050, 1), (4100, 1), (4150, 1), (4200, 0), (4250, 0), (4300, 0), (4350, 0), (4400, 0), (4450, 0), (4500, 1), (4550, 1), (4600, 1), (4650, 1), (4700, 0), (4750, 0), (4800, 0), (4850, 0), (4900, 0), (4950, 0), (5000, 0), (5050, 0), (5100, 0), (5150, 1), (5200, 1), (5250, 1), (5300, 1), (5350, 1), (5400, 1), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 1), (5850, 0), (5900, 0), (5950, 1), (6000, 1), (6050, 1), (6100, 1), (6150, 0), (6200, 0), (6250, 0), (6300, 0), (6350, 0), (6400, 0), (6450, 0), (6500, 0), (6550, 1), (6600, 1), (6650, 0), (6700, 1), (6750, 1), (6800, 1), (6850, 0), (6900, 1), (6950, 1), (7000, 1), (7050, 1), (7100, 0), (7150, 0), (7200, 1), (7250, 0), (7300, 0), (7350, 0), (7400, 0), (7450, 1), (7500, 1), (7550, 1), (7600, 1), (7650, 1), (7700, 1), (7750, 1), (7800, 1), (7850, 1), (7900, 1), (7950, 1), (8000, 1), (8050, 1), (8100, 1), (8150, 1), (8200, 0), (8250, 1), (8300, 1), (8350, 1), (8400, 1), (8450, 1), (8500, 1), (8550, 0), (8600, 1), (8650, 1), (8700, 1), (8750, 1), (8800, 1), (8850, 0), (8900, 1), (8950, 1), (9000, 0), (9050, 0), (9100, 0), (9150, 1), (9200, 1), (9250, 1), (9300, 1), (9350, 1), (9400, 1), (9450, 0), (9500, 1), (9550, 1), (9600, 0), (9650, 1), (9700, 1), (9750, 0), (9800, 0), (9850, 1), (9900, 0), (9950, 0), (10000, 1), (10050, 1), (10100, 1), (10150, 1), (10200, 1), (10250, 1)]
Va1_7  a1_7  0 PWL (0n 0.0v 47.49n 0.0v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 1.8v 347.49n 1.8v 347.51n 1.8v 397.49n 1.8v 397.51n 1.8v 447.49n 1.8v 447.51n 1.8v 497.49n 1.8v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 0.0v 647.49n 0.0v 647.51n 0.0v 697.49n 0.0v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 0.0v 1197.49n 0.0v 1197.51n 1.8v 1247.49n 1.8v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 1.8v 1497.49n 1.8v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 0.0v 2047.49n 0.0v 2047.51n 0.0v 2097.49n 0.0v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 0.0v 2247.49n 0.0v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 0.0v 2647.49n 0.0v 2647.51n 0.0v 2697.49n 0.0v 2697.51n 0.0v 2747.49n 0.0v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 1.8v 2897.49n 1.8v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 1.8v 3047.49n 1.8v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 0.0v 3297.49n 0.0v 3297.51n 1.8v 3347.49n 1.8v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 0.0v 3747.49n 0.0v 3747.51n 0.0v 3797.49n 0.0v 3797.51n 1.8v 3847.49n 1.8v 3847.51n 1.8v 3897.49n 1.8v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 1.8v 4047.49n 1.8v 4047.51n 1.8v 4097.49n 1.8v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 0.0v 4297.49n 0.0v 4297.51n 0.0v 4347.49n 0.0v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 1.8v 4547.49n 1.8v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 0.0v 4847.49n 0.0v 4847.51n 0.0v 4897.49n 0.0v 4897.51n 0.0v 4947.49n 0.0v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 1.8v 5197.49n 1.8v 5197.51n 1.8v 5247.49n 1.8v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 1.8v 5397.49n 1.8v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 1.8v 5847.49n 1.8v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 0.0v 5947.49n 0.0v 5947.51n 1.8v 5997.49n 1.8v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 0.0v 6397.49n 0.0v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 0.0v 6497.49n 0.0v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 1.8v 7047.49n 1.8v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 0.0v 7197.49n 0.0v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 0.0v 7347.49n 0.0v 7347.51n 0.0v 7397.49n 0.0v 7397.51n 0.0v 7447.49n 0.0v 7447.51n 1.8v 7497.49n 1.8v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 1.8v 7647.49n 1.8v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 1.8v 7947.49n 1.8v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 1.8v 8297.49n 1.8v 8297.51n 1.8v 8347.49n 1.8v 8347.51n 1.8v 8397.49n 1.8v 8397.51n 1.8v 8447.49n 1.8v 8447.51n 1.8v 8497.49n 1.8v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 1.8v 8647.49n 1.8v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 1.8v 8997.49n 1.8v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 1.8v 9247.49n 1.8v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 1.8v 9547.49n 1.8v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 0.0v 9847.49n 0.0v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 0.0v 9997.49n 0.0v 9997.51n 1.8v 10047.49n 1.8v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 1.8v 10147.49n 1.8v 10147.51n 1.8v 10197.49n 1.8v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )

 * Generation of control signals
* (time, data): [(0, 1), (50, 0), (100, 0), (150, 0), (200, 1), (250, 0), (300, 0), (350, 0), (400, 1), (450, 1), (500, 0), (550, 0), (600, 1), (650, 1), (700, 1), (750, 1), (800, 1), (850, 1), (900, 1), (950, 0), (1000, 0), (1050, 1), (1100, 0), (1150, 1), (1200, 0), (1250, 1), (1300, 1), (1350, 1), (1400, 0), (1450, 0), (1500, 1), (1550, 1), (1600, 0), (1650, 0), (1700, 0), (1750, 0), (1800, 1), (1850, 0), (1900, 1), (1950, 0), (2000, 0), (2050, 1), (2100, 0), (2150, 0), (2200, 1), (2250, 1), (2300, 1), (2350, 0), (2400, 1), (2450, 0), (2500, 1), (2550, 0), (2600, 1), (2650, 1), (2700, 1), (2750, 1), (2800, 1), (2850, 0), (2900, 1), (2950, 1), (3000, 0), (3050, 1), (3100, 1), (3150, 1), (3200, 0), (3250, 1), (3300, 0), (3350, 0), (3400, 1), (3450, 0), (3500, 1), (3550, 0), (3600, 1), (3650, 0), (3700, 1), (3750, 1), (3800, 0), (3850, 0), (3900, 1), (3950, 1), (4000, 0), (4050, 0), (4100, 0), (4150, 1), (4200, 1), (4250, 1), (4300, 1), (4350, 0), (4400, 0), (4450, 0), (4500, 0), (4550, 0), (4600, 0), (4650, 1), (4700, 1), (4750, 0), (4800, 1), (4850, 1), (4900, 1), (4950, 0), (5000, 0), (5050, 0), (5100, 0), (5150, 0), (5200, 0), (5250, 0), (5300, 0), (5350, 0), (5400, 1), (5450, 0), (5500, 1), (5550, 0), (5600, 0), (5650, 0), (5700, 1), (5750, 0), (5800, 0), (5850, 0), (5900, 1), (5950, 0), (6000, 0), (6050, 1), (6100, 1), (6150, 1), (6200, 0), (6250, 0), (6300, 0), (6350, 1), (6400, 1), (6450, 1), (6500, 1), (6550, 1), (6600, 1), (6650, 0), (6700, 1), (6750, 0), (6800, 0), (6850, 1), (6900, 1), (6950, 1), (7000, 0), (7050, 0), (7100, 1), (7150, 1), (7200, 1), (7250, 0), (7300, 1), (7350, 1), (7400, 1), (7450, 0), (7500, 1), (7550, 0), (7600, 0), (7650, 0), (7700, 0), (7750, 0), (7800, 1), (7850, 0), (7900, 0), (7950, 0), (8000, 0), (8050, 0), (8100, 0), (8150, 0), (8200, 1), (8250, 0), (8300, 0), (8350, 0), (8400, 0), (8450, 0), (8500, 1), (8550, 0), (8600, 0), (8650, 1), (8700, 0), (8750, 0), (8800, 0), (8850, 0), (8900, 1), (8950, 0), (9000, 1), (9050, 0), (9100, 0), (9150, 1), (9200, 0), (9250, 0), (9300, 0), (9350, 0), (9400, 1), (9450, 0), (9500, 0), (9550, 1), (9600, 1), (9650, 1), (9700, 0), (9750, 0), (9800, 1), (9850, 1), (9900, 1), (9950, 1), (10000, 0), (10050, 1), (10100, 0), (10150, 0), (10200, 0), (10250, 1)]
VCSB0 CSB0 0 PWL (0n 1.8v 47.49n 1.8v 47.51n 0.0v 97.49n 0.0v 97.51n 0.0v 147.49n 0.0v 147.51n 0.0v 197.49n 0.0v 197.51n 1.8v 247.49n 1.8v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 0.0v 397.49n 0.0v 397.51n 1.8v 447.49n 1.8v 447.51n 1.8v 497.49n 1.8v 497.51n 0.0v 547.49n 0.0v 547.51n 0.0v 597.49n 0.0v 597.51n 1.8v 647.49n 1.8v 647.51n 1.8v 697.49n 1.8v 697.51n 1.8v 747.49n 1.8v 747.51n 1.8v 797.49n 1.8v 797.51n 1.8v 847.49n 1.8v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 0.0v 997.49n 0.0v 997.51n 0.0v 1047.49n 0.0v 1047.51n 1.8v 1097.49n 1.8v 1097.51n 0.0v 1147.49n 0.0v 1147.51n 1.8v 1197.49n 1.8v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 1.8v 1297.49n 1.8v 1297.51n 1.8v 1347.49n 1.8v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 0.0v 1647.49n 0.0v 1647.51n 0.0v 1697.49n 0.0v 1697.51n 0.0v 1747.49n 0.0v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 1.8v 1847.49n 1.8v 1847.51n 0.0v 1897.49n 0.0v 1897.51n 1.8v 1947.49n 1.8v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 0.0v 2047.49n 0.0v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 0.0v 2197.49n 0.0v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 1.8v 2297.49n 1.8v 2297.51n 1.8v 2347.49n 1.8v 2347.51n 0.0v 2397.49n 0.0v 2397.51n 1.8v 2447.49n 1.8v 2447.51n 0.0v 2497.49n 0.0v 2497.51n 1.8v 2547.49n 1.8v 2547.51n 0.0v 2597.49n 0.0v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 1.8v 2797.49n 1.8v 2797.51n 1.8v 2847.49n 1.8v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 1.8v 2997.49n 1.8v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 1.8v 3147.49n 1.8v 3147.51n 1.8v 3197.49n 1.8v 3197.51n 0.0v 3247.49n 0.0v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 0.0v 3347.49n 0.0v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 1.8v 3447.49n 1.8v 3447.51n 0.0v 3497.49n 0.0v 3497.51n 1.8v 3547.49n 1.8v 3547.51n 0.0v 3597.49n 0.0v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 1.8v 3997.49n 1.8v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 0.0v 4097.49n 0.0v 4097.51n 0.0v 4147.49n 0.0v 4147.51n 1.8v 4197.49n 1.8v 4197.51n 1.8v 4247.49n 1.8v 4247.51n 1.8v 4297.49n 1.8v 4297.51n 1.8v 4347.49n 1.8v 4347.51n 0.0v 4397.49n 0.0v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 0.0v 4497.49n 0.0v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 0.0v 4597.49n 0.0v 4597.51n 0.0v 4647.49n 0.0v 4647.51n 1.8v 4697.49n 1.8v 4697.51n 1.8v 4747.49n 1.8v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 0.0v 5097.49n 0.0v 5097.51n 0.0v 5147.49n 0.0v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 0.0v 5297.49n 0.0v 5297.51n 0.0v 5347.49n 0.0v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 1.8v 5447.49n 1.8v 5447.51n 0.0v 5497.49n 0.0v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 0.0v 5597.49n 0.0v 5597.51n 0.0v 5647.49n 0.0v 5647.51n 0.0v 5697.49n 0.0v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 0.0v 5797.49n 0.0v 5797.51n 0.0v 5847.49n 0.0v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 0.0v 6047.49n 0.0v 6047.51n 1.8v 6097.49n 1.8v 6097.51n 1.8v 6147.49n 1.8v 6147.51n 1.8v 6197.49n 1.8v 6197.51n 0.0v 6247.49n 0.0v 6247.51n 0.0v 6297.49n 0.0v 6297.51n 0.0v 6347.49n 0.0v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 1.8v 6447.49n 1.8v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 1.8v 6547.49n 1.8v 6547.51n 1.8v 6597.49n 1.8v 6597.51n 1.8v 6647.49n 1.8v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 1.8v 6747.49n 1.8v 6747.51n 0.0v 6797.49n 0.0v 6797.51n 0.0v 6847.49n 0.0v 6847.51n 1.8v 6897.49n 1.8v 6897.51n 1.8v 6947.49n 1.8v 6947.51n 1.8v 6997.49n 1.8v 6997.51n 0.0v 7047.49n 0.0v 7047.51n 0.0v 7097.49n 0.0v 7097.51n 1.8v 7147.49n 1.8v 7147.51n 1.8v 7197.49n 1.8v 7197.51n 1.8v 7247.49n 1.8v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 0.0v 7597.49n 0.0v 7597.51n 0.0v 7647.49n 0.0v 7647.51n 0.0v 7697.49n 0.0v 7697.51n 0.0v 7747.49n 0.0v 7747.51n 0.0v 7797.49n 0.0v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 0.0v 7897.49n 0.0v 7897.51n 0.0v 7947.49n 0.0v 7947.51n 0.0v 7997.49n 0.0v 7997.51n 0.0v 8047.49n 0.0v 8047.51n 0.0v 8097.49n 0.0v 8097.51n 0.0v 8147.49n 0.0v 8147.51n 0.0v 8197.49n 0.0v 8197.51n 1.8v 8247.49n 1.8v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 0.0v 8397.49n 0.0v 8397.51n 0.0v 8447.49n 0.0v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 0.0v 8747.49n 0.0v 8747.51n 0.0v 8797.49n 0.0v 8797.51n 0.0v 8847.49n 0.0v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 1.8v 8947.49n 1.8v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 1.8v 9047.49n 1.8v 9047.51n 0.0v 9097.49n 0.0v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 1.8v 9197.49n 1.8v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 0.0v 9297.49n 0.0v 9297.51n 0.0v 9347.49n 0.0v 9347.51n 0.0v 9397.49n 0.0v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 1.8v 9597.49n 1.8v 9597.51n 1.8v 9647.49n 1.8v 9647.51n 1.8v 9697.49n 1.8v 9697.51n 0.0v 9747.49n 0.0v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 1.8v 9897.49n 1.8v 9897.51n 1.8v 9947.49n 1.8v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 0.0v 10047.49n 0.0v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 0.0v 10247.49n 0.0v 10247.51n 1.8v )
* (time, data): [(0, 1), (50, 1), (100, 1), (150, 1), (200, 0), (250, 0), (300, 0), (350, 1), (400, 0), (450, 1), (500, 0), (550, 1), (600, 1), (650, 0), (700, 0), (750, 1), (800, 0), (850, 1), (900, 1), (950, 1), (1000, 1), (1050, 0), (1100, 1), (1150, 1), (1200, 0), (1250, 0), (1300, 0), (1350, 1), (1400, 0), (1450, 0), (1500, 1), (1550, 1), (1600, 1), (1650, 1), (1700, 1), (1750, 0), (1800, 0), (1850, 1), (1900, 0), (1950, 0), (2000, 1), (2050, 1), (2100, 0), (2150, 1), (2200, 1), (2250, 0), (2300, 0), (2350, 1), (2400, 0), (2450, 1), (2500, 0), (2550, 1), (2600, 1), (2650, 1), (2700, 1), (2750, 0), (2800, 0), (2850, 0), (2900, 1), (2950, 0), (3000, 0), (3050, 1), (3100, 0), (3150, 0), (3200, 1), (3250, 1), (3300, 0), (3350, 0), (3400, 0), (3450, 1), (3500, 0), (3550, 1), (3600, 1), (3650, 0), (3700, 1), (3750, 1), (3800, 0), (3850, 0), (3900, 1), (3950, 0), (4000, 0), (4050, 1), (4100, 1), (4150, 0), (4200, 0), (4250, 1), (4300, 1), (4350, 1), (4400, 0), (4450, 1), (4500, 0), (4550, 1), (4600, 1), (4650, 0), (4700, 0), (4750, 0), (4800, 1), (4850, 1), (4900, 1), (4950, 0), (5000, 0), (5050, 1), (5100, 1), (5150, 0), (5200, 0), (5250, 1), (5300, 1), (5350, 0), (5400, 0), (5450, 1), (5500, 1), (5550, 1), (5600, 1), (5650, 1), (5700, 1), (5750, 1), (5800, 0), (5850, 0), (5900, 1), (5950, 0), (6000, 1), (6050, 0), (6100, 0), (6150, 0), (6200, 1), (6250, 1), (6300, 1), (6350, 1), (6400, 0), (6450, 1), (6500, 0), (6550, 0), (6600, 0), (6650, 0), (6700, 0), (6750, 1), (6800, 1), (6850, 0), (6900, 0), (6950, 0), (7000, 0), (7050, 1), (7100, 0), (7150, 1), (7200, 0), (7250, 0), (7300, 1), (7350, 1), (7400, 1), (7450, 0), (7500, 1), (7550, 1), (7600, 0), (7650, 1), (7700, 1), (7750, 1), (7800, 1), (7850, 1), (7900, 0), (7950, 1), (8000, 1), (8050, 1), (8100, 1), (8150, 1), (8200, 0), (8250, 0), (8300, 0), (8350, 1), (8400, 0), (8450, 0), (8500, 1), (8550, 0), (8600, 0), (8650, 1), (8700, 1), (8750, 1), (8800, 1), (8850, 0), (8900, 0), (8950, 0), (9000, 0), (9050, 1), (9100, 0), (9150, 0), (9200, 0), (9250, 1), (9300, 1), (9350, 1), (9400, 1), (9450, 0), (9500, 0), (9550, 0), (9600, 0), (9650, 0), (9700, 1), (9750, 0), (9800, 1), (9850, 0), (9900, 0), (9950, 1), (10000, 0), (10050, 1), (10100, 0), (10150, 0), (10200, 1), (10250, 1)]
VCSB1 CSB1 0 PWL (0n 1.8v 47.49n 1.8v 47.51n 1.8v 97.49n 1.8v 97.51n 1.8v 147.49n 1.8v 147.51n 1.8v 197.49n 1.8v 197.51n 0.0v 247.49n 0.0v 247.51n 0.0v 297.49n 0.0v 297.51n 0.0v 347.49n 0.0v 347.51n 1.8v 397.49n 1.8v 397.51n 0.0v 447.49n 0.0v 447.51n 1.8v 497.49n 1.8v 497.51n 0.0v 547.49n 0.0v 547.51n 1.8v 597.49n 1.8v 597.51n 1.8v 647.49n 1.8v 647.51n 0.0v 697.49n 0.0v 697.51n 0.0v 747.49n 0.0v 747.51n 1.8v 797.49n 1.8v 797.51n 0.0v 847.49n 0.0v 847.51n 1.8v 897.49n 1.8v 897.51n 1.8v 947.49n 1.8v 947.51n 1.8v 997.49n 1.8v 997.51n 1.8v 1047.49n 1.8v 1047.51n 0.0v 1097.49n 0.0v 1097.51n 1.8v 1147.49n 1.8v 1147.51n 1.8v 1197.49n 1.8v 1197.51n 0.0v 1247.49n 0.0v 1247.51n 0.0v 1297.49n 0.0v 1297.51n 0.0v 1347.49n 0.0v 1347.51n 1.8v 1397.49n 1.8v 1397.51n 0.0v 1447.49n 0.0v 1447.51n 0.0v 1497.49n 0.0v 1497.51n 1.8v 1547.49n 1.8v 1547.51n 1.8v 1597.49n 1.8v 1597.51n 1.8v 1647.49n 1.8v 1647.51n 1.8v 1697.49n 1.8v 1697.51n 1.8v 1747.49n 1.8v 1747.51n 0.0v 1797.49n 0.0v 1797.51n 0.0v 1847.49n 0.0v 1847.51n 1.8v 1897.49n 1.8v 1897.51n 0.0v 1947.49n 0.0v 1947.51n 0.0v 1997.49n 0.0v 1997.51n 1.8v 2047.49n 1.8v 2047.51n 1.8v 2097.49n 1.8v 2097.51n 0.0v 2147.49n 0.0v 2147.51n 1.8v 2197.49n 1.8v 2197.51n 1.8v 2247.49n 1.8v 2247.51n 0.0v 2297.49n 0.0v 2297.51n 0.0v 2347.49n 0.0v 2347.51n 1.8v 2397.49n 1.8v 2397.51n 0.0v 2447.49n 0.0v 2447.51n 1.8v 2497.49n 1.8v 2497.51n 0.0v 2547.49n 0.0v 2547.51n 1.8v 2597.49n 1.8v 2597.51n 1.8v 2647.49n 1.8v 2647.51n 1.8v 2697.49n 1.8v 2697.51n 1.8v 2747.49n 1.8v 2747.51n 0.0v 2797.49n 0.0v 2797.51n 0.0v 2847.49n 0.0v 2847.51n 0.0v 2897.49n 0.0v 2897.51n 1.8v 2947.49n 1.8v 2947.51n 0.0v 2997.49n 0.0v 2997.51n 0.0v 3047.49n 0.0v 3047.51n 1.8v 3097.49n 1.8v 3097.51n 0.0v 3147.49n 0.0v 3147.51n 0.0v 3197.49n 0.0v 3197.51n 1.8v 3247.49n 1.8v 3247.51n 1.8v 3297.49n 1.8v 3297.51n 0.0v 3347.49n 0.0v 3347.51n 0.0v 3397.49n 0.0v 3397.51n 0.0v 3447.49n 0.0v 3447.51n 1.8v 3497.49n 1.8v 3497.51n 0.0v 3547.49n 0.0v 3547.51n 1.8v 3597.49n 1.8v 3597.51n 1.8v 3647.49n 1.8v 3647.51n 0.0v 3697.49n 0.0v 3697.51n 1.8v 3747.49n 1.8v 3747.51n 1.8v 3797.49n 1.8v 3797.51n 0.0v 3847.49n 0.0v 3847.51n 0.0v 3897.49n 0.0v 3897.51n 1.8v 3947.49n 1.8v 3947.51n 0.0v 3997.49n 0.0v 3997.51n 0.0v 4047.49n 0.0v 4047.51n 1.8v 4097.49n 1.8v 4097.51n 1.8v 4147.49n 1.8v 4147.51n 0.0v 4197.49n 0.0v 4197.51n 0.0v 4247.49n 0.0v 4247.51n 1.8v 4297.49n 1.8v 4297.51n 1.8v 4347.49n 1.8v 4347.51n 1.8v 4397.49n 1.8v 4397.51n 0.0v 4447.49n 0.0v 4447.51n 1.8v 4497.49n 1.8v 4497.51n 0.0v 4547.49n 0.0v 4547.51n 1.8v 4597.49n 1.8v 4597.51n 1.8v 4647.49n 1.8v 4647.51n 0.0v 4697.49n 0.0v 4697.51n 0.0v 4747.49n 0.0v 4747.51n 0.0v 4797.49n 0.0v 4797.51n 1.8v 4847.49n 1.8v 4847.51n 1.8v 4897.49n 1.8v 4897.51n 1.8v 4947.49n 1.8v 4947.51n 0.0v 4997.49n 0.0v 4997.51n 0.0v 5047.49n 0.0v 5047.51n 1.8v 5097.49n 1.8v 5097.51n 1.8v 5147.49n 1.8v 5147.51n 0.0v 5197.49n 0.0v 5197.51n 0.0v 5247.49n 0.0v 5247.51n 1.8v 5297.49n 1.8v 5297.51n 1.8v 5347.49n 1.8v 5347.51n 0.0v 5397.49n 0.0v 5397.51n 0.0v 5447.49n 0.0v 5447.51n 1.8v 5497.49n 1.8v 5497.51n 1.8v 5547.49n 1.8v 5547.51n 1.8v 5597.49n 1.8v 5597.51n 1.8v 5647.49n 1.8v 5647.51n 1.8v 5697.49n 1.8v 5697.51n 1.8v 5747.49n 1.8v 5747.51n 1.8v 5797.49n 1.8v 5797.51n 0.0v 5847.49n 0.0v 5847.51n 0.0v 5897.49n 0.0v 5897.51n 1.8v 5947.49n 1.8v 5947.51n 0.0v 5997.49n 0.0v 5997.51n 1.8v 6047.49n 1.8v 6047.51n 0.0v 6097.49n 0.0v 6097.51n 0.0v 6147.49n 0.0v 6147.51n 0.0v 6197.49n 0.0v 6197.51n 1.8v 6247.49n 1.8v 6247.51n 1.8v 6297.49n 1.8v 6297.51n 1.8v 6347.49n 1.8v 6347.51n 1.8v 6397.49n 1.8v 6397.51n 0.0v 6447.49n 0.0v 6447.51n 1.8v 6497.49n 1.8v 6497.51n 0.0v 6547.49n 0.0v 6547.51n 0.0v 6597.49n 0.0v 6597.51n 0.0v 6647.49n 0.0v 6647.51n 0.0v 6697.49n 0.0v 6697.51n 0.0v 6747.49n 0.0v 6747.51n 1.8v 6797.49n 1.8v 6797.51n 1.8v 6847.49n 1.8v 6847.51n 0.0v 6897.49n 0.0v 6897.51n 0.0v 6947.49n 0.0v 6947.51n 0.0v 6997.49n 0.0v 6997.51n 0.0v 7047.49n 0.0v 7047.51n 1.8v 7097.49n 1.8v 7097.51n 0.0v 7147.49n 0.0v 7147.51n 1.8v 7197.49n 1.8v 7197.51n 0.0v 7247.49n 0.0v 7247.51n 0.0v 7297.49n 0.0v 7297.51n 1.8v 7347.49n 1.8v 7347.51n 1.8v 7397.49n 1.8v 7397.51n 1.8v 7447.49n 1.8v 7447.51n 0.0v 7497.49n 0.0v 7497.51n 1.8v 7547.49n 1.8v 7547.51n 1.8v 7597.49n 1.8v 7597.51n 0.0v 7647.49n 0.0v 7647.51n 1.8v 7697.49n 1.8v 7697.51n 1.8v 7747.49n 1.8v 7747.51n 1.8v 7797.49n 1.8v 7797.51n 1.8v 7847.49n 1.8v 7847.51n 1.8v 7897.49n 1.8v 7897.51n 0.0v 7947.49n 0.0v 7947.51n 1.8v 7997.49n 1.8v 7997.51n 1.8v 8047.49n 1.8v 8047.51n 1.8v 8097.49n 1.8v 8097.51n 1.8v 8147.49n 1.8v 8147.51n 1.8v 8197.49n 1.8v 8197.51n 0.0v 8247.49n 0.0v 8247.51n 0.0v 8297.49n 0.0v 8297.51n 0.0v 8347.49n 0.0v 8347.51n 1.8v 8397.49n 1.8v 8397.51n 0.0v 8447.49n 0.0v 8447.51n 0.0v 8497.49n 0.0v 8497.51n 1.8v 8547.49n 1.8v 8547.51n 0.0v 8597.49n 0.0v 8597.51n 0.0v 8647.49n 0.0v 8647.51n 1.8v 8697.49n 1.8v 8697.51n 1.8v 8747.49n 1.8v 8747.51n 1.8v 8797.49n 1.8v 8797.51n 1.8v 8847.49n 1.8v 8847.51n 0.0v 8897.49n 0.0v 8897.51n 0.0v 8947.49n 0.0v 8947.51n 0.0v 8997.49n 0.0v 8997.51n 0.0v 9047.49n 0.0v 9047.51n 1.8v 9097.49n 1.8v 9097.51n 0.0v 9147.49n 0.0v 9147.51n 0.0v 9197.49n 0.0v 9197.51n 0.0v 9247.49n 0.0v 9247.51n 1.8v 9297.49n 1.8v 9297.51n 1.8v 9347.49n 1.8v 9347.51n 1.8v 9397.49n 1.8v 9397.51n 1.8v 9447.49n 1.8v 9447.51n 0.0v 9497.49n 0.0v 9497.51n 0.0v 9547.49n 0.0v 9547.51n 0.0v 9597.49n 0.0v 9597.51n 0.0v 9647.49n 0.0v 9647.51n 0.0v 9697.49n 0.0v 9697.51n 1.8v 9747.49n 1.8v 9747.51n 0.0v 9797.49n 0.0v 9797.51n 1.8v 9847.49n 1.8v 9847.51n 0.0v 9897.49n 0.0v 9897.51n 0.0v 9947.49n 0.0v 9947.51n 1.8v 9997.49n 1.8v 9997.51n 0.0v 10047.49n 0.0v 10047.51n 1.8v 10097.49n 1.8v 10097.51n 0.0v 10147.49n 0.0v 10147.51n 0.0v 10197.49n 0.0v 10197.51n 1.8v 10247.49n 1.8v 10247.51n 1.8v )
* PULSE: period=50
Vclk0 clk0 0 PULSE (0 1.8 49.99n 0.02n 0.02n 24.979999999999997n 50n)
* PULSE: period=50
Vclk1 clk1 0 PULSE (0 1.8 49.99n 0.02n 0.02n 24.979999999999997n 50n)

 * Generation of dout measurements
* CHECK dout1_0 Vdout1_0ck4 = 0 time = 250
.meas tran vdout1_0ck4 FIND v(dout1_0) AT=250.25n

* CHECK dout1_1 Vdout1_1ck4 = 1.8 time = 250
.meas tran vdout1_1ck4 FIND v(dout1_1) AT=250.25n

* CHECK dout1_2 Vdout1_2ck4 = 1.8 time = 250
.meas tran vdout1_2ck4 FIND v(dout1_2) AT=250.25n

* CHECK dout1_3 Vdout1_3ck4 = 0 time = 250
.meas tran vdout1_3ck4 FIND v(dout1_3) AT=250.25n

* CHECK dout1_4 Vdout1_4ck4 = 0 time = 250
.meas tran vdout1_4ck4 FIND v(dout1_4) AT=250.25n

* CHECK dout1_5 Vdout1_5ck4 = 1.8 time = 250
.meas tran vdout1_5ck4 FIND v(dout1_5) AT=250.25n

* CHECK dout1_6 Vdout1_6ck4 = 0 time = 250
.meas tran vdout1_6ck4 FIND v(dout1_6) AT=250.25n

* CHECK dout1_7 Vdout1_7ck4 = 1.8 time = 250
.meas tran vdout1_7ck4 FIND v(dout1_7) AT=250.25n

* CHECK dout1_8 Vdout1_8ck4 = 1.8 time = 250
.meas tran vdout1_8ck4 FIND v(dout1_8) AT=250.25n

* CHECK dout1_9 Vdout1_9ck4 = 0 time = 250
.meas tran vdout1_9ck4 FIND v(dout1_9) AT=250.25n

* CHECK dout1_10 Vdout1_10ck4 = 1.8 time = 250
.meas tran vdout1_10ck4 FIND v(dout1_10) AT=250.25n

* CHECK dout1_11 Vdout1_11ck4 = 0 time = 250
.meas tran vdout1_11ck4 FIND v(dout1_11) AT=250.25n

* CHECK dout1_12 Vdout1_12ck4 = 0 time = 250
.meas tran vdout1_12ck4 FIND v(dout1_12) AT=250.25n

* CHECK dout1_13 Vdout1_13ck4 = 1.8 time = 250
.meas tran vdout1_13ck4 FIND v(dout1_13) AT=250.25n

* CHECK dout1_14 Vdout1_14ck4 = 0 time = 250
.meas tran vdout1_14ck4 FIND v(dout1_14) AT=250.25n

* CHECK dout1_15 Vdout1_15ck4 = 1.8 time = 250
.meas tran vdout1_15ck4 FIND v(dout1_15) AT=250.25n

* CHECK dout1_0 Vdout1_0ck5 = 0 time = 300
.meas tran vdout1_0ck5 FIND v(dout1_0) AT=300.25n

* CHECK dout1_1 Vdout1_1ck5 = 1.8 time = 300
.meas tran vdout1_1ck5 FIND v(dout1_1) AT=300.25n

* CHECK dout1_2 Vdout1_2ck5 = 1.8 time = 300
.meas tran vdout1_2ck5 FIND v(dout1_2) AT=300.25n

* CHECK dout1_3 Vdout1_3ck5 = 0 time = 300
.meas tran vdout1_3ck5 FIND v(dout1_3) AT=300.25n

* CHECK dout1_4 Vdout1_4ck5 = 0 time = 300
.meas tran vdout1_4ck5 FIND v(dout1_4) AT=300.25n

* CHECK dout1_5 Vdout1_5ck5 = 1.8 time = 300
.meas tran vdout1_5ck5 FIND v(dout1_5) AT=300.25n

* CHECK dout1_6 Vdout1_6ck5 = 0 time = 300
.meas tran vdout1_6ck5 FIND v(dout1_6) AT=300.25n

* CHECK dout1_7 Vdout1_7ck5 = 1.8 time = 300
.meas tran vdout1_7ck5 FIND v(dout1_7) AT=300.25n

* CHECK dout1_8 Vdout1_8ck5 = 1.8 time = 300
.meas tran vdout1_8ck5 FIND v(dout1_8) AT=300.25n

* CHECK dout1_9 Vdout1_9ck5 = 0 time = 300
.meas tran vdout1_9ck5 FIND v(dout1_9) AT=300.25n

* CHECK dout1_10 Vdout1_10ck5 = 1.8 time = 300
.meas tran vdout1_10ck5 FIND v(dout1_10) AT=300.25n

* CHECK dout1_11 Vdout1_11ck5 = 0 time = 300
.meas tran vdout1_11ck5 FIND v(dout1_11) AT=300.25n

* CHECK dout1_12 Vdout1_12ck5 = 0 time = 300
.meas tran vdout1_12ck5 FIND v(dout1_12) AT=300.25n

* CHECK dout1_13 Vdout1_13ck5 = 1.8 time = 300
.meas tran vdout1_13ck5 FIND v(dout1_13) AT=300.25n

* CHECK dout1_14 Vdout1_14ck5 = 0 time = 300
.meas tran vdout1_14ck5 FIND v(dout1_14) AT=300.25n

* CHECK dout1_15 Vdout1_15ck5 = 1.8 time = 300
.meas tran vdout1_15ck5 FIND v(dout1_15) AT=300.25n

* CHECK dout1_0 Vdout1_0ck6 = 1.8 time = 350
.meas tran vdout1_0ck6 FIND v(dout1_0) AT=350.25n

* CHECK dout1_1 Vdout1_1ck6 = 0 time = 350
.meas tran vdout1_1ck6 FIND v(dout1_1) AT=350.25n

* CHECK dout1_2 Vdout1_2ck6 = 1.8 time = 350
.meas tran vdout1_2ck6 FIND v(dout1_2) AT=350.25n

* CHECK dout1_3 Vdout1_3ck6 = 1.8 time = 350
.meas tran vdout1_3ck6 FIND v(dout1_3) AT=350.25n

* CHECK dout1_4 Vdout1_4ck6 = 1.8 time = 350
.meas tran vdout1_4ck6 FIND v(dout1_4) AT=350.25n

* CHECK dout1_5 Vdout1_5ck6 = 0 time = 350
.meas tran vdout1_5ck6 FIND v(dout1_5) AT=350.25n

* CHECK dout1_6 Vdout1_6ck6 = 0 time = 350
.meas tran vdout1_6ck6 FIND v(dout1_6) AT=350.25n

* CHECK dout1_7 Vdout1_7ck6 = 0 time = 350
.meas tran vdout1_7ck6 FIND v(dout1_7) AT=350.25n

* CHECK dout1_8 Vdout1_8ck6 = 1.8 time = 350
.meas tran vdout1_8ck6 FIND v(dout1_8) AT=350.25n

* CHECK dout1_9 Vdout1_9ck6 = 1.8 time = 350
.meas tran vdout1_9ck6 FIND v(dout1_9) AT=350.25n

* CHECK dout1_10 Vdout1_10ck6 = 0 time = 350
.meas tran vdout1_10ck6 FIND v(dout1_10) AT=350.25n

* CHECK dout1_11 Vdout1_11ck6 = 0 time = 350
.meas tran vdout1_11ck6 FIND v(dout1_11) AT=350.25n

* CHECK dout1_12 Vdout1_12ck6 = 1.8 time = 350
.meas tran vdout1_12ck6 FIND v(dout1_12) AT=350.25n

* CHECK dout1_13 Vdout1_13ck6 = 1.8 time = 350
.meas tran vdout1_13ck6 FIND v(dout1_13) AT=350.25n

* CHECK dout1_14 Vdout1_14ck6 = 1.8 time = 350
.meas tran vdout1_14ck6 FIND v(dout1_14) AT=350.25n

* CHECK dout1_15 Vdout1_15ck6 = 0 time = 350
.meas tran vdout1_15ck6 FIND v(dout1_15) AT=350.25n

* CHECK dout1_0 Vdout1_0ck8 = 1.8 time = 450
.meas tran vdout1_0ck8 FIND v(dout1_0) AT=450.25n

* CHECK dout1_1 Vdout1_1ck8 = 0 time = 450
.meas tran vdout1_1ck8 FIND v(dout1_1) AT=450.25n

* CHECK dout1_2 Vdout1_2ck8 = 1.8 time = 450
.meas tran vdout1_2ck8 FIND v(dout1_2) AT=450.25n

* CHECK dout1_3 Vdout1_3ck8 = 1.8 time = 450
.meas tran vdout1_3ck8 FIND v(dout1_3) AT=450.25n

* CHECK dout1_4 Vdout1_4ck8 = 1.8 time = 450
.meas tran vdout1_4ck8 FIND v(dout1_4) AT=450.25n

* CHECK dout1_5 Vdout1_5ck8 = 0 time = 450
.meas tran vdout1_5ck8 FIND v(dout1_5) AT=450.25n

* CHECK dout1_6 Vdout1_6ck8 = 0 time = 450
.meas tran vdout1_6ck8 FIND v(dout1_6) AT=450.25n

* CHECK dout1_7 Vdout1_7ck8 = 0 time = 450
.meas tran vdout1_7ck8 FIND v(dout1_7) AT=450.25n

* CHECK dout1_8 Vdout1_8ck8 = 1.8 time = 450
.meas tran vdout1_8ck8 FIND v(dout1_8) AT=450.25n

* CHECK dout1_9 Vdout1_9ck8 = 1.8 time = 450
.meas tran vdout1_9ck8 FIND v(dout1_9) AT=450.25n

* CHECK dout1_10 Vdout1_10ck8 = 0 time = 450
.meas tran vdout1_10ck8 FIND v(dout1_10) AT=450.25n

* CHECK dout1_11 Vdout1_11ck8 = 0 time = 450
.meas tran vdout1_11ck8 FIND v(dout1_11) AT=450.25n

* CHECK dout1_12 Vdout1_12ck8 = 1.8 time = 450
.meas tran vdout1_12ck8 FIND v(dout1_12) AT=450.25n

* CHECK dout1_13 Vdout1_13ck8 = 1.8 time = 450
.meas tran vdout1_13ck8 FIND v(dout1_13) AT=450.25n

* CHECK dout1_14 Vdout1_14ck8 = 1.8 time = 450
.meas tran vdout1_14ck8 FIND v(dout1_14) AT=450.25n

* CHECK dout1_15 Vdout1_15ck8 = 0 time = 450
.meas tran vdout1_15ck8 FIND v(dout1_15) AT=450.25n

* CHECK dout1_0 Vdout1_0ck10 = 1.8 time = 550
.meas tran vdout1_0ck10 FIND v(dout1_0) AT=550.25n

* CHECK dout1_1 Vdout1_1ck10 = 0 time = 550
.meas tran vdout1_1ck10 FIND v(dout1_1) AT=550.25n

* CHECK dout1_2 Vdout1_2ck10 = 0 time = 550
.meas tran vdout1_2ck10 FIND v(dout1_2) AT=550.25n

* CHECK dout1_3 Vdout1_3ck10 = 1.8 time = 550
.meas tran vdout1_3ck10 FIND v(dout1_3) AT=550.25n

* CHECK dout1_4 Vdout1_4ck10 = 0 time = 550
.meas tran vdout1_4ck10 FIND v(dout1_4) AT=550.25n

* CHECK dout1_5 Vdout1_5ck10 = 0 time = 550
.meas tran vdout1_5ck10 FIND v(dout1_5) AT=550.25n

* CHECK dout1_6 Vdout1_6ck10 = 0 time = 550
.meas tran vdout1_6ck10 FIND v(dout1_6) AT=550.25n

* CHECK dout1_7 Vdout1_7ck10 = 0 time = 550
.meas tran vdout1_7ck10 FIND v(dout1_7) AT=550.25n

* CHECK dout1_8 Vdout1_8ck10 = 0 time = 550
.meas tran vdout1_8ck10 FIND v(dout1_8) AT=550.25n

* CHECK dout1_9 Vdout1_9ck10 = 0 time = 550
.meas tran vdout1_9ck10 FIND v(dout1_9) AT=550.25n

* CHECK dout1_10 Vdout1_10ck10 = 1.8 time = 550
.meas tran vdout1_10ck10 FIND v(dout1_10) AT=550.25n

* CHECK dout1_11 Vdout1_11ck10 = 1.8 time = 550
.meas tran vdout1_11ck10 FIND v(dout1_11) AT=550.25n

* CHECK dout1_12 Vdout1_12ck10 = 0 time = 550
.meas tran vdout1_12ck10 FIND v(dout1_12) AT=550.25n

* CHECK dout1_13 Vdout1_13ck10 = 0 time = 550
.meas tran vdout1_13ck10 FIND v(dout1_13) AT=550.25n

* CHECK dout1_14 Vdout1_14ck10 = 0 time = 550
.meas tran vdout1_14ck10 FIND v(dout1_14) AT=550.25n

* CHECK dout1_15 Vdout1_15ck10 = 0 time = 550
.meas tran vdout1_15ck10 FIND v(dout1_15) AT=550.25n

* CHECK dout1_0 Vdout1_0ck13 = 0 time = 700
.meas tran vdout1_0ck13 FIND v(dout1_0) AT=700.25n

* CHECK dout1_1 Vdout1_1ck13 = 1.8 time = 700
.meas tran vdout1_1ck13 FIND v(dout1_1) AT=700.25n

* CHECK dout1_2 Vdout1_2ck13 = 1.8 time = 700
.meas tran vdout1_2ck13 FIND v(dout1_2) AT=700.25n

* CHECK dout1_3 Vdout1_3ck13 = 0 time = 700
.meas tran vdout1_3ck13 FIND v(dout1_3) AT=700.25n

* CHECK dout1_4 Vdout1_4ck13 = 0 time = 700
.meas tran vdout1_4ck13 FIND v(dout1_4) AT=700.25n

* CHECK dout1_5 Vdout1_5ck13 = 1.8 time = 700
.meas tran vdout1_5ck13 FIND v(dout1_5) AT=700.25n

* CHECK dout1_6 Vdout1_6ck13 = 0 time = 700
.meas tran vdout1_6ck13 FIND v(dout1_6) AT=700.25n

* CHECK dout1_7 Vdout1_7ck13 = 1.8 time = 700
.meas tran vdout1_7ck13 FIND v(dout1_7) AT=700.25n

* CHECK dout1_8 Vdout1_8ck13 = 1.8 time = 700
.meas tran vdout1_8ck13 FIND v(dout1_8) AT=700.25n

* CHECK dout1_9 Vdout1_9ck13 = 0 time = 700
.meas tran vdout1_9ck13 FIND v(dout1_9) AT=700.25n

* CHECK dout1_10 Vdout1_10ck13 = 1.8 time = 700
.meas tran vdout1_10ck13 FIND v(dout1_10) AT=700.25n

* CHECK dout1_11 Vdout1_11ck13 = 0 time = 700
.meas tran vdout1_11ck13 FIND v(dout1_11) AT=700.25n

* CHECK dout1_12 Vdout1_12ck13 = 0 time = 700
.meas tran vdout1_12ck13 FIND v(dout1_12) AT=700.25n

* CHECK dout1_13 Vdout1_13ck13 = 1.8 time = 700
.meas tran vdout1_13ck13 FIND v(dout1_13) AT=700.25n

* CHECK dout1_14 Vdout1_14ck13 = 0 time = 700
.meas tran vdout1_14ck13 FIND v(dout1_14) AT=700.25n

* CHECK dout1_15 Vdout1_15ck13 = 1.8 time = 700
.meas tran vdout1_15ck13 FIND v(dout1_15) AT=700.25n

* CHECK dout1_0 Vdout1_0ck14 = 0 time = 750
.meas tran vdout1_0ck14 FIND v(dout1_0) AT=750.25n

* CHECK dout1_1 Vdout1_1ck14 = 1.8 time = 750
.meas tran vdout1_1ck14 FIND v(dout1_1) AT=750.25n

* CHECK dout1_2 Vdout1_2ck14 = 1.8 time = 750
.meas tran vdout1_2ck14 FIND v(dout1_2) AT=750.25n

* CHECK dout1_3 Vdout1_3ck14 = 1.8 time = 750
.meas tran vdout1_3ck14 FIND v(dout1_3) AT=750.25n

* CHECK dout1_4 Vdout1_4ck14 = 0 time = 750
.meas tran vdout1_4ck14 FIND v(dout1_4) AT=750.25n

* CHECK dout1_5 Vdout1_5ck14 = 0 time = 750
.meas tran vdout1_5ck14 FIND v(dout1_5) AT=750.25n

* CHECK dout1_6 Vdout1_6ck14 = 0 time = 750
.meas tran vdout1_6ck14 FIND v(dout1_6) AT=750.25n

* CHECK dout1_7 Vdout1_7ck14 = 0 time = 750
.meas tran vdout1_7ck14 FIND v(dout1_7) AT=750.25n

* CHECK dout1_8 Vdout1_8ck14 = 1.8 time = 750
.meas tran vdout1_8ck14 FIND v(dout1_8) AT=750.25n

* CHECK dout1_9 Vdout1_9ck14 = 0 time = 750
.meas tran vdout1_9ck14 FIND v(dout1_9) AT=750.25n

* CHECK dout1_10 Vdout1_10ck14 = 0 time = 750
.meas tran vdout1_10ck14 FIND v(dout1_10) AT=750.25n

* CHECK dout1_11 Vdout1_11ck14 = 1.8 time = 750
.meas tran vdout1_11ck14 FIND v(dout1_11) AT=750.25n

* CHECK dout1_12 Vdout1_12ck14 = 1.8 time = 750
.meas tran vdout1_12ck14 FIND v(dout1_12) AT=750.25n

* CHECK dout1_13 Vdout1_13ck14 = 0 time = 750
.meas tran vdout1_13ck14 FIND v(dout1_13) AT=750.25n

* CHECK dout1_14 Vdout1_14ck14 = 0 time = 750
.meas tran vdout1_14ck14 FIND v(dout1_14) AT=750.25n

* CHECK dout1_15 Vdout1_15ck14 = 0 time = 750
.meas tran vdout1_15ck14 FIND v(dout1_15) AT=750.25n

* CHECK dout1_0 Vdout1_0ck16 = 0 time = 850
.meas tran vdout1_0ck16 FIND v(dout1_0) AT=850.25n

* CHECK dout1_1 Vdout1_1ck16 = 1.8 time = 850
.meas tran vdout1_1ck16 FIND v(dout1_1) AT=850.25n

* CHECK dout1_2 Vdout1_2ck16 = 0 time = 850
.meas tran vdout1_2ck16 FIND v(dout1_2) AT=850.25n

* CHECK dout1_3 Vdout1_3ck16 = 1.8 time = 850
.meas tran vdout1_3ck16 FIND v(dout1_3) AT=850.25n

* CHECK dout1_4 Vdout1_4ck16 = 0 time = 850
.meas tran vdout1_4ck16 FIND v(dout1_4) AT=850.25n

* CHECK dout1_5 Vdout1_5ck16 = 1.8 time = 850
.meas tran vdout1_5ck16 FIND v(dout1_5) AT=850.25n

* CHECK dout1_6 Vdout1_6ck16 = 1.8 time = 850
.meas tran vdout1_6ck16 FIND v(dout1_6) AT=850.25n

* CHECK dout1_7 Vdout1_7ck16 = 0 time = 850
.meas tran vdout1_7ck16 FIND v(dout1_7) AT=850.25n

* CHECK dout1_8 Vdout1_8ck16 = 1.8 time = 850
.meas tran vdout1_8ck16 FIND v(dout1_8) AT=850.25n

* CHECK dout1_9 Vdout1_9ck16 = 0 time = 850
.meas tran vdout1_9ck16 FIND v(dout1_9) AT=850.25n

* CHECK dout1_10 Vdout1_10ck16 = 1.8 time = 850
.meas tran vdout1_10ck16 FIND v(dout1_10) AT=850.25n

* CHECK dout1_11 Vdout1_11ck16 = 0 time = 850
.meas tran vdout1_11ck16 FIND v(dout1_11) AT=850.25n

* CHECK dout1_12 Vdout1_12ck16 = 0 time = 850
.meas tran vdout1_12ck16 FIND v(dout1_12) AT=850.25n

* CHECK dout1_13 Vdout1_13ck16 = 0 time = 850
.meas tran vdout1_13ck16 FIND v(dout1_13) AT=850.25n

* CHECK dout1_14 Vdout1_14ck16 = 0 time = 850
.meas tran vdout1_14ck16 FIND v(dout1_14) AT=850.25n

* CHECK dout1_15 Vdout1_15ck16 = 0 time = 850
.meas tran vdout1_15ck16 FIND v(dout1_15) AT=850.25n

* CHECK dout1_0 Vdout1_0ck21 = 0 time = 1100
.meas tran vdout1_0ck21 FIND v(dout1_0) AT=1100.25n

* CHECK dout1_1 Vdout1_1ck21 = 1.8 time = 1100
.meas tran vdout1_1ck21 FIND v(dout1_1) AT=1100.25n

* CHECK dout1_2 Vdout1_2ck21 = 1.8 time = 1100
.meas tran vdout1_2ck21 FIND v(dout1_2) AT=1100.25n

* CHECK dout1_3 Vdout1_3ck21 = 0 time = 1100
.meas tran vdout1_3ck21 FIND v(dout1_3) AT=1100.25n

* CHECK dout1_4 Vdout1_4ck21 = 0 time = 1100
.meas tran vdout1_4ck21 FIND v(dout1_4) AT=1100.25n

* CHECK dout1_5 Vdout1_5ck21 = 0 time = 1100
.meas tran vdout1_5ck21 FIND v(dout1_5) AT=1100.25n

* CHECK dout1_6 Vdout1_6ck21 = 0 time = 1100
.meas tran vdout1_6ck21 FIND v(dout1_6) AT=1100.25n

* CHECK dout1_7 Vdout1_7ck21 = 1.8 time = 1100
.meas tran vdout1_7ck21 FIND v(dout1_7) AT=1100.25n

* CHECK dout1_8 Vdout1_8ck21 = 0 time = 1100
.meas tran vdout1_8ck21 FIND v(dout1_8) AT=1100.25n

* CHECK dout1_9 Vdout1_9ck21 = 0 time = 1100
.meas tran vdout1_9ck21 FIND v(dout1_9) AT=1100.25n

* CHECK dout1_10 Vdout1_10ck21 = 0 time = 1100
.meas tran vdout1_10ck21 FIND v(dout1_10) AT=1100.25n

* CHECK dout1_11 Vdout1_11ck21 = 0 time = 1100
.meas tran vdout1_11ck21 FIND v(dout1_11) AT=1100.25n

* CHECK dout1_12 Vdout1_12ck21 = 0 time = 1100
.meas tran vdout1_12ck21 FIND v(dout1_12) AT=1100.25n

* CHECK dout1_13 Vdout1_13ck21 = 0 time = 1100
.meas tran vdout1_13ck21 FIND v(dout1_13) AT=1100.25n

* CHECK dout1_14 Vdout1_14ck21 = 1.8 time = 1100
.meas tran vdout1_14ck21 FIND v(dout1_14) AT=1100.25n

* CHECK dout1_15 Vdout1_15ck21 = 0 time = 1100
.meas tran vdout1_15ck21 FIND v(dout1_15) AT=1100.25n

* CHECK dout1_0 Vdout1_0ck24 = 0 time = 1250
.meas tran vdout1_0ck24 FIND v(dout1_0) AT=1250.25n

* CHECK dout1_1 Vdout1_1ck24 = 1.8 time = 1250
.meas tran vdout1_1ck24 FIND v(dout1_1) AT=1250.25n

* CHECK dout1_2 Vdout1_2ck24 = 1.8 time = 1250
.meas tran vdout1_2ck24 FIND v(dout1_2) AT=1250.25n

* CHECK dout1_3 Vdout1_3ck24 = 1.8 time = 1250
.meas tran vdout1_3ck24 FIND v(dout1_3) AT=1250.25n

* CHECK dout1_4 Vdout1_4ck24 = 0 time = 1250
.meas tran vdout1_4ck24 FIND v(dout1_4) AT=1250.25n

* CHECK dout1_5 Vdout1_5ck24 = 0 time = 1250
.meas tran vdout1_5ck24 FIND v(dout1_5) AT=1250.25n

* CHECK dout1_6 Vdout1_6ck24 = 0 time = 1250
.meas tran vdout1_6ck24 FIND v(dout1_6) AT=1250.25n

* CHECK dout1_7 Vdout1_7ck24 = 0 time = 1250
.meas tran vdout1_7ck24 FIND v(dout1_7) AT=1250.25n

* CHECK dout1_8 Vdout1_8ck24 = 1.8 time = 1250
.meas tran vdout1_8ck24 FIND v(dout1_8) AT=1250.25n

* CHECK dout1_9 Vdout1_9ck24 = 0 time = 1250
.meas tran vdout1_9ck24 FIND v(dout1_9) AT=1250.25n

* CHECK dout1_10 Vdout1_10ck24 = 0 time = 1250
.meas tran vdout1_10ck24 FIND v(dout1_10) AT=1250.25n

* CHECK dout1_11 Vdout1_11ck24 = 1.8 time = 1250
.meas tran vdout1_11ck24 FIND v(dout1_11) AT=1250.25n

* CHECK dout1_12 Vdout1_12ck24 = 1.8 time = 1250
.meas tran vdout1_12ck24 FIND v(dout1_12) AT=1250.25n

* CHECK dout1_13 Vdout1_13ck24 = 0 time = 1250
.meas tran vdout1_13ck24 FIND v(dout1_13) AT=1250.25n

* CHECK dout1_14 Vdout1_14ck24 = 0 time = 1250
.meas tran vdout1_14ck24 FIND v(dout1_14) AT=1250.25n

* CHECK dout1_15 Vdout1_15ck24 = 0 time = 1250
.meas tran vdout1_15ck24 FIND v(dout1_15) AT=1250.25n

* CHECK dout1_0 Vdout1_0ck25 = 1.8 time = 1300
.meas tran vdout1_0ck25 FIND v(dout1_0) AT=1300.25n

* CHECK dout1_1 Vdout1_1ck25 = 1.8 time = 1300
.meas tran vdout1_1ck25 FIND v(dout1_1) AT=1300.25n

* CHECK dout1_2 Vdout1_2ck25 = 0 time = 1300
.meas tran vdout1_2ck25 FIND v(dout1_2) AT=1300.25n

* CHECK dout1_3 Vdout1_3ck25 = 1.8 time = 1300
.meas tran vdout1_3ck25 FIND v(dout1_3) AT=1300.25n

* CHECK dout1_4 Vdout1_4ck25 = 0 time = 1300
.meas tran vdout1_4ck25 FIND v(dout1_4) AT=1300.25n

* CHECK dout1_5 Vdout1_5ck25 = 0 time = 1300
.meas tran vdout1_5ck25 FIND v(dout1_5) AT=1300.25n

* CHECK dout1_6 Vdout1_6ck25 = 0 time = 1300
.meas tran vdout1_6ck25 FIND v(dout1_6) AT=1300.25n

* CHECK dout1_7 Vdout1_7ck25 = 0 time = 1300
.meas tran vdout1_7ck25 FIND v(dout1_7) AT=1300.25n

* CHECK dout1_8 Vdout1_8ck25 = 0 time = 1300
.meas tran vdout1_8ck25 FIND v(dout1_8) AT=1300.25n

* CHECK dout1_9 Vdout1_9ck25 = 1.8 time = 1300
.meas tran vdout1_9ck25 FIND v(dout1_9) AT=1300.25n

* CHECK dout1_10 Vdout1_10ck25 = 0 time = 1300
.meas tran vdout1_10ck25 FIND v(dout1_10) AT=1300.25n

* CHECK dout1_11 Vdout1_11ck25 = 1.8 time = 1300
.meas tran vdout1_11ck25 FIND v(dout1_11) AT=1300.25n

* CHECK dout1_12 Vdout1_12ck25 = 0 time = 1300
.meas tran vdout1_12ck25 FIND v(dout1_12) AT=1300.25n

* CHECK dout1_13 Vdout1_13ck25 = 1.8 time = 1300
.meas tran vdout1_13ck25 FIND v(dout1_13) AT=1300.25n

* CHECK dout1_14 Vdout1_14ck25 = 0 time = 1300
.meas tran vdout1_14ck25 FIND v(dout1_14) AT=1300.25n

* CHECK dout1_15 Vdout1_15ck25 = 1.8 time = 1300
.meas tran vdout1_15ck25 FIND v(dout1_15) AT=1300.25n

* CHECK dout1_0 Vdout1_0ck26 = 0 time = 1350
.meas tran vdout1_0ck26 FIND v(dout1_0) AT=1350.25n

* CHECK dout1_1 Vdout1_1ck26 = 1.8 time = 1350
.meas tran vdout1_1ck26 FIND v(dout1_1) AT=1350.25n

* CHECK dout1_2 Vdout1_2ck26 = 1.8 time = 1350
.meas tran vdout1_2ck26 FIND v(dout1_2) AT=1350.25n

* CHECK dout1_3 Vdout1_3ck26 = 0 time = 1350
.meas tran vdout1_3ck26 FIND v(dout1_3) AT=1350.25n

* CHECK dout1_4 Vdout1_4ck26 = 0 time = 1350
.meas tran vdout1_4ck26 FIND v(dout1_4) AT=1350.25n

* CHECK dout1_5 Vdout1_5ck26 = 1.8 time = 1350
.meas tran vdout1_5ck26 FIND v(dout1_5) AT=1350.25n

* CHECK dout1_6 Vdout1_6ck26 = 1.8 time = 1350
.meas tran vdout1_6ck26 FIND v(dout1_6) AT=1350.25n

* CHECK dout1_7 Vdout1_7ck26 = 1.8 time = 1350
.meas tran vdout1_7ck26 FIND v(dout1_7) AT=1350.25n

* CHECK dout1_8 Vdout1_8ck26 = 1.8 time = 1350
.meas tran vdout1_8ck26 FIND v(dout1_8) AT=1350.25n

* CHECK dout1_9 Vdout1_9ck26 = 1.8 time = 1350
.meas tran vdout1_9ck26 FIND v(dout1_9) AT=1350.25n

* CHECK dout1_10 Vdout1_10ck26 = 0 time = 1350
.meas tran vdout1_10ck26 FIND v(dout1_10) AT=1350.25n

* CHECK dout1_11 Vdout1_11ck26 = 1.8 time = 1350
.meas tran vdout1_11ck26 FIND v(dout1_11) AT=1350.25n

* CHECK dout1_12 Vdout1_12ck26 = 1.8 time = 1350
.meas tran vdout1_12ck26 FIND v(dout1_12) AT=1350.25n

* CHECK dout1_13 Vdout1_13ck26 = 1.8 time = 1350
.meas tran vdout1_13ck26 FIND v(dout1_13) AT=1350.25n

* CHECK dout1_14 Vdout1_14ck26 = 0 time = 1350
.meas tran vdout1_14ck26 FIND v(dout1_14) AT=1350.25n

* CHECK dout1_15 Vdout1_15ck26 = 0 time = 1350
.meas tran vdout1_15ck26 FIND v(dout1_15) AT=1350.25n

* CHECK dout1_0 Vdout1_0ck28 = 1.8 time = 1450
.meas tran vdout1_0ck28 FIND v(dout1_0) AT=1450.25n

* CHECK dout1_1 Vdout1_1ck28 = 0 time = 1450
.meas tran vdout1_1ck28 FIND v(dout1_1) AT=1450.25n

* CHECK dout1_2 Vdout1_2ck28 = 0 time = 1450
.meas tran vdout1_2ck28 FIND v(dout1_2) AT=1450.25n

* CHECK dout1_3 Vdout1_3ck28 = 1.8 time = 1450
.meas tran vdout1_3ck28 FIND v(dout1_3) AT=1450.25n

* CHECK dout1_4 Vdout1_4ck28 = 0 time = 1450
.meas tran vdout1_4ck28 FIND v(dout1_4) AT=1450.25n

* CHECK dout1_5 Vdout1_5ck28 = 0 time = 1450
.meas tran vdout1_5ck28 FIND v(dout1_5) AT=1450.25n

* CHECK dout1_6 Vdout1_6ck28 = 0 time = 1450
.meas tran vdout1_6ck28 FIND v(dout1_6) AT=1450.25n

* CHECK dout1_7 Vdout1_7ck28 = 0 time = 1450
.meas tran vdout1_7ck28 FIND v(dout1_7) AT=1450.25n

* CHECK dout1_8 Vdout1_8ck28 = 0 time = 1450
.meas tran vdout1_8ck28 FIND v(dout1_8) AT=1450.25n

* CHECK dout1_9 Vdout1_9ck28 = 0 time = 1450
.meas tran vdout1_9ck28 FIND v(dout1_9) AT=1450.25n

* CHECK dout1_10 Vdout1_10ck28 = 1.8 time = 1450
.meas tran vdout1_10ck28 FIND v(dout1_10) AT=1450.25n

* CHECK dout1_11 Vdout1_11ck28 = 1.8 time = 1450
.meas tran vdout1_11ck28 FIND v(dout1_11) AT=1450.25n

* CHECK dout1_12 Vdout1_12ck28 = 0 time = 1450
.meas tran vdout1_12ck28 FIND v(dout1_12) AT=1450.25n

* CHECK dout1_13 Vdout1_13ck28 = 0 time = 1450
.meas tran vdout1_13ck28 FIND v(dout1_13) AT=1450.25n

* CHECK dout1_14 Vdout1_14ck28 = 0 time = 1450
.meas tran vdout1_14ck28 FIND v(dout1_14) AT=1450.25n

* CHECK dout1_15 Vdout1_15ck28 = 0 time = 1450
.meas tran vdout1_15ck28 FIND v(dout1_15) AT=1450.25n

* CHECK dout1_0 Vdout1_0ck29 = 0 time = 1500
.meas tran vdout1_0ck29 FIND v(dout1_0) AT=1500.25n

* CHECK dout1_1 Vdout1_1ck29 = 1.8 time = 1500
.meas tran vdout1_1ck29 FIND v(dout1_1) AT=1500.25n

* CHECK dout1_2 Vdout1_2ck29 = 1.8 time = 1500
.meas tran vdout1_2ck29 FIND v(dout1_2) AT=1500.25n

* CHECK dout1_3 Vdout1_3ck29 = 0 time = 1500
.meas tran vdout1_3ck29 FIND v(dout1_3) AT=1500.25n

* CHECK dout1_4 Vdout1_4ck29 = 0 time = 1500
.meas tran vdout1_4ck29 FIND v(dout1_4) AT=1500.25n

* CHECK dout1_5 Vdout1_5ck29 = 1.8 time = 1500
.meas tran vdout1_5ck29 FIND v(dout1_5) AT=1500.25n

* CHECK dout1_6 Vdout1_6ck29 = 1.8 time = 1500
.meas tran vdout1_6ck29 FIND v(dout1_6) AT=1500.25n

* CHECK dout1_7 Vdout1_7ck29 = 1.8 time = 1500
.meas tran vdout1_7ck29 FIND v(dout1_7) AT=1500.25n

* CHECK dout1_8 Vdout1_8ck29 = 1.8 time = 1500
.meas tran vdout1_8ck29 FIND v(dout1_8) AT=1500.25n

* CHECK dout1_9 Vdout1_9ck29 = 1.8 time = 1500
.meas tran vdout1_9ck29 FIND v(dout1_9) AT=1500.25n

* CHECK dout1_10 Vdout1_10ck29 = 0 time = 1500
.meas tran vdout1_10ck29 FIND v(dout1_10) AT=1500.25n

* CHECK dout1_11 Vdout1_11ck29 = 1.8 time = 1500
.meas tran vdout1_11ck29 FIND v(dout1_11) AT=1500.25n

* CHECK dout1_12 Vdout1_12ck29 = 1.8 time = 1500
.meas tran vdout1_12ck29 FIND v(dout1_12) AT=1500.25n

* CHECK dout1_13 Vdout1_13ck29 = 1.8 time = 1500
.meas tran vdout1_13ck29 FIND v(dout1_13) AT=1500.25n

* CHECK dout1_14 Vdout1_14ck29 = 0 time = 1500
.meas tran vdout1_14ck29 FIND v(dout1_14) AT=1500.25n

* CHECK dout1_15 Vdout1_15ck29 = 0 time = 1500
.meas tran vdout1_15ck29 FIND v(dout1_15) AT=1500.25n

* CHECK dout1_0 Vdout1_0ck35 = 1.8 time = 1800
.meas tran vdout1_0ck35 FIND v(dout1_0) AT=1800.25n

* CHECK dout1_1 Vdout1_1ck35 = 1.8 time = 1800
.meas tran vdout1_1ck35 FIND v(dout1_1) AT=1800.25n

* CHECK dout1_2 Vdout1_2ck35 = 0 time = 1800
.meas tran vdout1_2ck35 FIND v(dout1_2) AT=1800.25n

* CHECK dout1_3 Vdout1_3ck35 = 1.8 time = 1800
.meas tran vdout1_3ck35 FIND v(dout1_3) AT=1800.25n

* CHECK dout1_4 Vdout1_4ck35 = 0 time = 1800
.meas tran vdout1_4ck35 FIND v(dout1_4) AT=1800.25n

* CHECK dout1_5 Vdout1_5ck35 = 1.8 time = 1800
.meas tran vdout1_5ck35 FIND v(dout1_5) AT=1800.25n

* CHECK dout1_6 Vdout1_6ck35 = 1.8 time = 1800
.meas tran vdout1_6ck35 FIND v(dout1_6) AT=1800.25n

* CHECK dout1_7 Vdout1_7ck35 = 1.8 time = 1800
.meas tran vdout1_7ck35 FIND v(dout1_7) AT=1800.25n

* CHECK dout1_8 Vdout1_8ck35 = 0 time = 1800
.meas tran vdout1_8ck35 FIND v(dout1_8) AT=1800.25n

* CHECK dout1_9 Vdout1_9ck35 = 0 time = 1800
.meas tran vdout1_9ck35 FIND v(dout1_9) AT=1800.25n

* CHECK dout1_10 Vdout1_10ck35 = 1.8 time = 1800
.meas tran vdout1_10ck35 FIND v(dout1_10) AT=1800.25n

* CHECK dout1_11 Vdout1_11ck35 = 0 time = 1800
.meas tran vdout1_11ck35 FIND v(dout1_11) AT=1800.25n

* CHECK dout1_12 Vdout1_12ck35 = 1.8 time = 1800
.meas tran vdout1_12ck35 FIND v(dout1_12) AT=1800.25n

* CHECK dout1_13 Vdout1_13ck35 = 1.8 time = 1800
.meas tran vdout1_13ck35 FIND v(dout1_13) AT=1800.25n

* CHECK dout1_14 Vdout1_14ck35 = 0 time = 1800
.meas tran vdout1_14ck35 FIND v(dout1_14) AT=1800.25n

* CHECK dout1_15 Vdout1_15ck35 = 1.8 time = 1800
.meas tran vdout1_15ck35 FIND v(dout1_15) AT=1800.25n

* CHECK dout1_0 Vdout1_0ck36 = 0 time = 1850
.meas tran vdout1_0ck36 FIND v(dout1_0) AT=1850.25n

* CHECK dout1_1 Vdout1_1ck36 = 0 time = 1850
.meas tran vdout1_1ck36 FIND v(dout1_1) AT=1850.25n

* CHECK dout1_2 Vdout1_2ck36 = 1.8 time = 1850
.meas tran vdout1_2ck36 FIND v(dout1_2) AT=1850.25n

* CHECK dout1_3 Vdout1_3ck36 = 1.8 time = 1850
.meas tran vdout1_3ck36 FIND v(dout1_3) AT=1850.25n

* CHECK dout1_4 Vdout1_4ck36 = 0 time = 1850
.meas tran vdout1_4ck36 FIND v(dout1_4) AT=1850.25n

* CHECK dout1_5 Vdout1_5ck36 = 0 time = 1850
.meas tran vdout1_5ck36 FIND v(dout1_5) AT=1850.25n

* CHECK dout1_6 Vdout1_6ck36 = 1.8 time = 1850
.meas tran vdout1_6ck36 FIND v(dout1_6) AT=1850.25n

* CHECK dout1_7 Vdout1_7ck36 = 0 time = 1850
.meas tran vdout1_7ck36 FIND v(dout1_7) AT=1850.25n

* CHECK dout1_8 Vdout1_8ck36 = 1.8 time = 1850
.meas tran vdout1_8ck36 FIND v(dout1_8) AT=1850.25n

* CHECK dout1_9 Vdout1_9ck36 = 1.8 time = 1850
.meas tran vdout1_9ck36 FIND v(dout1_9) AT=1850.25n

* CHECK dout1_10 Vdout1_10ck36 = 0 time = 1850
.meas tran vdout1_10ck36 FIND v(dout1_10) AT=1850.25n

* CHECK dout1_11 Vdout1_11ck36 = 0 time = 1850
.meas tran vdout1_11ck36 FIND v(dout1_11) AT=1850.25n

* CHECK dout1_12 Vdout1_12ck36 = 0 time = 1850
.meas tran vdout1_12ck36 FIND v(dout1_12) AT=1850.25n

* CHECK dout1_13 Vdout1_13ck36 = 1.8 time = 1850
.meas tran vdout1_13ck36 FIND v(dout1_13) AT=1850.25n

* CHECK dout1_14 Vdout1_14ck36 = 1.8 time = 1850
.meas tran vdout1_14ck36 FIND v(dout1_14) AT=1850.25n

* CHECK dout1_15 Vdout1_15ck36 = 0 time = 1850
.meas tran vdout1_15ck36 FIND v(dout1_15) AT=1850.25n

* CHECK dout1_0 Vdout1_0ck38 = 1.8 time = 1950
.meas tran vdout1_0ck38 FIND v(dout1_0) AT=1950.25n

* CHECK dout1_1 Vdout1_1ck38 = 1.8 time = 1950
.meas tran vdout1_1ck38 FIND v(dout1_1) AT=1950.25n

* CHECK dout1_2 Vdout1_2ck38 = 0 time = 1950
.meas tran vdout1_2ck38 FIND v(dout1_2) AT=1950.25n

* CHECK dout1_3 Vdout1_3ck38 = 1.8 time = 1950
.meas tran vdout1_3ck38 FIND v(dout1_3) AT=1950.25n

* CHECK dout1_4 Vdout1_4ck38 = 0 time = 1950
.meas tran vdout1_4ck38 FIND v(dout1_4) AT=1950.25n

* CHECK dout1_5 Vdout1_5ck38 = 0 time = 1950
.meas tran vdout1_5ck38 FIND v(dout1_5) AT=1950.25n

* CHECK dout1_6 Vdout1_6ck38 = 0 time = 1950
.meas tran vdout1_6ck38 FIND v(dout1_6) AT=1950.25n

* CHECK dout1_7 Vdout1_7ck38 = 0 time = 1950
.meas tran vdout1_7ck38 FIND v(dout1_7) AT=1950.25n

* CHECK dout1_8 Vdout1_8ck38 = 0 time = 1950
.meas tran vdout1_8ck38 FIND v(dout1_8) AT=1950.25n

* CHECK dout1_9 Vdout1_9ck38 = 1.8 time = 1950
.meas tran vdout1_9ck38 FIND v(dout1_9) AT=1950.25n

* CHECK dout1_10 Vdout1_10ck38 = 0 time = 1950
.meas tran vdout1_10ck38 FIND v(dout1_10) AT=1950.25n

* CHECK dout1_11 Vdout1_11ck38 = 1.8 time = 1950
.meas tran vdout1_11ck38 FIND v(dout1_11) AT=1950.25n

* CHECK dout1_12 Vdout1_12ck38 = 0 time = 1950
.meas tran vdout1_12ck38 FIND v(dout1_12) AT=1950.25n

* CHECK dout1_13 Vdout1_13ck38 = 1.8 time = 1950
.meas tran vdout1_13ck38 FIND v(dout1_13) AT=1950.25n

* CHECK dout1_14 Vdout1_14ck38 = 0 time = 1950
.meas tran vdout1_14ck38 FIND v(dout1_14) AT=1950.25n

* CHECK dout1_15 Vdout1_15ck38 = 1.8 time = 1950
.meas tran vdout1_15ck38 FIND v(dout1_15) AT=1950.25n

* CHECK dout1_0 Vdout1_0ck39 = 0 time = 2000
.meas tran vdout1_0ck39 FIND v(dout1_0) AT=2000.25n

* CHECK dout1_1 Vdout1_1ck39 = 1.8 time = 2000
.meas tran vdout1_1ck39 FIND v(dout1_1) AT=2000.25n

* CHECK dout1_2 Vdout1_2ck39 = 1.8 time = 2000
.meas tran vdout1_2ck39 FIND v(dout1_2) AT=2000.25n

* CHECK dout1_3 Vdout1_3ck39 = 1.8 time = 2000
.meas tran vdout1_3ck39 FIND v(dout1_3) AT=2000.25n

* CHECK dout1_4 Vdout1_4ck39 = 1.8 time = 2000
.meas tran vdout1_4ck39 FIND v(dout1_4) AT=2000.25n

* CHECK dout1_5 Vdout1_5ck39 = 1.8 time = 2000
.meas tran vdout1_5ck39 FIND v(dout1_5) AT=2000.25n

* CHECK dout1_6 Vdout1_6ck39 = 0 time = 2000
.meas tran vdout1_6ck39 FIND v(dout1_6) AT=2000.25n

* CHECK dout1_7 Vdout1_7ck39 = 0 time = 2000
.meas tran vdout1_7ck39 FIND v(dout1_7) AT=2000.25n

* CHECK dout1_8 Vdout1_8ck39 = 0 time = 2000
.meas tran vdout1_8ck39 FIND v(dout1_8) AT=2000.25n

* CHECK dout1_9 Vdout1_9ck39 = 0 time = 2000
.meas tran vdout1_9ck39 FIND v(dout1_9) AT=2000.25n

* CHECK dout1_10 Vdout1_10ck39 = 0 time = 2000
.meas tran vdout1_10ck39 FIND v(dout1_10) AT=2000.25n

* CHECK dout1_11 Vdout1_11ck39 = 0 time = 2000
.meas tran vdout1_11ck39 FIND v(dout1_11) AT=2000.25n

* CHECK dout1_12 Vdout1_12ck39 = 0 time = 2000
.meas tran vdout1_12ck39 FIND v(dout1_12) AT=2000.25n

* CHECK dout1_13 Vdout1_13ck39 = 1.8 time = 2000
.meas tran vdout1_13ck39 FIND v(dout1_13) AT=2000.25n

* CHECK dout1_14 Vdout1_14ck39 = 1.8 time = 2000
.meas tran vdout1_14ck39 FIND v(dout1_14) AT=2000.25n

* CHECK dout1_15 Vdout1_15ck39 = 0 time = 2000
.meas tran vdout1_15ck39 FIND v(dout1_15) AT=2000.25n

* CHECK dout1_0 Vdout1_0ck42 = 1.8 time = 2150
.meas tran vdout1_0ck42 FIND v(dout1_0) AT=2150.25n

* CHECK dout1_1 Vdout1_1ck42 = 0 time = 2150
.meas tran vdout1_1ck42 FIND v(dout1_1) AT=2150.25n

* CHECK dout1_2 Vdout1_2ck42 = 0 time = 2150
.meas tran vdout1_2ck42 FIND v(dout1_2) AT=2150.25n

* CHECK dout1_3 Vdout1_3ck42 = 1.8 time = 2150
.meas tran vdout1_3ck42 FIND v(dout1_3) AT=2150.25n

* CHECK dout1_4 Vdout1_4ck42 = 0 time = 2150
.meas tran vdout1_4ck42 FIND v(dout1_4) AT=2150.25n

* CHECK dout1_5 Vdout1_5ck42 = 0 time = 2150
.meas tran vdout1_5ck42 FIND v(dout1_5) AT=2150.25n

* CHECK dout1_6 Vdout1_6ck42 = 0 time = 2150
.meas tran vdout1_6ck42 FIND v(dout1_6) AT=2150.25n

* CHECK dout1_7 Vdout1_7ck42 = 0 time = 2150
.meas tran vdout1_7ck42 FIND v(dout1_7) AT=2150.25n

* CHECK dout1_8 Vdout1_8ck42 = 0 time = 2150
.meas tran vdout1_8ck42 FIND v(dout1_8) AT=2150.25n

* CHECK dout1_9 Vdout1_9ck42 = 0 time = 2150
.meas tran vdout1_9ck42 FIND v(dout1_9) AT=2150.25n

* CHECK dout1_10 Vdout1_10ck42 = 1.8 time = 2150
.meas tran vdout1_10ck42 FIND v(dout1_10) AT=2150.25n

* CHECK dout1_11 Vdout1_11ck42 = 1.8 time = 2150
.meas tran vdout1_11ck42 FIND v(dout1_11) AT=2150.25n

* CHECK dout1_12 Vdout1_12ck42 = 0 time = 2150
.meas tran vdout1_12ck42 FIND v(dout1_12) AT=2150.25n

* CHECK dout1_13 Vdout1_13ck42 = 0 time = 2150
.meas tran vdout1_13ck42 FIND v(dout1_13) AT=2150.25n

* CHECK dout1_14 Vdout1_14ck42 = 0 time = 2150
.meas tran vdout1_14ck42 FIND v(dout1_14) AT=2150.25n

* CHECK dout1_15 Vdout1_15ck42 = 0 time = 2150
.meas tran vdout1_15ck42 FIND v(dout1_15) AT=2150.25n

* CHECK dout1_0 Vdout1_0ck45 = 0 time = 2300
.meas tran vdout1_0ck45 FIND v(dout1_0) AT=2300.25n

* CHECK dout1_1 Vdout1_1ck45 = 1.8 time = 2300
.meas tran vdout1_1ck45 FIND v(dout1_1) AT=2300.25n

* CHECK dout1_2 Vdout1_2ck45 = 1.8 time = 2300
.meas tran vdout1_2ck45 FIND v(dout1_2) AT=2300.25n

* CHECK dout1_3 Vdout1_3ck45 = 0 time = 2300
.meas tran vdout1_3ck45 FIND v(dout1_3) AT=2300.25n

* CHECK dout1_4 Vdout1_4ck45 = 0 time = 2300
.meas tran vdout1_4ck45 FIND v(dout1_4) AT=2300.25n

* CHECK dout1_5 Vdout1_5ck45 = 1.8 time = 2300
.meas tran vdout1_5ck45 FIND v(dout1_5) AT=2300.25n

* CHECK dout1_6 Vdout1_6ck45 = 1.8 time = 2300
.meas tran vdout1_6ck45 FIND v(dout1_6) AT=2300.25n

* CHECK dout1_7 Vdout1_7ck45 = 1.8 time = 2300
.meas tran vdout1_7ck45 FIND v(dout1_7) AT=2300.25n

* CHECK dout1_8 Vdout1_8ck45 = 1.8 time = 2300
.meas tran vdout1_8ck45 FIND v(dout1_8) AT=2300.25n

* CHECK dout1_9 Vdout1_9ck45 = 1.8 time = 2300
.meas tran vdout1_9ck45 FIND v(dout1_9) AT=2300.25n

* CHECK dout1_10 Vdout1_10ck45 = 0 time = 2300
.meas tran vdout1_10ck45 FIND v(dout1_10) AT=2300.25n

* CHECK dout1_11 Vdout1_11ck45 = 1.8 time = 2300
.meas tran vdout1_11ck45 FIND v(dout1_11) AT=2300.25n

* CHECK dout1_12 Vdout1_12ck45 = 1.8 time = 2300
.meas tran vdout1_12ck45 FIND v(dout1_12) AT=2300.25n

* CHECK dout1_13 Vdout1_13ck45 = 1.8 time = 2300
.meas tran vdout1_13ck45 FIND v(dout1_13) AT=2300.25n

* CHECK dout1_14 Vdout1_14ck45 = 0 time = 2300
.meas tran vdout1_14ck45 FIND v(dout1_14) AT=2300.25n

* CHECK dout1_15 Vdout1_15ck45 = 0 time = 2300
.meas tran vdout1_15ck45 FIND v(dout1_15) AT=2300.25n

* CHECK dout1_0 Vdout1_0ck46 = 1.8 time = 2350
.meas tran vdout1_0ck46 FIND v(dout1_0) AT=2350.25n

* CHECK dout1_1 Vdout1_1ck46 = 0 time = 2350
.meas tran vdout1_1ck46 FIND v(dout1_1) AT=2350.25n

* CHECK dout1_2 Vdout1_2ck46 = 0 time = 2350
.meas tran vdout1_2ck46 FIND v(dout1_2) AT=2350.25n

* CHECK dout1_3 Vdout1_3ck46 = 1.8 time = 2350
.meas tran vdout1_3ck46 FIND v(dout1_3) AT=2350.25n

* CHECK dout1_4 Vdout1_4ck46 = 0 time = 2350
.meas tran vdout1_4ck46 FIND v(dout1_4) AT=2350.25n

* CHECK dout1_5 Vdout1_5ck46 = 0 time = 2350
.meas tran vdout1_5ck46 FIND v(dout1_5) AT=2350.25n

* CHECK dout1_6 Vdout1_6ck46 = 0 time = 2350
.meas tran vdout1_6ck46 FIND v(dout1_6) AT=2350.25n

* CHECK dout1_7 Vdout1_7ck46 = 0 time = 2350
.meas tran vdout1_7ck46 FIND v(dout1_7) AT=2350.25n

* CHECK dout1_8 Vdout1_8ck46 = 0 time = 2350
.meas tran vdout1_8ck46 FIND v(dout1_8) AT=2350.25n

* CHECK dout1_9 Vdout1_9ck46 = 0 time = 2350
.meas tran vdout1_9ck46 FIND v(dout1_9) AT=2350.25n

* CHECK dout1_10 Vdout1_10ck46 = 1.8 time = 2350
.meas tran vdout1_10ck46 FIND v(dout1_10) AT=2350.25n

* CHECK dout1_11 Vdout1_11ck46 = 1.8 time = 2350
.meas tran vdout1_11ck46 FIND v(dout1_11) AT=2350.25n

* CHECK dout1_12 Vdout1_12ck46 = 0 time = 2350
.meas tran vdout1_12ck46 FIND v(dout1_12) AT=2350.25n

* CHECK dout1_13 Vdout1_13ck46 = 0 time = 2350
.meas tran vdout1_13ck46 FIND v(dout1_13) AT=2350.25n

* CHECK dout1_14 Vdout1_14ck46 = 0 time = 2350
.meas tran vdout1_14ck46 FIND v(dout1_14) AT=2350.25n

* CHECK dout1_15 Vdout1_15ck46 = 0 time = 2350
.meas tran vdout1_15ck46 FIND v(dout1_15) AT=2350.25n

* CHECK dout1_0 Vdout1_0ck48 = 0 time = 2450
.meas tran vdout1_0ck48 FIND v(dout1_0) AT=2450.25n

* CHECK dout1_1 Vdout1_1ck48 = 0 time = 2450
.meas tran vdout1_1ck48 FIND v(dout1_1) AT=2450.25n

* CHECK dout1_2 Vdout1_2ck48 = 1.8 time = 2450
.meas tran vdout1_2ck48 FIND v(dout1_2) AT=2450.25n

* CHECK dout1_3 Vdout1_3ck48 = 1.8 time = 2450
.meas tran vdout1_3ck48 FIND v(dout1_3) AT=2450.25n

* CHECK dout1_4 Vdout1_4ck48 = 0 time = 2450
.meas tran vdout1_4ck48 FIND v(dout1_4) AT=2450.25n

* CHECK dout1_5 Vdout1_5ck48 = 0 time = 2450
.meas tran vdout1_5ck48 FIND v(dout1_5) AT=2450.25n

* CHECK dout1_6 Vdout1_6ck48 = 1.8 time = 2450
.meas tran vdout1_6ck48 FIND v(dout1_6) AT=2450.25n

* CHECK dout1_7 Vdout1_7ck48 = 0 time = 2450
.meas tran vdout1_7ck48 FIND v(dout1_7) AT=2450.25n

* CHECK dout1_8 Vdout1_8ck48 = 1.8 time = 2450
.meas tran vdout1_8ck48 FIND v(dout1_8) AT=2450.25n

* CHECK dout1_9 Vdout1_9ck48 = 1.8 time = 2450
.meas tran vdout1_9ck48 FIND v(dout1_9) AT=2450.25n

* CHECK dout1_10 Vdout1_10ck48 = 0 time = 2450
.meas tran vdout1_10ck48 FIND v(dout1_10) AT=2450.25n

* CHECK dout1_11 Vdout1_11ck48 = 0 time = 2450
.meas tran vdout1_11ck48 FIND v(dout1_11) AT=2450.25n

* CHECK dout1_12 Vdout1_12ck48 = 0 time = 2450
.meas tran vdout1_12ck48 FIND v(dout1_12) AT=2450.25n

* CHECK dout1_13 Vdout1_13ck48 = 1.8 time = 2450
.meas tran vdout1_13ck48 FIND v(dout1_13) AT=2450.25n

* CHECK dout1_14 Vdout1_14ck48 = 1.8 time = 2450
.meas tran vdout1_14ck48 FIND v(dout1_14) AT=2450.25n

* CHECK dout1_15 Vdout1_15ck48 = 0 time = 2450
.meas tran vdout1_15ck48 FIND v(dout1_15) AT=2450.25n

* CHECK dout1_0 Vdout1_0ck50 = 1.8 time = 2550
.meas tran vdout1_0ck50 FIND v(dout1_0) AT=2550.25n

* CHECK dout1_1 Vdout1_1ck50 = 1.8 time = 2550
.meas tran vdout1_1ck50 FIND v(dout1_1) AT=2550.25n

* CHECK dout1_2 Vdout1_2ck50 = 1.8 time = 2550
.meas tran vdout1_2ck50 FIND v(dout1_2) AT=2550.25n

* CHECK dout1_3 Vdout1_3ck50 = 1.8 time = 2550
.meas tran vdout1_3ck50 FIND v(dout1_3) AT=2550.25n

* CHECK dout1_4 Vdout1_4ck50 = 0 time = 2550
.meas tran vdout1_4ck50 FIND v(dout1_4) AT=2550.25n

* CHECK dout1_5 Vdout1_5ck50 = 0 time = 2550
.meas tran vdout1_5ck50 FIND v(dout1_5) AT=2550.25n

* CHECK dout1_6 Vdout1_6ck50 = 0 time = 2550
.meas tran vdout1_6ck50 FIND v(dout1_6) AT=2550.25n

* CHECK dout1_7 Vdout1_7ck50 = 0 time = 2550
.meas tran vdout1_7ck50 FIND v(dout1_7) AT=2550.25n

* CHECK dout1_8 Vdout1_8ck50 = 0 time = 2550
.meas tran vdout1_8ck50 FIND v(dout1_8) AT=2550.25n

* CHECK dout1_9 Vdout1_9ck50 = 0 time = 2550
.meas tran vdout1_9ck50 FIND v(dout1_9) AT=2550.25n

* CHECK dout1_10 Vdout1_10ck50 = 1.8 time = 2550
.meas tran vdout1_10ck50 FIND v(dout1_10) AT=2550.25n

* CHECK dout1_11 Vdout1_11ck50 = 0 time = 2550
.meas tran vdout1_11ck50 FIND v(dout1_11) AT=2550.25n

* CHECK dout1_12 Vdout1_12ck50 = 0 time = 2550
.meas tran vdout1_12ck50 FIND v(dout1_12) AT=2550.25n

* CHECK dout1_13 Vdout1_13ck50 = 1.8 time = 2550
.meas tran vdout1_13ck50 FIND v(dout1_13) AT=2550.25n

* CHECK dout1_14 Vdout1_14ck50 = 1.8 time = 2550
.meas tran vdout1_14ck50 FIND v(dout1_14) AT=2550.25n

* CHECK dout1_15 Vdout1_15ck50 = 1.8 time = 2550
.meas tran vdout1_15ck50 FIND v(dout1_15) AT=2550.25n

* CHECK dout1_0 Vdout1_0ck55 = 1.8 time = 2800
.meas tran vdout1_0ck55 FIND v(dout1_0) AT=2800.25n

* CHECK dout1_1 Vdout1_1ck55 = 0 time = 2800
.meas tran vdout1_1ck55 FIND v(dout1_1) AT=2800.25n

* CHECK dout1_2 Vdout1_2ck55 = 1.8 time = 2800
.meas tran vdout1_2ck55 FIND v(dout1_2) AT=2800.25n

* CHECK dout1_3 Vdout1_3ck55 = 0 time = 2800
.meas tran vdout1_3ck55 FIND v(dout1_3) AT=2800.25n

* CHECK dout1_4 Vdout1_4ck55 = 1.8 time = 2800
.meas tran vdout1_4ck55 FIND v(dout1_4) AT=2800.25n

* CHECK dout1_5 Vdout1_5ck55 = 1.8 time = 2800
.meas tran vdout1_5ck55 FIND v(dout1_5) AT=2800.25n

* CHECK dout1_6 Vdout1_6ck55 = 0 time = 2800
.meas tran vdout1_6ck55 FIND v(dout1_6) AT=2800.25n

* CHECK dout1_7 Vdout1_7ck55 = 0 time = 2800
.meas tran vdout1_7ck55 FIND v(dout1_7) AT=2800.25n

* CHECK dout1_8 Vdout1_8ck55 = 1.8 time = 2800
.meas tran vdout1_8ck55 FIND v(dout1_8) AT=2800.25n

* CHECK dout1_9 Vdout1_9ck55 = 1.8 time = 2800
.meas tran vdout1_9ck55 FIND v(dout1_9) AT=2800.25n

* CHECK dout1_10 Vdout1_10ck55 = 1.8 time = 2800
.meas tran vdout1_10ck55 FIND v(dout1_10) AT=2800.25n

* CHECK dout1_11 Vdout1_11ck55 = 0 time = 2800
.meas tran vdout1_11ck55 FIND v(dout1_11) AT=2800.25n

* CHECK dout1_12 Vdout1_12ck55 = 0 time = 2800
.meas tran vdout1_12ck55 FIND v(dout1_12) AT=2800.25n

* CHECK dout1_13 Vdout1_13ck55 = 0 time = 2800
.meas tran vdout1_13ck55 FIND v(dout1_13) AT=2800.25n

* CHECK dout1_14 Vdout1_14ck55 = 1.8 time = 2800
.meas tran vdout1_14ck55 FIND v(dout1_14) AT=2800.25n

* CHECK dout1_15 Vdout1_15ck55 = 1.8 time = 2800
.meas tran vdout1_15ck55 FIND v(dout1_15) AT=2800.25n

* CHECK dout1_0 Vdout1_0ck56 = 1.8 time = 2850
.meas tran vdout1_0ck56 FIND v(dout1_0) AT=2850.25n

* CHECK dout1_1 Vdout1_1ck56 = 0 time = 2850
.meas tran vdout1_1ck56 FIND v(dout1_1) AT=2850.25n

* CHECK dout1_2 Vdout1_2ck56 = 1.8 time = 2850
.meas tran vdout1_2ck56 FIND v(dout1_2) AT=2850.25n

* CHECK dout1_3 Vdout1_3ck56 = 0 time = 2850
.meas tran vdout1_3ck56 FIND v(dout1_3) AT=2850.25n

* CHECK dout1_4 Vdout1_4ck56 = 1.8 time = 2850
.meas tran vdout1_4ck56 FIND v(dout1_4) AT=2850.25n

* CHECK dout1_5 Vdout1_5ck56 = 1.8 time = 2850
.meas tran vdout1_5ck56 FIND v(dout1_5) AT=2850.25n

* CHECK dout1_6 Vdout1_6ck56 = 0 time = 2850
.meas tran vdout1_6ck56 FIND v(dout1_6) AT=2850.25n

* CHECK dout1_7 Vdout1_7ck56 = 0 time = 2850
.meas tran vdout1_7ck56 FIND v(dout1_7) AT=2850.25n

* CHECK dout1_8 Vdout1_8ck56 = 1.8 time = 2850
.meas tran vdout1_8ck56 FIND v(dout1_8) AT=2850.25n

* CHECK dout1_9 Vdout1_9ck56 = 1.8 time = 2850
.meas tran vdout1_9ck56 FIND v(dout1_9) AT=2850.25n

* CHECK dout1_10 Vdout1_10ck56 = 1.8 time = 2850
.meas tran vdout1_10ck56 FIND v(dout1_10) AT=2850.25n

* CHECK dout1_11 Vdout1_11ck56 = 0 time = 2850
.meas tran vdout1_11ck56 FIND v(dout1_11) AT=2850.25n

* CHECK dout1_12 Vdout1_12ck56 = 0 time = 2850
.meas tran vdout1_12ck56 FIND v(dout1_12) AT=2850.25n

* CHECK dout1_13 Vdout1_13ck56 = 0 time = 2850
.meas tran vdout1_13ck56 FIND v(dout1_13) AT=2850.25n

* CHECK dout1_14 Vdout1_14ck56 = 1.8 time = 2850
.meas tran vdout1_14ck56 FIND v(dout1_14) AT=2850.25n

* CHECK dout1_15 Vdout1_15ck56 = 1.8 time = 2850
.meas tran vdout1_15ck56 FIND v(dout1_15) AT=2850.25n

* CHECK dout1_0 Vdout1_0ck57 = 0 time = 2900
.meas tran vdout1_0ck57 FIND v(dout1_0) AT=2900.25n

* CHECK dout1_1 Vdout1_1ck57 = 0 time = 2900
.meas tran vdout1_1ck57 FIND v(dout1_1) AT=2900.25n

* CHECK dout1_2 Vdout1_2ck57 = 1.8 time = 2900
.meas tran vdout1_2ck57 FIND v(dout1_2) AT=2900.25n

* CHECK dout1_3 Vdout1_3ck57 = 1.8 time = 2900
.meas tran vdout1_3ck57 FIND v(dout1_3) AT=2900.25n

* CHECK dout1_4 Vdout1_4ck57 = 0 time = 2900
.meas tran vdout1_4ck57 FIND v(dout1_4) AT=2900.25n

* CHECK dout1_5 Vdout1_5ck57 = 0 time = 2900
.meas tran vdout1_5ck57 FIND v(dout1_5) AT=2900.25n

* CHECK dout1_6 Vdout1_6ck57 = 1.8 time = 2900
.meas tran vdout1_6ck57 FIND v(dout1_6) AT=2900.25n

* CHECK dout1_7 Vdout1_7ck57 = 0 time = 2900
.meas tran vdout1_7ck57 FIND v(dout1_7) AT=2900.25n

* CHECK dout1_8 Vdout1_8ck57 = 1.8 time = 2900
.meas tran vdout1_8ck57 FIND v(dout1_8) AT=2900.25n

* CHECK dout1_9 Vdout1_9ck57 = 1.8 time = 2900
.meas tran vdout1_9ck57 FIND v(dout1_9) AT=2900.25n

* CHECK dout1_10 Vdout1_10ck57 = 0 time = 2900
.meas tran vdout1_10ck57 FIND v(dout1_10) AT=2900.25n

* CHECK dout1_11 Vdout1_11ck57 = 0 time = 2900
.meas tran vdout1_11ck57 FIND v(dout1_11) AT=2900.25n

* CHECK dout1_12 Vdout1_12ck57 = 0 time = 2900
.meas tran vdout1_12ck57 FIND v(dout1_12) AT=2900.25n

* CHECK dout1_13 Vdout1_13ck57 = 1.8 time = 2900
.meas tran vdout1_13ck57 FIND v(dout1_13) AT=2900.25n

* CHECK dout1_14 Vdout1_14ck57 = 1.8 time = 2900
.meas tran vdout1_14ck57 FIND v(dout1_14) AT=2900.25n

* CHECK dout1_15 Vdout1_15ck57 = 0 time = 2900
.meas tran vdout1_15ck57 FIND v(dout1_15) AT=2900.25n

* CHECK dout1_0 Vdout1_0ck59 = 1.8 time = 3000
.meas tran vdout1_0ck59 FIND v(dout1_0) AT=3000.25n

* CHECK dout1_1 Vdout1_1ck59 = 1.8 time = 3000
.meas tran vdout1_1ck59 FIND v(dout1_1) AT=3000.25n

* CHECK dout1_2 Vdout1_2ck59 = 1.8 time = 3000
.meas tran vdout1_2ck59 FIND v(dout1_2) AT=3000.25n

* CHECK dout1_3 Vdout1_3ck59 = 0 time = 3000
.meas tran vdout1_3ck59 FIND v(dout1_3) AT=3000.25n

* CHECK dout1_4 Vdout1_4ck59 = 0 time = 3000
.meas tran vdout1_4ck59 FIND v(dout1_4) AT=3000.25n

* CHECK dout1_5 Vdout1_5ck59 = 0 time = 3000
.meas tran vdout1_5ck59 FIND v(dout1_5) AT=3000.25n

* CHECK dout1_6 Vdout1_6ck59 = 1.8 time = 3000
.meas tran vdout1_6ck59 FIND v(dout1_6) AT=3000.25n

* CHECK dout1_7 Vdout1_7ck59 = 0 time = 3000
.meas tran vdout1_7ck59 FIND v(dout1_7) AT=3000.25n

* CHECK dout1_8 Vdout1_8ck59 = 1.8 time = 3000
.meas tran vdout1_8ck59 FIND v(dout1_8) AT=3000.25n

* CHECK dout1_9 Vdout1_9ck59 = 1.8 time = 3000
.meas tran vdout1_9ck59 FIND v(dout1_9) AT=3000.25n

* CHECK dout1_10 Vdout1_10ck59 = 1.8 time = 3000
.meas tran vdout1_10ck59 FIND v(dout1_10) AT=3000.25n

* CHECK dout1_11 Vdout1_11ck59 = 0 time = 3000
.meas tran vdout1_11ck59 FIND v(dout1_11) AT=3000.25n

* CHECK dout1_12 Vdout1_12ck59 = 0 time = 3000
.meas tran vdout1_12ck59 FIND v(dout1_12) AT=3000.25n

* CHECK dout1_13 Vdout1_13ck59 = 1.8 time = 3000
.meas tran vdout1_13ck59 FIND v(dout1_13) AT=3000.25n

* CHECK dout1_14 Vdout1_14ck59 = 1.8 time = 3000
.meas tran vdout1_14ck59 FIND v(dout1_14) AT=3000.25n

* CHECK dout1_15 Vdout1_15ck59 = 0 time = 3000
.meas tran vdout1_15ck59 FIND v(dout1_15) AT=3000.25n

* CHECK dout1_0 Vdout1_0ck60 = 0 time = 3050
.meas tran vdout1_0ck60 FIND v(dout1_0) AT=3050.25n

* CHECK dout1_1 Vdout1_1ck60 = 1.8 time = 3050
.meas tran vdout1_1ck60 FIND v(dout1_1) AT=3050.25n

* CHECK dout1_2 Vdout1_2ck60 = 1.8 time = 3050
.meas tran vdout1_2ck60 FIND v(dout1_2) AT=3050.25n

* CHECK dout1_3 Vdout1_3ck60 = 0 time = 3050
.meas tran vdout1_3ck60 FIND v(dout1_3) AT=3050.25n

* CHECK dout1_4 Vdout1_4ck60 = 0 time = 3050
.meas tran vdout1_4ck60 FIND v(dout1_4) AT=3050.25n

* CHECK dout1_5 Vdout1_5ck60 = 1.8 time = 3050
.meas tran vdout1_5ck60 FIND v(dout1_5) AT=3050.25n

* CHECK dout1_6 Vdout1_6ck60 = 1.8 time = 3050
.meas tran vdout1_6ck60 FIND v(dout1_6) AT=3050.25n

* CHECK dout1_7 Vdout1_7ck60 = 1.8 time = 3050
.meas tran vdout1_7ck60 FIND v(dout1_7) AT=3050.25n

* CHECK dout1_8 Vdout1_8ck60 = 1.8 time = 3050
.meas tran vdout1_8ck60 FIND v(dout1_8) AT=3050.25n

* CHECK dout1_9 Vdout1_9ck60 = 1.8 time = 3050
.meas tran vdout1_9ck60 FIND v(dout1_9) AT=3050.25n

* CHECK dout1_10 Vdout1_10ck60 = 0 time = 3050
.meas tran vdout1_10ck60 FIND v(dout1_10) AT=3050.25n

* CHECK dout1_11 Vdout1_11ck60 = 1.8 time = 3050
.meas tran vdout1_11ck60 FIND v(dout1_11) AT=3050.25n

* CHECK dout1_12 Vdout1_12ck60 = 1.8 time = 3050
.meas tran vdout1_12ck60 FIND v(dout1_12) AT=3050.25n

* CHECK dout1_13 Vdout1_13ck60 = 1.8 time = 3050
.meas tran vdout1_13ck60 FIND v(dout1_13) AT=3050.25n

* CHECK dout1_14 Vdout1_14ck60 = 1.8 time = 3050
.meas tran vdout1_14ck60 FIND v(dout1_14) AT=3050.25n

* CHECK dout1_15 Vdout1_15ck60 = 1.8 time = 3050
.meas tran vdout1_15ck60 FIND v(dout1_15) AT=3050.25n

* CHECK dout1_0 Vdout1_0ck62 = 0 time = 3150
.meas tran vdout1_0ck62 FIND v(dout1_0) AT=3150.25n

* CHECK dout1_1 Vdout1_1ck62 = 0 time = 3150
.meas tran vdout1_1ck62 FIND v(dout1_1) AT=3150.25n

* CHECK dout1_2 Vdout1_2ck62 = 0 time = 3150
.meas tran vdout1_2ck62 FIND v(dout1_2) AT=3150.25n

* CHECK dout1_3 Vdout1_3ck62 = 0 time = 3150
.meas tran vdout1_3ck62 FIND v(dout1_3) AT=3150.25n

* CHECK dout1_4 Vdout1_4ck62 = 1.8 time = 3150
.meas tran vdout1_4ck62 FIND v(dout1_4) AT=3150.25n

* CHECK dout1_5 Vdout1_5ck62 = 1.8 time = 3150
.meas tran vdout1_5ck62 FIND v(dout1_5) AT=3150.25n

* CHECK dout1_6 Vdout1_6ck62 = 1.8 time = 3150
.meas tran vdout1_6ck62 FIND v(dout1_6) AT=3150.25n

* CHECK dout1_7 Vdout1_7ck62 = 1.8 time = 3150
.meas tran vdout1_7ck62 FIND v(dout1_7) AT=3150.25n

* CHECK dout1_8 Vdout1_8ck62 = 0 time = 3150
.meas tran vdout1_8ck62 FIND v(dout1_8) AT=3150.25n

* CHECK dout1_9 Vdout1_9ck62 = 1.8 time = 3150
.meas tran vdout1_9ck62 FIND v(dout1_9) AT=3150.25n

* CHECK dout1_10 Vdout1_10ck62 = 0 time = 3150
.meas tran vdout1_10ck62 FIND v(dout1_10) AT=3150.25n

* CHECK dout1_11 Vdout1_11ck62 = 0 time = 3150
.meas tran vdout1_11ck62 FIND v(dout1_11) AT=3150.25n

* CHECK dout1_12 Vdout1_12ck62 = 0 time = 3150
.meas tran vdout1_12ck62 FIND v(dout1_12) AT=3150.25n

* CHECK dout1_13 Vdout1_13ck62 = 1.8 time = 3150
.meas tran vdout1_13ck62 FIND v(dout1_13) AT=3150.25n

* CHECK dout1_14 Vdout1_14ck62 = 1.8 time = 3150
.meas tran vdout1_14ck62 FIND v(dout1_14) AT=3150.25n

* CHECK dout1_15 Vdout1_15ck62 = 1.8 time = 3150
.meas tran vdout1_15ck62 FIND v(dout1_15) AT=3150.25n

* CHECK dout1_0 Vdout1_0ck63 = 0 time = 3200
.meas tran vdout1_0ck63 FIND v(dout1_0) AT=3200.25n

* CHECK dout1_1 Vdout1_1ck63 = 1.8 time = 3200
.meas tran vdout1_1ck63 FIND v(dout1_1) AT=3200.25n

* CHECK dout1_2 Vdout1_2ck63 = 1.8 time = 3200
.meas tran vdout1_2ck63 FIND v(dout1_2) AT=3200.25n

* CHECK dout1_3 Vdout1_3ck63 = 1.8 time = 3200
.meas tran vdout1_3ck63 FIND v(dout1_3) AT=3200.25n

* CHECK dout1_4 Vdout1_4ck63 = 1.8 time = 3200
.meas tran vdout1_4ck63 FIND v(dout1_4) AT=3200.25n

* CHECK dout1_5 Vdout1_5ck63 = 1.8 time = 3200
.meas tran vdout1_5ck63 FIND v(dout1_5) AT=3200.25n

* CHECK dout1_6 Vdout1_6ck63 = 0 time = 3200
.meas tran vdout1_6ck63 FIND v(dout1_6) AT=3200.25n

* CHECK dout1_7 Vdout1_7ck63 = 0 time = 3200
.meas tran vdout1_7ck63 FIND v(dout1_7) AT=3200.25n

* CHECK dout1_8 Vdout1_8ck63 = 0 time = 3200
.meas tran vdout1_8ck63 FIND v(dout1_8) AT=3200.25n

* CHECK dout1_9 Vdout1_9ck63 = 0 time = 3200
.meas tran vdout1_9ck63 FIND v(dout1_9) AT=3200.25n

* CHECK dout1_10 Vdout1_10ck63 = 0 time = 3200
.meas tran vdout1_10ck63 FIND v(dout1_10) AT=3200.25n

* CHECK dout1_11 Vdout1_11ck63 = 0 time = 3200
.meas tran vdout1_11ck63 FIND v(dout1_11) AT=3200.25n

* CHECK dout1_12 Vdout1_12ck63 = 0 time = 3200
.meas tran vdout1_12ck63 FIND v(dout1_12) AT=3200.25n

* CHECK dout1_13 Vdout1_13ck63 = 1.8 time = 3200
.meas tran vdout1_13ck63 FIND v(dout1_13) AT=3200.25n

* CHECK dout1_14 Vdout1_14ck63 = 1.8 time = 3200
.meas tran vdout1_14ck63 FIND v(dout1_14) AT=3200.25n

* CHECK dout1_15 Vdout1_15ck63 = 0 time = 3200
.meas tran vdout1_15ck63 FIND v(dout1_15) AT=3200.25n

* CHECK dout1_0 Vdout1_0ck66 = 1.8 time = 3350
.meas tran vdout1_0ck66 FIND v(dout1_0) AT=3350.25n

* CHECK dout1_1 Vdout1_1ck66 = 1.8 time = 3350
.meas tran vdout1_1ck66 FIND v(dout1_1) AT=3350.25n

* CHECK dout1_2 Vdout1_2ck66 = 0 time = 3350
.meas tran vdout1_2ck66 FIND v(dout1_2) AT=3350.25n

* CHECK dout1_3 Vdout1_3ck66 = 0 time = 3350
.meas tran vdout1_3ck66 FIND v(dout1_3) AT=3350.25n

* CHECK dout1_4 Vdout1_4ck66 = 1.8 time = 3350
.meas tran vdout1_4ck66 FIND v(dout1_4) AT=3350.25n

* CHECK dout1_5 Vdout1_5ck66 = 0 time = 3350
.meas tran vdout1_5ck66 FIND v(dout1_5) AT=3350.25n

* CHECK dout1_6 Vdout1_6ck66 = 1.8 time = 3350
.meas tran vdout1_6ck66 FIND v(dout1_6) AT=3350.25n

* CHECK dout1_7 Vdout1_7ck66 = 1.8 time = 3350
.meas tran vdout1_7ck66 FIND v(dout1_7) AT=3350.25n

* CHECK dout1_8 Vdout1_8ck66 = 1.8 time = 3350
.meas tran vdout1_8ck66 FIND v(dout1_8) AT=3350.25n

* CHECK dout1_9 Vdout1_9ck66 = 1.8 time = 3350
.meas tran vdout1_9ck66 FIND v(dout1_9) AT=3350.25n

* CHECK dout1_10 Vdout1_10ck66 = 1.8 time = 3350
.meas tran vdout1_10ck66 FIND v(dout1_10) AT=3350.25n

* CHECK dout1_11 Vdout1_11ck66 = 1.8 time = 3350
.meas tran vdout1_11ck66 FIND v(dout1_11) AT=3350.25n

* CHECK dout1_12 Vdout1_12ck66 = 1.8 time = 3350
.meas tran vdout1_12ck66 FIND v(dout1_12) AT=3350.25n

* CHECK dout1_13 Vdout1_13ck66 = 1.8 time = 3350
.meas tran vdout1_13ck66 FIND v(dout1_13) AT=3350.25n

* CHECK dout1_14 Vdout1_14ck66 = 0 time = 3350
.meas tran vdout1_14ck66 FIND v(dout1_14) AT=3350.25n

* CHECK dout1_15 Vdout1_15ck66 = 1.8 time = 3350
.meas tran vdout1_15ck66 FIND v(dout1_15) AT=3350.25n

* CHECK dout1_0 Vdout1_0ck67 = 1.8 time = 3400
.meas tran vdout1_0ck67 FIND v(dout1_0) AT=3400.25n

* CHECK dout1_1 Vdout1_1ck67 = 1.8 time = 3400
.meas tran vdout1_1ck67 FIND v(dout1_1) AT=3400.25n

* CHECK dout1_2 Vdout1_2ck67 = 0 time = 3400
.meas tran vdout1_2ck67 FIND v(dout1_2) AT=3400.25n

* CHECK dout1_3 Vdout1_3ck67 = 0 time = 3400
.meas tran vdout1_3ck67 FIND v(dout1_3) AT=3400.25n

* CHECK dout1_4 Vdout1_4ck67 = 1.8 time = 3400
.meas tran vdout1_4ck67 FIND v(dout1_4) AT=3400.25n

* CHECK dout1_5 Vdout1_5ck67 = 1.8 time = 3400
.meas tran vdout1_5ck67 FIND v(dout1_5) AT=3400.25n

* CHECK dout1_6 Vdout1_6ck67 = 0 time = 3400
.meas tran vdout1_6ck67 FIND v(dout1_6) AT=3400.25n

* CHECK dout1_7 Vdout1_7ck67 = 1.8 time = 3400
.meas tran vdout1_7ck67 FIND v(dout1_7) AT=3400.25n

* CHECK dout1_8 Vdout1_8ck67 = 0 time = 3400
.meas tran vdout1_8ck67 FIND v(dout1_8) AT=3400.25n

* CHECK dout1_9 Vdout1_9ck67 = 1.8 time = 3400
.meas tran vdout1_9ck67 FIND v(dout1_9) AT=3400.25n

* CHECK dout1_10 Vdout1_10ck67 = 0 time = 3400
.meas tran vdout1_10ck67 FIND v(dout1_10) AT=3400.25n

* CHECK dout1_11 Vdout1_11ck67 = 0 time = 3400
.meas tran vdout1_11ck67 FIND v(dout1_11) AT=3400.25n

* CHECK dout1_12 Vdout1_12ck67 = 1.8 time = 3400
.meas tran vdout1_12ck67 FIND v(dout1_12) AT=3400.25n

* CHECK dout1_13 Vdout1_13ck67 = 0 time = 3400
.meas tran vdout1_13ck67 FIND v(dout1_13) AT=3400.25n

* CHECK dout1_14 Vdout1_14ck67 = 1.8 time = 3400
.meas tran vdout1_14ck67 FIND v(dout1_14) AT=3400.25n

* CHECK dout1_15 Vdout1_15ck67 = 1.8 time = 3400
.meas tran vdout1_15ck67 FIND v(dout1_15) AT=3400.25n

* CHECK dout1_0 Vdout1_0ck68 = 1.8 time = 3450
.meas tran vdout1_0ck68 FIND v(dout1_0) AT=3450.25n

* CHECK dout1_1 Vdout1_1ck68 = 0 time = 3450
.meas tran vdout1_1ck68 FIND v(dout1_1) AT=3450.25n

* CHECK dout1_2 Vdout1_2ck68 = 1.8 time = 3450
.meas tran vdout1_2ck68 FIND v(dout1_2) AT=3450.25n

* CHECK dout1_3 Vdout1_3ck68 = 1.8 time = 3450
.meas tran vdout1_3ck68 FIND v(dout1_3) AT=3450.25n

* CHECK dout1_4 Vdout1_4ck68 = 1.8 time = 3450
.meas tran vdout1_4ck68 FIND v(dout1_4) AT=3450.25n

* CHECK dout1_5 Vdout1_5ck68 = 1.8 time = 3450
.meas tran vdout1_5ck68 FIND v(dout1_5) AT=3450.25n

* CHECK dout1_6 Vdout1_6ck68 = 1.8 time = 3450
.meas tran vdout1_6ck68 FIND v(dout1_6) AT=3450.25n

* CHECK dout1_7 Vdout1_7ck68 = 1.8 time = 3450
.meas tran vdout1_7ck68 FIND v(dout1_7) AT=3450.25n

* CHECK dout1_8 Vdout1_8ck68 = 1.8 time = 3450
.meas tran vdout1_8ck68 FIND v(dout1_8) AT=3450.25n

* CHECK dout1_9 Vdout1_9ck68 = 0 time = 3450
.meas tran vdout1_9ck68 FIND v(dout1_9) AT=3450.25n

* CHECK dout1_10 Vdout1_10ck68 = 0 time = 3450
.meas tran vdout1_10ck68 FIND v(dout1_10) AT=3450.25n

* CHECK dout1_11 Vdout1_11ck68 = 1.8 time = 3450
.meas tran vdout1_11ck68 FIND v(dout1_11) AT=3450.25n

* CHECK dout1_12 Vdout1_12ck68 = 0 time = 3450
.meas tran vdout1_12ck68 FIND v(dout1_12) AT=3450.25n

* CHECK dout1_13 Vdout1_13ck68 = 1.8 time = 3450
.meas tran vdout1_13ck68 FIND v(dout1_13) AT=3450.25n

* CHECK dout1_14 Vdout1_14ck68 = 1.8 time = 3450
.meas tran vdout1_14ck68 FIND v(dout1_14) AT=3450.25n

* CHECK dout1_15 Vdout1_15ck68 = 0 time = 3450
.meas tran vdout1_15ck68 FIND v(dout1_15) AT=3450.25n

* CHECK dout1_0 Vdout1_0ck70 = 1.8 time = 3550
.meas tran vdout1_0ck70 FIND v(dout1_0) AT=3550.25n

* CHECK dout1_1 Vdout1_1ck70 = 0 time = 3550
.meas tran vdout1_1ck70 FIND v(dout1_1) AT=3550.25n

* CHECK dout1_2 Vdout1_2ck70 = 1.8 time = 3550
.meas tran vdout1_2ck70 FIND v(dout1_2) AT=3550.25n

* CHECK dout1_3 Vdout1_3ck70 = 1.8 time = 3550
.meas tran vdout1_3ck70 FIND v(dout1_3) AT=3550.25n

* CHECK dout1_4 Vdout1_4ck70 = 1.8 time = 3550
.meas tran vdout1_4ck70 FIND v(dout1_4) AT=3550.25n

* CHECK dout1_5 Vdout1_5ck70 = 1.8 time = 3550
.meas tran vdout1_5ck70 FIND v(dout1_5) AT=3550.25n

* CHECK dout1_6 Vdout1_6ck70 = 1.8 time = 3550
.meas tran vdout1_6ck70 FIND v(dout1_6) AT=3550.25n

* CHECK dout1_7 Vdout1_7ck70 = 1.8 time = 3550
.meas tran vdout1_7ck70 FIND v(dout1_7) AT=3550.25n

* CHECK dout1_8 Vdout1_8ck70 = 1.8 time = 3550
.meas tran vdout1_8ck70 FIND v(dout1_8) AT=3550.25n

* CHECK dout1_9 Vdout1_9ck70 = 0 time = 3550
.meas tran vdout1_9ck70 FIND v(dout1_9) AT=3550.25n

* CHECK dout1_10 Vdout1_10ck70 = 0 time = 3550
.meas tran vdout1_10ck70 FIND v(dout1_10) AT=3550.25n

* CHECK dout1_11 Vdout1_11ck70 = 1.8 time = 3550
.meas tran vdout1_11ck70 FIND v(dout1_11) AT=3550.25n

* CHECK dout1_12 Vdout1_12ck70 = 0 time = 3550
.meas tran vdout1_12ck70 FIND v(dout1_12) AT=3550.25n

* CHECK dout1_13 Vdout1_13ck70 = 1.8 time = 3550
.meas tran vdout1_13ck70 FIND v(dout1_13) AT=3550.25n

* CHECK dout1_14 Vdout1_14ck70 = 1.8 time = 3550
.meas tran vdout1_14ck70 FIND v(dout1_14) AT=3550.25n

* CHECK dout1_15 Vdout1_15ck70 = 0 time = 3550
.meas tran vdout1_15ck70 FIND v(dout1_15) AT=3550.25n

* CHECK dout1_0 Vdout1_0ck73 = 0 time = 3700
.meas tran vdout1_0ck73 FIND v(dout1_0) AT=3700.25n

* CHECK dout1_1 Vdout1_1ck73 = 1.8 time = 3700
.meas tran vdout1_1ck73 FIND v(dout1_1) AT=3700.25n

* CHECK dout1_2 Vdout1_2ck73 = 0 time = 3700
.meas tran vdout1_2ck73 FIND v(dout1_2) AT=3700.25n

* CHECK dout1_3 Vdout1_3ck73 = 0 time = 3700
.meas tran vdout1_3ck73 FIND v(dout1_3) AT=3700.25n

* CHECK dout1_4 Vdout1_4ck73 = 1.8 time = 3700
.meas tran vdout1_4ck73 FIND v(dout1_4) AT=3700.25n

* CHECK dout1_5 Vdout1_5ck73 = 0 time = 3700
.meas tran vdout1_5ck73 FIND v(dout1_5) AT=3700.25n

* CHECK dout1_6 Vdout1_6ck73 = 1.8 time = 3700
.meas tran vdout1_6ck73 FIND v(dout1_6) AT=3700.25n

* CHECK dout1_7 Vdout1_7ck73 = 1.8 time = 3700
.meas tran vdout1_7ck73 FIND v(dout1_7) AT=3700.25n

* CHECK dout1_8 Vdout1_8ck73 = 1.8 time = 3700
.meas tran vdout1_8ck73 FIND v(dout1_8) AT=3700.25n

* CHECK dout1_9 Vdout1_9ck73 = 0 time = 3700
.meas tran vdout1_9ck73 FIND v(dout1_9) AT=3700.25n

* CHECK dout1_10 Vdout1_10ck73 = 1.8 time = 3700
.meas tran vdout1_10ck73 FIND v(dout1_10) AT=3700.25n

* CHECK dout1_11 Vdout1_11ck73 = 1.8 time = 3700
.meas tran vdout1_11ck73 FIND v(dout1_11) AT=3700.25n

* CHECK dout1_12 Vdout1_12ck73 = 1.8 time = 3700
.meas tran vdout1_12ck73 FIND v(dout1_12) AT=3700.25n

* CHECK dout1_13 Vdout1_13ck73 = 0 time = 3700
.meas tran vdout1_13ck73 FIND v(dout1_13) AT=3700.25n

* CHECK dout1_14 Vdout1_14ck73 = 1.8 time = 3700
.meas tran vdout1_14ck73 FIND v(dout1_14) AT=3700.25n

* CHECK dout1_15 Vdout1_15ck73 = 0 time = 3700
.meas tran vdout1_15ck73 FIND v(dout1_15) AT=3700.25n

* CHECK dout1_0 Vdout1_0ck76 = 0 time = 3850
.meas tran vdout1_0ck76 FIND v(dout1_0) AT=3850.25n

* CHECK dout1_1 Vdout1_1ck76 = 0 time = 3850
.meas tran vdout1_1ck76 FIND v(dout1_1) AT=3850.25n

* CHECK dout1_2 Vdout1_2ck76 = 1.8 time = 3850
.meas tran vdout1_2ck76 FIND v(dout1_2) AT=3850.25n

* CHECK dout1_3 Vdout1_3ck76 = 1.8 time = 3850
.meas tran vdout1_3ck76 FIND v(dout1_3) AT=3850.25n

* CHECK dout1_4 Vdout1_4ck76 = 1.8 time = 3850
.meas tran vdout1_4ck76 FIND v(dout1_4) AT=3850.25n

* CHECK dout1_5 Vdout1_5ck76 = 1.8 time = 3850
.meas tran vdout1_5ck76 FIND v(dout1_5) AT=3850.25n

* CHECK dout1_6 Vdout1_6ck76 = 0 time = 3850
.meas tran vdout1_6ck76 FIND v(dout1_6) AT=3850.25n

* CHECK dout1_7 Vdout1_7ck76 = 0 time = 3850
.meas tran vdout1_7ck76 FIND v(dout1_7) AT=3850.25n

* CHECK dout1_8 Vdout1_8ck76 = 0 time = 3850
.meas tran vdout1_8ck76 FIND v(dout1_8) AT=3850.25n

* CHECK dout1_9 Vdout1_9ck76 = 1.8 time = 3850
.meas tran vdout1_9ck76 FIND v(dout1_9) AT=3850.25n

* CHECK dout1_10 Vdout1_10ck76 = 0 time = 3850
.meas tran vdout1_10ck76 FIND v(dout1_10) AT=3850.25n

* CHECK dout1_11 Vdout1_11ck76 = 1.8 time = 3850
.meas tran vdout1_11ck76 FIND v(dout1_11) AT=3850.25n

* CHECK dout1_12 Vdout1_12ck76 = 1.8 time = 3850
.meas tran vdout1_12ck76 FIND v(dout1_12) AT=3850.25n

* CHECK dout1_13 Vdout1_13ck76 = 0 time = 3850
.meas tran vdout1_13ck76 FIND v(dout1_13) AT=3850.25n

* CHECK dout1_14 Vdout1_14ck76 = 1.8 time = 3850
.meas tran vdout1_14ck76 FIND v(dout1_14) AT=3850.25n

* CHECK dout1_15 Vdout1_15ck76 = 0 time = 3850
.meas tran vdout1_15ck76 FIND v(dout1_15) AT=3850.25n

* CHECK dout1_0 Vdout1_0ck77 = 0 time = 3900
.meas tran vdout1_0ck77 FIND v(dout1_0) AT=3900.25n

* CHECK dout1_1 Vdout1_1ck77 = 0 time = 3900
.meas tran vdout1_1ck77 FIND v(dout1_1) AT=3900.25n

* CHECK dout1_2 Vdout1_2ck77 = 1.8 time = 3900
.meas tran vdout1_2ck77 FIND v(dout1_2) AT=3900.25n

* CHECK dout1_3 Vdout1_3ck77 = 1.8 time = 3900
.meas tran vdout1_3ck77 FIND v(dout1_3) AT=3900.25n

* CHECK dout1_4 Vdout1_4ck77 = 1.8 time = 3900
.meas tran vdout1_4ck77 FIND v(dout1_4) AT=3900.25n

* CHECK dout1_5 Vdout1_5ck77 = 1.8 time = 3900
.meas tran vdout1_5ck77 FIND v(dout1_5) AT=3900.25n

* CHECK dout1_6 Vdout1_6ck77 = 0 time = 3900
.meas tran vdout1_6ck77 FIND v(dout1_6) AT=3900.25n

* CHECK dout1_7 Vdout1_7ck77 = 0 time = 3900
.meas tran vdout1_7ck77 FIND v(dout1_7) AT=3900.25n

* CHECK dout1_8 Vdout1_8ck77 = 0 time = 3900
.meas tran vdout1_8ck77 FIND v(dout1_8) AT=3900.25n

* CHECK dout1_9 Vdout1_9ck77 = 1.8 time = 3900
.meas tran vdout1_9ck77 FIND v(dout1_9) AT=3900.25n

* CHECK dout1_10 Vdout1_10ck77 = 0 time = 3900
.meas tran vdout1_10ck77 FIND v(dout1_10) AT=3900.25n

* CHECK dout1_11 Vdout1_11ck77 = 1.8 time = 3900
.meas tran vdout1_11ck77 FIND v(dout1_11) AT=3900.25n

* CHECK dout1_12 Vdout1_12ck77 = 1.8 time = 3900
.meas tran vdout1_12ck77 FIND v(dout1_12) AT=3900.25n

* CHECK dout1_13 Vdout1_13ck77 = 0 time = 3900
.meas tran vdout1_13ck77 FIND v(dout1_13) AT=3900.25n

* CHECK dout1_14 Vdout1_14ck77 = 1.8 time = 3900
.meas tran vdout1_14ck77 FIND v(dout1_14) AT=3900.25n

* CHECK dout1_15 Vdout1_15ck77 = 0 time = 3900
.meas tran vdout1_15ck77 FIND v(dout1_15) AT=3900.25n

* CHECK dout1_0 Vdout1_0ck79 = 1.8 time = 4000
.meas tran vdout1_0ck79 FIND v(dout1_0) AT=4000.25n

* CHECK dout1_1 Vdout1_1ck79 = 1.8 time = 4000
.meas tran vdout1_1ck79 FIND v(dout1_1) AT=4000.25n

* CHECK dout1_2 Vdout1_2ck79 = 1.8 time = 4000
.meas tran vdout1_2ck79 FIND v(dout1_2) AT=4000.25n

* CHECK dout1_3 Vdout1_3ck79 = 0 time = 4000
.meas tran vdout1_3ck79 FIND v(dout1_3) AT=4000.25n

* CHECK dout1_4 Vdout1_4ck79 = 0 time = 4000
.meas tran vdout1_4ck79 FIND v(dout1_4) AT=4000.25n

* CHECK dout1_5 Vdout1_5ck79 = 0 time = 4000
.meas tran vdout1_5ck79 FIND v(dout1_5) AT=4000.25n

* CHECK dout1_6 Vdout1_6ck79 = 1.8 time = 4000
.meas tran vdout1_6ck79 FIND v(dout1_6) AT=4000.25n

* CHECK dout1_7 Vdout1_7ck79 = 1.8 time = 4000
.meas tran vdout1_7ck79 FIND v(dout1_7) AT=4000.25n

* CHECK dout1_8 Vdout1_8ck79 = 0 time = 4000
.meas tran vdout1_8ck79 FIND v(dout1_8) AT=4000.25n

* CHECK dout1_9 Vdout1_9ck79 = 1.8 time = 4000
.meas tran vdout1_9ck79 FIND v(dout1_9) AT=4000.25n

* CHECK dout1_10 Vdout1_10ck79 = 0 time = 4000
.meas tran vdout1_10ck79 FIND v(dout1_10) AT=4000.25n

* CHECK dout1_11 Vdout1_11ck79 = 1.8 time = 4000
.meas tran vdout1_11ck79 FIND v(dout1_11) AT=4000.25n

* CHECK dout1_12 Vdout1_12ck79 = 1.8 time = 4000
.meas tran vdout1_12ck79 FIND v(dout1_12) AT=4000.25n

* CHECK dout1_13 Vdout1_13ck79 = 0 time = 4000
.meas tran vdout1_13ck79 FIND v(dout1_13) AT=4000.25n

* CHECK dout1_14 Vdout1_14ck79 = 0 time = 4000
.meas tran vdout1_14ck79 FIND v(dout1_14) AT=4000.25n

* CHECK dout1_15 Vdout1_15ck79 = 0 time = 4000
.meas tran vdout1_15ck79 FIND v(dout1_15) AT=4000.25n

* CHECK dout1_0 Vdout1_0ck80 = 1.8 time = 4050
.meas tran vdout1_0ck80 FIND v(dout1_0) AT=4050.25n

* CHECK dout1_1 Vdout1_1ck80 = 0 time = 4050
.meas tran vdout1_1ck80 FIND v(dout1_1) AT=4050.25n

* CHECK dout1_2 Vdout1_2ck80 = 1.8 time = 4050
.meas tran vdout1_2ck80 FIND v(dout1_2) AT=4050.25n

* CHECK dout1_3 Vdout1_3ck80 = 0 time = 4050
.meas tran vdout1_3ck80 FIND v(dout1_3) AT=4050.25n

* CHECK dout1_4 Vdout1_4ck80 = 1.8 time = 4050
.meas tran vdout1_4ck80 FIND v(dout1_4) AT=4050.25n

* CHECK dout1_5 Vdout1_5ck80 = 1.8 time = 4050
.meas tran vdout1_5ck80 FIND v(dout1_5) AT=4050.25n

* CHECK dout1_6 Vdout1_6ck80 = 0 time = 4050
.meas tran vdout1_6ck80 FIND v(dout1_6) AT=4050.25n

* CHECK dout1_7 Vdout1_7ck80 = 0 time = 4050
.meas tran vdout1_7ck80 FIND v(dout1_7) AT=4050.25n

* CHECK dout1_8 Vdout1_8ck80 = 1.8 time = 4050
.meas tran vdout1_8ck80 FIND v(dout1_8) AT=4050.25n

* CHECK dout1_9 Vdout1_9ck80 = 1.8 time = 4050
.meas tran vdout1_9ck80 FIND v(dout1_9) AT=4050.25n

* CHECK dout1_10 Vdout1_10ck80 = 1.8 time = 4050
.meas tran vdout1_10ck80 FIND v(dout1_10) AT=4050.25n

* CHECK dout1_11 Vdout1_11ck80 = 0 time = 4050
.meas tran vdout1_11ck80 FIND v(dout1_11) AT=4050.25n

* CHECK dout1_12 Vdout1_12ck80 = 0 time = 4050
.meas tran vdout1_12ck80 FIND v(dout1_12) AT=4050.25n

* CHECK dout1_13 Vdout1_13ck80 = 0 time = 4050
.meas tran vdout1_13ck80 FIND v(dout1_13) AT=4050.25n

* CHECK dout1_14 Vdout1_14ck80 = 1.8 time = 4050
.meas tran vdout1_14ck80 FIND v(dout1_14) AT=4050.25n

* CHECK dout1_15 Vdout1_15ck80 = 1.8 time = 4050
.meas tran vdout1_15ck80 FIND v(dout1_15) AT=4050.25n

* CHECK dout1_0 Vdout1_0ck83 = 1.8 time = 4200
.meas tran vdout1_0ck83 FIND v(dout1_0) AT=4200.25n

* CHECK dout1_1 Vdout1_1ck83 = 0 time = 4200
.meas tran vdout1_1ck83 FIND v(dout1_1) AT=4200.25n

* CHECK dout1_2 Vdout1_2ck83 = 1.8 time = 4200
.meas tran vdout1_2ck83 FIND v(dout1_2) AT=4200.25n

* CHECK dout1_3 Vdout1_3ck83 = 0 time = 4200
.meas tran vdout1_3ck83 FIND v(dout1_3) AT=4200.25n

* CHECK dout1_4 Vdout1_4ck83 = 1.8 time = 4200
.meas tran vdout1_4ck83 FIND v(dout1_4) AT=4200.25n

* CHECK dout1_5 Vdout1_5ck83 = 1.8 time = 4200
.meas tran vdout1_5ck83 FIND v(dout1_5) AT=4200.25n

* CHECK dout1_6 Vdout1_6ck83 = 0 time = 4200
.meas tran vdout1_6ck83 FIND v(dout1_6) AT=4200.25n

* CHECK dout1_7 Vdout1_7ck83 = 0 time = 4200
.meas tran vdout1_7ck83 FIND v(dout1_7) AT=4200.25n

* CHECK dout1_8 Vdout1_8ck83 = 1.8 time = 4200
.meas tran vdout1_8ck83 FIND v(dout1_8) AT=4200.25n

* CHECK dout1_9 Vdout1_9ck83 = 1.8 time = 4200
.meas tran vdout1_9ck83 FIND v(dout1_9) AT=4200.25n

* CHECK dout1_10 Vdout1_10ck83 = 1.8 time = 4200
.meas tran vdout1_10ck83 FIND v(dout1_10) AT=4200.25n

* CHECK dout1_11 Vdout1_11ck83 = 0 time = 4200
.meas tran vdout1_11ck83 FIND v(dout1_11) AT=4200.25n

* CHECK dout1_12 Vdout1_12ck83 = 0 time = 4200
.meas tran vdout1_12ck83 FIND v(dout1_12) AT=4200.25n

* CHECK dout1_13 Vdout1_13ck83 = 0 time = 4200
.meas tran vdout1_13ck83 FIND v(dout1_13) AT=4200.25n

* CHECK dout1_14 Vdout1_14ck83 = 1.8 time = 4200
.meas tran vdout1_14ck83 FIND v(dout1_14) AT=4200.25n

* CHECK dout1_15 Vdout1_15ck83 = 1.8 time = 4200
.meas tran vdout1_15ck83 FIND v(dout1_15) AT=4200.25n

* CHECK dout1_0 Vdout1_0ck84 = 1.8 time = 4250
.meas tran vdout1_0ck84 FIND v(dout1_0) AT=4250.25n

* CHECK dout1_1 Vdout1_1ck84 = 0 time = 4250
.meas tran vdout1_1ck84 FIND v(dout1_1) AT=4250.25n

* CHECK dout1_2 Vdout1_2ck84 = 0 time = 4250
.meas tran vdout1_2ck84 FIND v(dout1_2) AT=4250.25n

* CHECK dout1_3 Vdout1_3ck84 = 0 time = 4250
.meas tran vdout1_3ck84 FIND v(dout1_3) AT=4250.25n

* CHECK dout1_4 Vdout1_4ck84 = 1.8 time = 4250
.meas tran vdout1_4ck84 FIND v(dout1_4) AT=4250.25n

* CHECK dout1_5 Vdout1_5ck84 = 1.8 time = 4250
.meas tran vdout1_5ck84 FIND v(dout1_5) AT=4250.25n

* CHECK dout1_6 Vdout1_6ck84 = 1.8 time = 4250
.meas tran vdout1_6ck84 FIND v(dout1_6) AT=4250.25n

* CHECK dout1_7 Vdout1_7ck84 = 0 time = 4250
.meas tran vdout1_7ck84 FIND v(dout1_7) AT=4250.25n

* CHECK dout1_8 Vdout1_8ck84 = 1.8 time = 4250
.meas tran vdout1_8ck84 FIND v(dout1_8) AT=4250.25n

* CHECK dout1_9 Vdout1_9ck84 = 1.8 time = 4250
.meas tran vdout1_9ck84 FIND v(dout1_9) AT=4250.25n

* CHECK dout1_10 Vdout1_10ck84 = 1.8 time = 4250
.meas tran vdout1_10ck84 FIND v(dout1_10) AT=4250.25n

* CHECK dout1_11 Vdout1_11ck84 = 1.8 time = 4250
.meas tran vdout1_11ck84 FIND v(dout1_11) AT=4250.25n

* CHECK dout1_12 Vdout1_12ck84 = 1.8 time = 4250
.meas tran vdout1_12ck84 FIND v(dout1_12) AT=4250.25n

* CHECK dout1_13 Vdout1_13ck84 = 1.8 time = 4250
.meas tran vdout1_13ck84 FIND v(dout1_13) AT=4250.25n

* CHECK dout1_14 Vdout1_14ck84 = 1.8 time = 4250
.meas tran vdout1_14ck84 FIND v(dout1_14) AT=4250.25n

* CHECK dout1_15 Vdout1_15ck84 = 1.8 time = 4250
.meas tran vdout1_15ck84 FIND v(dout1_15) AT=4250.25n

* CHECK dout1_0 Vdout1_0ck88 = 1.8 time = 4450
.meas tran vdout1_0ck88 FIND v(dout1_0) AT=4450.25n

* CHECK dout1_1 Vdout1_1ck88 = 1.8 time = 4450
.meas tran vdout1_1ck88 FIND v(dout1_1) AT=4450.25n

* CHECK dout1_2 Vdout1_2ck88 = 1.8 time = 4450
.meas tran vdout1_2ck88 FIND v(dout1_2) AT=4450.25n

* CHECK dout1_3 Vdout1_3ck88 = 1.8 time = 4450
.meas tran vdout1_3ck88 FIND v(dout1_3) AT=4450.25n

* CHECK dout1_4 Vdout1_4ck88 = 0 time = 4450
.meas tran vdout1_4ck88 FIND v(dout1_4) AT=4450.25n

* CHECK dout1_5 Vdout1_5ck88 = 0 time = 4450
.meas tran vdout1_5ck88 FIND v(dout1_5) AT=4450.25n

* CHECK dout1_6 Vdout1_6ck88 = 1.8 time = 4450
.meas tran vdout1_6ck88 FIND v(dout1_6) AT=4450.25n

* CHECK dout1_7 Vdout1_7ck88 = 0 time = 4450
.meas tran vdout1_7ck88 FIND v(dout1_7) AT=4450.25n

* CHECK dout1_8 Vdout1_8ck88 = 0 time = 4450
.meas tran vdout1_8ck88 FIND v(dout1_8) AT=4450.25n

* CHECK dout1_9 Vdout1_9ck88 = 0 time = 4450
.meas tran vdout1_9ck88 FIND v(dout1_9) AT=4450.25n

* CHECK dout1_10 Vdout1_10ck88 = 1.8 time = 4450
.meas tran vdout1_10ck88 FIND v(dout1_10) AT=4450.25n

* CHECK dout1_11 Vdout1_11ck88 = 0 time = 4450
.meas tran vdout1_11ck88 FIND v(dout1_11) AT=4450.25n

* CHECK dout1_12 Vdout1_12ck88 = 0 time = 4450
.meas tran vdout1_12ck88 FIND v(dout1_12) AT=4450.25n

* CHECK dout1_13 Vdout1_13ck88 = 1.8 time = 4450
.meas tran vdout1_13ck88 FIND v(dout1_13) AT=4450.25n

* CHECK dout1_14 Vdout1_14ck88 = 1.8 time = 4450
.meas tran vdout1_14ck88 FIND v(dout1_14) AT=4450.25n

* CHECK dout1_15 Vdout1_15ck88 = 0 time = 4450
.meas tran vdout1_15ck88 FIND v(dout1_15) AT=4450.25n

* CHECK dout1_0 Vdout1_0ck90 = 1.8 time = 4550
.meas tran vdout1_0ck90 FIND v(dout1_0) AT=4550.25n

* CHECK dout1_1 Vdout1_1ck90 = 0 time = 4550
.meas tran vdout1_1ck90 FIND v(dout1_1) AT=4550.25n

* CHECK dout1_2 Vdout1_2ck90 = 1.8 time = 4550
.meas tran vdout1_2ck90 FIND v(dout1_2) AT=4550.25n

* CHECK dout1_3 Vdout1_3ck90 = 1.8 time = 4550
.meas tran vdout1_3ck90 FIND v(dout1_3) AT=4550.25n

* CHECK dout1_4 Vdout1_4ck90 = 1.8 time = 4550
.meas tran vdout1_4ck90 FIND v(dout1_4) AT=4550.25n

* CHECK dout1_5 Vdout1_5ck90 = 1.8 time = 4550
.meas tran vdout1_5ck90 FIND v(dout1_5) AT=4550.25n

* CHECK dout1_6 Vdout1_6ck90 = 1.8 time = 4550
.meas tran vdout1_6ck90 FIND v(dout1_6) AT=4550.25n

* CHECK dout1_7 Vdout1_7ck90 = 1.8 time = 4550
.meas tran vdout1_7ck90 FIND v(dout1_7) AT=4550.25n

* CHECK dout1_8 Vdout1_8ck90 = 1.8 time = 4550
.meas tran vdout1_8ck90 FIND v(dout1_8) AT=4550.25n

* CHECK dout1_9 Vdout1_9ck90 = 0 time = 4550
.meas tran vdout1_9ck90 FIND v(dout1_9) AT=4550.25n

* CHECK dout1_10 Vdout1_10ck90 = 0 time = 4550
.meas tran vdout1_10ck90 FIND v(dout1_10) AT=4550.25n

* CHECK dout1_11 Vdout1_11ck90 = 1.8 time = 4550
.meas tran vdout1_11ck90 FIND v(dout1_11) AT=4550.25n

* CHECK dout1_12 Vdout1_12ck90 = 0 time = 4550
.meas tran vdout1_12ck90 FIND v(dout1_12) AT=4550.25n

* CHECK dout1_13 Vdout1_13ck90 = 1.8 time = 4550
.meas tran vdout1_13ck90 FIND v(dout1_13) AT=4550.25n

* CHECK dout1_14 Vdout1_14ck90 = 1.8 time = 4550
.meas tran vdout1_14ck90 FIND v(dout1_14) AT=4550.25n

* CHECK dout1_15 Vdout1_15ck90 = 0 time = 4550
.meas tran vdout1_15ck90 FIND v(dout1_15) AT=4550.25n

* CHECK dout1_0 Vdout1_0ck93 = 1.8 time = 4700
.meas tran vdout1_0ck93 FIND v(dout1_0) AT=4700.25n

* CHECK dout1_1 Vdout1_1ck93 = 0 time = 4700
.meas tran vdout1_1ck93 FIND v(dout1_1) AT=4700.25n

* CHECK dout1_2 Vdout1_2ck93 = 1.8 time = 4700
.meas tran vdout1_2ck93 FIND v(dout1_2) AT=4700.25n

* CHECK dout1_3 Vdout1_3ck93 = 1.8 time = 4700
.meas tran vdout1_3ck93 FIND v(dout1_3) AT=4700.25n

* CHECK dout1_4 Vdout1_4ck93 = 0 time = 4700
.meas tran vdout1_4ck93 FIND v(dout1_4) AT=4700.25n

* CHECK dout1_5 Vdout1_5ck93 = 0 time = 4700
.meas tran vdout1_5ck93 FIND v(dout1_5) AT=4700.25n

* CHECK dout1_6 Vdout1_6ck93 = 0 time = 4700
.meas tran vdout1_6ck93 FIND v(dout1_6) AT=4700.25n

* CHECK dout1_7 Vdout1_7ck93 = 0 time = 4700
.meas tran vdout1_7ck93 FIND v(dout1_7) AT=4700.25n

* CHECK dout1_8 Vdout1_8ck93 = 1.8 time = 4700
.meas tran vdout1_8ck93 FIND v(dout1_8) AT=4700.25n

* CHECK dout1_9 Vdout1_9ck93 = 0 time = 4700
.meas tran vdout1_9ck93 FIND v(dout1_9) AT=4700.25n

* CHECK dout1_10 Vdout1_10ck93 = 1.8 time = 4700
.meas tran vdout1_10ck93 FIND v(dout1_10) AT=4700.25n

* CHECK dout1_11 Vdout1_11ck93 = 1.8 time = 4700
.meas tran vdout1_11ck93 FIND v(dout1_11) AT=4700.25n

* CHECK dout1_12 Vdout1_12ck93 = 1.8 time = 4700
.meas tran vdout1_12ck93 FIND v(dout1_12) AT=4700.25n

* CHECK dout1_13 Vdout1_13ck93 = 0 time = 4700
.meas tran vdout1_13ck93 FIND v(dout1_13) AT=4700.25n

* CHECK dout1_14 Vdout1_14ck93 = 0 time = 4700
.meas tran vdout1_14ck93 FIND v(dout1_14) AT=4700.25n

* CHECK dout1_15 Vdout1_15ck93 = 0 time = 4700
.meas tran vdout1_15ck93 FIND v(dout1_15) AT=4700.25n

* CHECK dout1_0 Vdout1_0ck94 = 0 time = 4750
.meas tran vdout1_0ck94 FIND v(dout1_0) AT=4750.25n

* CHECK dout1_1 Vdout1_1ck94 = 0 time = 4750
.meas tran vdout1_1ck94 FIND v(dout1_1) AT=4750.25n

* CHECK dout1_2 Vdout1_2ck94 = 1.8 time = 4750
.meas tran vdout1_2ck94 FIND v(dout1_2) AT=4750.25n

* CHECK dout1_3 Vdout1_3ck94 = 0 time = 4750
.meas tran vdout1_3ck94 FIND v(dout1_3) AT=4750.25n

* CHECK dout1_4 Vdout1_4ck94 = 0 time = 4750
.meas tran vdout1_4ck94 FIND v(dout1_4) AT=4750.25n

* CHECK dout1_5 Vdout1_5ck94 = 1.8 time = 4750
.meas tran vdout1_5ck94 FIND v(dout1_5) AT=4750.25n

* CHECK dout1_6 Vdout1_6ck94 = 1.8 time = 4750
.meas tran vdout1_6ck94 FIND v(dout1_6) AT=4750.25n

* CHECK dout1_7 Vdout1_7ck94 = 1.8 time = 4750
.meas tran vdout1_7ck94 FIND v(dout1_7) AT=4750.25n

* CHECK dout1_8 Vdout1_8ck94 = 1.8 time = 4750
.meas tran vdout1_8ck94 FIND v(dout1_8) AT=4750.25n

* CHECK dout1_9 Vdout1_9ck94 = 1.8 time = 4750
.meas tran vdout1_9ck94 FIND v(dout1_9) AT=4750.25n

* CHECK dout1_10 Vdout1_10ck94 = 0 time = 4750
.meas tran vdout1_10ck94 FIND v(dout1_10) AT=4750.25n

* CHECK dout1_11 Vdout1_11ck94 = 0 time = 4750
.meas tran vdout1_11ck94 FIND v(dout1_11) AT=4750.25n

* CHECK dout1_12 Vdout1_12ck94 = 1.8 time = 4750
.meas tran vdout1_12ck94 FIND v(dout1_12) AT=4750.25n

* CHECK dout1_13 Vdout1_13ck94 = 0 time = 4750
.meas tran vdout1_13ck94 FIND v(dout1_13) AT=4750.25n

* CHECK dout1_14 Vdout1_14ck94 = 1.8 time = 4750
.meas tran vdout1_14ck94 FIND v(dout1_14) AT=4750.25n

* CHECK dout1_15 Vdout1_15ck94 = 0 time = 4750
.meas tran vdout1_15ck94 FIND v(dout1_15) AT=4750.25n

* CHECK dout1_0 Vdout1_0ck95 = 1.8 time = 4800
.meas tran vdout1_0ck95 FIND v(dout1_0) AT=4800.25n

* CHECK dout1_1 Vdout1_1ck95 = 0 time = 4800
.meas tran vdout1_1ck95 FIND v(dout1_1) AT=4800.25n

* CHECK dout1_2 Vdout1_2ck95 = 0 time = 4800
.meas tran vdout1_2ck95 FIND v(dout1_2) AT=4800.25n

* CHECK dout1_3 Vdout1_3ck95 = 0 time = 4800
.meas tran vdout1_3ck95 FIND v(dout1_3) AT=4800.25n

* CHECK dout1_4 Vdout1_4ck95 = 0 time = 4800
.meas tran vdout1_4ck95 FIND v(dout1_4) AT=4800.25n

* CHECK dout1_5 Vdout1_5ck95 = 0 time = 4800
.meas tran vdout1_5ck95 FIND v(dout1_5) AT=4800.25n

* CHECK dout1_6 Vdout1_6ck95 = 0 time = 4800
.meas tran vdout1_6ck95 FIND v(dout1_6) AT=4800.25n

* CHECK dout1_7 Vdout1_7ck95 = 0 time = 4800
.meas tran vdout1_7ck95 FIND v(dout1_7) AT=4800.25n

* CHECK dout1_8 Vdout1_8ck95 = 1.8 time = 4800
.meas tran vdout1_8ck95 FIND v(dout1_8) AT=4800.25n

* CHECK dout1_9 Vdout1_9ck95 = 1.8 time = 4800
.meas tran vdout1_9ck95 FIND v(dout1_9) AT=4800.25n

* CHECK dout1_10 Vdout1_10ck95 = 1.8 time = 4800
.meas tran vdout1_10ck95 FIND v(dout1_10) AT=4800.25n

* CHECK dout1_11 Vdout1_11ck95 = 1.8 time = 4800
.meas tran vdout1_11ck95 FIND v(dout1_11) AT=4800.25n

* CHECK dout1_12 Vdout1_12ck95 = 0 time = 4800
.meas tran vdout1_12ck95 FIND v(dout1_12) AT=4800.25n

* CHECK dout1_13 Vdout1_13ck95 = 1.8 time = 4800
.meas tran vdout1_13ck95 FIND v(dout1_13) AT=4800.25n

* CHECK dout1_14 Vdout1_14ck95 = 0 time = 4800
.meas tran vdout1_14ck95 FIND v(dout1_14) AT=4800.25n

* CHECK dout1_15 Vdout1_15ck95 = 1.8 time = 4800
.meas tran vdout1_15ck95 FIND v(dout1_15) AT=4800.25n

* CHECK dout1_0 Vdout1_0ck99 = 1.8 time = 5000
.meas tran vdout1_0ck99 FIND v(dout1_0) AT=5000.25n

* CHECK dout1_1 Vdout1_1ck99 = 1.8 time = 5000
.meas tran vdout1_1ck99 FIND v(dout1_1) AT=5000.25n

* CHECK dout1_2 Vdout1_2ck99 = 0 time = 5000
.meas tran vdout1_2ck99 FIND v(dout1_2) AT=5000.25n

* CHECK dout1_3 Vdout1_3ck99 = 1.8 time = 5000
.meas tran vdout1_3ck99 FIND v(dout1_3) AT=5000.25n

* CHECK dout1_4 Vdout1_4ck99 = 0 time = 5000
.meas tran vdout1_4ck99 FIND v(dout1_4) AT=5000.25n

* CHECK dout1_5 Vdout1_5ck99 = 1.8 time = 5000
.meas tran vdout1_5ck99 FIND v(dout1_5) AT=5000.25n

* CHECK dout1_6 Vdout1_6ck99 = 1.8 time = 5000
.meas tran vdout1_6ck99 FIND v(dout1_6) AT=5000.25n

* CHECK dout1_7 Vdout1_7ck99 = 1.8 time = 5000
.meas tran vdout1_7ck99 FIND v(dout1_7) AT=5000.25n

* CHECK dout1_8 Vdout1_8ck99 = 0 time = 5000
.meas tran vdout1_8ck99 FIND v(dout1_8) AT=5000.25n

* CHECK dout1_9 Vdout1_9ck99 = 0 time = 5000
.meas tran vdout1_9ck99 FIND v(dout1_9) AT=5000.25n

* CHECK dout1_10 Vdout1_10ck99 = 0 time = 5000
.meas tran vdout1_10ck99 FIND v(dout1_10) AT=5000.25n

* CHECK dout1_11 Vdout1_11ck99 = 1.8 time = 5000
.meas tran vdout1_11ck99 FIND v(dout1_11) AT=5000.25n

* CHECK dout1_12 Vdout1_12ck99 = 1.8 time = 5000
.meas tran vdout1_12ck99 FIND v(dout1_12) AT=5000.25n

* CHECK dout1_13 Vdout1_13ck99 = 0 time = 5000
.meas tran vdout1_13ck99 FIND v(dout1_13) AT=5000.25n

* CHECK dout1_14 Vdout1_14ck99 = 1.8 time = 5000
.meas tran vdout1_14ck99 FIND v(dout1_14) AT=5000.25n

* CHECK dout1_15 Vdout1_15ck99 = 0 time = 5000
.meas tran vdout1_15ck99 FIND v(dout1_15) AT=5000.25n

* CHECK dout1_0 Vdout1_0ck100 = 0 time = 5050
.meas tran vdout1_0ck100 FIND v(dout1_0) AT=5050.25n

* CHECK dout1_1 Vdout1_1ck100 = 0 time = 5050
.meas tran vdout1_1ck100 FIND v(dout1_1) AT=5050.25n

* CHECK dout1_2 Vdout1_2ck100 = 1.8 time = 5050
.meas tran vdout1_2ck100 FIND v(dout1_2) AT=5050.25n

* CHECK dout1_3 Vdout1_3ck100 = 0 time = 5050
.meas tran vdout1_3ck100 FIND v(dout1_3) AT=5050.25n

* CHECK dout1_4 Vdout1_4ck100 = 0 time = 5050
.meas tran vdout1_4ck100 FIND v(dout1_4) AT=5050.25n

* CHECK dout1_5 Vdout1_5ck100 = 1.8 time = 5050
.meas tran vdout1_5ck100 FIND v(dout1_5) AT=5050.25n

* CHECK dout1_6 Vdout1_6ck100 = 1.8 time = 5050
.meas tran vdout1_6ck100 FIND v(dout1_6) AT=5050.25n

* CHECK dout1_7 Vdout1_7ck100 = 1.8 time = 5050
.meas tran vdout1_7ck100 FIND v(dout1_7) AT=5050.25n

* CHECK dout1_8 Vdout1_8ck100 = 1.8 time = 5050
.meas tran vdout1_8ck100 FIND v(dout1_8) AT=5050.25n

* CHECK dout1_9 Vdout1_9ck100 = 1.8 time = 5050
.meas tran vdout1_9ck100 FIND v(dout1_9) AT=5050.25n

* CHECK dout1_10 Vdout1_10ck100 = 0 time = 5050
.meas tran vdout1_10ck100 FIND v(dout1_10) AT=5050.25n

* CHECK dout1_11 Vdout1_11ck100 = 0 time = 5050
.meas tran vdout1_11ck100 FIND v(dout1_11) AT=5050.25n

* CHECK dout1_12 Vdout1_12ck100 = 1.8 time = 5050
.meas tran vdout1_12ck100 FIND v(dout1_12) AT=5050.25n

* CHECK dout1_13 Vdout1_13ck100 = 0 time = 5050
.meas tran vdout1_13ck100 FIND v(dout1_13) AT=5050.25n

* CHECK dout1_14 Vdout1_14ck100 = 1.8 time = 5050
.meas tran vdout1_14ck100 FIND v(dout1_14) AT=5050.25n

* CHECK dout1_15 Vdout1_15ck100 = 0 time = 5050
.meas tran vdout1_15ck100 FIND v(dout1_15) AT=5050.25n

* CHECK dout1_0 Vdout1_0ck103 = 0 time = 5200
.meas tran vdout1_0ck103 FIND v(dout1_0) AT=5200.25n

* CHECK dout1_1 Vdout1_1ck103 = 1.8 time = 5200
.meas tran vdout1_1ck103 FIND v(dout1_1) AT=5200.25n

* CHECK dout1_2 Vdout1_2ck103 = 0 time = 5200
.meas tran vdout1_2ck103 FIND v(dout1_2) AT=5200.25n

* CHECK dout1_3 Vdout1_3ck103 = 1.8 time = 5200
.meas tran vdout1_3ck103 FIND v(dout1_3) AT=5200.25n

* CHECK dout1_4 Vdout1_4ck103 = 0 time = 5200
.meas tran vdout1_4ck103 FIND v(dout1_4) AT=5200.25n

* CHECK dout1_5 Vdout1_5ck103 = 1.8 time = 5200
.meas tran vdout1_5ck103 FIND v(dout1_5) AT=5200.25n

* CHECK dout1_6 Vdout1_6ck103 = 0 time = 5200
.meas tran vdout1_6ck103 FIND v(dout1_6) AT=5200.25n

* CHECK dout1_7 Vdout1_7ck103 = 0 time = 5200
.meas tran vdout1_7ck103 FIND v(dout1_7) AT=5200.25n

* CHECK dout1_8 Vdout1_8ck103 = 0 time = 5200
.meas tran vdout1_8ck103 FIND v(dout1_8) AT=5200.25n

* CHECK dout1_9 Vdout1_9ck103 = 0 time = 5200
.meas tran vdout1_9ck103 FIND v(dout1_9) AT=5200.25n

* CHECK dout1_10 Vdout1_10ck103 = 0 time = 5200
.meas tran vdout1_10ck103 FIND v(dout1_10) AT=5200.25n

* CHECK dout1_11 Vdout1_11ck103 = 1.8 time = 5200
.meas tran vdout1_11ck103 FIND v(dout1_11) AT=5200.25n

* CHECK dout1_12 Vdout1_12ck103 = 0 time = 5200
.meas tran vdout1_12ck103 FIND v(dout1_12) AT=5200.25n

* CHECK dout1_13 Vdout1_13ck103 = 0 time = 5200
.meas tran vdout1_13ck103 FIND v(dout1_13) AT=5200.25n

* CHECK dout1_14 Vdout1_14ck103 = 1.8 time = 5200
.meas tran vdout1_14ck103 FIND v(dout1_14) AT=5200.25n

* CHECK dout1_15 Vdout1_15ck103 = 0 time = 5200
.meas tran vdout1_15ck103 FIND v(dout1_15) AT=5200.25n

* CHECK dout1_0 Vdout1_0ck104 = 1.8 time = 5250
.meas tran vdout1_0ck104 FIND v(dout1_0) AT=5250.25n

* CHECK dout1_1 Vdout1_1ck104 = 1.8 time = 5250
.meas tran vdout1_1ck104 FIND v(dout1_1) AT=5250.25n

* CHECK dout1_2 Vdout1_2ck104 = 1.8 time = 5250
.meas tran vdout1_2ck104 FIND v(dout1_2) AT=5250.25n

* CHECK dout1_3 Vdout1_3ck104 = 0 time = 5250
.meas tran vdout1_3ck104 FIND v(dout1_3) AT=5250.25n

* CHECK dout1_4 Vdout1_4ck104 = 0 time = 5250
.meas tran vdout1_4ck104 FIND v(dout1_4) AT=5250.25n

* CHECK dout1_5 Vdout1_5ck104 = 0 time = 5250
.meas tran vdout1_5ck104 FIND v(dout1_5) AT=5250.25n

* CHECK dout1_6 Vdout1_6ck104 = 0 time = 5250
.meas tran vdout1_6ck104 FIND v(dout1_6) AT=5250.25n

* CHECK dout1_7 Vdout1_7ck104 = 1.8 time = 5250
.meas tran vdout1_7ck104 FIND v(dout1_7) AT=5250.25n

* CHECK dout1_8 Vdout1_8ck104 = 0 time = 5250
.meas tran vdout1_8ck104 FIND v(dout1_8) AT=5250.25n

* CHECK dout1_9 Vdout1_9ck104 = 1.8 time = 5250
.meas tran vdout1_9ck104 FIND v(dout1_9) AT=5250.25n

* CHECK dout1_10 Vdout1_10ck104 = 0 time = 5250
.meas tran vdout1_10ck104 FIND v(dout1_10) AT=5250.25n

* CHECK dout1_11 Vdout1_11ck104 = 0 time = 5250
.meas tran vdout1_11ck104 FIND v(dout1_11) AT=5250.25n

* CHECK dout1_12 Vdout1_12ck104 = 1.8 time = 5250
.meas tran vdout1_12ck104 FIND v(dout1_12) AT=5250.25n

* CHECK dout1_13 Vdout1_13ck104 = 0 time = 5250
.meas tran vdout1_13ck104 FIND v(dout1_13) AT=5250.25n

* CHECK dout1_14 Vdout1_14ck104 = 0 time = 5250
.meas tran vdout1_14ck104 FIND v(dout1_14) AT=5250.25n

* CHECK dout1_15 Vdout1_15ck104 = 1.8 time = 5250
.meas tran vdout1_15ck104 FIND v(dout1_15) AT=5250.25n

* CHECK dout1_0 Vdout1_0ck107 = 1.8 time = 5400
.meas tran vdout1_0ck107 FIND v(dout1_0) AT=5400.25n

* CHECK dout1_1 Vdout1_1ck107 = 1.8 time = 5400
.meas tran vdout1_1ck107 FIND v(dout1_1) AT=5400.25n

* CHECK dout1_2 Vdout1_2ck107 = 1.8 time = 5400
.meas tran vdout1_2ck107 FIND v(dout1_2) AT=5400.25n

* CHECK dout1_3 Vdout1_3ck107 = 0 time = 5400
.meas tran vdout1_3ck107 FIND v(dout1_3) AT=5400.25n

* CHECK dout1_4 Vdout1_4ck107 = 0 time = 5400
.meas tran vdout1_4ck107 FIND v(dout1_4) AT=5400.25n

* CHECK dout1_5 Vdout1_5ck107 = 0 time = 5400
.meas tran vdout1_5ck107 FIND v(dout1_5) AT=5400.25n

* CHECK dout1_6 Vdout1_6ck107 = 0 time = 5400
.meas tran vdout1_6ck107 FIND v(dout1_6) AT=5400.25n

* CHECK dout1_7 Vdout1_7ck107 = 1.8 time = 5400
.meas tran vdout1_7ck107 FIND v(dout1_7) AT=5400.25n

* CHECK dout1_8 Vdout1_8ck107 = 0 time = 5400
.meas tran vdout1_8ck107 FIND v(dout1_8) AT=5400.25n

* CHECK dout1_9 Vdout1_9ck107 = 1.8 time = 5400
.meas tran vdout1_9ck107 FIND v(dout1_9) AT=5400.25n

* CHECK dout1_10 Vdout1_10ck107 = 0 time = 5400
.meas tran vdout1_10ck107 FIND v(dout1_10) AT=5400.25n

* CHECK dout1_11 Vdout1_11ck107 = 0 time = 5400
.meas tran vdout1_11ck107 FIND v(dout1_11) AT=5400.25n

* CHECK dout1_12 Vdout1_12ck107 = 1.8 time = 5400
.meas tran vdout1_12ck107 FIND v(dout1_12) AT=5400.25n

* CHECK dout1_13 Vdout1_13ck107 = 0 time = 5400
.meas tran vdout1_13ck107 FIND v(dout1_13) AT=5400.25n

* CHECK dout1_14 Vdout1_14ck107 = 0 time = 5400
.meas tran vdout1_14ck107 FIND v(dout1_14) AT=5400.25n

* CHECK dout1_15 Vdout1_15ck107 = 1.8 time = 5400
.meas tran vdout1_15ck107 FIND v(dout1_15) AT=5400.25n

* CHECK dout1_0 Vdout1_0ck108 = 0 time = 5450
.meas tran vdout1_0ck108 FIND v(dout1_0) AT=5450.25n

* CHECK dout1_1 Vdout1_1ck108 = 0 time = 5450
.meas tran vdout1_1ck108 FIND v(dout1_1) AT=5450.25n

* CHECK dout1_2 Vdout1_2ck108 = 1.8 time = 5450
.meas tran vdout1_2ck108 FIND v(dout1_2) AT=5450.25n

* CHECK dout1_3 Vdout1_3ck108 = 1.8 time = 5450
.meas tran vdout1_3ck108 FIND v(dout1_3) AT=5450.25n

* CHECK dout1_4 Vdout1_4ck108 = 0 time = 5450
.meas tran vdout1_4ck108 FIND v(dout1_4) AT=5450.25n

* CHECK dout1_5 Vdout1_5ck108 = 1.8 time = 5450
.meas tran vdout1_5ck108 FIND v(dout1_5) AT=5450.25n

* CHECK dout1_6 Vdout1_6ck108 = 0 time = 5450
.meas tran vdout1_6ck108 FIND v(dout1_6) AT=5450.25n

* CHECK dout1_7 Vdout1_7ck108 = 1.8 time = 5450
.meas tran vdout1_7ck108 FIND v(dout1_7) AT=5450.25n

* CHECK dout1_8 Vdout1_8ck108 = 1.8 time = 5450
.meas tran vdout1_8ck108 FIND v(dout1_8) AT=5450.25n

* CHECK dout1_9 Vdout1_9ck108 = 1.8 time = 5450
.meas tran vdout1_9ck108 FIND v(dout1_9) AT=5450.25n

* CHECK dout1_10 Vdout1_10ck108 = 0 time = 5450
.meas tran vdout1_10ck108 FIND v(dout1_10) AT=5450.25n

* CHECK dout1_11 Vdout1_11ck108 = 0 time = 5450
.meas tran vdout1_11ck108 FIND v(dout1_11) AT=5450.25n

* CHECK dout1_12 Vdout1_12ck108 = 0 time = 5450
.meas tran vdout1_12ck108 FIND v(dout1_12) AT=5450.25n

* CHECK dout1_13 Vdout1_13ck108 = 0 time = 5450
.meas tran vdout1_13ck108 FIND v(dout1_13) AT=5450.25n

* CHECK dout1_14 Vdout1_14ck108 = 1.8 time = 5450
.meas tran vdout1_14ck108 FIND v(dout1_14) AT=5450.25n

* CHECK dout1_15 Vdout1_15ck108 = 0 time = 5450
.meas tran vdout1_15ck108 FIND v(dout1_15) AT=5450.25n

* CHECK dout1_0 Vdout1_0ck116 = 0 time = 5850
.meas tran vdout1_0ck116 FIND v(dout1_0) AT=5850.25n

* CHECK dout1_1 Vdout1_1ck116 = 1.8 time = 5850
.meas tran vdout1_1ck116 FIND v(dout1_1) AT=5850.25n

* CHECK dout1_2 Vdout1_2ck116 = 1.8 time = 5850
.meas tran vdout1_2ck116 FIND v(dout1_2) AT=5850.25n

* CHECK dout1_3 Vdout1_3ck116 = 1.8 time = 5850
.meas tran vdout1_3ck116 FIND v(dout1_3) AT=5850.25n

* CHECK dout1_4 Vdout1_4ck116 = 1.8 time = 5850
.meas tran vdout1_4ck116 FIND v(dout1_4) AT=5850.25n

* CHECK dout1_5 Vdout1_5ck116 = 1.8 time = 5850
.meas tran vdout1_5ck116 FIND v(dout1_5) AT=5850.25n

* CHECK dout1_6 Vdout1_6ck116 = 0 time = 5850
.meas tran vdout1_6ck116 FIND v(dout1_6) AT=5850.25n

* CHECK dout1_7 Vdout1_7ck116 = 0 time = 5850
.meas tran vdout1_7ck116 FIND v(dout1_7) AT=5850.25n

* CHECK dout1_8 Vdout1_8ck116 = 1.8 time = 5850
.meas tran vdout1_8ck116 FIND v(dout1_8) AT=5850.25n

* CHECK dout1_9 Vdout1_9ck116 = 1.8 time = 5850
.meas tran vdout1_9ck116 FIND v(dout1_9) AT=5850.25n

* CHECK dout1_10 Vdout1_10ck116 = 1.8 time = 5850
.meas tran vdout1_10ck116 FIND v(dout1_10) AT=5850.25n

* CHECK dout1_11 Vdout1_11ck116 = 0 time = 5850
.meas tran vdout1_11ck116 FIND v(dout1_11) AT=5850.25n

* CHECK dout1_12 Vdout1_12ck116 = 1.8 time = 5850
.meas tran vdout1_12ck116 FIND v(dout1_12) AT=5850.25n

* CHECK dout1_13 Vdout1_13ck116 = 1.8 time = 5850
.meas tran vdout1_13ck116 FIND v(dout1_13) AT=5850.25n

* CHECK dout1_14 Vdout1_14ck116 = 1.8 time = 5850
.meas tran vdout1_14ck116 FIND v(dout1_14) AT=5850.25n

* CHECK dout1_15 Vdout1_15ck116 = 0 time = 5850
.meas tran vdout1_15ck116 FIND v(dout1_15) AT=5850.25n

* CHECK dout1_0 Vdout1_0ck117 = 1.8 time = 5900
.meas tran vdout1_0ck117 FIND v(dout1_0) AT=5900.25n

* CHECK dout1_1 Vdout1_1ck117 = 0 time = 5900
.meas tran vdout1_1ck117 FIND v(dout1_1) AT=5900.25n

* CHECK dout1_2 Vdout1_2ck117 = 1.8 time = 5900
.meas tran vdout1_2ck117 FIND v(dout1_2) AT=5900.25n

* CHECK dout1_3 Vdout1_3ck117 = 1.8 time = 5900
.meas tran vdout1_3ck117 FIND v(dout1_3) AT=5900.25n

* CHECK dout1_4 Vdout1_4ck117 = 0 time = 5900
.meas tran vdout1_4ck117 FIND v(dout1_4) AT=5900.25n

* CHECK dout1_5 Vdout1_5ck117 = 1.8 time = 5900
.meas tran vdout1_5ck117 FIND v(dout1_5) AT=5900.25n

* CHECK dout1_6 Vdout1_6ck117 = 0 time = 5900
.meas tran vdout1_6ck117 FIND v(dout1_6) AT=5900.25n

* CHECK dout1_7 Vdout1_7ck117 = 0 time = 5900
.meas tran vdout1_7ck117 FIND v(dout1_7) AT=5900.25n

* CHECK dout1_8 Vdout1_8ck117 = 1.8 time = 5900
.meas tran vdout1_8ck117 FIND v(dout1_8) AT=5900.25n

* CHECK dout1_9 Vdout1_9ck117 = 1.8 time = 5900
.meas tran vdout1_9ck117 FIND v(dout1_9) AT=5900.25n

* CHECK dout1_10 Vdout1_10ck117 = 0 time = 5900
.meas tran vdout1_10ck117 FIND v(dout1_10) AT=5900.25n

* CHECK dout1_11 Vdout1_11ck117 = 1.8 time = 5900
.meas tran vdout1_11ck117 FIND v(dout1_11) AT=5900.25n

* CHECK dout1_12 Vdout1_12ck117 = 0 time = 5900
.meas tran vdout1_12ck117 FIND v(dout1_12) AT=5900.25n

* CHECK dout1_13 Vdout1_13ck117 = 1.8 time = 5900
.meas tran vdout1_13ck117 FIND v(dout1_13) AT=5900.25n

* CHECK dout1_14 Vdout1_14ck117 = 1.8 time = 5900
.meas tran vdout1_14ck117 FIND v(dout1_14) AT=5900.25n

* CHECK dout1_15 Vdout1_15ck117 = 0 time = 5900
.meas tran vdout1_15ck117 FIND v(dout1_15) AT=5900.25n

* CHECK dout1_0 Vdout1_0ck119 = 1.8 time = 6000
.meas tran vdout1_0ck119 FIND v(dout1_0) AT=6000.25n

* CHECK dout1_1 Vdout1_1ck119 = 0 time = 6000
.meas tran vdout1_1ck119 FIND v(dout1_1) AT=6000.25n

* CHECK dout1_2 Vdout1_2ck119 = 0 time = 6000
.meas tran vdout1_2ck119 FIND v(dout1_2) AT=6000.25n

* CHECK dout1_3 Vdout1_3ck119 = 1.8 time = 6000
.meas tran vdout1_3ck119 FIND v(dout1_3) AT=6000.25n

* CHECK dout1_4 Vdout1_4ck119 = 0 time = 6000
.meas tran vdout1_4ck119 FIND v(dout1_4) AT=6000.25n

* CHECK dout1_5 Vdout1_5ck119 = 1.8 time = 6000
.meas tran vdout1_5ck119 FIND v(dout1_5) AT=6000.25n

* CHECK dout1_6 Vdout1_6ck119 = 1.8 time = 6000
.meas tran vdout1_6ck119 FIND v(dout1_6) AT=6000.25n

* CHECK dout1_7 Vdout1_7ck119 = 0 time = 6000
.meas tran vdout1_7ck119 FIND v(dout1_7) AT=6000.25n

* CHECK dout1_8 Vdout1_8ck119 = 1.8 time = 6000
.meas tran vdout1_8ck119 FIND v(dout1_8) AT=6000.25n

* CHECK dout1_9 Vdout1_9ck119 = 0 time = 6000
.meas tran vdout1_9ck119 FIND v(dout1_9) AT=6000.25n

* CHECK dout1_10 Vdout1_10ck119 = 0 time = 6000
.meas tran vdout1_10ck119 FIND v(dout1_10) AT=6000.25n

* CHECK dout1_11 Vdout1_11ck119 = 1.8 time = 6000
.meas tran vdout1_11ck119 FIND v(dout1_11) AT=6000.25n

* CHECK dout1_12 Vdout1_12ck119 = 0 time = 6000
.meas tran vdout1_12ck119 FIND v(dout1_12) AT=6000.25n

* CHECK dout1_13 Vdout1_13ck119 = 1.8 time = 6000
.meas tran vdout1_13ck119 FIND v(dout1_13) AT=6000.25n

* CHECK dout1_14 Vdout1_14ck119 = 0 time = 6000
.meas tran vdout1_14ck119 FIND v(dout1_14) AT=6000.25n

* CHECK dout1_15 Vdout1_15ck119 = 0 time = 6000
.meas tran vdout1_15ck119 FIND v(dout1_15) AT=6000.25n

* CHECK dout1_0 Vdout1_0ck121 = 0 time = 6100
.meas tran vdout1_0ck121 FIND v(dout1_0) AT=6100.25n

* CHECK dout1_1 Vdout1_1ck121 = 0 time = 6100
.meas tran vdout1_1ck121 FIND v(dout1_1) AT=6100.25n

* CHECK dout1_2 Vdout1_2ck121 = 1.8 time = 6100
.meas tran vdout1_2ck121 FIND v(dout1_2) AT=6100.25n

* CHECK dout1_3 Vdout1_3ck121 = 0 time = 6100
.meas tran vdout1_3ck121 FIND v(dout1_3) AT=6100.25n

* CHECK dout1_4 Vdout1_4ck121 = 0 time = 6100
.meas tran vdout1_4ck121 FIND v(dout1_4) AT=6100.25n

* CHECK dout1_5 Vdout1_5ck121 = 0 time = 6100
.meas tran vdout1_5ck121 FIND v(dout1_5) AT=6100.25n

* CHECK dout1_6 Vdout1_6ck121 = 0 time = 6100
.meas tran vdout1_6ck121 FIND v(dout1_6) AT=6100.25n

* CHECK dout1_7 Vdout1_7ck121 = 0 time = 6100
.meas tran vdout1_7ck121 FIND v(dout1_7) AT=6100.25n

* CHECK dout1_8 Vdout1_8ck121 = 0 time = 6100
.meas tran vdout1_8ck121 FIND v(dout1_8) AT=6100.25n

* CHECK dout1_9 Vdout1_9ck121 = 0 time = 6100
.meas tran vdout1_9ck121 FIND v(dout1_9) AT=6100.25n

* CHECK dout1_10 Vdout1_10ck121 = 1.8 time = 6100
.meas tran vdout1_10ck121 FIND v(dout1_10) AT=6100.25n

* CHECK dout1_11 Vdout1_11ck121 = 1.8 time = 6100
.meas tran vdout1_11ck121 FIND v(dout1_11) AT=6100.25n

* CHECK dout1_12 Vdout1_12ck121 = 0 time = 6100
.meas tran vdout1_12ck121 FIND v(dout1_12) AT=6100.25n

* CHECK dout1_13 Vdout1_13ck121 = 0 time = 6100
.meas tran vdout1_13ck121 FIND v(dout1_13) AT=6100.25n

* CHECK dout1_14 Vdout1_14ck121 = 1.8 time = 6100
.meas tran vdout1_14ck121 FIND v(dout1_14) AT=6100.25n

* CHECK dout1_15 Vdout1_15ck121 = 1.8 time = 6100
.meas tran vdout1_15ck121 FIND v(dout1_15) AT=6100.25n

* CHECK dout1_0 Vdout1_0ck122 = 0 time = 6150
.meas tran vdout1_0ck122 FIND v(dout1_0) AT=6150.25n

* CHECK dout1_1 Vdout1_1ck122 = 0 time = 6150
.meas tran vdout1_1ck122 FIND v(dout1_1) AT=6150.25n

* CHECK dout1_2 Vdout1_2ck122 = 1.8 time = 6150
.meas tran vdout1_2ck122 FIND v(dout1_2) AT=6150.25n

* CHECK dout1_3 Vdout1_3ck122 = 0 time = 6150
.meas tran vdout1_3ck122 FIND v(dout1_3) AT=6150.25n

* CHECK dout1_4 Vdout1_4ck122 = 0 time = 6150
.meas tran vdout1_4ck122 FIND v(dout1_4) AT=6150.25n

* CHECK dout1_5 Vdout1_5ck122 = 0 time = 6150
.meas tran vdout1_5ck122 FIND v(dout1_5) AT=6150.25n

* CHECK dout1_6 Vdout1_6ck122 = 0 time = 6150
.meas tran vdout1_6ck122 FIND v(dout1_6) AT=6150.25n

* CHECK dout1_7 Vdout1_7ck122 = 0 time = 6150
.meas tran vdout1_7ck122 FIND v(dout1_7) AT=6150.25n

* CHECK dout1_8 Vdout1_8ck122 = 0 time = 6150
.meas tran vdout1_8ck122 FIND v(dout1_8) AT=6150.25n

* CHECK dout1_9 Vdout1_9ck122 = 0 time = 6150
.meas tran vdout1_9ck122 FIND v(dout1_9) AT=6150.25n

* CHECK dout1_10 Vdout1_10ck122 = 1.8 time = 6150
.meas tran vdout1_10ck122 FIND v(dout1_10) AT=6150.25n

* CHECK dout1_11 Vdout1_11ck122 = 1.8 time = 6150
.meas tran vdout1_11ck122 FIND v(dout1_11) AT=6150.25n

* CHECK dout1_12 Vdout1_12ck122 = 0 time = 6150
.meas tran vdout1_12ck122 FIND v(dout1_12) AT=6150.25n

* CHECK dout1_13 Vdout1_13ck122 = 0 time = 6150
.meas tran vdout1_13ck122 FIND v(dout1_13) AT=6150.25n

* CHECK dout1_14 Vdout1_14ck122 = 1.8 time = 6150
.meas tran vdout1_14ck122 FIND v(dout1_14) AT=6150.25n

* CHECK dout1_15 Vdout1_15ck122 = 1.8 time = 6150
.meas tran vdout1_15ck122 FIND v(dout1_15) AT=6150.25n

* CHECK dout1_0 Vdout1_0ck123 = 0 time = 6200
.meas tran vdout1_0ck123 FIND v(dout1_0) AT=6200.25n

* CHECK dout1_1 Vdout1_1ck123 = 0 time = 6200
.meas tran vdout1_1ck123 FIND v(dout1_1) AT=6200.25n

* CHECK dout1_2 Vdout1_2ck123 = 1.8 time = 6200
.meas tran vdout1_2ck123 FIND v(dout1_2) AT=6200.25n

* CHECK dout1_3 Vdout1_3ck123 = 0 time = 6200
.meas tran vdout1_3ck123 FIND v(dout1_3) AT=6200.25n

* CHECK dout1_4 Vdout1_4ck123 = 0 time = 6200
.meas tran vdout1_4ck123 FIND v(dout1_4) AT=6200.25n

* CHECK dout1_5 Vdout1_5ck123 = 0 time = 6200
.meas tran vdout1_5ck123 FIND v(dout1_5) AT=6200.25n

* CHECK dout1_6 Vdout1_6ck123 = 1.8 time = 6200
.meas tran vdout1_6ck123 FIND v(dout1_6) AT=6200.25n

* CHECK dout1_7 Vdout1_7ck123 = 1.8 time = 6200
.meas tran vdout1_7ck123 FIND v(dout1_7) AT=6200.25n

* CHECK dout1_8 Vdout1_8ck123 = 1.8 time = 6200
.meas tran vdout1_8ck123 FIND v(dout1_8) AT=6200.25n

* CHECK dout1_9 Vdout1_9ck123 = 0 time = 6200
.meas tran vdout1_9ck123 FIND v(dout1_9) AT=6200.25n

* CHECK dout1_10 Vdout1_10ck123 = 1.8 time = 6200
.meas tran vdout1_10ck123 FIND v(dout1_10) AT=6200.25n

* CHECK dout1_11 Vdout1_11ck123 = 1.8 time = 6200
.meas tran vdout1_11ck123 FIND v(dout1_11) AT=6200.25n

* CHECK dout1_12 Vdout1_12ck123 = 0 time = 6200
.meas tran vdout1_12ck123 FIND v(dout1_12) AT=6200.25n

* CHECK dout1_13 Vdout1_13ck123 = 1.8 time = 6200
.meas tran vdout1_13ck123 FIND v(dout1_13) AT=6200.25n

* CHECK dout1_14 Vdout1_14ck123 = 1.8 time = 6200
.meas tran vdout1_14ck123 FIND v(dout1_14) AT=6200.25n

* CHECK dout1_15 Vdout1_15ck123 = 0 time = 6200
.meas tran vdout1_15ck123 FIND v(dout1_15) AT=6200.25n

* CHECK dout1_0 Vdout1_0ck128 = 0 time = 6450
.meas tran vdout1_0ck128 FIND v(dout1_0) AT=6450.25n

* CHECK dout1_1 Vdout1_1ck128 = 0 time = 6450
.meas tran vdout1_1ck128 FIND v(dout1_1) AT=6450.25n

* CHECK dout1_2 Vdout1_2ck128 = 1.8 time = 6450
.meas tran vdout1_2ck128 FIND v(dout1_2) AT=6450.25n

* CHECK dout1_3 Vdout1_3ck128 = 0 time = 6450
.meas tran vdout1_3ck128 FIND v(dout1_3) AT=6450.25n

* CHECK dout1_4 Vdout1_4ck128 = 0 time = 6450
.meas tran vdout1_4ck128 FIND v(dout1_4) AT=6450.25n

* CHECK dout1_5 Vdout1_5ck128 = 0 time = 6450
.meas tran vdout1_5ck128 FIND v(dout1_5) AT=6450.25n

* CHECK dout1_6 Vdout1_6ck128 = 1.8 time = 6450
.meas tran vdout1_6ck128 FIND v(dout1_6) AT=6450.25n

* CHECK dout1_7 Vdout1_7ck128 = 1.8 time = 6450
.meas tran vdout1_7ck128 FIND v(dout1_7) AT=6450.25n

* CHECK dout1_8 Vdout1_8ck128 = 1.8 time = 6450
.meas tran vdout1_8ck128 FIND v(dout1_8) AT=6450.25n

* CHECK dout1_9 Vdout1_9ck128 = 0 time = 6450
.meas tran vdout1_9ck128 FIND v(dout1_9) AT=6450.25n

* CHECK dout1_10 Vdout1_10ck128 = 1.8 time = 6450
.meas tran vdout1_10ck128 FIND v(dout1_10) AT=6450.25n

* CHECK dout1_11 Vdout1_11ck128 = 1.8 time = 6450
.meas tran vdout1_11ck128 FIND v(dout1_11) AT=6450.25n

* CHECK dout1_12 Vdout1_12ck128 = 0 time = 6450
.meas tran vdout1_12ck128 FIND v(dout1_12) AT=6450.25n

* CHECK dout1_13 Vdout1_13ck128 = 1.8 time = 6450
.meas tran vdout1_13ck128 FIND v(dout1_13) AT=6450.25n

* CHECK dout1_14 Vdout1_14ck128 = 1.8 time = 6450
.meas tran vdout1_14ck128 FIND v(dout1_14) AT=6450.25n

* CHECK dout1_15 Vdout1_15ck128 = 0 time = 6450
.meas tran vdout1_15ck128 FIND v(dout1_15) AT=6450.25n

* CHECK dout1_0 Vdout1_0ck130 = 1.8 time = 6550
.meas tran vdout1_0ck130 FIND v(dout1_0) AT=6550.25n

* CHECK dout1_1 Vdout1_1ck130 = 1.8 time = 6550
.meas tran vdout1_1ck130 FIND v(dout1_1) AT=6550.25n

* CHECK dout1_2 Vdout1_2ck130 = 0 time = 6550
.meas tran vdout1_2ck130 FIND v(dout1_2) AT=6550.25n

* CHECK dout1_3 Vdout1_3ck130 = 1.8 time = 6550
.meas tran vdout1_3ck130 FIND v(dout1_3) AT=6550.25n

* CHECK dout1_4 Vdout1_4ck130 = 1.8 time = 6550
.meas tran vdout1_4ck130 FIND v(dout1_4) AT=6550.25n

* CHECK dout1_5 Vdout1_5ck130 = 1.8 time = 6550
.meas tran vdout1_5ck130 FIND v(dout1_5) AT=6550.25n

* CHECK dout1_6 Vdout1_6ck130 = 0 time = 6550
.meas tran vdout1_6ck130 FIND v(dout1_6) AT=6550.25n

* CHECK dout1_7 Vdout1_7ck130 = 1.8 time = 6550
.meas tran vdout1_7ck130 FIND v(dout1_7) AT=6550.25n

* CHECK dout1_8 Vdout1_8ck130 = 1.8 time = 6550
.meas tran vdout1_8ck130 FIND v(dout1_8) AT=6550.25n

* CHECK dout1_9 Vdout1_9ck130 = 1.8 time = 6550
.meas tran vdout1_9ck130 FIND v(dout1_9) AT=6550.25n

* CHECK dout1_10 Vdout1_10ck130 = 0 time = 6550
.meas tran vdout1_10ck130 FIND v(dout1_10) AT=6550.25n

* CHECK dout1_11 Vdout1_11ck130 = 1.8 time = 6550
.meas tran vdout1_11ck130 FIND v(dout1_11) AT=6550.25n

* CHECK dout1_12 Vdout1_12ck130 = 1.8 time = 6550
.meas tran vdout1_12ck130 FIND v(dout1_12) AT=6550.25n

* CHECK dout1_13 Vdout1_13ck130 = 1.8 time = 6550
.meas tran vdout1_13ck130 FIND v(dout1_13) AT=6550.25n

* CHECK dout1_14 Vdout1_14ck130 = 0 time = 6550
.meas tran vdout1_14ck130 FIND v(dout1_14) AT=6550.25n

* CHECK dout1_15 Vdout1_15ck130 = 0 time = 6550
.meas tran vdout1_15ck130 FIND v(dout1_15) AT=6550.25n

* CHECK dout1_0 Vdout1_0ck131 = 1.8 time = 6600
.meas tran vdout1_0ck131 FIND v(dout1_0) AT=6600.25n

* CHECK dout1_1 Vdout1_1ck131 = 1.8 time = 6600
.meas tran vdout1_1ck131 FIND v(dout1_1) AT=6600.25n

* CHECK dout1_2 Vdout1_2ck131 = 0 time = 6600
.meas tran vdout1_2ck131 FIND v(dout1_2) AT=6600.25n

* CHECK dout1_3 Vdout1_3ck131 = 1.8 time = 6600
.meas tran vdout1_3ck131 FIND v(dout1_3) AT=6600.25n

* CHECK dout1_4 Vdout1_4ck131 = 1.8 time = 6600
.meas tran vdout1_4ck131 FIND v(dout1_4) AT=6600.25n

* CHECK dout1_5 Vdout1_5ck131 = 0 time = 6600
.meas tran vdout1_5ck131 FIND v(dout1_5) AT=6600.25n

* CHECK dout1_6 Vdout1_6ck131 = 0 time = 6600
.meas tran vdout1_6ck131 FIND v(dout1_6) AT=6600.25n

* CHECK dout1_7 Vdout1_7ck131 = 1.8 time = 6600
.meas tran vdout1_7ck131 FIND v(dout1_7) AT=6600.25n

* CHECK dout1_8 Vdout1_8ck131 = 1.8 time = 6600
.meas tran vdout1_8ck131 FIND v(dout1_8) AT=6600.25n

* CHECK dout1_9 Vdout1_9ck131 = 0 time = 6600
.meas tran vdout1_9ck131 FIND v(dout1_9) AT=6600.25n

* CHECK dout1_10 Vdout1_10ck131 = 0 time = 6600
.meas tran vdout1_10ck131 FIND v(dout1_10) AT=6600.25n

* CHECK dout1_11 Vdout1_11ck131 = 0 time = 6600
.meas tran vdout1_11ck131 FIND v(dout1_11) AT=6600.25n

* CHECK dout1_12 Vdout1_12ck131 = 1.8 time = 6600
.meas tran vdout1_12ck131 FIND v(dout1_12) AT=6600.25n

* CHECK dout1_13 Vdout1_13ck131 = 1.8 time = 6600
.meas tran vdout1_13ck131 FIND v(dout1_13) AT=6600.25n

* CHECK dout1_14 Vdout1_14ck131 = 1.8 time = 6600
.meas tran vdout1_14ck131 FIND v(dout1_14) AT=6600.25n

* CHECK dout1_15 Vdout1_15ck131 = 1.8 time = 6600
.meas tran vdout1_15ck131 FIND v(dout1_15) AT=6600.25n

* CHECK dout1_0 Vdout1_0ck132 = 0 time = 6650
.meas tran vdout1_0ck132 FIND v(dout1_0) AT=6650.25n

* CHECK dout1_1 Vdout1_1ck132 = 1.8 time = 6650
.meas tran vdout1_1ck132 FIND v(dout1_1) AT=6650.25n

* CHECK dout1_2 Vdout1_2ck132 = 1.8 time = 6650
.meas tran vdout1_2ck132 FIND v(dout1_2) AT=6650.25n

* CHECK dout1_3 Vdout1_3ck132 = 1.8 time = 6650
.meas tran vdout1_3ck132 FIND v(dout1_3) AT=6650.25n

* CHECK dout1_4 Vdout1_4ck132 = 1.8 time = 6650
.meas tran vdout1_4ck132 FIND v(dout1_4) AT=6650.25n

* CHECK dout1_5 Vdout1_5ck132 = 1.8 time = 6650
.meas tran vdout1_5ck132 FIND v(dout1_5) AT=6650.25n

* CHECK dout1_6 Vdout1_6ck132 = 0 time = 6650
.meas tran vdout1_6ck132 FIND v(dout1_6) AT=6650.25n

* CHECK dout1_7 Vdout1_7ck132 = 0 time = 6650
.meas tran vdout1_7ck132 FIND v(dout1_7) AT=6650.25n

* CHECK dout1_8 Vdout1_8ck132 = 1.8 time = 6650
.meas tran vdout1_8ck132 FIND v(dout1_8) AT=6650.25n

* CHECK dout1_9 Vdout1_9ck132 = 1.8 time = 6650
.meas tran vdout1_9ck132 FIND v(dout1_9) AT=6650.25n

* CHECK dout1_10 Vdout1_10ck132 = 1.8 time = 6650
.meas tran vdout1_10ck132 FIND v(dout1_10) AT=6650.25n

* CHECK dout1_11 Vdout1_11ck132 = 0 time = 6650
.meas tran vdout1_11ck132 FIND v(dout1_11) AT=6650.25n

* CHECK dout1_12 Vdout1_12ck132 = 1.8 time = 6650
.meas tran vdout1_12ck132 FIND v(dout1_12) AT=6650.25n

* CHECK dout1_13 Vdout1_13ck132 = 1.8 time = 6650
.meas tran vdout1_13ck132 FIND v(dout1_13) AT=6650.25n

* CHECK dout1_14 Vdout1_14ck132 = 1.8 time = 6650
.meas tran vdout1_14ck132 FIND v(dout1_14) AT=6650.25n

* CHECK dout1_15 Vdout1_15ck132 = 0 time = 6650
.meas tran vdout1_15ck132 FIND v(dout1_15) AT=6650.25n

* CHECK dout1_0 Vdout1_0ck133 = 0 time = 6700
.meas tran vdout1_0ck133 FIND v(dout1_0) AT=6700.25n

* CHECK dout1_1 Vdout1_1ck133 = 0 time = 6700
.meas tran vdout1_1ck133 FIND v(dout1_1) AT=6700.25n

* CHECK dout1_2 Vdout1_2ck133 = 0 time = 6700
.meas tran vdout1_2ck133 FIND v(dout1_2) AT=6700.25n

* CHECK dout1_3 Vdout1_3ck133 = 1.8 time = 6700
.meas tran vdout1_3ck133 FIND v(dout1_3) AT=6700.25n

* CHECK dout1_4 Vdout1_4ck133 = 0 time = 6700
.meas tran vdout1_4ck133 FIND v(dout1_4) AT=6700.25n

* CHECK dout1_5 Vdout1_5ck133 = 0 time = 6700
.meas tran vdout1_5ck133 FIND v(dout1_5) AT=6700.25n

* CHECK dout1_6 Vdout1_6ck133 = 0 time = 6700
.meas tran vdout1_6ck133 FIND v(dout1_6) AT=6700.25n

* CHECK dout1_7 Vdout1_7ck133 = 1.8 time = 6700
.meas tran vdout1_7ck133 FIND v(dout1_7) AT=6700.25n

* CHECK dout1_8 Vdout1_8ck133 = 0 time = 6700
.meas tran vdout1_8ck133 FIND v(dout1_8) AT=6700.25n

* CHECK dout1_9 Vdout1_9ck133 = 1.8 time = 6700
.meas tran vdout1_9ck133 FIND v(dout1_9) AT=6700.25n

* CHECK dout1_10 Vdout1_10ck133 = 0 time = 6700
.meas tran vdout1_10ck133 FIND v(dout1_10) AT=6700.25n

* CHECK dout1_11 Vdout1_11ck133 = 0 time = 6700
.meas tran vdout1_11ck133 FIND v(dout1_11) AT=6700.25n

* CHECK dout1_12 Vdout1_12ck133 = 1.8 time = 6700
.meas tran vdout1_12ck133 FIND v(dout1_12) AT=6700.25n

* CHECK dout1_13 Vdout1_13ck133 = 0 time = 6700
.meas tran vdout1_13ck133 FIND v(dout1_13) AT=6700.25n

* CHECK dout1_14 Vdout1_14ck133 = 0 time = 6700
.meas tran vdout1_14ck133 FIND v(dout1_14) AT=6700.25n

* CHECK dout1_15 Vdout1_15ck133 = 1.8 time = 6700
.meas tran vdout1_15ck133 FIND v(dout1_15) AT=6700.25n

* CHECK dout1_0 Vdout1_0ck134 = 0 time = 6750
.meas tran vdout1_0ck134 FIND v(dout1_0) AT=6750.25n

* CHECK dout1_1 Vdout1_1ck134 = 0 time = 6750
.meas tran vdout1_1ck134 FIND v(dout1_1) AT=6750.25n

* CHECK dout1_2 Vdout1_2ck134 = 0 time = 6750
.meas tran vdout1_2ck134 FIND v(dout1_2) AT=6750.25n

* CHECK dout1_3 Vdout1_3ck134 = 1.8 time = 6750
.meas tran vdout1_3ck134 FIND v(dout1_3) AT=6750.25n

* CHECK dout1_4 Vdout1_4ck134 = 1.8 time = 6750
.meas tran vdout1_4ck134 FIND v(dout1_4) AT=6750.25n

* CHECK dout1_5 Vdout1_5ck134 = 0 time = 6750
.meas tran vdout1_5ck134 FIND v(dout1_5) AT=6750.25n

* CHECK dout1_6 Vdout1_6ck134 = 1.8 time = 6750
.meas tran vdout1_6ck134 FIND v(dout1_6) AT=6750.25n

* CHECK dout1_7 Vdout1_7ck134 = 0 time = 6750
.meas tran vdout1_7ck134 FIND v(dout1_7) AT=6750.25n

* CHECK dout1_8 Vdout1_8ck134 = 1.8 time = 6750
.meas tran vdout1_8ck134 FIND v(dout1_8) AT=6750.25n

* CHECK dout1_9 Vdout1_9ck134 = 0 time = 6750
.meas tran vdout1_9ck134 FIND v(dout1_9) AT=6750.25n

* CHECK dout1_10 Vdout1_10ck134 = 0 time = 6750
.meas tran vdout1_10ck134 FIND v(dout1_10) AT=6750.25n

* CHECK dout1_11 Vdout1_11ck134 = 1.8 time = 6750
.meas tran vdout1_11ck134 FIND v(dout1_11) AT=6750.25n

* CHECK dout1_12 Vdout1_12ck134 = 0 time = 6750
.meas tran vdout1_12ck134 FIND v(dout1_12) AT=6750.25n

* CHECK dout1_13 Vdout1_13ck134 = 0 time = 6750
.meas tran vdout1_13ck134 FIND v(dout1_13) AT=6750.25n

* CHECK dout1_14 Vdout1_14ck134 = 1.8 time = 6750
.meas tran vdout1_14ck134 FIND v(dout1_14) AT=6750.25n

* CHECK dout1_15 Vdout1_15ck134 = 0 time = 6750
.meas tran vdout1_15ck134 FIND v(dout1_15) AT=6750.25n

* CHECK dout1_0 Vdout1_0ck137 = 0 time = 6900
.meas tran vdout1_0ck137 FIND v(dout1_0) AT=6900.25n

* CHECK dout1_1 Vdout1_1ck137 = 0 time = 6900
.meas tran vdout1_1ck137 FIND v(dout1_1) AT=6900.25n

* CHECK dout1_2 Vdout1_2ck137 = 1.8 time = 6900
.meas tran vdout1_2ck137 FIND v(dout1_2) AT=6900.25n

* CHECK dout1_3 Vdout1_3ck137 = 0 time = 6900
.meas tran vdout1_3ck137 FIND v(dout1_3) AT=6900.25n

* CHECK dout1_4 Vdout1_4ck137 = 0 time = 6900
.meas tran vdout1_4ck137 FIND v(dout1_4) AT=6900.25n

* CHECK dout1_5 Vdout1_5ck137 = 0 time = 6900
.meas tran vdout1_5ck137 FIND v(dout1_5) AT=6900.25n

* CHECK dout1_6 Vdout1_6ck137 = 1.8 time = 6900
.meas tran vdout1_6ck137 FIND v(dout1_6) AT=6900.25n

* CHECK dout1_7 Vdout1_7ck137 = 1.8 time = 6900
.meas tran vdout1_7ck137 FIND v(dout1_7) AT=6900.25n

* CHECK dout1_8 Vdout1_8ck137 = 1.8 time = 6900
.meas tran vdout1_8ck137 FIND v(dout1_8) AT=6900.25n

* CHECK dout1_9 Vdout1_9ck137 = 0 time = 6900
.meas tran vdout1_9ck137 FIND v(dout1_9) AT=6900.25n

* CHECK dout1_10 Vdout1_10ck137 = 1.8 time = 6900
.meas tran vdout1_10ck137 FIND v(dout1_10) AT=6900.25n

* CHECK dout1_11 Vdout1_11ck137 = 1.8 time = 6900
.meas tran vdout1_11ck137 FIND v(dout1_11) AT=6900.25n

* CHECK dout1_12 Vdout1_12ck137 = 0 time = 6900
.meas tran vdout1_12ck137 FIND v(dout1_12) AT=6900.25n

* CHECK dout1_13 Vdout1_13ck137 = 1.8 time = 6900
.meas tran vdout1_13ck137 FIND v(dout1_13) AT=6900.25n

* CHECK dout1_14 Vdout1_14ck137 = 1.8 time = 6900
.meas tran vdout1_14ck137 FIND v(dout1_14) AT=6900.25n

* CHECK dout1_15 Vdout1_15ck137 = 0 time = 6900
.meas tran vdout1_15ck137 FIND v(dout1_15) AT=6900.25n

* CHECK dout1_0 Vdout1_0ck138 = 1.8 time = 6950
.meas tran vdout1_0ck138 FIND v(dout1_0) AT=6950.25n

* CHECK dout1_1 Vdout1_1ck138 = 1.8 time = 6950
.meas tran vdout1_1ck138 FIND v(dout1_1) AT=6950.25n

* CHECK dout1_2 Vdout1_2ck138 = 0 time = 6950
.meas tran vdout1_2ck138 FIND v(dout1_2) AT=6950.25n

* CHECK dout1_3 Vdout1_3ck138 = 1.8 time = 6950
.meas tran vdout1_3ck138 FIND v(dout1_3) AT=6950.25n

* CHECK dout1_4 Vdout1_4ck138 = 1.8 time = 6950
.meas tran vdout1_4ck138 FIND v(dout1_4) AT=6950.25n

* CHECK dout1_5 Vdout1_5ck138 = 0 time = 6950
.meas tran vdout1_5ck138 FIND v(dout1_5) AT=6950.25n

* CHECK dout1_6 Vdout1_6ck138 = 0 time = 6950
.meas tran vdout1_6ck138 FIND v(dout1_6) AT=6950.25n

* CHECK dout1_7 Vdout1_7ck138 = 1.8 time = 6950
.meas tran vdout1_7ck138 FIND v(dout1_7) AT=6950.25n

* CHECK dout1_8 Vdout1_8ck138 = 1.8 time = 6950
.meas tran vdout1_8ck138 FIND v(dout1_8) AT=6950.25n

* CHECK dout1_9 Vdout1_9ck138 = 0 time = 6950
.meas tran vdout1_9ck138 FIND v(dout1_9) AT=6950.25n

* CHECK dout1_10 Vdout1_10ck138 = 0 time = 6950
.meas tran vdout1_10ck138 FIND v(dout1_10) AT=6950.25n

* CHECK dout1_11 Vdout1_11ck138 = 0 time = 6950
.meas tran vdout1_11ck138 FIND v(dout1_11) AT=6950.25n

* CHECK dout1_12 Vdout1_12ck138 = 1.8 time = 6950
.meas tran vdout1_12ck138 FIND v(dout1_12) AT=6950.25n

* CHECK dout1_13 Vdout1_13ck138 = 1.8 time = 6950
.meas tran vdout1_13ck138 FIND v(dout1_13) AT=6950.25n

* CHECK dout1_14 Vdout1_14ck138 = 1.8 time = 6950
.meas tran vdout1_14ck138 FIND v(dout1_14) AT=6950.25n

* CHECK dout1_15 Vdout1_15ck138 = 1.8 time = 6950
.meas tran vdout1_15ck138 FIND v(dout1_15) AT=6950.25n

* CHECK dout1_0 Vdout1_0ck139 = 0 time = 7000
.meas tran vdout1_0ck139 FIND v(dout1_0) AT=7000.25n

* CHECK dout1_1 Vdout1_1ck139 = 0 time = 7000
.meas tran vdout1_1ck139 FIND v(dout1_1) AT=7000.25n

* CHECK dout1_2 Vdout1_2ck139 = 0 time = 7000
.meas tran vdout1_2ck139 FIND v(dout1_2) AT=7000.25n

* CHECK dout1_3 Vdout1_3ck139 = 0 time = 7000
.meas tran vdout1_3ck139 FIND v(dout1_3) AT=7000.25n

* CHECK dout1_4 Vdout1_4ck139 = 0 time = 7000
.meas tran vdout1_4ck139 FIND v(dout1_4) AT=7000.25n

* CHECK dout1_5 Vdout1_5ck139 = 0 time = 7000
.meas tran vdout1_5ck139 FIND v(dout1_5) AT=7000.25n

* CHECK dout1_6 Vdout1_6ck139 = 0 time = 7000
.meas tran vdout1_6ck139 FIND v(dout1_6) AT=7000.25n

* CHECK dout1_7 Vdout1_7ck139 = 0 time = 7000
.meas tran vdout1_7ck139 FIND v(dout1_7) AT=7000.25n

* CHECK dout1_8 Vdout1_8ck139 = 1.8 time = 7000
.meas tran vdout1_8ck139 FIND v(dout1_8) AT=7000.25n

* CHECK dout1_9 Vdout1_9ck139 = 1.8 time = 7000
.meas tran vdout1_9ck139 FIND v(dout1_9) AT=7000.25n

* CHECK dout1_10 Vdout1_10ck139 = 1.8 time = 7000
.meas tran vdout1_10ck139 FIND v(dout1_10) AT=7000.25n

* CHECK dout1_11 Vdout1_11ck139 = 0 time = 7000
.meas tran vdout1_11ck139 FIND v(dout1_11) AT=7000.25n

* CHECK dout1_12 Vdout1_12ck139 = 1.8 time = 7000
.meas tran vdout1_12ck139 FIND v(dout1_12) AT=7000.25n

* CHECK dout1_13 Vdout1_13ck139 = 1.8 time = 7000
.meas tran vdout1_13ck139 FIND v(dout1_13) AT=7000.25n

* CHECK dout1_14 Vdout1_14ck139 = 0 time = 7000
.meas tran vdout1_14ck139 FIND v(dout1_14) AT=7000.25n

* CHECK dout1_15 Vdout1_15ck139 = 0 time = 7000
.meas tran vdout1_15ck139 FIND v(dout1_15) AT=7000.25n

* CHECK dout1_0 Vdout1_0ck140 = 0 time = 7050
.meas tran vdout1_0ck140 FIND v(dout1_0) AT=7050.25n

* CHECK dout1_1 Vdout1_1ck140 = 0 time = 7050
.meas tran vdout1_1ck140 FIND v(dout1_1) AT=7050.25n

* CHECK dout1_2 Vdout1_2ck140 = 0 time = 7050
.meas tran vdout1_2ck140 FIND v(dout1_2) AT=7050.25n

* CHECK dout1_3 Vdout1_3ck140 = 0 time = 7050
.meas tran vdout1_3ck140 FIND v(dout1_3) AT=7050.25n

* CHECK dout1_4 Vdout1_4ck140 = 0 time = 7050
.meas tran vdout1_4ck140 FIND v(dout1_4) AT=7050.25n

* CHECK dout1_5 Vdout1_5ck140 = 0 time = 7050
.meas tran vdout1_5ck140 FIND v(dout1_5) AT=7050.25n

* CHECK dout1_6 Vdout1_6ck140 = 0 time = 7050
.meas tran vdout1_6ck140 FIND v(dout1_6) AT=7050.25n

* CHECK dout1_7 Vdout1_7ck140 = 0 time = 7050
.meas tran vdout1_7ck140 FIND v(dout1_7) AT=7050.25n

* CHECK dout1_8 Vdout1_8ck140 = 1.8 time = 7050
.meas tran vdout1_8ck140 FIND v(dout1_8) AT=7050.25n

* CHECK dout1_9 Vdout1_9ck140 = 1.8 time = 7050
.meas tran vdout1_9ck140 FIND v(dout1_9) AT=7050.25n

* CHECK dout1_10 Vdout1_10ck140 = 1.8 time = 7050
.meas tran vdout1_10ck140 FIND v(dout1_10) AT=7050.25n

* CHECK dout1_11 Vdout1_11ck140 = 0 time = 7050
.meas tran vdout1_11ck140 FIND v(dout1_11) AT=7050.25n

* CHECK dout1_12 Vdout1_12ck140 = 1.8 time = 7050
.meas tran vdout1_12ck140 FIND v(dout1_12) AT=7050.25n

* CHECK dout1_13 Vdout1_13ck140 = 1.8 time = 7050
.meas tran vdout1_13ck140 FIND v(dout1_13) AT=7050.25n

* CHECK dout1_14 Vdout1_14ck140 = 0 time = 7050
.meas tran vdout1_14ck140 FIND v(dout1_14) AT=7050.25n

* CHECK dout1_15 Vdout1_15ck140 = 0 time = 7050
.meas tran vdout1_15ck140 FIND v(dout1_15) AT=7050.25n

* CHECK dout1_0 Vdout1_0ck142 = 1.8 time = 7150
.meas tran vdout1_0ck142 FIND v(dout1_0) AT=7150.25n

* CHECK dout1_1 Vdout1_1ck142 = 0 time = 7150
.meas tran vdout1_1ck142 FIND v(dout1_1) AT=7150.25n

* CHECK dout1_2 Vdout1_2ck142 = 1.8 time = 7150
.meas tran vdout1_2ck142 FIND v(dout1_2) AT=7150.25n

* CHECK dout1_3 Vdout1_3ck142 = 0 time = 7150
.meas tran vdout1_3ck142 FIND v(dout1_3) AT=7150.25n

* CHECK dout1_4 Vdout1_4ck142 = 1.8 time = 7150
.meas tran vdout1_4ck142 FIND v(dout1_4) AT=7150.25n

* CHECK dout1_5 Vdout1_5ck142 = 1.8 time = 7150
.meas tran vdout1_5ck142 FIND v(dout1_5) AT=7150.25n

* CHECK dout1_6 Vdout1_6ck142 = 1.8 time = 7150
.meas tran vdout1_6ck142 FIND v(dout1_6) AT=7150.25n

* CHECK dout1_7 Vdout1_7ck142 = 0 time = 7150
.meas tran vdout1_7ck142 FIND v(dout1_7) AT=7150.25n

* CHECK dout1_8 Vdout1_8ck142 = 0 time = 7150
.meas tran vdout1_8ck142 FIND v(dout1_8) AT=7150.25n

* CHECK dout1_9 Vdout1_9ck142 = 1.8 time = 7150
.meas tran vdout1_9ck142 FIND v(dout1_9) AT=7150.25n

* CHECK dout1_10 Vdout1_10ck142 = 1.8 time = 7150
.meas tran vdout1_10ck142 FIND v(dout1_10) AT=7150.25n

* CHECK dout1_11 Vdout1_11ck142 = 0 time = 7150
.meas tran vdout1_11ck142 FIND v(dout1_11) AT=7150.25n

* CHECK dout1_12 Vdout1_12ck142 = 0 time = 7150
.meas tran vdout1_12ck142 FIND v(dout1_12) AT=7150.25n

* CHECK dout1_13 Vdout1_13ck142 = 0 time = 7150
.meas tran vdout1_13ck142 FIND v(dout1_13) AT=7150.25n

* CHECK dout1_14 Vdout1_14ck142 = 0 time = 7150
.meas tran vdout1_14ck142 FIND v(dout1_14) AT=7150.25n

* CHECK dout1_15 Vdout1_15ck142 = 1.8 time = 7150
.meas tran vdout1_15ck142 FIND v(dout1_15) AT=7150.25n

* CHECK dout1_0 Vdout1_0ck144 = 0 time = 7250
.meas tran vdout1_0ck144 FIND v(dout1_0) AT=7250.25n

* CHECK dout1_1 Vdout1_1ck144 = 0 time = 7250
.meas tran vdout1_1ck144 FIND v(dout1_1) AT=7250.25n

* CHECK dout1_2 Vdout1_2ck144 = 0 time = 7250
.meas tran vdout1_2ck144 FIND v(dout1_2) AT=7250.25n

* CHECK dout1_3 Vdout1_3ck144 = 1.8 time = 7250
.meas tran vdout1_3ck144 FIND v(dout1_3) AT=7250.25n

* CHECK dout1_4 Vdout1_4ck144 = 1.8 time = 7250
.meas tran vdout1_4ck144 FIND v(dout1_4) AT=7250.25n

* CHECK dout1_5 Vdout1_5ck144 = 0 time = 7250
.meas tran vdout1_5ck144 FIND v(dout1_5) AT=7250.25n

* CHECK dout1_6 Vdout1_6ck144 = 1.8 time = 7250
.meas tran vdout1_6ck144 FIND v(dout1_6) AT=7250.25n

* CHECK dout1_7 Vdout1_7ck144 = 0 time = 7250
.meas tran vdout1_7ck144 FIND v(dout1_7) AT=7250.25n

* CHECK dout1_8 Vdout1_8ck144 = 1.8 time = 7250
.meas tran vdout1_8ck144 FIND v(dout1_8) AT=7250.25n

* CHECK dout1_9 Vdout1_9ck144 = 0 time = 7250
.meas tran vdout1_9ck144 FIND v(dout1_9) AT=7250.25n

* CHECK dout1_10 Vdout1_10ck144 = 0 time = 7250
.meas tran vdout1_10ck144 FIND v(dout1_10) AT=7250.25n

* CHECK dout1_11 Vdout1_11ck144 = 1.8 time = 7250
.meas tran vdout1_11ck144 FIND v(dout1_11) AT=7250.25n

* CHECK dout1_12 Vdout1_12ck144 = 0 time = 7250
.meas tran vdout1_12ck144 FIND v(dout1_12) AT=7250.25n

* CHECK dout1_13 Vdout1_13ck144 = 0 time = 7250
.meas tran vdout1_13ck144 FIND v(dout1_13) AT=7250.25n

* CHECK dout1_14 Vdout1_14ck144 = 1.8 time = 7250
.meas tran vdout1_14ck144 FIND v(dout1_14) AT=7250.25n

* CHECK dout1_15 Vdout1_15ck144 = 0 time = 7250
.meas tran vdout1_15ck144 FIND v(dout1_15) AT=7250.25n

* CHECK dout1_0 Vdout1_0ck145 = 1.8 time = 7300
.meas tran vdout1_0ck145 FIND v(dout1_0) AT=7300.25n

* CHECK dout1_1 Vdout1_1ck145 = 1.8 time = 7300
.meas tran vdout1_1ck145 FIND v(dout1_1) AT=7300.25n

* CHECK dout1_2 Vdout1_2ck145 = 0 time = 7300
.meas tran vdout1_2ck145 FIND v(dout1_2) AT=7300.25n

* CHECK dout1_3 Vdout1_3ck145 = 1.8 time = 7300
.meas tran vdout1_3ck145 FIND v(dout1_3) AT=7300.25n

* CHECK dout1_4 Vdout1_4ck145 = 1.8 time = 7300
.meas tran vdout1_4ck145 FIND v(dout1_4) AT=7300.25n

* CHECK dout1_5 Vdout1_5ck145 = 1.8 time = 7300
.meas tran vdout1_5ck145 FIND v(dout1_5) AT=7300.25n

* CHECK dout1_6 Vdout1_6ck145 = 0 time = 7300
.meas tran vdout1_6ck145 FIND v(dout1_6) AT=7300.25n

* CHECK dout1_7 Vdout1_7ck145 = 1.8 time = 7300
.meas tran vdout1_7ck145 FIND v(dout1_7) AT=7300.25n

* CHECK dout1_8 Vdout1_8ck145 = 1.8 time = 7300
.meas tran vdout1_8ck145 FIND v(dout1_8) AT=7300.25n

* CHECK dout1_9 Vdout1_9ck145 = 1.8 time = 7300
.meas tran vdout1_9ck145 FIND v(dout1_9) AT=7300.25n

* CHECK dout1_10 Vdout1_10ck145 = 0 time = 7300
.meas tran vdout1_10ck145 FIND v(dout1_10) AT=7300.25n

* CHECK dout1_11 Vdout1_11ck145 = 1.8 time = 7300
.meas tran vdout1_11ck145 FIND v(dout1_11) AT=7300.25n

* CHECK dout1_12 Vdout1_12ck145 = 1.8 time = 7300
.meas tran vdout1_12ck145 FIND v(dout1_12) AT=7300.25n

* CHECK dout1_13 Vdout1_13ck145 = 1.8 time = 7300
.meas tran vdout1_13ck145 FIND v(dout1_13) AT=7300.25n

* CHECK dout1_14 Vdout1_14ck145 = 0 time = 7300
.meas tran vdout1_14ck145 FIND v(dout1_14) AT=7300.25n

* CHECK dout1_15 Vdout1_15ck145 = 0 time = 7300
.meas tran vdout1_15ck145 FIND v(dout1_15) AT=7300.25n

* CHECK dout1_0 Vdout1_0ck149 = 1.8 time = 7500
.meas tran vdout1_0ck149 FIND v(dout1_0) AT=7500.25n

* CHECK dout1_1 Vdout1_1ck149 = 0 time = 7500
.meas tran vdout1_1ck149 FIND v(dout1_1) AT=7500.25n

* CHECK dout1_2 Vdout1_2ck149 = 1.8 time = 7500
.meas tran vdout1_2ck149 FIND v(dout1_2) AT=7500.25n

* CHECK dout1_3 Vdout1_3ck149 = 1.8 time = 7500
.meas tran vdout1_3ck149 FIND v(dout1_3) AT=7500.25n

* CHECK dout1_4 Vdout1_4ck149 = 1.8 time = 7500
.meas tran vdout1_4ck149 FIND v(dout1_4) AT=7500.25n

* CHECK dout1_5 Vdout1_5ck149 = 0 time = 7500
.meas tran vdout1_5ck149 FIND v(dout1_5) AT=7500.25n

* CHECK dout1_6 Vdout1_6ck149 = 1.8 time = 7500
.meas tran vdout1_6ck149 FIND v(dout1_6) AT=7500.25n

* CHECK dout1_7 Vdout1_7ck149 = 0 time = 7500
.meas tran vdout1_7ck149 FIND v(dout1_7) AT=7500.25n

* CHECK dout1_8 Vdout1_8ck149 = 1.8 time = 7500
.meas tran vdout1_8ck149 FIND v(dout1_8) AT=7500.25n

* CHECK dout1_9 Vdout1_9ck149 = 0 time = 7500
.meas tran vdout1_9ck149 FIND v(dout1_9) AT=7500.25n

* CHECK dout1_10 Vdout1_10ck149 = 0 time = 7500
.meas tran vdout1_10ck149 FIND v(dout1_10) AT=7500.25n

* CHECK dout1_11 Vdout1_11ck149 = 0 time = 7500
.meas tran vdout1_11ck149 FIND v(dout1_11) AT=7500.25n

* CHECK dout1_12 Vdout1_12ck149 = 1.8 time = 7500
.meas tran vdout1_12ck149 FIND v(dout1_12) AT=7500.25n

* CHECK dout1_13 Vdout1_13ck149 = 1.8 time = 7500
.meas tran vdout1_13ck149 FIND v(dout1_13) AT=7500.25n

* CHECK dout1_14 Vdout1_14ck149 = 1.8 time = 7500
.meas tran vdout1_14ck149 FIND v(dout1_14) AT=7500.25n

* CHECK dout1_15 Vdout1_15ck149 = 0 time = 7500
.meas tran vdout1_15ck149 FIND v(dout1_15) AT=7500.25n

* CHECK dout1_0 Vdout1_0ck152 = 0 time = 7650
.meas tran vdout1_0ck152 FIND v(dout1_0) AT=7650.25n

* CHECK dout1_1 Vdout1_1ck152 = 1.8 time = 7650
.meas tran vdout1_1ck152 FIND v(dout1_1) AT=7650.25n

* CHECK dout1_2 Vdout1_2ck152 = 1.8 time = 7650
.meas tran vdout1_2ck152 FIND v(dout1_2) AT=7650.25n

* CHECK dout1_3 Vdout1_3ck152 = 1.8 time = 7650
.meas tran vdout1_3ck152 FIND v(dout1_3) AT=7650.25n

* CHECK dout1_4 Vdout1_4ck152 = 0 time = 7650
.meas tran vdout1_4ck152 FIND v(dout1_4) AT=7650.25n

* CHECK dout1_5 Vdout1_5ck152 = 0 time = 7650
.meas tran vdout1_5ck152 FIND v(dout1_5) AT=7650.25n

* CHECK dout1_6 Vdout1_6ck152 = 1.8 time = 7650
.meas tran vdout1_6ck152 FIND v(dout1_6) AT=7650.25n

* CHECK dout1_7 Vdout1_7ck152 = 1.8 time = 7650
.meas tran vdout1_7ck152 FIND v(dout1_7) AT=7650.25n

* CHECK dout1_8 Vdout1_8ck152 = 0 time = 7650
.meas tran vdout1_8ck152 FIND v(dout1_8) AT=7650.25n

* CHECK dout1_9 Vdout1_9ck152 = 0 time = 7650
.meas tran vdout1_9ck152 FIND v(dout1_9) AT=7650.25n

* CHECK dout1_10 Vdout1_10ck152 = 1.8 time = 7650
.meas tran vdout1_10ck152 FIND v(dout1_10) AT=7650.25n

* CHECK dout1_11 Vdout1_11ck152 = 0 time = 7650
.meas tran vdout1_11ck152 FIND v(dout1_11) AT=7650.25n

* CHECK dout1_12 Vdout1_12ck152 = 1.8 time = 7650
.meas tran vdout1_12ck152 FIND v(dout1_12) AT=7650.25n

* CHECK dout1_13 Vdout1_13ck152 = 1.8 time = 7650
.meas tran vdout1_13ck152 FIND v(dout1_13) AT=7650.25n

* CHECK dout1_14 Vdout1_14ck152 = 1.8 time = 7650
.meas tran vdout1_14ck152 FIND v(dout1_14) AT=7650.25n

* CHECK dout1_15 Vdout1_15ck152 = 0 time = 7650
.meas tran vdout1_15ck152 FIND v(dout1_15) AT=7650.25n

* CHECK dout1_0 Vdout1_0ck158 = 0 time = 7950
.meas tran vdout1_0ck158 FIND v(dout1_0) AT=7950.25n

* CHECK dout1_1 Vdout1_1ck158 = 1.8 time = 7950
.meas tran vdout1_1ck158 FIND v(dout1_1) AT=7950.25n

* CHECK dout1_2 Vdout1_2ck158 = 1.8 time = 7950
.meas tran vdout1_2ck158 FIND v(dout1_2) AT=7950.25n

* CHECK dout1_3 Vdout1_3ck158 = 1.8 time = 7950
.meas tran vdout1_3ck158 FIND v(dout1_3) AT=7950.25n

* CHECK dout1_4 Vdout1_4ck158 = 0 time = 7950
.meas tran vdout1_4ck158 FIND v(dout1_4) AT=7950.25n

* CHECK dout1_5 Vdout1_5ck158 = 0 time = 7950
.meas tran vdout1_5ck158 FIND v(dout1_5) AT=7950.25n

* CHECK dout1_6 Vdout1_6ck158 = 1.8 time = 7950
.meas tran vdout1_6ck158 FIND v(dout1_6) AT=7950.25n

* CHECK dout1_7 Vdout1_7ck158 = 1.8 time = 7950
.meas tran vdout1_7ck158 FIND v(dout1_7) AT=7950.25n

* CHECK dout1_8 Vdout1_8ck158 = 0 time = 7950
.meas tran vdout1_8ck158 FIND v(dout1_8) AT=7950.25n

* CHECK dout1_9 Vdout1_9ck158 = 0 time = 7950
.meas tran vdout1_9ck158 FIND v(dout1_9) AT=7950.25n

* CHECK dout1_10 Vdout1_10ck158 = 1.8 time = 7950
.meas tran vdout1_10ck158 FIND v(dout1_10) AT=7950.25n

* CHECK dout1_11 Vdout1_11ck158 = 0 time = 7950
.meas tran vdout1_11ck158 FIND v(dout1_11) AT=7950.25n

* CHECK dout1_12 Vdout1_12ck158 = 1.8 time = 7950
.meas tran vdout1_12ck158 FIND v(dout1_12) AT=7950.25n

* CHECK dout1_13 Vdout1_13ck158 = 1.8 time = 7950
.meas tran vdout1_13ck158 FIND v(dout1_13) AT=7950.25n

* CHECK dout1_14 Vdout1_14ck158 = 1.8 time = 7950
.meas tran vdout1_14ck158 FIND v(dout1_14) AT=7950.25n

* CHECK dout1_15 Vdout1_15ck158 = 0 time = 7950
.meas tran vdout1_15ck158 FIND v(dout1_15) AT=7950.25n

* CHECK dout1_0 Vdout1_0ck164 = 0 time = 8250
.meas tran vdout1_0ck164 FIND v(dout1_0) AT=8250.25n

* CHECK dout1_1 Vdout1_1ck164 = 0 time = 8250
.meas tran vdout1_1ck164 FIND v(dout1_1) AT=8250.25n

* CHECK dout1_2 Vdout1_2ck164 = 1.8 time = 8250
.meas tran vdout1_2ck164 FIND v(dout1_2) AT=8250.25n

* CHECK dout1_3 Vdout1_3ck164 = 0 time = 8250
.meas tran vdout1_3ck164 FIND v(dout1_3) AT=8250.25n

* CHECK dout1_4 Vdout1_4ck164 = 0 time = 8250
.meas tran vdout1_4ck164 FIND v(dout1_4) AT=8250.25n

* CHECK dout1_5 Vdout1_5ck164 = 0 time = 8250
.meas tran vdout1_5ck164 FIND v(dout1_5) AT=8250.25n

* CHECK dout1_6 Vdout1_6ck164 = 1.8 time = 8250
.meas tran vdout1_6ck164 FIND v(dout1_6) AT=8250.25n

* CHECK dout1_7 Vdout1_7ck164 = 1.8 time = 8250
.meas tran vdout1_7ck164 FIND v(dout1_7) AT=8250.25n

* CHECK dout1_8 Vdout1_8ck164 = 1.8 time = 8250
.meas tran vdout1_8ck164 FIND v(dout1_8) AT=8250.25n

* CHECK dout1_9 Vdout1_9ck164 = 0 time = 8250
.meas tran vdout1_9ck164 FIND v(dout1_9) AT=8250.25n

* CHECK dout1_10 Vdout1_10ck164 = 1.8 time = 8250
.meas tran vdout1_10ck164 FIND v(dout1_10) AT=8250.25n

* CHECK dout1_11 Vdout1_11ck164 = 1.8 time = 8250
.meas tran vdout1_11ck164 FIND v(dout1_11) AT=8250.25n

* CHECK dout1_12 Vdout1_12ck164 = 0 time = 8250
.meas tran vdout1_12ck164 FIND v(dout1_12) AT=8250.25n

* CHECK dout1_13 Vdout1_13ck164 = 1.8 time = 8250
.meas tran vdout1_13ck164 FIND v(dout1_13) AT=8250.25n

* CHECK dout1_14 Vdout1_14ck164 = 1.8 time = 8250
.meas tran vdout1_14ck164 FIND v(dout1_14) AT=8250.25n

* CHECK dout1_15 Vdout1_15ck164 = 0 time = 8250
.meas tran vdout1_15ck164 FIND v(dout1_15) AT=8250.25n

* CHECK dout1_0 Vdout1_0ck165 = 0 time = 8300
.meas tran vdout1_0ck165 FIND v(dout1_0) AT=8300.25n

* CHECK dout1_1 Vdout1_1ck165 = 0 time = 8300
.meas tran vdout1_1ck165 FIND v(dout1_1) AT=8300.25n

* CHECK dout1_2 Vdout1_2ck165 = 1.8 time = 8300
.meas tran vdout1_2ck165 FIND v(dout1_2) AT=8300.25n

* CHECK dout1_3 Vdout1_3ck165 = 1.8 time = 8300
.meas tran vdout1_3ck165 FIND v(dout1_3) AT=8300.25n

* CHECK dout1_4 Vdout1_4ck165 = 1.8 time = 8300
.meas tran vdout1_4ck165 FIND v(dout1_4) AT=8300.25n

* CHECK dout1_5 Vdout1_5ck165 = 1.8 time = 8300
.meas tran vdout1_5ck165 FIND v(dout1_5) AT=8300.25n

* CHECK dout1_6 Vdout1_6ck165 = 0 time = 8300
.meas tran vdout1_6ck165 FIND v(dout1_6) AT=8300.25n

* CHECK dout1_7 Vdout1_7ck165 = 0 time = 8300
.meas tran vdout1_7ck165 FIND v(dout1_7) AT=8300.25n

* CHECK dout1_8 Vdout1_8ck165 = 0 time = 8300
.meas tran vdout1_8ck165 FIND v(dout1_8) AT=8300.25n

* CHECK dout1_9 Vdout1_9ck165 = 0 time = 8300
.meas tran vdout1_9ck165 FIND v(dout1_9) AT=8300.25n

* CHECK dout1_10 Vdout1_10ck165 = 0 time = 8300
.meas tran vdout1_10ck165 FIND v(dout1_10) AT=8300.25n

* CHECK dout1_11 Vdout1_11ck165 = 0 time = 8300
.meas tran vdout1_11ck165 FIND v(dout1_11) AT=8300.25n

* CHECK dout1_12 Vdout1_12ck165 = 0 time = 8300
.meas tran vdout1_12ck165 FIND v(dout1_12) AT=8300.25n

* CHECK dout1_13 Vdout1_13ck165 = 0 time = 8300
.meas tran vdout1_13ck165 FIND v(dout1_13) AT=8300.25n

* CHECK dout1_14 Vdout1_14ck165 = 1.8 time = 8300
.meas tran vdout1_14ck165 FIND v(dout1_14) AT=8300.25n

* CHECK dout1_15 Vdout1_15ck165 = 1.8 time = 8300
.meas tran vdout1_15ck165 FIND v(dout1_15) AT=8300.25n

* CHECK dout1_0 Vdout1_0ck166 = 1.8 time = 8350
.meas tran vdout1_0ck166 FIND v(dout1_0) AT=8350.25n

* CHECK dout1_1 Vdout1_1ck166 = 1.8 time = 8350
.meas tran vdout1_1ck166 FIND v(dout1_1) AT=8350.25n

* CHECK dout1_2 Vdout1_2ck166 = 0 time = 8350
.meas tran vdout1_2ck166 FIND v(dout1_2) AT=8350.25n

* CHECK dout1_3 Vdout1_3ck166 = 0 time = 8350
.meas tran vdout1_3ck166 FIND v(dout1_3) AT=8350.25n

* CHECK dout1_4 Vdout1_4ck166 = 0 time = 8350
.meas tran vdout1_4ck166 FIND v(dout1_4) AT=8350.25n

* CHECK dout1_5 Vdout1_5ck166 = 0 time = 8350
.meas tran vdout1_5ck166 FIND v(dout1_5) AT=8350.25n

* CHECK dout1_6 Vdout1_6ck166 = 1.8 time = 8350
.meas tran vdout1_6ck166 FIND v(dout1_6) AT=8350.25n

* CHECK dout1_7 Vdout1_7ck166 = 0 time = 8350
.meas tran vdout1_7ck166 FIND v(dout1_7) AT=8350.25n

* CHECK dout1_8 Vdout1_8ck166 = 1.8 time = 8350
.meas tran vdout1_8ck166 FIND v(dout1_8) AT=8350.25n

* CHECK dout1_9 Vdout1_9ck166 = 0 time = 8350
.meas tran vdout1_9ck166 FIND v(dout1_9) AT=8350.25n

* CHECK dout1_10 Vdout1_10ck166 = 0 time = 8350
.meas tran vdout1_10ck166 FIND v(dout1_10) AT=8350.25n

* CHECK dout1_11 Vdout1_11ck166 = 1.8 time = 8350
.meas tran vdout1_11ck166 FIND v(dout1_11) AT=8350.25n

* CHECK dout1_12 Vdout1_12ck166 = 0 time = 8350
.meas tran vdout1_12ck166 FIND v(dout1_12) AT=8350.25n

* CHECK dout1_13 Vdout1_13ck166 = 1.8 time = 8350
.meas tran vdout1_13ck166 FIND v(dout1_13) AT=8350.25n

* CHECK dout1_14 Vdout1_14ck166 = 1.8 time = 8350
.meas tran vdout1_14ck166 FIND v(dout1_14) AT=8350.25n

* CHECK dout1_15 Vdout1_15ck166 = 1.8 time = 8350
.meas tran vdout1_15ck166 FIND v(dout1_15) AT=8350.25n

* CHECK dout1_0 Vdout1_0ck168 = 1.8 time = 8450
.meas tran vdout1_0ck168 FIND v(dout1_0) AT=8450.25n

* CHECK dout1_1 Vdout1_1ck168 = 1.8 time = 8450
.meas tran vdout1_1ck168 FIND v(dout1_1) AT=8450.25n

* CHECK dout1_2 Vdout1_2ck168 = 0 time = 8450
.meas tran vdout1_2ck168 FIND v(dout1_2) AT=8450.25n

* CHECK dout1_3 Vdout1_3ck168 = 0 time = 8450
.meas tran vdout1_3ck168 FIND v(dout1_3) AT=8450.25n

* CHECK dout1_4 Vdout1_4ck168 = 0 time = 8450
.meas tran vdout1_4ck168 FIND v(dout1_4) AT=8450.25n

* CHECK dout1_5 Vdout1_5ck168 = 0 time = 8450
.meas tran vdout1_5ck168 FIND v(dout1_5) AT=8450.25n

* CHECK dout1_6 Vdout1_6ck168 = 1.8 time = 8450
.meas tran vdout1_6ck168 FIND v(dout1_6) AT=8450.25n

* CHECK dout1_7 Vdout1_7ck168 = 0 time = 8450
.meas tran vdout1_7ck168 FIND v(dout1_7) AT=8450.25n

* CHECK dout1_8 Vdout1_8ck168 = 1.8 time = 8450
.meas tran vdout1_8ck168 FIND v(dout1_8) AT=8450.25n

* CHECK dout1_9 Vdout1_9ck168 = 0 time = 8450
.meas tran vdout1_9ck168 FIND v(dout1_9) AT=8450.25n

* CHECK dout1_10 Vdout1_10ck168 = 0 time = 8450
.meas tran vdout1_10ck168 FIND v(dout1_10) AT=8450.25n

* CHECK dout1_11 Vdout1_11ck168 = 1.8 time = 8450
.meas tran vdout1_11ck168 FIND v(dout1_11) AT=8450.25n

* CHECK dout1_12 Vdout1_12ck168 = 0 time = 8450
.meas tran vdout1_12ck168 FIND v(dout1_12) AT=8450.25n

* CHECK dout1_13 Vdout1_13ck168 = 1.8 time = 8450
.meas tran vdout1_13ck168 FIND v(dout1_13) AT=8450.25n

* CHECK dout1_14 Vdout1_14ck168 = 1.8 time = 8450
.meas tran vdout1_14ck168 FIND v(dout1_14) AT=8450.25n

* CHECK dout1_15 Vdout1_15ck168 = 1.8 time = 8450
.meas tran vdout1_15ck168 FIND v(dout1_15) AT=8450.25n

* CHECK dout1_0 Vdout1_0ck169 = 0 time = 8500
.meas tran vdout1_0ck169 FIND v(dout1_0) AT=8500.25n

* CHECK dout1_1 Vdout1_1ck169 = 0 time = 8500
.meas tran vdout1_1ck169 FIND v(dout1_1) AT=8500.25n

* CHECK dout1_2 Vdout1_2ck169 = 0 time = 8500
.meas tran vdout1_2ck169 FIND v(dout1_2) AT=8500.25n

* CHECK dout1_3 Vdout1_3ck169 = 0 time = 8500
.meas tran vdout1_3ck169 FIND v(dout1_3) AT=8500.25n

* CHECK dout1_4 Vdout1_4ck169 = 0 time = 8500
.meas tran vdout1_4ck169 FIND v(dout1_4) AT=8500.25n

* CHECK dout1_5 Vdout1_5ck169 = 1.8 time = 8500
.meas tran vdout1_5ck169 FIND v(dout1_5) AT=8500.25n

* CHECK dout1_6 Vdout1_6ck169 = 1.8 time = 8500
.meas tran vdout1_6ck169 FIND v(dout1_6) AT=8500.25n

* CHECK dout1_7 Vdout1_7ck169 = 1.8 time = 8500
.meas tran vdout1_7ck169 FIND v(dout1_7) AT=8500.25n

* CHECK dout1_8 Vdout1_8ck169 = 0 time = 8500
.meas tran vdout1_8ck169 FIND v(dout1_8) AT=8500.25n

* CHECK dout1_9 Vdout1_9ck169 = 0 time = 8500
.meas tran vdout1_9ck169 FIND v(dout1_9) AT=8500.25n

* CHECK dout1_10 Vdout1_10ck169 = 1.8 time = 8500
.meas tran vdout1_10ck169 FIND v(dout1_10) AT=8500.25n

* CHECK dout1_11 Vdout1_11ck169 = 0 time = 8500
.meas tran vdout1_11ck169 FIND v(dout1_11) AT=8500.25n

* CHECK dout1_12 Vdout1_12ck169 = 0 time = 8500
.meas tran vdout1_12ck169 FIND v(dout1_12) AT=8500.25n

* CHECK dout1_13 Vdout1_13ck169 = 1.8 time = 8500
.meas tran vdout1_13ck169 FIND v(dout1_13) AT=8500.25n

* CHECK dout1_14 Vdout1_14ck169 = 0 time = 8500
.meas tran vdout1_14ck169 FIND v(dout1_14) AT=8500.25n

* CHECK dout1_15 Vdout1_15ck169 = 0 time = 8500
.meas tran vdout1_15ck169 FIND v(dout1_15) AT=8500.25n

* CHECK dout1_0 Vdout1_0ck171 = 1.8 time = 8600
.meas tran vdout1_0ck171 FIND v(dout1_0) AT=8600.25n

* CHECK dout1_1 Vdout1_1ck171 = 0 time = 8600
.meas tran vdout1_1ck171 FIND v(dout1_1) AT=8600.25n

* CHECK dout1_2 Vdout1_2ck171 = 0 time = 8600
.meas tran vdout1_2ck171 FIND v(dout1_2) AT=8600.25n

* CHECK dout1_3 Vdout1_3ck171 = 0 time = 8600
.meas tran vdout1_3ck171 FIND v(dout1_3) AT=8600.25n

* CHECK dout1_4 Vdout1_4ck171 = 0 time = 8600
.meas tran vdout1_4ck171 FIND v(dout1_4) AT=8600.25n

* CHECK dout1_5 Vdout1_5ck171 = 0 time = 8600
.meas tran vdout1_5ck171 FIND v(dout1_5) AT=8600.25n

* CHECK dout1_6 Vdout1_6ck171 = 1.8 time = 8600
.meas tran vdout1_6ck171 FIND v(dout1_6) AT=8600.25n

* CHECK dout1_7 Vdout1_7ck171 = 0 time = 8600
.meas tran vdout1_7ck171 FIND v(dout1_7) AT=8600.25n

* CHECK dout1_8 Vdout1_8ck171 = 0 time = 8600
.meas tran vdout1_8ck171 FIND v(dout1_8) AT=8600.25n

* CHECK dout1_9 Vdout1_9ck171 = 0 time = 8600
.meas tran vdout1_9ck171 FIND v(dout1_9) AT=8600.25n

* CHECK dout1_10 Vdout1_10ck171 = 0 time = 8600
.meas tran vdout1_10ck171 FIND v(dout1_10) AT=8600.25n

* CHECK dout1_11 Vdout1_11ck171 = 0 time = 8600
.meas tran vdout1_11ck171 FIND v(dout1_11) AT=8600.25n

* CHECK dout1_12 Vdout1_12ck171 = 0 time = 8600
.meas tran vdout1_12ck171 FIND v(dout1_12) AT=8600.25n

* CHECK dout1_13 Vdout1_13ck171 = 0 time = 8600
.meas tran vdout1_13ck171 FIND v(dout1_13) AT=8600.25n

* CHECK dout1_14 Vdout1_14ck171 = 1.8 time = 8600
.meas tran vdout1_14ck171 FIND v(dout1_14) AT=8600.25n

* CHECK dout1_15 Vdout1_15ck171 = 1.8 time = 8600
.meas tran vdout1_15ck171 FIND v(dout1_15) AT=8600.25n

* CHECK dout1_0 Vdout1_0ck172 = 1.8 time = 8650
.meas tran vdout1_0ck172 FIND v(dout1_0) AT=8650.25n

* CHECK dout1_1 Vdout1_1ck172 = 1.8 time = 8650
.meas tran vdout1_1ck172 FIND v(dout1_1) AT=8650.25n

* CHECK dout1_2 Vdout1_2ck172 = 0 time = 8650
.meas tran vdout1_2ck172 FIND v(dout1_2) AT=8650.25n

* CHECK dout1_3 Vdout1_3ck172 = 0 time = 8650
.meas tran vdout1_3ck172 FIND v(dout1_3) AT=8650.25n

* CHECK dout1_4 Vdout1_4ck172 = 0 time = 8650
.meas tran vdout1_4ck172 FIND v(dout1_4) AT=8650.25n

* CHECK dout1_5 Vdout1_5ck172 = 0 time = 8650
.meas tran vdout1_5ck172 FIND v(dout1_5) AT=8650.25n

* CHECK dout1_6 Vdout1_6ck172 = 1.8 time = 8650
.meas tran vdout1_6ck172 FIND v(dout1_6) AT=8650.25n

* CHECK dout1_7 Vdout1_7ck172 = 0 time = 8650
.meas tran vdout1_7ck172 FIND v(dout1_7) AT=8650.25n

* CHECK dout1_8 Vdout1_8ck172 = 1.8 time = 8650
.meas tran vdout1_8ck172 FIND v(dout1_8) AT=8650.25n

* CHECK dout1_9 Vdout1_9ck172 = 0 time = 8650
.meas tran vdout1_9ck172 FIND v(dout1_9) AT=8650.25n

* CHECK dout1_10 Vdout1_10ck172 = 0 time = 8650
.meas tran vdout1_10ck172 FIND v(dout1_10) AT=8650.25n

* CHECK dout1_11 Vdout1_11ck172 = 1.8 time = 8650
.meas tran vdout1_11ck172 FIND v(dout1_11) AT=8650.25n

* CHECK dout1_12 Vdout1_12ck172 = 0 time = 8650
.meas tran vdout1_12ck172 FIND v(dout1_12) AT=8650.25n

* CHECK dout1_13 Vdout1_13ck172 = 1.8 time = 8650
.meas tran vdout1_13ck172 FIND v(dout1_13) AT=8650.25n

* CHECK dout1_14 Vdout1_14ck172 = 1.8 time = 8650
.meas tran vdout1_14ck172 FIND v(dout1_14) AT=8650.25n

* CHECK dout1_15 Vdout1_15ck172 = 1.8 time = 8650
.meas tran vdout1_15ck172 FIND v(dout1_15) AT=8650.25n

* CHECK dout1_0 Vdout1_0ck177 = 0 time = 8900
.meas tran vdout1_0ck177 FIND v(dout1_0) AT=8900.25n

* CHECK dout1_1 Vdout1_1ck177 = 0 time = 8900
.meas tran vdout1_1ck177 FIND v(dout1_1) AT=8900.25n

* CHECK dout1_2 Vdout1_2ck177 = 0 time = 8900
.meas tran vdout1_2ck177 FIND v(dout1_2) AT=8900.25n

* CHECK dout1_3 Vdout1_3ck177 = 0 time = 8900
.meas tran vdout1_3ck177 FIND v(dout1_3) AT=8900.25n

* CHECK dout1_4 Vdout1_4ck177 = 0 time = 8900
.meas tran vdout1_4ck177 FIND v(dout1_4) AT=8900.25n

* CHECK dout1_5 Vdout1_5ck177 = 0 time = 8900
.meas tran vdout1_5ck177 FIND v(dout1_5) AT=8900.25n

* CHECK dout1_6 Vdout1_6ck177 = 1.8 time = 8900
.meas tran vdout1_6ck177 FIND v(dout1_6) AT=8900.25n

* CHECK dout1_7 Vdout1_7ck177 = 1.8 time = 8900
.meas tran vdout1_7ck177 FIND v(dout1_7) AT=8900.25n

* CHECK dout1_8 Vdout1_8ck177 = 0 time = 8900
.meas tran vdout1_8ck177 FIND v(dout1_8) AT=8900.25n

* CHECK dout1_9 Vdout1_9ck177 = 0 time = 8900
.meas tran vdout1_9ck177 FIND v(dout1_9) AT=8900.25n

* CHECK dout1_10 Vdout1_10ck177 = 1.8 time = 8900
.meas tran vdout1_10ck177 FIND v(dout1_10) AT=8900.25n

* CHECK dout1_11 Vdout1_11ck177 = 0 time = 8900
.meas tran vdout1_11ck177 FIND v(dout1_11) AT=8900.25n

* CHECK dout1_12 Vdout1_12ck177 = 1.8 time = 8900
.meas tran vdout1_12ck177 FIND v(dout1_12) AT=8900.25n

* CHECK dout1_13 Vdout1_13ck177 = 0 time = 8900
.meas tran vdout1_13ck177 FIND v(dout1_13) AT=8900.25n

* CHECK dout1_14 Vdout1_14ck177 = 1.8 time = 8900
.meas tran vdout1_14ck177 FIND v(dout1_14) AT=8900.25n

* CHECK dout1_15 Vdout1_15ck177 = 1.8 time = 8900
.meas tran vdout1_15ck177 FIND v(dout1_15) AT=8900.25n

* CHECK dout1_0 Vdout1_0ck178 = 0 time = 8950
.meas tran vdout1_0ck178 FIND v(dout1_0) AT=8950.25n

* CHECK dout1_1 Vdout1_1ck178 = 0 time = 8950
.meas tran vdout1_1ck178 FIND v(dout1_1) AT=8950.25n

* CHECK dout1_2 Vdout1_2ck178 = 0 time = 8950
.meas tran vdout1_2ck178 FIND v(dout1_2) AT=8950.25n

* CHECK dout1_3 Vdout1_3ck178 = 0 time = 8950
.meas tran vdout1_3ck178 FIND v(dout1_3) AT=8950.25n

* CHECK dout1_4 Vdout1_4ck178 = 0 time = 8950
.meas tran vdout1_4ck178 FIND v(dout1_4) AT=8950.25n

* CHECK dout1_5 Vdout1_5ck178 = 1.8 time = 8950
.meas tran vdout1_5ck178 FIND v(dout1_5) AT=8950.25n

* CHECK dout1_6 Vdout1_6ck178 = 0 time = 8950
.meas tran vdout1_6ck178 FIND v(dout1_6) AT=8950.25n

* CHECK dout1_7 Vdout1_7ck178 = 0 time = 8950
.meas tran vdout1_7ck178 FIND v(dout1_7) AT=8950.25n

* CHECK dout1_8 Vdout1_8ck178 = 1.8 time = 8950
.meas tran vdout1_8ck178 FIND v(dout1_8) AT=8950.25n

* CHECK dout1_9 Vdout1_9ck178 = 0 time = 8950
.meas tran vdout1_9ck178 FIND v(dout1_9) AT=8950.25n

* CHECK dout1_10 Vdout1_10ck178 = 1.8 time = 8950
.meas tran vdout1_10ck178 FIND v(dout1_10) AT=8950.25n

* CHECK dout1_11 Vdout1_11ck178 = 0 time = 8950
.meas tran vdout1_11ck178 FIND v(dout1_11) AT=8950.25n

* CHECK dout1_12 Vdout1_12ck178 = 0 time = 8950
.meas tran vdout1_12ck178 FIND v(dout1_12) AT=8950.25n

* CHECK dout1_13 Vdout1_13ck178 = 1.8 time = 8950
.meas tran vdout1_13ck178 FIND v(dout1_13) AT=8950.25n

* CHECK dout1_14 Vdout1_14ck178 = 0 time = 8950
.meas tran vdout1_14ck178 FIND v(dout1_14) AT=8950.25n

* CHECK dout1_15 Vdout1_15ck178 = 1.8 time = 8950
.meas tran vdout1_15ck178 FIND v(dout1_15) AT=8950.25n

* CHECK dout1_0 Vdout1_0ck179 = 1.8 time = 9000
.meas tran vdout1_0ck179 FIND v(dout1_0) AT=9000.25n

* CHECK dout1_1 Vdout1_1ck179 = 1.8 time = 9000
.meas tran vdout1_1ck179 FIND v(dout1_1) AT=9000.25n

* CHECK dout1_2 Vdout1_2ck179 = 0 time = 9000
.meas tran vdout1_2ck179 FIND v(dout1_2) AT=9000.25n

* CHECK dout1_3 Vdout1_3ck179 = 0 time = 9000
.meas tran vdout1_3ck179 FIND v(dout1_3) AT=9000.25n

* CHECK dout1_4 Vdout1_4ck179 = 0 time = 9000
.meas tran vdout1_4ck179 FIND v(dout1_4) AT=9000.25n

* CHECK dout1_5 Vdout1_5ck179 = 0 time = 9000
.meas tran vdout1_5ck179 FIND v(dout1_5) AT=9000.25n

* CHECK dout1_6 Vdout1_6ck179 = 1.8 time = 9000
.meas tran vdout1_6ck179 FIND v(dout1_6) AT=9000.25n

* CHECK dout1_7 Vdout1_7ck179 = 0 time = 9000
.meas tran vdout1_7ck179 FIND v(dout1_7) AT=9000.25n

* CHECK dout1_8 Vdout1_8ck179 = 1.8 time = 9000
.meas tran vdout1_8ck179 FIND v(dout1_8) AT=9000.25n

* CHECK dout1_9 Vdout1_9ck179 = 0 time = 9000
.meas tran vdout1_9ck179 FIND v(dout1_9) AT=9000.25n

* CHECK dout1_10 Vdout1_10ck179 = 0 time = 9000
.meas tran vdout1_10ck179 FIND v(dout1_10) AT=9000.25n

* CHECK dout1_11 Vdout1_11ck179 = 1.8 time = 9000
.meas tran vdout1_11ck179 FIND v(dout1_11) AT=9000.25n

* CHECK dout1_12 Vdout1_12ck179 = 0 time = 9000
.meas tran vdout1_12ck179 FIND v(dout1_12) AT=9000.25n

* CHECK dout1_13 Vdout1_13ck179 = 1.8 time = 9000
.meas tran vdout1_13ck179 FIND v(dout1_13) AT=9000.25n

* CHECK dout1_14 Vdout1_14ck179 = 1.8 time = 9000
.meas tran vdout1_14ck179 FIND v(dout1_14) AT=9000.25n

* CHECK dout1_15 Vdout1_15ck179 = 1.8 time = 9000
.meas tran vdout1_15ck179 FIND v(dout1_15) AT=9000.25n

* CHECK dout1_0 Vdout1_0ck180 = 0 time = 9050
.meas tran vdout1_0ck180 FIND v(dout1_0) AT=9050.25n

* CHECK dout1_1 Vdout1_1ck180 = 1.8 time = 9050
.meas tran vdout1_1ck180 FIND v(dout1_1) AT=9050.25n

* CHECK dout1_2 Vdout1_2ck180 = 1.8 time = 9050
.meas tran vdout1_2ck180 FIND v(dout1_2) AT=9050.25n

* CHECK dout1_3 Vdout1_3ck180 = 0 time = 9050
.meas tran vdout1_3ck180 FIND v(dout1_3) AT=9050.25n

* CHECK dout1_4 Vdout1_4ck180 = 1.8 time = 9050
.meas tran vdout1_4ck180 FIND v(dout1_4) AT=9050.25n

* CHECK dout1_5 Vdout1_5ck180 = 0 time = 9050
.meas tran vdout1_5ck180 FIND v(dout1_5) AT=9050.25n

* CHECK dout1_6 Vdout1_6ck180 = 0 time = 9050
.meas tran vdout1_6ck180 FIND v(dout1_6) AT=9050.25n

* CHECK dout1_7 Vdout1_7ck180 = 0 time = 9050
.meas tran vdout1_7ck180 FIND v(dout1_7) AT=9050.25n

* CHECK dout1_8 Vdout1_8ck180 = 0 time = 9050
.meas tran vdout1_8ck180 FIND v(dout1_8) AT=9050.25n

* CHECK dout1_9 Vdout1_9ck180 = 0 time = 9050
.meas tran vdout1_9ck180 FIND v(dout1_9) AT=9050.25n

* CHECK dout1_10 Vdout1_10ck180 = 0 time = 9050
.meas tran vdout1_10ck180 FIND v(dout1_10) AT=9050.25n

* CHECK dout1_11 Vdout1_11ck180 = 1.8 time = 9050
.meas tran vdout1_11ck180 FIND v(dout1_11) AT=9050.25n

* CHECK dout1_12 Vdout1_12ck180 = 0 time = 9050
.meas tran vdout1_12ck180 FIND v(dout1_12) AT=9050.25n

* CHECK dout1_13 Vdout1_13ck180 = 0 time = 9050
.meas tran vdout1_13ck180 FIND v(dout1_13) AT=9050.25n

* CHECK dout1_14 Vdout1_14ck180 = 0 time = 9050
.meas tran vdout1_14ck180 FIND v(dout1_14) AT=9050.25n

* CHECK dout1_15 Vdout1_15ck180 = 0 time = 9050
.meas tran vdout1_15ck180 FIND v(dout1_15) AT=9050.25n

* CHECK dout1_0 Vdout1_0ck182 = 1.8 time = 9150
.meas tran vdout1_0ck182 FIND v(dout1_0) AT=9150.25n

* CHECK dout1_1 Vdout1_1ck182 = 0 time = 9150
.meas tran vdout1_1ck182 FIND v(dout1_1) AT=9150.25n

* CHECK dout1_2 Vdout1_2ck182 = 1.8 time = 9150
.meas tran vdout1_2ck182 FIND v(dout1_2) AT=9150.25n

* CHECK dout1_3 Vdout1_3ck182 = 0 time = 9150
.meas tran vdout1_3ck182 FIND v(dout1_3) AT=9150.25n

* CHECK dout1_4 Vdout1_4ck182 = 1.8 time = 9150
.meas tran vdout1_4ck182 FIND v(dout1_4) AT=9150.25n

* CHECK dout1_5 Vdout1_5ck182 = 1.8 time = 9150
.meas tran vdout1_5ck182 FIND v(dout1_5) AT=9150.25n

* CHECK dout1_6 Vdout1_6ck182 = 0 time = 9150
.meas tran vdout1_6ck182 FIND v(dout1_6) AT=9150.25n

* CHECK dout1_7 Vdout1_7ck182 = 1.8 time = 9150
.meas tran vdout1_7ck182 FIND v(dout1_7) AT=9150.25n

* CHECK dout1_8 Vdout1_8ck182 = 1.8 time = 9150
.meas tran vdout1_8ck182 FIND v(dout1_8) AT=9150.25n

* CHECK dout1_9 Vdout1_9ck182 = 0 time = 9150
.meas tran vdout1_9ck182 FIND v(dout1_9) AT=9150.25n

* CHECK dout1_10 Vdout1_10ck182 = 0 time = 9150
.meas tran vdout1_10ck182 FIND v(dout1_10) AT=9150.25n

* CHECK dout1_11 Vdout1_11ck182 = 1.8 time = 9150
.meas tran vdout1_11ck182 FIND v(dout1_11) AT=9150.25n

* CHECK dout1_12 Vdout1_12ck182 = 0 time = 9150
.meas tran vdout1_12ck182 FIND v(dout1_12) AT=9150.25n

* CHECK dout1_13 Vdout1_13ck182 = 1.8 time = 9150
.meas tran vdout1_13ck182 FIND v(dout1_13) AT=9150.25n

* CHECK dout1_14 Vdout1_14ck182 = 0 time = 9150
.meas tran vdout1_14ck182 FIND v(dout1_14) AT=9150.25n

* CHECK dout1_15 Vdout1_15ck182 = 0 time = 9150
.meas tran vdout1_15ck182 FIND v(dout1_15) AT=9150.25n

* CHECK dout1_0 Vdout1_0ck183 = 0 time = 9200
.meas tran vdout1_0ck183 FIND v(dout1_0) AT=9200.25n

* CHECK dout1_1 Vdout1_1ck183 = 1.8 time = 9200
.meas tran vdout1_1ck183 FIND v(dout1_1) AT=9200.25n

* CHECK dout1_2 Vdout1_2ck183 = 1.8 time = 9200
.meas tran vdout1_2ck183 FIND v(dout1_2) AT=9200.25n

* CHECK dout1_3 Vdout1_3ck183 = 0 time = 9200
.meas tran vdout1_3ck183 FIND v(dout1_3) AT=9200.25n

* CHECK dout1_4 Vdout1_4ck183 = 0 time = 9200
.meas tran vdout1_4ck183 FIND v(dout1_4) AT=9200.25n

* CHECK dout1_5 Vdout1_5ck183 = 0 time = 9200
.meas tran vdout1_5ck183 FIND v(dout1_5) AT=9200.25n

* CHECK dout1_6 Vdout1_6ck183 = 1.8 time = 9200
.meas tran vdout1_6ck183 FIND v(dout1_6) AT=9200.25n

* CHECK dout1_7 Vdout1_7ck183 = 0 time = 9200
.meas tran vdout1_7ck183 FIND v(dout1_7) AT=9200.25n

* CHECK dout1_8 Vdout1_8ck183 = 1.8 time = 9200
.meas tran vdout1_8ck183 FIND v(dout1_8) AT=9200.25n

* CHECK dout1_9 Vdout1_9ck183 = 0 time = 9200
.meas tran vdout1_9ck183 FIND v(dout1_9) AT=9200.25n

* CHECK dout1_10 Vdout1_10ck183 = 0 time = 9200
.meas tran vdout1_10ck183 FIND v(dout1_10) AT=9200.25n

* CHECK dout1_11 Vdout1_11ck183 = 0 time = 9200
.meas tran vdout1_11ck183 FIND v(dout1_11) AT=9200.25n

* CHECK dout1_12 Vdout1_12ck183 = 0 time = 9200
.meas tran vdout1_12ck183 FIND v(dout1_12) AT=9200.25n

* CHECK dout1_13 Vdout1_13ck183 = 0 time = 9200
.meas tran vdout1_13ck183 FIND v(dout1_13) AT=9200.25n

* CHECK dout1_14 Vdout1_14ck183 = 0 time = 9200
.meas tran vdout1_14ck183 FIND v(dout1_14) AT=9200.25n

* CHECK dout1_15 Vdout1_15ck183 = 0 time = 9200
.meas tran vdout1_15ck183 FIND v(dout1_15) AT=9200.25n

* CHECK dout1_0 Vdout1_0ck184 = 0 time = 9250
.meas tran vdout1_0ck184 FIND v(dout1_0) AT=9250.25n

* CHECK dout1_1 Vdout1_1ck184 = 0 time = 9250
.meas tran vdout1_1ck184 FIND v(dout1_1) AT=9250.25n

* CHECK dout1_2 Vdout1_2ck184 = 1.8 time = 9250
.meas tran vdout1_2ck184 FIND v(dout1_2) AT=9250.25n

* CHECK dout1_3 Vdout1_3ck184 = 0 time = 9250
.meas tran vdout1_3ck184 FIND v(dout1_3) AT=9250.25n

* CHECK dout1_4 Vdout1_4ck184 = 1.8 time = 9250
.meas tran vdout1_4ck184 FIND v(dout1_4) AT=9250.25n

* CHECK dout1_5 Vdout1_5ck184 = 0 time = 9250
.meas tran vdout1_5ck184 FIND v(dout1_5) AT=9250.25n

* CHECK dout1_6 Vdout1_6ck184 = 1.8 time = 9250
.meas tran vdout1_6ck184 FIND v(dout1_6) AT=9250.25n

* CHECK dout1_7 Vdout1_7ck184 = 1.8 time = 9250
.meas tran vdout1_7ck184 FIND v(dout1_7) AT=9250.25n

* CHECK dout1_8 Vdout1_8ck184 = 1.8 time = 9250
.meas tran vdout1_8ck184 FIND v(dout1_8) AT=9250.25n

* CHECK dout1_9 Vdout1_9ck184 = 0 time = 9250
.meas tran vdout1_9ck184 FIND v(dout1_9) AT=9250.25n

* CHECK dout1_10 Vdout1_10ck184 = 0 time = 9250
.meas tran vdout1_10ck184 FIND v(dout1_10) AT=9250.25n

* CHECK dout1_11 Vdout1_11ck184 = 0 time = 9250
.meas tran vdout1_11ck184 FIND v(dout1_11) AT=9250.25n

* CHECK dout1_12 Vdout1_12ck184 = 1.8 time = 9250
.meas tran vdout1_12ck184 FIND v(dout1_12) AT=9250.25n

* CHECK dout1_13 Vdout1_13ck184 = 1.8 time = 9250
.meas tran vdout1_13ck184 FIND v(dout1_13) AT=9250.25n

* CHECK dout1_14 Vdout1_14ck184 = 0 time = 9250
.meas tran vdout1_14ck184 FIND v(dout1_14) AT=9250.25n

* CHECK dout1_15 Vdout1_15ck184 = 1.8 time = 9250
.meas tran vdout1_15ck184 FIND v(dout1_15) AT=9250.25n

* CHECK dout1_0 Vdout1_0ck189 = 1.8 time = 9500
.meas tran vdout1_0ck189 FIND v(dout1_0) AT=9500.25n

* CHECK dout1_1 Vdout1_1ck189 = 0 time = 9500
.meas tran vdout1_1ck189 FIND v(dout1_1) AT=9500.25n

* CHECK dout1_2 Vdout1_2ck189 = 1.8 time = 9500
.meas tran vdout1_2ck189 FIND v(dout1_2) AT=9500.25n

* CHECK dout1_3 Vdout1_3ck189 = 0 time = 9500
.meas tran vdout1_3ck189 FIND v(dout1_3) AT=9500.25n

* CHECK dout1_4 Vdout1_4ck189 = 1.8 time = 9500
.meas tran vdout1_4ck189 FIND v(dout1_4) AT=9500.25n

* CHECK dout1_5 Vdout1_5ck189 = 1.8 time = 9500
.meas tran vdout1_5ck189 FIND v(dout1_5) AT=9500.25n

* CHECK dout1_6 Vdout1_6ck189 = 0 time = 9500
.meas tran vdout1_6ck189 FIND v(dout1_6) AT=9500.25n

* CHECK dout1_7 Vdout1_7ck189 = 1.8 time = 9500
.meas tran vdout1_7ck189 FIND v(dout1_7) AT=9500.25n

* CHECK dout1_8 Vdout1_8ck189 = 1.8 time = 9500
.meas tran vdout1_8ck189 FIND v(dout1_8) AT=9500.25n

* CHECK dout1_9 Vdout1_9ck189 = 0 time = 9500
.meas tran vdout1_9ck189 FIND v(dout1_9) AT=9500.25n

* CHECK dout1_10 Vdout1_10ck189 = 0 time = 9500
.meas tran vdout1_10ck189 FIND v(dout1_10) AT=9500.25n

* CHECK dout1_11 Vdout1_11ck189 = 1.8 time = 9500
.meas tran vdout1_11ck189 FIND v(dout1_11) AT=9500.25n

* CHECK dout1_12 Vdout1_12ck189 = 0 time = 9500
.meas tran vdout1_12ck189 FIND v(dout1_12) AT=9500.25n

* CHECK dout1_13 Vdout1_13ck189 = 1.8 time = 9500
.meas tran vdout1_13ck189 FIND v(dout1_13) AT=9500.25n

* CHECK dout1_14 Vdout1_14ck189 = 0 time = 9500
.meas tran vdout1_14ck189 FIND v(dout1_14) AT=9500.25n

* CHECK dout1_15 Vdout1_15ck189 = 0 time = 9500
.meas tran vdout1_15ck189 FIND v(dout1_15) AT=9500.25n

* CHECK dout1_0 Vdout1_0ck190 = 0 time = 9550
.meas tran vdout1_0ck190 FIND v(dout1_0) AT=9550.25n

* CHECK dout1_1 Vdout1_1ck190 = 0 time = 9550
.meas tran vdout1_1ck190 FIND v(dout1_1) AT=9550.25n

* CHECK dout1_2 Vdout1_2ck190 = 0 time = 9550
.meas tran vdout1_2ck190 FIND v(dout1_2) AT=9550.25n

* CHECK dout1_3 Vdout1_3ck190 = 0 time = 9550
.meas tran vdout1_3ck190 FIND v(dout1_3) AT=9550.25n

* CHECK dout1_4 Vdout1_4ck190 = 0 time = 9550
.meas tran vdout1_4ck190 FIND v(dout1_4) AT=9550.25n

* CHECK dout1_5 Vdout1_5ck190 = 1.8 time = 9550
.meas tran vdout1_5ck190 FIND v(dout1_5) AT=9550.25n

* CHECK dout1_6 Vdout1_6ck190 = 0 time = 9550
.meas tran vdout1_6ck190 FIND v(dout1_6) AT=9550.25n

* CHECK dout1_7 Vdout1_7ck190 = 0 time = 9550
.meas tran vdout1_7ck190 FIND v(dout1_7) AT=9550.25n

* CHECK dout1_8 Vdout1_8ck190 = 1.8 time = 9550
.meas tran vdout1_8ck190 FIND v(dout1_8) AT=9550.25n

* CHECK dout1_9 Vdout1_9ck190 = 0 time = 9550
.meas tran vdout1_9ck190 FIND v(dout1_9) AT=9550.25n

* CHECK dout1_10 Vdout1_10ck190 = 1.8 time = 9550
.meas tran vdout1_10ck190 FIND v(dout1_10) AT=9550.25n

* CHECK dout1_11 Vdout1_11ck190 = 0 time = 9550
.meas tran vdout1_11ck190 FIND v(dout1_11) AT=9550.25n

* CHECK dout1_12 Vdout1_12ck190 = 0 time = 9550
.meas tran vdout1_12ck190 FIND v(dout1_12) AT=9550.25n

* CHECK dout1_13 Vdout1_13ck190 = 1.8 time = 9550
.meas tran vdout1_13ck190 FIND v(dout1_13) AT=9550.25n

* CHECK dout1_14 Vdout1_14ck190 = 0 time = 9550
.meas tran vdout1_14ck190 FIND v(dout1_14) AT=9550.25n

* CHECK dout1_15 Vdout1_15ck190 = 1.8 time = 9550
.meas tran vdout1_15ck190 FIND v(dout1_15) AT=9550.25n

* CHECK dout1_0 Vdout1_0ck191 = 0 time = 9600
.meas tran vdout1_0ck191 FIND v(dout1_0) AT=9600.25n

* CHECK dout1_1 Vdout1_1ck191 = 0 time = 9600
.meas tran vdout1_1ck191 FIND v(dout1_1) AT=9600.25n

* CHECK dout1_2 Vdout1_2ck191 = 0 time = 9600
.meas tran vdout1_2ck191 FIND v(dout1_2) AT=9600.25n

* CHECK dout1_3 Vdout1_3ck191 = 0 time = 9600
.meas tran vdout1_3ck191 FIND v(dout1_3) AT=9600.25n

* CHECK dout1_4 Vdout1_4ck191 = 0 time = 9600
.meas tran vdout1_4ck191 FIND v(dout1_4) AT=9600.25n

* CHECK dout1_5 Vdout1_5ck191 = 1.8 time = 9600
.meas tran vdout1_5ck191 FIND v(dout1_5) AT=9600.25n

* CHECK dout1_6 Vdout1_6ck191 = 0 time = 9600
.meas tran vdout1_6ck191 FIND v(dout1_6) AT=9600.25n

* CHECK dout1_7 Vdout1_7ck191 = 0 time = 9600
.meas tran vdout1_7ck191 FIND v(dout1_7) AT=9600.25n

* CHECK dout1_8 Vdout1_8ck191 = 1.8 time = 9600
.meas tran vdout1_8ck191 FIND v(dout1_8) AT=9600.25n

* CHECK dout1_9 Vdout1_9ck191 = 0 time = 9600
.meas tran vdout1_9ck191 FIND v(dout1_9) AT=9600.25n

* CHECK dout1_10 Vdout1_10ck191 = 1.8 time = 9600
.meas tran vdout1_10ck191 FIND v(dout1_10) AT=9600.25n

* CHECK dout1_11 Vdout1_11ck191 = 0 time = 9600
.meas tran vdout1_11ck191 FIND v(dout1_11) AT=9600.25n

* CHECK dout1_12 Vdout1_12ck191 = 0 time = 9600
.meas tran vdout1_12ck191 FIND v(dout1_12) AT=9600.25n

* CHECK dout1_13 Vdout1_13ck191 = 1.8 time = 9600
.meas tran vdout1_13ck191 FIND v(dout1_13) AT=9600.25n

* CHECK dout1_14 Vdout1_14ck191 = 0 time = 9600
.meas tran vdout1_14ck191 FIND v(dout1_14) AT=9600.25n

* CHECK dout1_15 Vdout1_15ck191 = 1.8 time = 9600
.meas tran vdout1_15ck191 FIND v(dout1_15) AT=9600.25n

* CHECK dout1_0 Vdout1_0ck192 = 1.8 time = 9650
.meas tran vdout1_0ck192 FIND v(dout1_0) AT=9650.25n

* CHECK dout1_1 Vdout1_1ck192 = 0 time = 9650
.meas tran vdout1_1ck192 FIND v(dout1_1) AT=9650.25n

* CHECK dout1_2 Vdout1_2ck192 = 0 time = 9650
.meas tran vdout1_2ck192 FIND v(dout1_2) AT=9650.25n

* CHECK dout1_3 Vdout1_3ck192 = 0 time = 9650
.meas tran vdout1_3ck192 FIND v(dout1_3) AT=9650.25n

* CHECK dout1_4 Vdout1_4ck192 = 0 time = 9650
.meas tran vdout1_4ck192 FIND v(dout1_4) AT=9650.25n

* CHECK dout1_5 Vdout1_5ck192 = 0 time = 9650
.meas tran vdout1_5ck192 FIND v(dout1_5) AT=9650.25n

* CHECK dout1_6 Vdout1_6ck192 = 1.8 time = 9650
.meas tran vdout1_6ck192 FIND v(dout1_6) AT=9650.25n

* CHECK dout1_7 Vdout1_7ck192 = 0 time = 9650
.meas tran vdout1_7ck192 FIND v(dout1_7) AT=9650.25n

* CHECK dout1_8 Vdout1_8ck192 = 0 time = 9650
.meas tran vdout1_8ck192 FIND v(dout1_8) AT=9650.25n

* CHECK dout1_9 Vdout1_9ck192 = 0 time = 9650
.meas tran vdout1_9ck192 FIND v(dout1_9) AT=9650.25n

* CHECK dout1_10 Vdout1_10ck192 = 0 time = 9650
.meas tran vdout1_10ck192 FIND v(dout1_10) AT=9650.25n

* CHECK dout1_11 Vdout1_11ck192 = 0 time = 9650
.meas tran vdout1_11ck192 FIND v(dout1_11) AT=9650.25n

* CHECK dout1_12 Vdout1_12ck192 = 0 time = 9650
.meas tran vdout1_12ck192 FIND v(dout1_12) AT=9650.25n

* CHECK dout1_13 Vdout1_13ck192 = 0 time = 9650
.meas tran vdout1_13ck192 FIND v(dout1_13) AT=9650.25n

* CHECK dout1_14 Vdout1_14ck192 = 1.8 time = 9650
.meas tran vdout1_14ck192 FIND v(dout1_14) AT=9650.25n

* CHECK dout1_15 Vdout1_15ck192 = 1.8 time = 9650
.meas tran vdout1_15ck192 FIND v(dout1_15) AT=9650.25n

* CHECK dout1_0 Vdout1_0ck193 = 0 time = 9700
.meas tran vdout1_0ck193 FIND v(dout1_0) AT=9700.25n

* CHECK dout1_1 Vdout1_1ck193 = 0 time = 9700
.meas tran vdout1_1ck193 FIND v(dout1_1) AT=9700.25n

* CHECK dout1_2 Vdout1_2ck193 = 0 time = 9700
.meas tran vdout1_2ck193 FIND v(dout1_2) AT=9700.25n

* CHECK dout1_3 Vdout1_3ck193 = 0 time = 9700
.meas tran vdout1_3ck193 FIND v(dout1_3) AT=9700.25n

* CHECK dout1_4 Vdout1_4ck193 = 0 time = 9700
.meas tran vdout1_4ck193 FIND v(dout1_4) AT=9700.25n

* CHECK dout1_5 Vdout1_5ck193 = 1.8 time = 9700
.meas tran vdout1_5ck193 FIND v(dout1_5) AT=9700.25n

* CHECK dout1_6 Vdout1_6ck193 = 0 time = 9700
.meas tran vdout1_6ck193 FIND v(dout1_6) AT=9700.25n

* CHECK dout1_7 Vdout1_7ck193 = 0 time = 9700
.meas tran vdout1_7ck193 FIND v(dout1_7) AT=9700.25n

* CHECK dout1_8 Vdout1_8ck193 = 1.8 time = 9700
.meas tran vdout1_8ck193 FIND v(dout1_8) AT=9700.25n

* CHECK dout1_9 Vdout1_9ck193 = 0 time = 9700
.meas tran vdout1_9ck193 FIND v(dout1_9) AT=9700.25n

* CHECK dout1_10 Vdout1_10ck193 = 1.8 time = 9700
.meas tran vdout1_10ck193 FIND v(dout1_10) AT=9700.25n

* CHECK dout1_11 Vdout1_11ck193 = 0 time = 9700
.meas tran vdout1_11ck193 FIND v(dout1_11) AT=9700.25n

* CHECK dout1_12 Vdout1_12ck193 = 0 time = 9700
.meas tran vdout1_12ck193 FIND v(dout1_12) AT=9700.25n

* CHECK dout1_13 Vdout1_13ck193 = 1.8 time = 9700
.meas tran vdout1_13ck193 FIND v(dout1_13) AT=9700.25n

* CHECK dout1_14 Vdout1_14ck193 = 0 time = 9700
.meas tran vdout1_14ck193 FIND v(dout1_14) AT=9700.25n

* CHECK dout1_15 Vdout1_15ck193 = 1.8 time = 9700
.meas tran vdout1_15ck193 FIND v(dout1_15) AT=9700.25n

* CHECK dout1_0 Vdout1_0ck195 = 0 time = 9800
.meas tran vdout1_0ck195 FIND v(dout1_0) AT=9800.25n

* CHECK dout1_1 Vdout1_1ck195 = 1.8 time = 9800
.meas tran vdout1_1ck195 FIND v(dout1_1) AT=9800.25n

* CHECK dout1_2 Vdout1_2ck195 = 1.8 time = 9800
.meas tran vdout1_2ck195 FIND v(dout1_2) AT=9800.25n

* CHECK dout1_3 Vdout1_3ck195 = 1.8 time = 9800
.meas tran vdout1_3ck195 FIND v(dout1_3) AT=9800.25n

* CHECK dout1_4 Vdout1_4ck195 = 0 time = 9800
.meas tran vdout1_4ck195 FIND v(dout1_4) AT=9800.25n

* CHECK dout1_5 Vdout1_5ck195 = 0 time = 9800
.meas tran vdout1_5ck195 FIND v(dout1_5) AT=9800.25n

* CHECK dout1_6 Vdout1_6ck195 = 0 time = 9800
.meas tran vdout1_6ck195 FIND v(dout1_6) AT=9800.25n

* CHECK dout1_7 Vdout1_7ck195 = 1.8 time = 9800
.meas tran vdout1_7ck195 FIND v(dout1_7) AT=9800.25n

* CHECK dout1_8 Vdout1_8ck195 = 0 time = 9800
.meas tran vdout1_8ck195 FIND v(dout1_8) AT=9800.25n

* CHECK dout1_9 Vdout1_9ck195 = 1.8 time = 9800
.meas tran vdout1_9ck195 FIND v(dout1_9) AT=9800.25n

* CHECK dout1_10 Vdout1_10ck195 = 0 time = 9800
.meas tran vdout1_10ck195 FIND v(dout1_10) AT=9800.25n

* CHECK dout1_11 Vdout1_11ck195 = 0 time = 9800
.meas tran vdout1_11ck195 FIND v(dout1_11) AT=9800.25n

* CHECK dout1_12 Vdout1_12ck195 = 0 time = 9800
.meas tran vdout1_12ck195 FIND v(dout1_12) AT=9800.25n

* CHECK dout1_13 Vdout1_13ck195 = 0 time = 9800
.meas tran vdout1_13ck195 FIND v(dout1_13) AT=9800.25n

* CHECK dout1_14 Vdout1_14ck195 = 0 time = 9800
.meas tran vdout1_14ck195 FIND v(dout1_14) AT=9800.25n

* CHECK dout1_15 Vdout1_15ck195 = 1.8 time = 9800
.meas tran vdout1_15ck195 FIND v(dout1_15) AT=9800.25n

* CHECK dout1_0 Vdout1_0ck197 = 1.8 time = 9900
.meas tran vdout1_0ck197 FIND v(dout1_0) AT=9900.25n

* CHECK dout1_1 Vdout1_1ck197 = 1.8 time = 9900
.meas tran vdout1_1ck197 FIND v(dout1_1) AT=9900.25n

* CHECK dout1_2 Vdout1_2ck197 = 1.8 time = 9900
.meas tran vdout1_2ck197 FIND v(dout1_2) AT=9900.25n

* CHECK dout1_3 Vdout1_3ck197 = 0 time = 9900
.meas tran vdout1_3ck197 FIND v(dout1_3) AT=9900.25n

* CHECK dout1_4 Vdout1_4ck197 = 1.8 time = 9900
.meas tran vdout1_4ck197 FIND v(dout1_4) AT=9900.25n

* CHECK dout1_5 Vdout1_5ck197 = 0 time = 9900
.meas tran vdout1_5ck197 FIND v(dout1_5) AT=9900.25n

* CHECK dout1_6 Vdout1_6ck197 = 0 time = 9900
.meas tran vdout1_6ck197 FIND v(dout1_6) AT=9900.25n

* CHECK dout1_7 Vdout1_7ck197 = 1.8 time = 9900
.meas tran vdout1_7ck197 FIND v(dout1_7) AT=9900.25n

* CHECK dout1_8 Vdout1_8ck197 = 1.8 time = 9900
.meas tran vdout1_8ck197 FIND v(dout1_8) AT=9900.25n

* CHECK dout1_9 Vdout1_9ck197 = 0 time = 9900
.meas tran vdout1_9ck197 FIND v(dout1_9) AT=9900.25n

* CHECK dout1_10 Vdout1_10ck197 = 1.8 time = 9900
.meas tran vdout1_10ck197 FIND v(dout1_10) AT=9900.25n

* CHECK dout1_11 Vdout1_11ck197 = 1.8 time = 9900
.meas tran vdout1_11ck197 FIND v(dout1_11) AT=9900.25n

* CHECK dout1_12 Vdout1_12ck197 = 0 time = 9900
.meas tran vdout1_12ck197 FIND v(dout1_12) AT=9900.25n

* CHECK dout1_13 Vdout1_13ck197 = 0 time = 9900
.meas tran vdout1_13ck197 FIND v(dout1_13) AT=9900.25n

* CHECK dout1_14 Vdout1_14ck197 = 1.8 time = 9900
.meas tran vdout1_14ck197 FIND v(dout1_14) AT=9900.25n

* CHECK dout1_15 Vdout1_15ck197 = 0 time = 9900
.meas tran vdout1_15ck197 FIND v(dout1_15) AT=9900.25n

* CHECK dout1_0 Vdout1_0ck198 = 0 time = 9950
.meas tran vdout1_0ck198 FIND v(dout1_0) AT=9950.25n

* CHECK dout1_1 Vdout1_1ck198 = 1.8 time = 9950
.meas tran vdout1_1ck198 FIND v(dout1_1) AT=9950.25n

* CHECK dout1_2 Vdout1_2ck198 = 1.8 time = 9950
.meas tran vdout1_2ck198 FIND v(dout1_2) AT=9950.25n

* CHECK dout1_3 Vdout1_3ck198 = 1.8 time = 9950
.meas tran vdout1_3ck198 FIND v(dout1_3) AT=9950.25n

* CHECK dout1_4 Vdout1_4ck198 = 0 time = 9950
.meas tran vdout1_4ck198 FIND v(dout1_4) AT=9950.25n

* CHECK dout1_5 Vdout1_5ck198 = 0 time = 9950
.meas tran vdout1_5ck198 FIND v(dout1_5) AT=9950.25n

* CHECK dout1_6 Vdout1_6ck198 = 0 time = 9950
.meas tran vdout1_6ck198 FIND v(dout1_6) AT=9950.25n

* CHECK dout1_7 Vdout1_7ck198 = 1.8 time = 9950
.meas tran vdout1_7ck198 FIND v(dout1_7) AT=9950.25n

* CHECK dout1_8 Vdout1_8ck198 = 0 time = 9950
.meas tran vdout1_8ck198 FIND v(dout1_8) AT=9950.25n

* CHECK dout1_9 Vdout1_9ck198 = 1.8 time = 9950
.meas tran vdout1_9ck198 FIND v(dout1_9) AT=9950.25n

* CHECK dout1_10 Vdout1_10ck198 = 0 time = 9950
.meas tran vdout1_10ck198 FIND v(dout1_10) AT=9950.25n

* CHECK dout1_11 Vdout1_11ck198 = 0 time = 9950
.meas tran vdout1_11ck198 FIND v(dout1_11) AT=9950.25n

* CHECK dout1_12 Vdout1_12ck198 = 0 time = 9950
.meas tran vdout1_12ck198 FIND v(dout1_12) AT=9950.25n

* CHECK dout1_13 Vdout1_13ck198 = 0 time = 9950
.meas tran vdout1_13ck198 FIND v(dout1_13) AT=9950.25n

* CHECK dout1_14 Vdout1_14ck198 = 0 time = 9950
.meas tran vdout1_14ck198 FIND v(dout1_14) AT=9950.25n

* CHECK dout1_15 Vdout1_15ck198 = 1.8 time = 9950
.meas tran vdout1_15ck198 FIND v(dout1_15) AT=9950.25n

* CHECK dout1_0 Vdout1_0ck200 = 0 time = 10050
.meas tran vdout1_0ck200 FIND v(dout1_0) AT=10050.25n

* CHECK dout1_1 Vdout1_1ck200 = 0 time = 10050
.meas tran vdout1_1ck200 FIND v(dout1_1) AT=10050.25n

* CHECK dout1_2 Vdout1_2ck200 = 1.8 time = 10050
.meas tran vdout1_2ck200 FIND v(dout1_2) AT=10050.25n

* CHECK dout1_3 Vdout1_3ck200 = 0 time = 10050
.meas tran vdout1_3ck200 FIND v(dout1_3) AT=10050.25n

* CHECK dout1_4 Vdout1_4ck200 = 1.8 time = 10050
.meas tran vdout1_4ck200 FIND v(dout1_4) AT=10050.25n

* CHECK dout1_5 Vdout1_5ck200 = 0 time = 10050
.meas tran vdout1_5ck200 FIND v(dout1_5) AT=10050.25n

* CHECK dout1_6 Vdout1_6ck200 = 0 time = 10050
.meas tran vdout1_6ck200 FIND v(dout1_6) AT=10050.25n

* CHECK dout1_7 Vdout1_7ck200 = 1.8 time = 10050
.meas tran vdout1_7ck200 FIND v(dout1_7) AT=10050.25n

* CHECK dout1_8 Vdout1_8ck200 = 0 time = 10050
.meas tran vdout1_8ck200 FIND v(dout1_8) AT=10050.25n

* CHECK dout1_9 Vdout1_9ck200 = 1.8 time = 10050
.meas tran vdout1_9ck200 FIND v(dout1_9) AT=10050.25n

* CHECK dout1_10 Vdout1_10ck200 = 1.8 time = 10050
.meas tran vdout1_10ck200 FIND v(dout1_10) AT=10050.25n

* CHECK dout1_11 Vdout1_11ck200 = 0 time = 10050
.meas tran vdout1_11ck200 FIND v(dout1_11) AT=10050.25n

* CHECK dout1_12 Vdout1_12ck200 = 1.8 time = 10050
.meas tran vdout1_12ck200 FIND v(dout1_12) AT=10050.25n

* CHECK dout1_13 Vdout1_13ck200 = 0 time = 10050
.meas tran vdout1_13ck200 FIND v(dout1_13) AT=10050.25n

* CHECK dout1_14 Vdout1_14ck200 = 1.8 time = 10050
.meas tran vdout1_14ck200 FIND v(dout1_14) AT=10050.25n

* CHECK dout1_15 Vdout1_15ck200 = 0 time = 10050
.meas tran vdout1_15ck200 FIND v(dout1_15) AT=10050.25n

* CHECK dout1_0 Vdout1_0ck202 = 0 time = 10150
.meas tran vdout1_0ck202 FIND v(dout1_0) AT=10150.25n

* CHECK dout1_1 Vdout1_1ck202 = 0 time = 10150
.meas tran vdout1_1ck202 FIND v(dout1_1) AT=10150.25n

* CHECK dout1_2 Vdout1_2ck202 = 1.8 time = 10150
.meas tran vdout1_2ck202 FIND v(dout1_2) AT=10150.25n

* CHECK dout1_3 Vdout1_3ck202 = 0 time = 10150
.meas tran vdout1_3ck202 FIND v(dout1_3) AT=10150.25n

* CHECK dout1_4 Vdout1_4ck202 = 1.8 time = 10150
.meas tran vdout1_4ck202 FIND v(dout1_4) AT=10150.25n

* CHECK dout1_5 Vdout1_5ck202 = 0 time = 10150
.meas tran vdout1_5ck202 FIND v(dout1_5) AT=10150.25n

* CHECK dout1_6 Vdout1_6ck202 = 0 time = 10150
.meas tran vdout1_6ck202 FIND v(dout1_6) AT=10150.25n

* CHECK dout1_7 Vdout1_7ck202 = 1.8 time = 10150
.meas tran vdout1_7ck202 FIND v(dout1_7) AT=10150.25n

* CHECK dout1_8 Vdout1_8ck202 = 0 time = 10150
.meas tran vdout1_8ck202 FIND v(dout1_8) AT=10150.25n

* CHECK dout1_9 Vdout1_9ck202 = 1.8 time = 10150
.meas tran vdout1_9ck202 FIND v(dout1_9) AT=10150.25n

* CHECK dout1_10 Vdout1_10ck202 = 1.8 time = 10150
.meas tran vdout1_10ck202 FIND v(dout1_10) AT=10150.25n

* CHECK dout1_11 Vdout1_11ck202 = 0 time = 10150
.meas tran vdout1_11ck202 FIND v(dout1_11) AT=10150.25n

* CHECK dout1_12 Vdout1_12ck202 = 1.8 time = 10150
.meas tran vdout1_12ck202 FIND v(dout1_12) AT=10150.25n

* CHECK dout1_13 Vdout1_13ck202 = 0 time = 10150
.meas tran vdout1_13ck202 FIND v(dout1_13) AT=10150.25n

* CHECK dout1_14 Vdout1_14ck202 = 1.8 time = 10150
.meas tran vdout1_14ck202 FIND v(dout1_14) AT=10150.25n

* CHECK dout1_15 Vdout1_15ck202 = 0 time = 10150
.meas tran vdout1_15ck202 FIND v(dout1_15) AT=10150.25n

* CHECK dout1_0 Vdout1_0ck203 = 1.8 time = 10200
.meas tran vdout1_0ck203 FIND v(dout1_0) AT=10200.25n

* CHECK dout1_1 Vdout1_1ck203 = 1.8 time = 10200
.meas tran vdout1_1ck203 FIND v(dout1_1) AT=10200.25n

* CHECK dout1_2 Vdout1_2ck203 = 1.8 time = 10200
.meas tran vdout1_2ck203 FIND v(dout1_2) AT=10200.25n

* CHECK dout1_3 Vdout1_3ck203 = 0 time = 10200
.meas tran vdout1_3ck203 FIND v(dout1_3) AT=10200.25n

* CHECK dout1_4 Vdout1_4ck203 = 1.8 time = 10200
.meas tran vdout1_4ck203 FIND v(dout1_4) AT=10200.25n

* CHECK dout1_5 Vdout1_5ck203 = 0 time = 10200
.meas tran vdout1_5ck203 FIND v(dout1_5) AT=10200.25n

* CHECK dout1_6 Vdout1_6ck203 = 0 time = 10200
.meas tran vdout1_6ck203 FIND v(dout1_6) AT=10200.25n

* CHECK dout1_7 Vdout1_7ck203 = 1.8 time = 10200
.meas tran vdout1_7ck203 FIND v(dout1_7) AT=10200.25n

* CHECK dout1_8 Vdout1_8ck203 = 1.8 time = 10200
.meas tran vdout1_8ck203 FIND v(dout1_8) AT=10200.25n

* CHECK dout1_9 Vdout1_9ck203 = 0 time = 10200
.meas tran vdout1_9ck203 FIND v(dout1_9) AT=10200.25n

* CHECK dout1_10 Vdout1_10ck203 = 1.8 time = 10200
.meas tran vdout1_10ck203 FIND v(dout1_10) AT=10200.25n

* CHECK dout1_11 Vdout1_11ck203 = 1.8 time = 10200
.meas tran vdout1_11ck203 FIND v(dout1_11) AT=10200.25n

* CHECK dout1_12 Vdout1_12ck203 = 0 time = 10200
.meas tran vdout1_12ck203 FIND v(dout1_12) AT=10200.25n

* CHECK dout1_13 Vdout1_13ck203 = 0 time = 10200
.meas tran vdout1_13ck203 FIND v(dout1_13) AT=10200.25n

* CHECK dout1_14 Vdout1_14ck203 = 1.8 time = 10200
.meas tran vdout1_14ck203 FIND v(dout1_14) AT=10200.25n

* CHECK dout1_15 Vdout1_15ck203 = 0 time = 10200
.meas tran vdout1_15ck203 FIND v(dout1_15) AT=10200.25n

* probe is used for hspice/xa, while plot is used in ngspice
*.probe V(*)
*.plot V(*)
.end

