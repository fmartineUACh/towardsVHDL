-- MAX+plus II VHDL Example
-- Register Inference
-- Copyright (c) 1994 Altera Corporation

ENTITY reginf IS
	PORT
	(
		d, clk, clr, pre, load, data	: IN BIT;
		q1, q2, q3, q4, q5, q6, q7		: OUT BIT
	);
END reginf;

ARCHITECTURE maxpld OF reginf IS
BEGIN

	-- Register with active-high Clock
	PROCESS
	BEGIN
	    WAIT UNTIL clk = '1';         
	    q1 <= d;
	END PROCESS;
	
	-- Register with active-low Clock
	PROCESS
	BEGIN
	    WAIT UNTIL clk = '0';          
	    q2 <= d;
	END PROCESS;
	
	-- Register with active-high Clock & asynchronous Clear
	PROCESS (clk, clr)                      
	BEGIN
	    IF clr = '1' THEN  			 
	        q3 <= '0';
	    ELSIF clk'EVENT AND clk = '1' THEN
	        q3 <= d;
	    END IF;
	END PROCESS;
	

	-- Register with active-low Clock & asynchronous Clear
	PROCESS (clk, clr)                     
	BEGIN
	    IF clr = '0' THEN  			 
	        q4 <= '0';
	    ELSIF clk'EVENT AND clk = '0' THEN
	        q4 <= d;
	    END IF;
	END PROCESS;

	-- Register with active-high Clock & asynchronous Preset
	PROCESS (clk, pre)                      
	BEGIN
	    IF pre = '1' THEN  			 
	        q5 <= '1';
	    ELSIF clk'EVENT AND clk = '1' THEN
	        q5 <= d;
	    END IF;
	END PROCESS;
	
	-- Register with active-high Clock & asynchronous load
	PROCESS (clk, load, data)                      
	BEGIN
	    IF load = '1' THEN  			 
	        q6 <= data;
	    ELSIF clk'EVENT AND clk = '1' THEN
	        q6 <= d;
	    END IF;
	END PROCESS;
	
	-- Register with active-high Clock & asynchronous Clear & Preset
	PROCESS (clk, clr, pre)                      
	BEGIN
	    IF clr = '1' THEN  			 
	        q7 <= '0';
		ELSIF pre = '1' THEN
			q7 <= '1';
	    ELSIF clk'EVENT AND clk = '1' THEN
	        q7 <= d;
	    END IF;
	END PROCESS;
	



END maxpld;

