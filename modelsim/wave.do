onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/clk
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/reset
add wave -noupdate -radix hexadecimal -expand -subitemconfig {/tb_leros/cpu/fd/din.accu {-height 15 -radix hexadecimal}} /tb_leros/cpu/fd/din
add wave -noupdate -radix hexadecimal -expand -subitemconfig {/tb_leros/cpu/fd/dout.dec {-height 15 -radix hexadecimal -expand} /tb_leros/cpu/fd/dout.dec.op {-radix hexadecimal} /tb_leros/cpu/fd/dout.dec.acc_en {-radix hexadecimal} /tb_leros/cpu/fd/dout.dec.sel_imm {-radix hexadecimal} /tb_leros/cpu/fd/dout.imm {-height 15 -radix hexadecimal} /tb_leros/cpu/fd/dout.imm(7) {-radix hexadecimal} /tb_leros/cpu/fd/dout.imm(6) {-radix hexadecimal} /tb_leros/cpu/fd/dout.imm(5) {-radix hexadecimal} /tb_leros/cpu/fd/dout.imm(4) {-radix hexadecimal} /tb_leros/cpu/fd/dout.imm(3) {-radix hexadecimal} /tb_leros/cpu/fd/dout.imm(2) {-radix hexadecimal} /tb_leros/cpu/fd/dout.imm(1) {-radix hexadecimal} /tb_leros/cpu/fd/dout.imm(0) {-radix hexadecimal} /tb_leros/cpu/fd/dout.data {-height 15 -radix hexadecimal}} /tb_leros/cpu/fd/dout
add wave -noupdate -radix hexadecimal -expand -subitemconfig {/tb_leros/cpu/fd/imin.rdaddr {-height 15 -radix hexadecimal} /tb_leros/cpu/fd/imin.wraddr {-height 15 -radix hexadecimal} /tb_leros/cpu/fd/imin.wrdata {-height 15 -radix hexadecimal} /tb_leros/cpu/fd/imin.wren {-height 15 -radix hexadecimal}} /tb_leros/cpu/fd/imin
add wave -noupdate -radix hexadecimal -expand -subitemconfig {/tb_leros/cpu/fd/imout.data {-height 15 -radix hexadecimal}} /tb_leros/cpu/fd/imout
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/clk
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/reset
add wave -noupdate -radix hexadecimal -expand -subitemconfig {/tb_leros/cpu/ex/din.dec {-height 15 -radix hexadecimal} /tb_leros/cpu/ex/din.imm {-height 15 -radix hexadecimal} /tb_leros/cpu/ex/din.sel_imm {-height 15 -radix hexadecimal} /tb_leros/cpu/ex/din.dm_rdaddr {-height 15 -radix hexadecimal} /tb_leros/cpu/ex/din.dm_wraddr {-height 15 -radix hexadecimal} /tb_leros/cpu/ex/din.wren {-height 15 -radix hexadecimal}} /tb_leros/cpu/ex/din
add wave -noupdate -radix hexadecimal -expand -subitemconfig {/tb_leros/cpu/ex/dout.accu {-height 15 -radix hexadecimal}} /tb_leros/cpu/ex/dout
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/res
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/accu
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/opd
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/dm
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/wrdata
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/rddata
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/wraddr
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/rdaddr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 195
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {24266 ps} {103986 ps}
