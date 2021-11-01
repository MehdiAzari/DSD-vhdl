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
    signal sum : signed (0 to 32) := (others => '0');
begin
    sum <= (('0'&a) + ('0'&b)) after 3 ns when ((func = "1000") and (cin = '0')) else
           (('0'&a) + ('0'&b) + (32 => '1',0 to 31 => '0')) after 3 ns when ((func = "1000") and (cin = '1')) else
           (others => '0');
    cout <= sum(0);
    y <= (not a) after 1 ns when (func = "0000") else
                (a nand b) after 2 ns when (func = "0001") else
                (a nor b) after 2 ns when (func = "0010") else
                (a xor b) after 2 ns when (func = "0011") else
                (a and b) after 1 ns when (func = "0100") else
                (((a srl 0) and (31 => '1',0 to 30 => '0'))
                +((a srl 1) and (31 => '1',0 to 30 => '0'))
                +((a srl 2) and (31 => '1',0 to 30 => '0'))
                +((a srl 3) and (31 => '1',0 to 30 => '0'))
                +((a srl 4) and (31 => '1',0 to 30 => '0'))
                +((a srl 5) and (31 => '1',0 to 30 => '0'))
                +((a srl 6) and (31 => '1',0 to 30 => '0'))
                +((a srl 7) and (31 => '1',0 to 30 => '0'))
                +((a srl 8) and (31 => '1',0 to 30 => '0'))
                +((a srl 9) and (31 => '1',0 to 30 => '0'))
                +((a srl 10) and (31 => '1',0 to 30 => '0'))
                +((a srl 11) and (31 => '1',0 to 30 => '0'))
                +((a srl 12) and (31 => '1',0 to 30 => '0'))
                +((a srl 13) and (31 => '1',0 to 30 => '0'))
                +((a srl 14) and (31 => '1',0 to 30 => '0'))
                +((a srl 15) and (31 => '1',0 to 30 => '0'))
                +((a srl 16) and (31 => '1',0 to 30 => '0'))
                +((a srl 17) and (31 => '1',0 to 30 => '0'))
                +((a srl 18) and (31 => '1',0 to 30 => '0'))
                +((a srl 19) and (31 => '1',0 to 30 => '0'))
                +((a srl 20) and (31 => '1',0 to 30 => '0'))
                +((a srl 21) and (31 => '1',0 to 30 => '0'))
                +((a srl 22) and (31 => '1',0 to 30 => '0'))
                +((a srl 23) and (31 => '1',0 to 30 => '0'))
                +((a srl 24) and (31 => '1',0 to 30 => '0'))
                +((a srl 25) and (31 => '1',0 to 30 => '0'))
                +((a srl 26) and (31 => '1',0 to 30 => '0'))
                +((a srl 27) and (31 => '1',0 to 30 => '0'))
                +((a srl 28) and (31 => '1',0 to 30 => '0'))
                +((a srl 29) and (31 => '1',0 to 30 => '0'))
                +((a srl 30) and (31 => '1',0 to 30 => '0'))
                +((a srl 30) and (31 => '1',0 to 30 => '0'))) after 6 ns when (func = "0101") else
                (((b srl 0) and (31 => '1',0 to 30 => '0'))
                +((b srl 1) and (31 => '1',0 to 30 => '0'))
                +((b srl 2) and (31 => '1',0 to 30 => '0'))
                +((b srl 3) and (31 => '1',0 to 30 => '0'))
                +((b srl 4) and (31 => '1',0 to 30 => '0'))
                +((b srl 5) and (31 => '1',0 to 30 => '0'))
                +((b srl 6) and (31 => '1',0 to 30 => '0'))
                +((b srl 7) and (31 => '1',0 to 30 => '0'))
                +((b srl 8) and (31 => '1',0 to 30 => '0'))
                +((b srl 9) and (31 => '1',0 to 30 => '0'))
                +((b srl 10) and (31 => '1',0 to 30 => '0'))
                +((b srl 11) and (31 => '1',0 to 30 => '0'))
                +((b srl 12) and (31 => '1',0 to 30 => '0'))
                +((b srl 13) and (31 => '1',0 to 30 => '0'))
                +((b srl 14) and (31 => '1',0 to 30 => '0'))
                +((b srl 15) and (31 => '1',0 to 30 => '0'))
                +((b srl 16) and (31 => '1',0 to 30 => '0'))
                +((b srl 17) and (31 => '1',0 to 30 => '0'))
                +((b srl 18) and (31 => '1',0 to 30 => '0'))
                +((b srl 19) and (31 => '1',0 to 30 => '0'))
                +((b srl 20) and (31 => '1',0 to 30 => '0'))
                +((b srl 21) and (31 => '1',0 to 30 => '0'))
                +((b srl 22) and (31 => '1',0 to 30 => '0'))
                +((b srl 23) and (31 => '1',0 to 30 => '0'))
                +((b srl 24) and (31 => '1',0 to 30 => '0'))
                +((b srl 25) and (31 => '1',0 to 30 => '0'))
                +((b srl 26) and (31 => '1',0 to 30 => '0'))
                +((b srl 27) and (31 => '1',0 to 30 => '0'))
                +((b srl 28) and (31 => '1',0 to 30 => '0'))
                +((b srl 29) and (31 => '1',0 to 30 => '0'))
                +((b srl 30) and (31 => '1',0 to 30 => '0'))
                +((b srl 30) and (31 => '1',0 to 30 => '0'))) after 6 ns when (func = "0110") else
                (0 - a) after 3 ns when (func = "0111") else
                --(a + b) after 3 ns when ((func = "1000") and (cin = '0')) else
                --(a + b + "1") after 3 ns when ((func = "1000") and (cin = '1')) else
                (sum(1 to 32)) when (func = "1000") else
                (a - b) after 3 ns when (func = "1001") else
                ((31 => '1',others => '0')) after 2 ns when ((func = "1010") and (a >  b)) else
                ((31 => '0',others => '0')) after 2 ns when ((func = "1010") and (a <= b)) else
                ((31 => '1',others => '0')) after 2 ns when ((func = "1011") and (a <  b)) else
                ((31 => '0',others => '0')) after 2 ns when ((func = "1011") and (a >= b)) else
                ((31 => '1',others => '0')) after 2 ns when ((func = "1100") and (a =  b)) else
                ((31 => '0',others => '0')) after 2 ns when ((func = "1100") and (a /= b)) else
                (a ror 1) after 1 ns when (func = "1101") else
                (a rol 1) after 1 ns when (func = "1110") else
                (0 to 31 => '0') after 1 ns;--when (func = "1111")
end concurrent;