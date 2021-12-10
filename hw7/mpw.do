onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Testbench
add wave -noupdate /miniproc_tb/rst_t
add wave -noupdate /miniproc_tb/clk_t
add wave -noupdate /miniproc_tb/opcode_t
add wave -noupdate -divider Miniproc
add wave -noupdate -radix binary /miniproc_tb/cut/rst
add wave -noupdate -radix binary /miniproc_tb/cut/clk
add wave -noupdate -radix binary /miniproc_tb/cut/opcode
add wave -noupdate -radix binary /miniproc_tb/cut/cur_state
add wave -noupdate -radix binary /miniproc_tb/cut/a_ld
add wave -noupdate -radix binary /miniproc_tb/cut/b_ld
add wave -noupdate -radix binary /miniproc_tb/cut/c_ld
add wave -noupdate -radix binary /miniproc_tb/cut/d_ld
add wave -noupdate -radix binary /miniproc_tb/cut/ac_ld
add wave -noupdate -radix binary /miniproc_tb/cut/dout
add wave -noupdate -radix binary /miniproc_tb/cut/shifted
add wave -noupdate -radix binary /miniproc_tb/cut/sram
add wave -noupdate -radix binary /miniproc_tb/cut/wr
add wave -noupdate -radix binary /miniproc_tb/cut/cbus
add wave -noupdate -radix binary /miniproc_tb/cut/sel
add wave -noupdate -radix binary /miniproc_tb/cut/func
add wave -noupdate -radix binary /miniproc_tb/cut/Z
add wave -noupdate -radix binary /miniproc_tb/cut/A
add wave -noupdate -radix binary /miniproc_tb/cut/C
add wave -noupdate -radix binary /miniproc_tb/cut/B
add wave -noupdate -radix binary /miniproc_tb/cut/D
add wave -noupdate -radix binary /miniproc_tb/cut/AC
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {185 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 193
configure wave -valuecolwidth 100
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
configure wave -timelineunits ns
update
WaveRestoreZoom {100 ns} {205 ns}
