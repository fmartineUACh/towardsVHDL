FUNCTION altram(WE, Data[WIDTH-1..0], Address[Ad_Width-1..0], ClockI, ClockO, BE)
	WITH (Width, Ad_Width, NUMWORDS, FILE, RegisterInputMode)
	RETURNS (Q[WIDTH-1..0]);
