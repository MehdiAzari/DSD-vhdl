LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

ENTITY miniproc IS 
    PORT (
        clk, rst   : IN    std_logic;
        opcode      : IN    std_logic_vector(3 DOWNTO 0)
    );
END miniproc; 
ARCHITECTURE behavioral OF miniproc IS
    TYPE state IS (T0, T1, T2, T3, T4, T5);
	SIGNAL cur_state, nxt_state : state;
	-- Control signals
	SIGNAL a_ld 	: std_logic;
	SIGNAL b_ld 	: std_logic;
	SIGNAL c_ld 	: std_logic;
	SIGNAL d_ld 	: std_logic;
	SIGNAL ac_ld 	: std_logic;
	SIGNAL wr 	: std_logic;
	SIGNAL cbus : std_logic_vector(31 DOWNTO 0);
	SIGNAL sel 	: std_logic_vector(1 DOWNTO 0);
	SIGNAL func : std_logic_vector(2 DOWNTO 0);
	
	SIGNAL Z 	: std_logic_vector(31 DOWNTO 0);
	SIGNAL dout 	: std_logic_vector(31 DOWNTO 0);
	SIGNAL shifted 	: std_logic_vector(31 DOWNTO 0);

	-- Registers
	SIGNAL A 	: std_logic_vector(31 DOWNTO 0);
	SIGNAL B 	: std_logic_vector(31 DOWNTO 0);
	SIGNAL C 	: std_logic_vector(31 DOWNTO 0);
	SIGNAL D 	: std_logic_vector(31 DOWNTO 0);
	SIGNAL AC 	: std_logic_vector(31 DOWNTO 0);

	--SRAM
	TYPE ram IS ARRAY (63 downto 0) OF std_logic_vector(31 DOWNTO 0);
	signal sram	: ram;
