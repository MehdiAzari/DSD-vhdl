vcom -reportprogress 300 -work work C:/Users/Sepehr/Desktop/university/DSD/7/miniproc.vhd
vcom -reportprogress 300 -work work C:/Users/Sepehr/Desktop/university/DSD/7/miniproc_tb.vhd
vsim -gui work.miniproc_tb -voptargs=+acc
do mpw.do
run 200 ns