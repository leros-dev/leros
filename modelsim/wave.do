onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/clk
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/reset
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/pc
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/ir
add wave -noupdate -radix hexadecimal -expand -subitemconfig {/tb_leros/cpu/fd/din.accu {-radix hexadecimal} /tb_leros/cpu/fd/din.zf {-radix hexadecimal}} /tb_leros/cpu/fd/din
add wave -noupdate -radix hexadecimal -expand -subitemconfig {/tb_leros/cpu/fd/dout.dec {-radix hexadecimal -expand} /tb_leros/cpu/fd/dout.dec.op {-radix hexadecimal} /tb_leros/cpu/fd/dout.dec.al_ena {-radix hexadecimal} /tb_leros/cpu/fd/dout.dec.ah_ena {-radix hexadecimal} /tb_leros/cpu/fd/dout.dec.log_add {-radix hexadecimal} /tb_leros/cpu/fd/dout.dec.add_sub {-radix hexadecimal} /tb_leros/cpu/fd/dout.dec.sel_imm {-radix hexadecimal} /tb_leros/cpu/fd/dout.dec.store {-radix hexadecimal} /tb_leros/cpu/fd/dout.dec.outp {-radix hexadecimal} /tb_leros/cpu/fd/dout.imm {-radix hexadecimal} /tb_leros/cpu/fd/dout.data {-radix hexadecimal}} /tb_leros/cpu/fd/dout
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/alu_op
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/br_op
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/immr
add wave -noupdate -radix hexadecimal -subitemconfig {/tb_leros/cpu/ex/din.dec {-radix hexadecimal} /tb_leros/cpu/ex/din.imm {-radix hexadecimal}} /tb_leros/cpu/ex/din
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/dout
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/accu
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/opd
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/log
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/arith
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/a_mux
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/dm
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/wrdata
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/rddata
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/wraddr
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/rdaddr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {147273 ps} 0}
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
WaveRestoreZoom {0 ps} {210 ns}
