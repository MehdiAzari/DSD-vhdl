library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity tb;

architecture test of tb is
	signal a : signed (0 to 31) := (others => '0');
	signal b : signed (0 to 31) := (others => '0');
	signal y : signed (0 to 31) := (others => '0');
	signal cin : std_logic := '0';
	signal cout : std_logic := '0';
	signal func : signed (0 to 3) := (others => '0');
begin
	test_alu: entity work.alu(concurrent)
		port map (
			a => a,
			b => b,
			cin => cin,
			func => func,
			y => y,
			cout => cout
		);

	stimulus:
	process begin
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "0000";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "0001";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "0010";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "0011";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "0100";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "0101";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "0110";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "0111";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "1000";
		wait for 10 ns;

		a <= "00001011100110010001111001111001";
		b <= "11110100011001101110000110000110";
		cin <= '1';
		func <= "1000";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "1001";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "1010";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "1011";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "1100";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "1101";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "1110";
		wait for 10 ns;

		a <= "00000011100000000001000001000001";
		b <= "11110000000001100000000110000010";
		cin <= '0';
		func <= "1111";
		wait for 10 ns;
	end process stimulus;
end test;

