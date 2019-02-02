--Declaración de un flip flop JK

library ieee;
use ieee.std_logic_1164.all;
USE WORK.rtlpkg.ALL;

ENTITY ffjk IS
    PORT (
	j	: IN std_logic;		-- J input to J-K register.
	k	: IN std_logic;		-- K input to J-K register.
	clk	: IN std_logic;		-- Positive edge Clock.
	q	: OUT std_logic		-- Qutput from register.
    );
END ffjk;
ARCHITECTURE archffjk OF ffjk IS
    SIGNAL qx, dx : std_logic;
BEGIN
    dx	<= (j and not(qx)) or (not(k) and qx);
    q	<= qx;
    d1:dff port map(dx,clk,qx);
END archffjk;