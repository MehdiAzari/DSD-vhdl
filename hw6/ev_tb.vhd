library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
use std.env.stop;

entity tb is
end entity tb;

architecture test of tb is
    signal come,cf,switch: std_logic_vector(0 to 3) := (others => '0');
    signal clk: std_logic := '0';
    signal current_floor: std_logic_vector(0 to 1) := (others => '0');
    signal motor_up,motor_down,elevator_state: std_logic := '0';
    SIGNAL PERIOD  : TIME := 15 ns;
begin
	test_mul: entity work.elevator(behavioral)
	port map (
		come => come ,
		cf => cf ,
		switch => switch ,
		clk => clk ,
		current_floor => current_floor ,
		motor_up => motor_up ,
		motor_down => motor_down ,
		elevator_state => elevator_state 
	);

    clk <= not clk after 5 ns;

    sim: process
        file inf : text open read_mode is "input.txt";
        variable text_line : line;
        variable w_time : time;
        variable data : std_logic_vector(0 to 3) := (others => '0');
    begin
        while not endfile(inf) loop
            readline(inf, text_line);
            read(text_line, w_time);
            wait for w_time;
            read(text_line, data);
            come <= data;
            read(text_line, data);
            cf <= data;
            read(text_line, data);
            switch <= data;
        end loop;
        wait for 20 ns;
        stop;
    end process sim;

end test;
