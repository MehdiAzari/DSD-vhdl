vcom -reportprogress 300 -work work C:/Users/Sepehr/Desktop/university/DSD/8/uart.vhd
vcom -reportprogress 300 -work work C:/Users/Sepehr/Desktop/university/DSD/8/uart_tb.vhd
vsim -gui work.uart_tb -voptargs=+acc
do mpw.do
run 2000 ns