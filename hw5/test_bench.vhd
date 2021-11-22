library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity tb;

architecture test of tb is
	signal a: std_logic_vector(0 to 15) := (others => '0');
    signal b: std_logic_vector(0 to 15) := (others => '0');
    signal sum: std_logic_vector(0 to 15) := (others => '0');
    signal start: std_logic := '0';
    signal clk: std_logic := '0';
    signal nrst: std_logic := '0';
    signal cout: std_logic := '0';
    signal done: std_logic := '0';
begin
	test_mul: entity work.adder(behavioral)
    generic map(
        n => 16
    )
	port map (
		a => a,
		b => b,
		sum => sum,
        start => start,
        clk => clk,
        nrst => nrst,
        cout => cout,
        done => done
	);

    clk <= not clk after 5 ns;

	sim: process begin
		wait for 10 ns;

		a <= "0000000000111111";
		b <= "0000000000000001";
		wait for 10 ns;

        start <= '1';
        wait for 200 ns;

        nrst <= '1';
        start <= '0';
        wait for 20 ns;

        nrst <= '0';
        wait for 10 ns;

        a <= "0000000000111111";
		b <= "0000011110000000";
		wait for 10 ns;

        start <= '1';
        wait for 70 ns;

        nrst <= '1';
        wait for 20 ns;

        start <= '0';
        nrst <= '0';
        wait for 20 ns;

        start <= '1';
        wait for 200 ns;
		
	end process sim;
end test;