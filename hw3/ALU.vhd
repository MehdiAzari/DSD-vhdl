library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    port (a,b: in signed (0 to 31);
    func: in signed (0 to 3);
    cin: in std_logic;
    y: out signed (0 to 31);
    cout: out std_logic);
end alu;

architecture concurrent of alu is
begin
    y <= (not a) after 1 ns when (func = "0000") else
         (a nand b) after 2 ns when (func = "0001") else
         (a nor b) after 2 ns when (func = "0010") else
         (a xor b) after 2 ns when (func = "0011") else
         (a and b) after 1 ns when (func = "0100") else
         a after 6 ns when (func = "0101") else
         a after 6 ns when (func = "0110") else
         (0 - a) after 3 ns when (func = "0111") else
         a after 3 ns when (func = "1000") else
         a after 3 ns when (func = "1001") else
         a after 2 ns when (func = "1010") else
         a after 2 ns when (func = "1011") else
         a after 2 ns when (func = "1100") else
         a after 1 ns when (func = "1101") else
         a after 1 ns when (func = "1110") else
         a after 1 ns;--when (func = "1111")
end concurrent;