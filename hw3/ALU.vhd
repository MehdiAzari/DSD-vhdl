library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port (a,b: in std_logic_vector (0 to 31);
    func: in std_logic_vector (0 to 3);
    cin: in std_logic;
    y: out std_logic_vector (0 to 31);
    cout: out std_logic);
end alu;

architecture concurrent of alu is
    signal y_0000: std_logic_vector (0 to 31) := (others => '0');
    signal y_0001: std_logic_vector (0 to 31) := (others => '0');
    signal y_0010: std_logic_vector (0 to 31) := (others => '0');
    signal y_0011: std_logic_vector (0 to 31) := (others => '0');
    signal y_0100: std_logic_vector (0 to 31) := (others => '0');
    signal y_0101: std_logic_vector (0 to 31) := (others => '0');
    signal y_0110: std_logic_vector (0 to 31) := (others => '0');
    signal y_0111: std_logic_vector (0 to 31) := (others => '0');
    signal y_1000: std_logic_vector (0 to 31) := (others => '0');
    signal y_1001: std_logic_vector (0 to 31) := (others => '0');
    signal y_1010: std_logic_vector (0 to 31) := (others => '0');
    signal y_1011: std_logic_vector (0 to 31) := (others => '0');
    signal y_1100: std_logic_vector (0 to 31) := (others => '0');
    signal y_1101: std_logic_vector (0 to 31) := (others => '0');
    signal y_1110: std_logic_vector (0 to 31) := (others => '0');
    signal y_1111: std_logic_vector (0 to 31) := (others => '0');
begin
    y_0000 <= (not a) after 1 ns;
    y_0001 <= (a nand b) after 2 ns;
    y_0010 <= (a nor b) after 2 ns;
    y_0011 <= (a xor b) after 2 ns;
    y_0100 <= (a and b) after 1 ns;
    y_0101 <= (a) after 6 ns;
    y_0110 <= (a) after 6 ns;
    y_0111 <= (a) after 3 ns;
    y_1000 <= (a) after 3 ns;
    y_1001 <= (a) after 3 ns;
    y_1010 <= (a) after 2 ns;
    y_1011 <= (a) after 2 ns;
    y_1100 <= (a) after 2 ns;
    y_1101 <= (a) after 1 ns;
    y_1110 <= (a) after 1 ns;
    y_1111 <= (a) after 1 ns;

    y <= y_0000 when (func = "0000") else
         y_0001 when (func = "0001") else
         y_0010 when (func = "0010") else
         y_0011 when (func = "0011") else
         y_0100 when (func = "0100") else
         y_0101 when (func = "0101") else
         y_0110 when (func = "0110") else
         y_0111 when (func = "0111") else
         y_1000 when (func = "1000") else
         y_1001 when (func = "1001") else
         y_1010 when (func = "1010") else
         y_1011 when (func = "1011") else
         y_1100 when (func = "1100") else
         y_1101 when (func = "1101") else
         y_1110 when (func = "1110") else
         y_1111;--when (func = "1111")
end concurrent;