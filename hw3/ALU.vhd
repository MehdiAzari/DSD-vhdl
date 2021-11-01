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
begin
    y <= (not a)       	when (func = "0000") else
         (a nand b ) 	when (func = "0001") else
         (a nor b) 	when (func = "0010") else
         (a xor b)    	when (func = "0011") else
         (a and b)      when (func = "0100") else
         ("1")        when (func = "0101") else
         ("10")        when (func = "0110") else
         ("11")        when (func = "0111") else
         (a)           	when (func = "1000") else
         (a)           	when (func = "1001") else
         (a)           	when (func = "1010") else
         (a)           	when (func = "1011") else
         (a)           	when (func = "1100") else
         (a)           	when (func = "1101") else
         (a)           	when (func = "1110") else
         (a);--        	when (func = "1111")
end concurrent;