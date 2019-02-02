-- MAX+plus II VHDL Example
-- State Machine
-- Copyright (c) 1994 Altera Corporation

ENTITY statmach IS
	PORT(
		clk		: IN	BIT;
		input	: IN	BIT;
		reset	: IN	BIT;
		output	: OUT	BIT);
END statmach;

ARCHITECTURE a OF statmach IS
	TYPE STATE_TYPE IS (s0, s1);
	SIGNAL state	: STATE_TYPE;
BEGIN
	PROCESS (clk)
	BEGIN
		IF reset = '1' THEN
			state <= s0;
		ELSIF (clk'EVENT AND clk = '1') THEN
			CASE state IS
				WHEN s0=>
					state <= s1;
				WHEN s1=>
					IF input = '1' THEN
						state <= s0;
					ELSE
						state <= s1;
					END IF;
			END CASE;
		END IF;
	END PROCESS;
	
	output <= '1' WHEN state = s1 ELSE '0';
END a;

