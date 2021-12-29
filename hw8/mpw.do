onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Testbench
add wave -noupdate -radix binary /uart_tb/rst_t
add wave -noupdate -radix binary /uart_tb/clk_t
add wave -noupdate -radix binary /uart_tb/start_t
add wave -noupdate -radix binary /uart_tb/rx_t
add wave -noupdate -radix binary /uart_tb/data_in_t
add wave -noupdate -radix binary /uart_tb/baud_t
add wave -noupdate -radix binary /uart_tb/data_out_t
add wave -noupdate -radix binary /uart_tb/data_ready_t
add wave -noupdate -radix binary /uart_tb/tx_t
add wave -noupdate -divider UART
add wave -noupdate -radix binary /uart_tb/cut/rst
add wave -noupdate -radix binary /uart_tb/cut/clk
add wave -noupdate -radix binary /uart_tb/cut/start
add wave -noupdate -radix binary /uart_tb/cut/rx
add wave -noupdate -radix binary /uart_tb/cut/data_in
add wave -noupdate -radix binary /uart_tb/cut/baud
add wave -noupdate -radix binary /uart_tb/cut/data_out
add wave -noupdate -radix binary /uart_tb/cut/data_ready
add wave -noupdate -radix binary /uart_tb/cut/tx
add wave -noupdate -radix binary /uart_tb/cut/input_data
add wave -noupdate -radix decimal /uart_tb/cut/counter
add wave -noupdate -radix decimal /uart_tb/cut/index
add wave -noupdate -radix binary /uart_tb/cut/t_started
add wave -noupdate -radix binary /uart_tb/cut/tx_signal
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
WaveRestoreZoom {0 ns} {2100 ns}
