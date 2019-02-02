package STANDARD is

    -- Predefined enumeration types

    type BOOLEAN is (FALSE, TRUE);

    type BIT is ('0', '1');

    type CHARACTER IS (
	NUL,	SOH,	STX,	ETX,	EOT,	ENQ, 	ACK,	BEL,
	BS,	HT,	LF, 	VT,	FF,	CR,	SO,	SI,
	DLE,	DC1,	DC2,	DC3,	DC4,	NAK,	SYN,	ETB,
	CAN,	EM,	SUB,	ESC,	FSP,	GSP,	RSP,	USP,

	' ',	'!',	'"',	'#',	'$',	'%',	'&',	''',
	'(',	')',	'*',	'+',	',',	'-',	'.',	'/',
	'0',	'1',	'2',	'3',	'4',	'5',	'6',	'7',
	'8',	'9',	':',	';',	'<',	'=',	'>',	'?',

	'@',	'A',	'B',	'C',	'D',	'E',	'F',	'G',
	'H',	'I',	'J',	'K',	'L',	'M',	'N',	'O',
	'P',	'Q',	'R',	'S',	'T',	'U',	'V',	'W',
	'X',	'Y',	'Z','	'[',	'\',	']',	'^',	'_',

	'`',	'a',	'b',	'c',	'd',	'e',	'f',	'g',
	'h',	'i',	'j',	'k',	'l',	'm',	'n',	'o',
	'p',	'q',	'r',	's',	't',	'u',	'v',	'w',
	'x',	'y',	'z','	'{',	'|',	'}',	'~',	DEL,

	C128,	C129,	C130,	C131,	C132,	C133,	C134,	C135,
	C136,	C137,	C138,	C139,	C140,	C141,	C142,	C143,
	C144,	C145,	C146,	C147,	C148,	C149,	C150,	C151,
	C152,	C153,	C154,	C155,	C156,	C157,	C158,	C159,

	'?',	'?',	'?',	'?',	'?',	'?',	'?',	'?',
	'?',	'?',	'?',	'?',	'?',	'?',	'?',	'?',
	'?',	'?',	'?',	'?',	'?',	'?',	'?',	'?',
	'?',	'?',	'?',	'?',	'?',	'?',	'?',	'?',

	'?',	'?',	'?',	'?',	'?',	'?',	'?',	'?',
	'?',	'?',	'?',	'?',	'?',	'?',	'?',	'?',
	'?',	'?',	'?',	'?',	'?',	'?',	'?',	'?',
	'?',	'?',	'?',	'?',	'?',	'?',	'?',	'?',

	'?',	'?',	'?',	'?',	'?',	'?',	'?',	'?',
	'?',	'?',	'?',	'?',	'?',	'?',	'?',	'?',
	'?',	'?',	'?',	'?',	'?',	'?',	'?',	'?',
	'?',	'?',	'?',	'?',	'?',	'?',	'?',	'?');

    type SEVERITY_LEVEL is (NOTE, WARNING, ERROR, FAILURE);

    -- Predefined numeric types

    type INTEGER is range -2147483648 to 2147483647;

    type REAL is range -1.7e38 to 1.7e38;

    -- Predefined type TIME

    type TIME is range -9223372036854775808 to 9223372036854775807
        units
            fs;			-- femtosecond
	    ps	= 1000 fs;	-- picosecond
	    ns	= 1000 ns;	-- nanosecond
	    us	= 1000 ns;	-- microsecond
	    ms	= 1000 us;	-- millisecond
	    sec	= 1000 ms;	-- second
	    min	= 60 sec;	-- minute
	    hr = 60 min;	-- hour
	end units;

    subtype DELAY_LENGTH is TIME range 0 fs to TIME'HIGH;

    -- A function that returns the current simulation time, Tc (see Section 12.6.4):

    impure function NOW return DELAY_LENGTH;

    -- Predefined numeric subtypes:

    subtype NATURAL is INTEGER range 0 to INTEGER'HIGH;

    subtype POSITIVE is INTEGER range 1 to INTEGER'HIGH;

    -- Predefined array types:

    type STRING is array (POSITIVE range <>) of CHARACTER;

    type BIT_VECTOR is array (NATURAL range <>) of BIT;

    -- The predefined types for opening files:

    type FILE_OPEN_KIND is (
	READ_MODE,	-- Resulting access mode is read-only.
	WRITE_MODE,	-- Resulting access mode is write-only.
	APPEND_MODE);	-- Resulting access mode is write-only; information
			-- is appended to the end of the existing file.

    type FILE_OPEN_STATUS is (
	OPEN_OK,	-- File open was successful.
	STATUS_ERROR,	-- File object was already open.
	NAME_ERROR,	-- External file not found or inaccessible.
	MODE_ERROR);	-- Could not open file with requested access mode.

    -- The 'FOREIGN attribute:

    attribute FOREIGN: STRING;

end STANDARD;
