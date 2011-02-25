onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/clk
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/reset
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/din
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/dout
add wave -noupdate -radix hexadecimal -expand -subitemconfig {/tb_leros/cpu/fd/imin.rdaddr {-radix hexadecimal} /tb_leros/cpu/fd/imin.wraddr {-radix hexadecimal} /tb_leros/cpu/fd/imin.wrdata {-radix hexadecimal} /tb_leros/cpu/fd/imin.wren {-radix hexadecimal}} /tb_leros/cpu/fd/imin
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/imout
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/alu_op
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/br_op
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/pc
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/pc_next
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/ir
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/immr
add wave -noupdate -radix hexadecimal /tb_leros/cpu/fd/decode
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/clk
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/reset
add wave -noupdate -radix hexadecimal /tb_leros/cpu/ex/din
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
WaveRestoreZoom {0 ps} {107622 ps}
