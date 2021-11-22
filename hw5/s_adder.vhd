library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_STD.all;

entity adder is
    generic (	
        n : integer := 8
    );
    port (
        a,b: in std_logic_vector(0 to n-1);
        start,clk,nrst: in std_logic;
        sum: out std_logic_vector(0 to n-1);
        cout,done: out std_logic
    );
end adder;

architecture behavioral of adder is
	signal carry: std_logic := '0';
        signal d: std_logic := '0';
        signal s: std_logic := '0';
        signal i: integer range 0 to n-1 := n-1;
begin
    prc: process (clk, nrst)
    begin
        if (nrst='1') then
            carry <= '0';
            i <= n-1;
            done <= '0';
            s <= '0';
            d <= '0';
            sum <= (others => '0');
        elsif (clk'event and clk='1') then
            if (s='0') then
                s <= start;
            elsif (i=0 and d='0') then
                sum(i) <= ((not carry) and (a(i) xor b(i))) or (carry and (a(i) nor b(i))) or (carry and a(i) and b(i));
                carry <= (a(i) and b(i)) or (carry and (a(i) or b(i)));
                cout <= carry;
                done <= '1';
                d <= '1';
            elsif (d='0') then
                sum(i) <= ((not carry) and (a(i) xor b(i))) or (carry and (a(i) nor b(i))) or (carry and a(i) and b(i));
                carry <= (a(i) and b(i)) or (carry and (a(i) or b(i)));
                i <= i-1;
            end if;
        end if;
    end process prc;
end behavioral;