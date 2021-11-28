library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_STD.all;

entity elevator is
    port (
        come,cf,switch: in std_logic_vector(0 to 3);
        clk: in std_logic;
        current_floor: out std_logic_vector(0 to 1);
        motor_up,motor_down,elevator_state: out std_logic
    );
end elevator;

architecture behavioral of elevator is
begin
    prc: process (clk)
    begin
        if (clk'event and clk='1') then
            if (switch = "0001") then
                if (cf(3) = '1' or come(3) = '1') then
                    current_floor <= "00";
                    motor_up <= '0';
                    motor_down <= '0';
                    elevator_state <= '0';
                elsif (cf(2) = '1' or come(2) = '1') then
                    current_floor <= "XX";
                    motor_up <= '1';
                    motor_down <= '0';
                    elevator_state <= '1';
                elsif (cf(1) = '1' or come(1) = '1') then
                    current_floor <= "XX";
                    motor_up <= '1';
                    motor_down <= '0';
                    elevator_state <= '1';
                elsif (cf(0) = '1' or come(0) = '1') then
                    current_floor <= "XX";
                    motor_up <= '1';
                    motor_down <= '0';
                    elevator_state <= '1';
                else
                    current_floor <= "00";
                    motor_up <= '0';
                    motor_down <= '0';
                    elevator_state <= '0';
                end if;
            elsif (switch = "0010") then
                if (cf(2) = '1' or come(2) = '1') then
                    current_floor <= "01";
                    motor_up <= '0';
                    motor_down <= '0';
                    elevator_state <= '0';
                elsif (cf(3) = '1' or come(3) = '1') then
                    current_floor <= "XX";
                    motor_up <= '0';
                    motor_down <= '1';
                    elevator_state <= '1';
                elsif (cf(1) = '1' or come(1) = '1') then
                    current_floor <= "XX";
                    motor_up <= '1';
                    motor_down <= '0';
                    elevator_state <= '1';
                elsif (cf(0) = '1' or come(0) = '1') then
                    current_floor <= "XX";
                    motor_up <= '1';
                    motor_down <= '0';
                    elevator_state <= '1';
                else
                    current_floor <= "01";
                    motor_up <= '0';
                    motor_down <= '0';
                    elevator_state <= '0';
                end if;
            elsif (switch = "0100") then
                if (cf(1) = '1' or come(1) = '1') then
                    current_floor <= "10";
                    motor_up <= '0';
                    motor_down <= '0';
                    elevator_state <= '0';
                elsif (cf(3) = '1' or come(3) = '1') then
                    current_floor <= "XX";
                    motor_up <= '0';
                    motor_down <= '1';
                    elevator_state <= '1';
                elsif (cf(2) = '1' or come(2) = '1') then
                    current_floor <= "XX";
                    motor_up <= '0';
                    motor_down <= '1';
                    elevator_state <= '1';
                elsif (cf(0) = '1' or come(0) = '1') then
                    current_floor <= "XX";
                    motor_up <= '1';
                    motor_down <= '0';
                    elevator_state <= '1';
                else
                    current_floor <= "10";
                    motor_up <= '0';
                    motor_down <= '0';
                    elevator_state <= '0';
                end if;
            elsif (switch = "1000") then
                if (cf(0) = '1' or come(0) = '1') then
                    current_floor <= "11";
                    motor_up <= '0';
                    motor_down <= '0';
                    elevator_state <= '0';
                elsif (cf(3) = '1' or come(3) = '1') then
                    current_floor <= "XX";
                    motor_up <= '0';
                    motor_down <= '1';
                    elevator_state <= '1';
                elsif (cf(2) = '1' or come(2) = '1') then
                    current_floor <= "XX";
                    motor_up <= '0';
                    motor_down <= '1';
                    elevator_state <= '1';
                elsif (cf(1) = '1' or come(1) = '1') then
                    current_floor <= "XX";
                    motor_up <= '0';
                    motor_down <= '1';
                    elevator_state <= '1';
                else
                    current_floor <= "11";
                    motor_up <= '0';
                    motor_down <= '0';
                    elevator_state <= '0';
                end if;
            else
                current_floor <= "XX";
                motor_up <= 'X';
                motor_down <= 'X';
                elevator_state <= 'X';
            end if;
        end if;
    end process prc;
end behavioral;