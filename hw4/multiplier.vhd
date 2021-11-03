LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_STD.ALL;
ENTITY multiplier IS
    GENERIC (	
        n : integer := 8
    );
    PORT (
        clk         : IN std_logic;
        A, B        : IN std_logic_vector(0 TO n-1);
        result      : OUT std_logic_vector(0 TO (2*n)-1)
    );
END multiplier;
ARCHITECTURE concurrent OF multiplier IS

    TYPE vectorn_n IS ARRAY (0 TO n-1) OF std_logic_vector(0 TO n-1);
    TYPE vectorn_2n IS ARRAY (0 TO n-1) OF std_logic_vector(0 TO (2*n)-1);

    SIGNAL tmp         : std_logic_vector(0 TO (2*n)-1);

    SIGNAL carry            : vectorn_2n := (others => (others => '0'));
    SIGNAL partial_sum  : vectorn_2n := (others => (others => '0'));

    SIGNAL and_all  : vectorn_n;

BEGIN

    GEN1: FOR i IN 0 TO n-1 GENERATE
        GEN2: FOR j IN 0 TO n-1 GENERATE
            and_all(i)(j) <= A(i) AND B(j);
        END GENERATE GEN2;
    END GENERATE GEN1;

    GEN3: FOR i IN 1 TO n-1 GENERATE
        carry(i)(i-1) <= '0';
    END GENERATE GEN3;


    PROCESS (clk)

        VARIABLE offset : integer;

        BEGIN
            IF clk = '1' THEN

                FOR i IN 1 TO n-1 LOOP

                    offset := i; 
                    partial_sum(1)(i) <= (and_all(i)(0) XOR and_all(i)(1) XOR carry(1)(i-1));

                    FOR j IN i-2 DOWNTO 0 LOOP
                            partial_sum(offset - j)(i)   <= (and_all(j)(offset-j) XOR partial_sum(offset-j-1)(i) XOR carry(offset-j)(i-1));
                            
                            carry(offset - j)(i)     <= (and_all(j)(offset-j) AND partial_sum(offset-j-1)(i)) 
                                                    OR (and_all(j)(offset-j) AND carry(offset-j)(i-1)) 
                                                    OR (partial_sum(offset-j-1)(i) AND carry(offset-j)(i-1));
                        END LOOP;

                END LOOP;


                partial_sum(0)(n-1) <= '0';

                FOR i IN 1 TO n-1 LOOP

                    partial_sum(i-1)(i+n-1) <= partial_sum(i-1)(i+n-2);

                    FOR j IN n DOWNTO i+1 LOOP
                            partial_sum(n-j+i)(i+n-1)   <= (and_all(j-1)(n-j+i) XOR partial_sum(n-j+i-1)(i+n-1) XOR carry(n-j+i)(i+n-2));
                            
                            carry(n - j)(i)     <= (and_all(j-1)(n-j+i) AND partial_sum(n-j+i-1)(i+n-1)) 
                                                OR (and_all(j-1)(n-j+i) AND carry(n-j+i)(i+n-2)) 
                                                OR (partial_sum(n-j+i-1)(i+n-1) AND carry(n-j+i)(i+n-2));
                        END LOOP;
                        
                END LOOP;


                tmp(0) <= and_all(0)(0);

                FOR i IN 1 TO (2*n)-2 LOOP
                    tmp(i) <= partial_sum(n-1)(i);
                END LOOP;

                tmp((2*n)-1) <= carry(n-1)((2*n)-1);

            END IF;

        END PROCESS;

        result <= A*B;

END concurrent;