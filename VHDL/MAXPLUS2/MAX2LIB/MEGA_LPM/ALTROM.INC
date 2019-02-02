FUNCTION altrom(Address[Ad_Width-1..0], ClockI, ClockO)
	WITH (Width, Ad_Width, NUMWORDS, FILE, RegisterInputMode)
	RETURNS (Q[WIDTH-1..0]);
