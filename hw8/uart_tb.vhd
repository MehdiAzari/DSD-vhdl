
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
use STD.textio.all;
use ieee.std_logic_textio.all;
--USE work.regfile_pack.ALL;

ENTITY uart_tb IS  
END uart_tb;
ARCHITECTURE behavioral OF uart_tb IS
	COMPONENT uart IS 
        port (
            clk,rst,start,rx:   in  std_logic;
            data_in,baud    :   in  std_logic_vector(7 downto 0);
            data_out        :   out std_logic_vector(7 downto 0);
            data_ready,tx   :   out std_logic
        );
	END COMPONENT;
    signal clk_t,rst_t,start_t,rx_t:  std_logic := '0';
    signal data_in_t,baud_t    :  std_logic_vector(7 downto 0) := (others => '0');
    signal data_out_t        : std_logic_vector(7 downto 0);
    signal data_ready_t,tx_t   : std_logic;
BEGIN
	cut: uart PORT MAP (clk_t,rst_t,start_t,rx_t,data_in_t,baud_t,data_out_t,data_ready_t,tx_t);
	clk_t <= NOT clk_t AFTER 5 ns;
    baud_t <= "00000010";

	sim: process
        file inf : text open read_mode is "input.txt";
        variable text_line : line;
        variable w_time : time;
        variable data : std_logic_vector(0 to 7) := (others => '0');
		variable data_bit1,data_bit2,data_bit3 : std_logic := '0';
    begin
        while not endfile(inf) loop
            readline(inf, text_line);
            read(text_line, w_time);
            wait for w_time;
            read(text_line, data_bit1);
            rst_t <= data_bit1;
            read(text_line, data);
            data_in_t <= data;
            read(text_line, data_bit2);
            start_t <= data_bit2;
            read(text_line, data_bit3);
            rx_t <= data_bit3;
        end loop;
        wait;
    end process sim;
END behavioral;
