LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
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
	SIGNAL rst_t 		: std_logic;
BEGIN
	cut: miniproc PORT MAP (clk_t, rst_t, opcode_t);
	clk_t <= NOT clk_t AFTER 5 ns;
	rst_t <= '1', '0' AFTER 20 ns;
	opcode_t <= "0000", "0001" AFTER 40 ns, "0010" AFTER 80 ns, "0011" AFTER 120 ns;
END behavioral;
