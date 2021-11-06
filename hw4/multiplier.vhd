LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_STD.ALL;

ENTITY multiplier IS
    GENERIC (	
        n : integer := 8
    );
    PORT (
        a,b: IN std_logic_vector(0 TO n-1);
        y: OUT std_logic_vector(0 TO (2*n)-1)
    );
END multiplier;

ARCHITECTURE concurrent OF multiplier IS
    TYPE arr IS ARRAY (0 TO n) OF std_logic_vector(0 TO (2*n)-1);
    SIGNAL tmp: arr := (others => (others => '0'));
    SIGNAL sum: arr := (others => (others => '0'));
BEGIN
    y <= sum(n);
    FG1: FOR i IN 0 TO n-1 GENERATE
    BEGIN
        FG2: FOR j IN 0 TO n-1 GENERATE
        BEGIN
            tmp(i)(j+i+1) <= (a(j) and b(i));
        END GENERATE FG2;
        sum(i+1) <= sum(i) + tmp(i);
    END GENERATE FG1;
END concurrent;