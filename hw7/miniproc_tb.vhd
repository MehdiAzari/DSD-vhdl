LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
use STD.textio.all;
use ieee.std_logic_textio.all;
use std.env.stop;
--USE work.regfile_pack.ALL;

ENTITY miniproc_tb IS  
END miniproc_tb;
ARCHITECTURE behavioral OF miniproc_tb IS
	COMPONENT miniproc IS 
		PORT (
			clk, rst   : IN    std_logic;
			opcode      : IN    std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT; 
	SIGNAL opcode_t 	: std_logic_vector(3 DOWNTO 0);
	SIGNAL clk_t 		: std_logic := '0';
	SIGNAL rst_t 		: std_logic := '1';
BEGIN
	cut: miniproc PORT MAP (clk_t, rst_t, opcode_t);
	clk_t <= NOT clk_t AFTER 5 ns;

	sim: process
        file inf : text open read_mode is "input.txt";
        variable text_line : line;
        variable w_time : time;
        variable data : std_logic_vector(0 to 3) := (others => '0');
		variable data_bit : std_logic := '0';
    begin
        while not endfile(inf) loop
            readline(inf, text_line);
            read(text_line, w_time);
            wait for w_time;
            read(text_line, data_bit);
            rst_t <= data_bit;
            read(text_line, data);
            opcode_t <= data;
        end loop;
        wait for 100 ns;
        stop;
    end process sim;
END behavioral;