BEGIN
	cbus <= dout WHEN sel = "00" ELSE
			B WHEN sel = "01" ELSE
			AC;

	shifted <=	B(31 downto 0)	WHEN C(4 downto 0) = "00000" ELSE
				B(30 downto 0)&(0 downto 0 => '0')	WHEN C(4 downto 0) = "00001" ELSE
				B(29 downto 0)&(1 downto 0 => '0')	WHEN C(4 downto 0) = "00010" ELSE
				B(28 downto 0)&(2 downto 0 => '0')	WHEN C(4 downto 0) = "00011" ELSE
				B(27 downto 0)&(3 downto 0 => '0')	WHEN C(4 downto 0) = "00100" ELSE
				B(26 downto 0)&(4 downto 0 => '0')	WHEN C(4 downto 0) = "00101" ELSE
				B(25 downto 0)&(5 downto 0 => '0')	WHEN C(4 downto 0) = "00110" ELSE
				B(24 downto 0)&(6 downto 0 => '0')	WHEN C(4 downto 0) = "00111" ELSE
				B(23 downto 0)&(7 downto 0 => '0')	WHEN C(4 downto 0) = "01000" ELSE
				B(22 downto 0)&(8 downto 0 => '0')	WHEN C(4 downto 0) = "01001" ELSE
				B(21 downto 0)&(9 downto 0 => '0')	WHEN C(4 downto 0) = "01010" ELSE
				B(20 downto 0)&(10 downto 0 => '0')	WHEN C(4 downto 0) = "01011" ELSE
				B(19 downto 0)&(11 downto 0 => '0')	WHEN C(4 downto 0) = "01100" ELSE
				B(18 downto 0)&(12 downto 0 => '0')	WHEN C(4 downto 0) = "01101" ELSE
				B(17 downto 0)&(13 downto 0 => '0')	WHEN C(4 downto 0) = "01110" ELSE
				B(16 downto 0)&(14 downto 0 => '0')	WHEN C(4 downto 0) = "01111" ELSE
				B(15 downto 0)&(15 downto 0 => '0')	WHEN C(4 downto 0) = "10000" ELSE
				B(14 downto 0)&(16 downto 0 => '0')	WHEN C(4 downto 0) = "10001" ELSE
				B(13 downto 0)&(17 downto 0 => '0')	WHEN C(4 downto 0) = "10010" ELSE
				B(12 downto 0)&(18 downto 0 => '0')	WHEN C(4 downto 0) = "10011" ELSE
				B(11 downto 0)&(19 downto 0 => '0')	WHEN C(4 downto 0) = "10100" ELSE
				B(10 downto 0)&(20 downto 0 => '0')	WHEN C(4 downto 0) = "10101" ELSE
				B(9 downto 0)&(21 downto 0 => '0')	WHEN C(4 downto 0) = "10110" ELSE
				B(8 downto 0)&(22 downto 0 => '0')	WHEN C(4 downto 0) = "10111" ELSE
				B(7 downto 0)&(23 downto 0 => '0')	WHEN C(4 downto 0) = "11000" ELSE
				B(6 downto 0)&(24 downto 0 => '0')	WHEN C(4 downto 0) = "11001" ELSE
				B(5 downto 0)&(25 downto 0 => '0')	WHEN C(4 downto 0) = "11010" ELSE
				B(4 downto 0)&(26 downto 0 => '0')	WHEN C(4 downto 0) = "11011" ELSE
				B(3 downto 0)&(27 downto 0 => '0')	WHEN C(4 downto 0) = "11100" ELSE
				B(2 downto 0)&(28 downto 0 => '0')	WHEN C(4 downto 0) = "11101" ELSE
				B(1 downto 0)&(29 downto 0 => '0')	WHEN C(4 downto 0) = "11110" ELSE
				B(0 downto 0)&(30 downto 0 => '0');
			
	z <= 	C	WHEN func = "000" ELSE
			D	WHEN func = "001" ELSE
			D + C	WHEN func = "010" ELSE
			D and C	WHEN func = "011" ELSE
			D xor C	WHEN func = "100" ELSE
			D - C	WHEN func = "101" ELSE
			shifted;
			
    controlpath: PROCESS (cur_state, opcode)
    BEGIN
		a_ld <= '0';
		b_ld <= '0';
		c_ld <= '0';
		d_ld <= '0';
		ac_ld <= '0';
		wr <= '0';
		CASE cur_state is
			WHEN T0 =>
				CASE opcode IS
					WHEN "0000"	=>	func <= "000"; ac_ld <= '1'; nxt_state <= T0;
					WHEN "0001"	=>	func <= "001"; ac_ld <= '1'; nxt_state <= T0;
					WHEN "0010"	=>	func <= "010"; ac_ld <= '1'; nxt_state <= T0;
					WHEN "0011"	=>	sel <= "01"; d_ld <= '1'; nxt_state <= T1;
					WHEN "0100"	=>	sel <= "01"; d_ld <= '1'; nxt_state <= T1;
					WHEN "0101"	=>	sel <= "00"; c_ld <= '1'; nxt_state <= T1;
					WHEN "0110"	=>	sel <= "10"; wr <= '1'; nxt_state <= T0;
					WHEN "0111"	=>	sel <= "01"; a_ld <= '1'; nxt_state <= T1;
					WHEN "1000"	=>	sel <= "01"; a_ld <= '1'; nxt_state <= T1;
					WHEN "1001"	=>	sel <= "01"; d_ld <= '1'; nxt_state <= T1;
					WHEN OTHERS	=>	sel <= "01"; d_ld <= '1'; nxt_state <= T1;
				END CASE;
			WHEN T1 =>
				CASE opcode IS
					WHEN "0011"	=>	func <= "011"; ac_ld <= '1'; nxt_state <= T0;
					WHEN "0100"	=>	func <= "100"; ac_ld <= '1'; nxt_state <= T0;
					WHEN "0101"	=>	func <= "000"; ac_ld <= '1'; nxt_state <= T0;
					WHEN "0111"	=>	sel <= "00"; d_ld <= '1'; nxt_state <= T2;
					WHEN "1000"	=>	sel <= "00"; d_ld <= '1'; nxt_state <= T2;
					WHEN "1001"	=>	func <= "100"; ac_ld <= '1'; nxt_state <= T2;
					WHEN OTHERS	=>	func <= "110"; ac_ld <= '1'; nxt_state <= T2;
				END CASE;
			WHEN T2 =>
				CASE opcode IS
					WHEN "0111"	=>	func <= "000"; ac_ld <= '1'; nxt_state <= T3;
					WHEN "1000"	=>	func <= "000"; ac_ld <= '1'; nxt_state <= T3;
					WHEN "1001"	=>	sel <= "10"; wr <= '1'; nxt_state <= T0;
					WHEN OTHERS	=>	sel <= "10"; wr <= '1'; nxt_state <= T0;
				END CASE;
			WHEN T3 =>
				CASE opcode IS
					WHEN "0111"	=>	sel <= "10"; a_ld <= '1'; nxt_state <= T4;
					WHEN OTHERS	=>	sel <= "10"; a_ld <= '1'; nxt_state <= T4;
				END CASE;
			WHEN T4 =>
				CASE opcode IS
					WHEN "0111"	=>	sel <= "00"; c_ld <= '1'; nxt_state <= T5;
					WHEN OTHERS	=>	sel <= "00"; c_ld <= '1'; nxt_state <= T5;
				END CASE;
			WHEN OTHERS =>
				CASE opcode IS
					WHEN "0111"	=>	func <= "010"; ac_ld <= '1'; nxt_state <= T0;
					WHEN OTHERS	=>	func <= "101"; ac_ld <= '1'; nxt_state <= T0;
				END CASE;
		END CASE;
    END PROCESS controlpath;

	ram_p: PROCESS (clk)
    BEGIN
		IF clk = '1' THEN
			IF wr = '1' THEN
				sram(to_integer(unsigned(A))) <= cbus;
			ELSE 
				dout <= sram(to_integer(unsigned(A)));
			END IF;
		END IF;
	END PROCESS ram_p;

    datapath: PROCESS (clk)
    BEGIN
        IF clk = '1' THEN
			IF rst = '1' THEN
				cur_state <= T0;
			ELSE
				IF a_ld = '1' THEN
					A <= cbus;
				END IF;
				IF b_ld = '1' THEN
					B <= cbus;
				END IF;
				IF c_ld = '1' THEN
					C <= cbus;
				END IF;
				IF d_ld = '1' THEN
					D <= cbus;
				END IF;
				IF ac_ld = '1' THEN
					AC <= z;
				END IF;
				cur_state <= nxt_state;
			END IF;
        END IF;
    END PROCESS datapath;

END behavioral;
