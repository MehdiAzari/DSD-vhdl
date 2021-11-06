library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity tb;

architecture test of tb is
	signal a : std_logic_vector (0 to 15) := (others => '0');
	signal b : std_logic_vector (0 to 15) := (others => '0');
	signal y : std_logic_vector (0 to 31) := (others => '0');
begin
	test_mul: entity work.multiplier(concurrent)
        generic map(
            n => 16
        )
		port map (
			a => a,
			b => b,
			y => y
		);

	stimulus:
	process begin
		wait for 10 ns;

		a <= "0000000000111111";
		b <= "0000000000000001";
		wait for 10 ns;

        a <= "0000000000111111";
		b <= "0000000000000010";
		wait for 10 ns;

        a <= "0000000000111111";
		b <= "0000000000000011";
		wait for 10 ns;
	end process stimulus;
end test;


