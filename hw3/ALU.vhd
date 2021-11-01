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
    type twod_type is array (0 to 32) of signed (0 to 31);
    signal a_hw: twod_type;
    signal b_hw: twod_type;
begin
    a_hw(0) <= ("1" and a);
    hw_a: for i in 1 to 31 generate
        a_hw(i) <= a_hw(i-1) + ("1" and (a srl i));
    end generate hw_a;
    b_hw(0) <= ("1" and b);
    hw_b: for i in 1 to 31 generate
        b_hw(i) <= b_hw(i-1) + ("1" and (b srl i));
    end generate hw_b;
    y <= (not a) after 1 ns when (func = "0000") else
         (a nand b) after 2 ns when (func = "0001") else
         (a nor b) after 2 ns when (func = "0010") else
         (a xor b) after 2 ns when (func = "0011") else
         (a and b) after 1 ns when (func = "0100") else
         (a_hw(31)) after 6 ns when (func = "0101") else
         (b_hw(31)) after 6 ns when (func = "0110") else
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