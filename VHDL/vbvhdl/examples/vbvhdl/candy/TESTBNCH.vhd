library ieee;
use ieee.std_logic_1164.all;

entity TESTBENCH is
end TESTBENCH;

architecture STIMULUS of TESTBENCH is

    component CANDY
        port(
            CLK, RST, NICKEL_IN, DIME_IN,
            SNICKERS, MARS, MOUNDS, HERSHEYS: in std_logic;
            NICKEL_OUT, SNICKERS_OUT, MARS_OUT,
            MOUNDS_OUT, HERSHEYS_OUT: out std_logic);
    end component;

    signal  CLK, RST, NICKEL_IN, DIME_IN,
            SNICKERS, MARS, MOUNDS, HERSHEYS,
            NICKEL_OUT, SNICKERS_OUT, MARS_OUT,
            MOUNDS_OUT, HERSHEYS_OUT: std_logic;

    for DUT: CANDY use
        entity WORK.CANDY(CANDY);

begin

    DUT: CANDY port map (
        CLK, RST, NICKEL_IN, DIME_IN, SNICKERS, MARS, MOUNDS, HERSHEYS,
        NICKEL_OUT, SNICKERS_OUT, MARS_OUT, MOUNDS_OUT, HERSHEYS_OUT);

    clock: process
        variable clktmp: std_logic := '1';
    begin
        clktmp := not clktmp;
        CLK <= clktmp;
        wait for 10 ns;
    end process;

    stimulus: process
    begin
        NICKEL_IN <= '0';
        DIME_IN <= '0';
        SNICKERS <= '0';
        MARS <= '0';
        MOUNDS <= '0';
        HERSHEYS <= '0';
        RST <= '1';
        wait for 35 ns;
        RST <= '0';
        wait for 20 ns;
        NICKEL_IN <= '1';
        wait for 65 ns;
        NICKEL_IN <= '0';
        wait for 35 ns;
        SNICKERS <= '1';
        wait for 25 ns;
        SNICKERS <= '0';
        wait for 35 ns;
        NICKEL_IN <= '1';
        wait for 40 ns;
        NICKEL_IN <= '0';
        DIME_IN <= '1';
        wait for 25 ns;
        DIME_IN <= '0';
        wait for 30 ns;
        MOUNDS <= '1';
        wait for 25 ns;
        MOUNDS <= '0';
        wait for 60 ns;
        DIME_IN <= '1';
        wait for 40 ns;
        DIME_IN <= '0';
        wait for 35 ns;
        MARS <= '1';
        wait for 25 ns;
        MARS <= '0';
        wait for 60 ns;
        DIME_IN <= '1';
        wait for 25 ns;
        DIME_IN <= '0';
        wait for 25 ns;
        NICKEL_IN <= '1';
        wait for 25 ns;
        NICKEL_IN <= '0';
        wait for 25 ns;
        HERSHEYS <= '1';
        wait for 25 ns;
        HERSHEYS <= '0';
        wait;
    end process;

end STIMULUS;
