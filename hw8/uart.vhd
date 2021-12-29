library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity uart is
    port (
        clk,rst,start,rx:   in  std_logic;
        data_in,baud    :   in  std_logic_vector(7 downto 0);
        data_out        :   out std_logic_vector(7 downto 0);
        data_ready,tx   :   out std_logic
    );
end uart; 
architecture behavioral of uart is
    signal input_data : std_logic_vector(7 downto 0) := (others => '0');
    signal temp_data : std_logic_vector(7 downto 0) := (others => '0');
    signal counter : integer := 1;
    signal counter2 : integer := 1;
    signal index : integer := 0;
    signal index2 : integer := 0;
    signal t_started : std_logic := '0';
    signal r_started : std_logic := '0';
    signal tx_signal : std_logic := '1';
    signal ready_signal : std_logic := '0';
begin

    tx <= tx_signal;
    data_ready <= ready_signal;
    data_out <= temp_data;
			
    transmit: process (clk,rst)
    begin
        if rst = '1' then
            input_data <= (others => '0');
            counter <= 1;
            t_started <= '0';
            tx_signal <= '1';
            index <= 0;
        elsif clk = '1' then
            if t_started = '0' then
                if start = '1' then
                    t_started <= '1';
                    input_data <= data_in;
                    index <= 0;
                    tx_signal <= '0';
                else
                    tx_signal <= '1';
                end if;
            else
                if counter = to_integer(unsigned(baud)) then
                    counter <= 1;
                    if index = 8 then
                        index <= 0;
                        t_started <= '0';
                        tx_signal <= '1';
                    else
                        tx_signal <= input_data(index);
                        index <= index + 1;
                    end if;
                else
                    counter <= counter + 1;
                end if;
            end if;
        end if;
    end process transmit;

    receive: process (clk,rst)
    begin
        if rst = '1' then
            temp_data <= (others => '0');
            counter2 <= 1;
            r_started <= '0';
            ready_signal <= '0';
            index2 <= 0;
        elsif clk = '1' then
            if r_started = '0' then
                ready_signal <= '0';
                if rx = '0' then
                    r_started <= '1';
                    index2 <= 0;
                end if;
            else
                if counter2 = to_integer(unsigned(baud)) then
                    counter2 <= 1;
                    if index2 = 8 then
                        index2 <= 0;
                        r_started <= '0';
                        ready_signal <= '1';
                    else
                        temp_data(index2) <= rx;
                        index2 <= index2 + 1;
                    end if;
                else
                    counter2 <= counter2 + 1;
                end if;
            end if;
        end if;
    end process receive;

end behavioral;