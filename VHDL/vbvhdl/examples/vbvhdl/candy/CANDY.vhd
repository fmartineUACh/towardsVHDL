--
-- File : C:\USERS\VBVHDL\candy\genhdl\sbk\candy.vhd
-- CDB  : C:\USERS\VBVHDL\candy\candy.cdb
-- By   : CDB2VHDL Netlister version 14.5.0.6
-- Time : Wed Jun 26 12:04:01 1996


-- Entity/architecture declarations

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CANDY is
    port(
        NICKEL_OUT : out std_logic;
        SNICKERS_OUT : out std_logic;
        MARS_OUT : out std_logic;
        MOUNDS_OUT : out std_logic;
        HERSHEYS_OUT : out std_logic;
        CLK : in std_logic;
        NICKEL_IN : in std_logic;
        DIME_IN : in std_logic;
        RST : in std_logic;
        SNICKERS : in std_logic;
        MARS : in std_logic;
        MOUNDS : in std_logic;
        HERSHEYS : in std_logic
    );
end CANDY;

architecture CANDY of CANDY is
    -- Component declarations
    component MONEY
        port(
            CLK : in std_logic := 'X';
            RST : in std_logic := 'X';
            NICKEL_IN : in std_logic := 'X';
            DIME_IN : in std_logic := 'X';
            NICKEL_OUT : out std_logic;
            DISPENSE : out std_logic;
            SEL_MADE : in std_logic := 'X'
        );
    end component;
    component SELECT1
        port(
            SNICKERS : in std_logic := 'X';
            MARS : in std_logic := 'X';
            MOUNDS : in std_logic := 'X';
            HERSHEYS : in std_logic := 'X';
            ENABLE : in std_logic := 'X';
            SEL_MADE : out std_logic;
            SNICKERS_OUT : out std_logic;
            MARS_OUT : out std_logic;
            MOUNDS_OUT : out std_logic;
            HERSHEYS_OUT : out std_logic
        );
    end component;
    -- Signal declarations
    signal DISPENSE : std_logic;
    signal SEL_MADE : std_logic;
begin
    -- Signal assignments
    -- Component instances
    XBLK1 : MONEY
        port map(
            CLK => CLK,
            RST => RST,
            NICKEL_IN => NICKEL_IN,
            DIME_IN => DIME_IN,
            NICKEL_OUT => NICKEL_OUT,
            DISPENSE => DISPENSE,
            SEL_MADE => SEL_MADE
        );
    XBLK2 : SELECT1
        port map(
            SNICKERS => SNICKERS,
            MARS => MARS,
            MOUNDS => MOUNDS,
            HERSHEYS => HERSHEYS,
            ENABLE => DISPENSE,
            SEL_MADE => SEL_MADE,
            SNICKERS_OUT => SNICKERS_OUT,
            MARS_OUT => MARS_OUT,
            MOUNDS_OUT => MOUNDS_OUT,
            HERSHEYS_OUT => HERSHEYS_OUT
        );
end CANDY;
