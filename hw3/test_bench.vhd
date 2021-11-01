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

		a <= "00000000000000000000000000000000";
		b <= "00000000000000000000000000000000";
		cin <= '0';
		func <= "0000";
		wait for 5 ns;

		a <= "00000000000000000000000001000010";
		b <= "00000000000000000000000001000000";
		cin <= '0';
		func <= "0001";
		wait for 5 ns;

		a <= "00000000000000000000000001001000";
		b <= "00000000000000000000000000001000";
		cin <= '0';
		func <= "0010";
		wait for 5 ns;
	end process stimulus;
end test;

