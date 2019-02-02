--------------------------------------------------------------------------------
-- 
--              Copyright Cypress Semiconductor, 2000
--              Protected as an unpublished work.
-- 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library primitive;
use primitive.c2gsp.all;

entity c2gffo is
port (	data_in	: in    std_logic_vector(15 downto 0);
	rstb	: in    std_logic;
	wrclk	: in    std_logic;
	out_2d	: out   std_logic_vector(15 downto 0);
	rdclk	: in    std_logic;
	fifoerr	: out   std_logic;
	fifoempty:inout std_logic);
end c2gffo;

architecture sim of c2gffo is

    signal intrstb	: std_logic;
    signal fifoclr	: std_logic;
    signal undflow_err	: std_logic;
    signal ovflow_err	: std_logic;
    signal d_avl	: std_logic;
    signal d_avl_sync1	:std_logic;
    signal d_avl_sync2	:std_logic;
    signal d_avl_sync2_d:std_logic;
    signal rstb_d	: std_logic;
    signal rstb_2d	: std_logic;
    signal fifofull	: std_logic;
    signal rdcnt	: integer range 0 to 5;
    signal rdcnt_sync1	: integer range 0 to 5;
    signal rdcnt_sync2	: integer range 0 to 5;
    signal wrcnt	: integer range 0 to 5;
    signal wrcnt_sync1	: integer range 0 to 5;
    signal wrcnt_sync2	: integer range 0 to 5;
    signal fifoclrcnt	: integer range 0 to 9;
    signal data_out	: std_logic_vector(15 downto 0);
    signal out_d	: std_logic_vector(15 downto 0);
    signal temp1	: std_logic_vector(15 downto 0);
    signal temp2	: std_logic_vector(15 downto 0);
    signal temp3	: std_logic_vector(15 downto 0);
    signal temp4	: std_logic_vector(15 downto 0);
    signal temp5	: std_logic_vector(15 downto 0);
    signal temp6	: std_logic_vector(15 downto 0);

begin

    Write: process (wrclk, intrstb)
    begin
	if (intrstb = '0') then
	    wrcnt	<=  0;
	    rdcnt_sync1	<=  0;
	    rdcnt_sync2	<=  0;
	    ovflow_err	<= '0' after 200 ps;
	    d_avl	<= '0';
	    fifofull	<= '0';
	elsif (rising_edge(wrclk)) then
	    d_avl <= '1';

	    if (fifofull = '0') then
		if (wrcnt = 5) then
		    wrcnt <= 0;
		else
		    wrcnt <= wrcnt + 1;
		end if;
	    else
		ovflow_err <= '1';
	    end if;

	    if (((wrcnt-rdcnt_sync1) >= 5) OR ((rdcnt_sync1-wrcnt) = 1)) then
		fifofull <= '1';
	    else
		fifofull <= '0';
	    end if;

	    rdcnt_sync1 <= rdcnt;
	    rdcnt_sync2 <= rdcnt_sync1;

	end if;

	if (rising_edge(wrclk)) then
	    rstb_d  <= rstb;
	    rstb_2d <= rstb_d;
	    if (fifofull = '0') then
	    	case (wrcnt) is
		    when 0 => temp1 <= data_in;
		    when 1 => temp2 <= data_in;
		    when 2 => temp3 <= data_in;
		    when 3 => temp4 <= data_in;
		    when 4 => temp5 <= data_in;
		    when 5 => temp6 <= data_in;
		end case;
	    end if;
	end if;
    end process;

    Read: process (rdclk, intrstb)
    begin
	if (intrstb = '0') then
	    rdcnt	<=  0;
	    wrcnt_sync1	<=  0;
	    wrcnt_sync2	<=  0;
	    d_avl_sync1	<= '0';
	    d_avl_sync2	<= '0';
	    fifoempty	<= '1';
	    fifoclrcnt	<=  0;
	    data_out	<= x"5555";
	elsif (rising_edge(rdclk)) then
	    case (rdcnt) is
		when 0 => data_out <= temp1;
		when 1 => data_out <= temp2;
		when 2 => data_out <= temp3;
		when 3 => data_out <= temp4;
		when 4 => data_out <= temp5;
		when 5 => data_out <= temp6;
	    end case;

	    out_d <= data_out;
	    out_2d <= out_d;

	    if (rdcnt /= wrcnt_sync1) then
		if (rdcnt = 5) then
		    rdcnt <= 0;
		else
		    rdcnt <= rdcnt + 1;
		end if;
	    end if;

	    wrcnt_sync1 <= wrcnt;
	    wrcnt_sync2 <= wrcnt_sync1;

	    d_avl_sync1 <= d_avl;
	    d_avl_sync2 <= d_avl_sync1;

	    if (rdcnt = wrcnt_sync1) then
		fifoempty <= '1';
	    else
		fifoempty <= '0';
	    end if;

	    if ((undflow_err = '1') OR (ovflow_err = '1')) then
		fifoclrcnt <= 1;
	    elsif (fifoclrcnt /= 0) then
		fifoclrcnt <= fifoclrcnt + 1;
	    end if;
	end if;
    end process;

    d_avl_sync2_d <= d_avl_sync2 after 200 ps;

    fifoerr	<= undflow_err OR ovflow_err;
    undflow_err	<= fifoempty AND d_avl_sync2_d;
    fifoclr	<= '1' when (fifoclrcnt = 9) else '0';
    intrstb	<= rstb AND NOT fifoclr;

end sim;
