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
         (((a srl 0)  and "00000000000000000000000000000001")
         +((a srl 1)  and "00000000000000000000000000000001")
         +((a srl 2)  and "00000000000000000000000000000001")
         +((a srl 3)  and "00000000000000000000000000000001")
         +((a srl 4)  and "00000000000000000000000000000001")
         +((a srl 5)  and "00000000000000000000000000000001")
         +((a srl 6)  and "00000000000000000000000000000001")
         +((a srl 7)  and "00000000000000000000000000000001")
         +((a srl 8)  and "00000000000000000000000000000001")
         +((a srl 9)  and "00000000000000000000000000000001")
         +((a srl 10) and "00000000000000000000000000000001")
         +((a srl 11) and "00000000000000000000000000000001")
         +((a srl 12) and "00000000000000000000000000000001")
         +((a srl 13) and "00000000000000000000000000000001")
         +((a srl 14) and "00000000000000000000000000000001")
         +((a srl 15) and "00000000000000000000000000000001")) after 6 ns when (func = "0101") else
         (((b srl 0)  and "00000000000000000000000000000001")
         +((b srl 1)  and "00000000000000000000000000000001")
         +((b srl 2)  and "00000000000000000000000000000001")
         +((b srl 3)  and "00000000000000000000000000000001")
         +((b srl 4)  and "00000000000000000000000000000001")
         +((b srl 5)  and "00000000000000000000000000000001")
         +((b srl 6)  and "00000000000000000000000000000001")
         +((b srl 7)  and "00000000000000000000000000000001")
         +((b srl 8)  and "00000000000000000000000000000001")
         +((b srl 9)  and "00000000000000000000000000000001")
         +((b srl 10) and "00000000000000000000000000000001")
         +((b srl 11) and "00000000000000000000000000000001")
         +((b srl 12) and "00000000000000000000000000000001")
         +((b srl 13) and "00000000000000000000000000000001")
         +((b srl 14) and "00000000000000000000000000000001")
         +((b srl 15) and "00000000000000000000000000000001")) after 6 ns when (func = "0110") else
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