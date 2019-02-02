PACKAGE STANDARD IS

	-- predefined enumeration types:

	TYPE BOOLEAN IS (FALSE,TRUE);

	TYPE BIT IS ('0', '1');

	TYPE CHARACTER IS (
		NUL, SOH, STX, ETX, EOT, ENQ, ACK, BEL,
		BS,  HT,  LF,  VT,  FF,  CR,  SO,  SI,
		DLE, DC1, DC2, DC3, DC4, NAK, SYN, ETB,
		CAN, EM,  SUB, ESC, FSP, GSP, RSP, USP,
		' ', '!', '"', '#', '$', '%', '&', ''',
		'(', ')', '*', '+', ',', '-', '.', '/',
		'0', '1', '2', '3', '4', '5', '6', '7',
		'8', '9', ':', ';', '<', '=', '>', '?',
		'@', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
		'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
		'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
		'X', 'Y', 'Z', '[', '\', ']', '^', '_',
		'`', 'a', 'b', 'c', 'd', 'e', 'f', 'g',
		'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
		'p', 'q', 'r', 's', 't', 'u', 'v', 'w',
		'x', 'y', 'z', '{', '|', '}', '~', DEL,
		C128, C129, C130, C131, C132, C133, C134, C135,
		C136, C137, C138, C139, C140, C141, C142, C143,
		C144, C145, C146, C147, C148, C149, C150, C151,
		C152, C153, C154, C155, C156, C157, C158, C159,
		' ', '¡', '¢', '£', '¤', '¥', '¦', '§',
		'¨', '©', 'ª', '«', '¬', '­', '®', '¯',
		'°', '±', '²', '³', '´', 'µ', '¶', '·',
		'¸', '¹', 'º', '»', '¼', '½', '¾', '¿',
		'À', 'Á', 'Â', 'Ã', 'Ä', 'Å', 'Æ', 'Ç',
		'È', 'É', 'Ê', 'Ë', 'Ì', 'Í', 'Î', 'Ï',
		'Ð', 'Ñ', 'Ò', 'Ó', 'Ô', 'Õ', 'Ö', '×',
		'Ø', 'Ù', 'Ú', 'Û', 'Ü', 'Ý', 'Þ', 'ß',
		'à', 'á', 'â', 'ã', 'ä', 'å', 'æ', 'ç',
		'è', 'é', 'ê', 'ë', 'ì', 'í', 'î', 'ï',
		'ð', 'ñ', 'ò', 'ó', 'ô', 'õ', 'ö', '÷',
		'ø', 'ù', 'ú', 'û', 'ü', 'ý', 'þ', 'ÿ');

	TYPE SEVERITY_LEVEL IS (NOTE, WARNING, ERROR, FAILURE);

	-- predefined numeric types:

	TYPE INTEGER IS RANGE -2147483648 TO 2147483647;

	TYPE REAL IS RANGE -1.0E38 TO 1.0E38;

   -- predefined type TIME:

	TYPE TIME IS RANGE - 2**62 -2**62 TO 2**62 - 1 + 2**62
		UNITS
			FS;
			PS = 1000 FS;
			NS = 1000 PS;
			US = 1000 NS;
			MS = 1000 US;
			SEC = 1000 MS;
			MIN = 60 SEC;
			HR = 60 MIN;
		END UNITS;

	SUBTYPE DELAY_LENGTH IS TIME RANGE 0 FS TO TIME'HIGH;

	-- function that returns the current simulation time:

	FUNCTION NOW RETURN DELAY_LENGTH;

	-- predefined numeric subtypes:

	SUBTYPE NATURAL IS INTEGER RANGE 0 TO INTEGER'HIGH;

	SUBTYPE POSITIVE IS INTEGER RANGE 1 TO INTEGER'HIGH;

	-- predefined array types:

	TYPE STRING IS ARRAY (POSITIVE RANGE <>) OF CHARACTER;

	TYPE BIT_VECTOR IS ARRAY (NATURAL RANGE <>) OF BIT;

	TYPE FILE_OPEN_KIND IS (READ_MODE, WRITE_MODE, APPEND_MODE);

	TYPE FILE_OPEN_STATUS IS (OPEN_OK, STATUS_ERROR, NAME_ERROR, MODE_ERROR);

	ATTRIBUTE FOREIGN: STRING;

END STANDARD;
package TEXTIO is

    -- Types definitions for Text I/O

    type LINE is access string;

    type TEXT is file of string;

    type SIDE is (right, left);

    subtype WIDTH is natural;

    -- Standard Text Files

    file input : TEXT open READ_MODE	is "STD_INPUT";
    file output : TEXT open WRITE_MODE	is "STD_OUTPUT";

    -- Input Routines for Standard Types

    procedure READLINE(file f: TEXT; L: inout LINE);

    procedure READ(L:inout LINE; VALUE: out bit; GOOD : out BOOLEAN);
    procedure READ(L:inout LINE; VALUE: out bit);

    procedure READ(L:inout LINE; VALUE: out bit_vector; GOOD : out BOOLEAN);
    procedure READ(L:inout LINE; VALUE: out bit_vector);

    procedure READ(L:inout LINE; VALUE: out BOOLEAN; GOOD : out BOOLEAN);
    procedure READ(L:inout LINE; VALUE: out BOOLEAN);

    procedure READ(L:inout LINE; VALUE: out character; GOOD : out BOOLEAN);
    procedure READ(L:inout LINE; VALUE: out character);

    procedure READ(L:inout LINE; VALUE: out integer; GOOD : out BOOLEAN);
    procedure READ(L:inout LINE; VALUE: out integer);

    procedure READ(L:inout LINE; VALUE: out real; GOOD : out BOOLEAN);
    procedure READ(L:inout LINE; VALUE: out real);

    procedure READ(L:inout LINE; VALUE: out string; GOOD : out BOOLEAN);
    procedure READ(L:inout LINE; VALUE: out string);

    procedure READ(L:inout LINE; VALUE: out time; GOOD : out BOOLEAN);
    procedure READ(L:inout LINE; VALUE: out time);

    -- Output Routines for Standard Types

    procedure WRITELINE(file f : TEXT; L : inout LINE);

    procedure WRITE(L : inout LINE; VALUE : in bit;
	      JUSTIFIED: in SIDE := right;
	      FIELD: in WIDTH := 0);

    procedure WRITE(L : inout LINE; VALUE : in bit_vector;
	      JUSTIFIED: in SIDE := right;
	      FIELD: in WIDTH := 0);

    procedure WRITE(L : inout LINE; VALUE : in BOOLEAN;
	      JUSTIFIED: in SIDE := right;
	      FIELD: in WIDTH := 0);

    procedure WRITE(L : inout LINE; VALUE : in character;
	      JUSTIFIED: in SIDE := right;
	      FIELD: in WIDTH := 0);

    procedure WRITE(L : inout LINE; VALUE : in integer;
	      JUSTIFIED: in SIDE := right;
	      FIELD: in WIDTH := 0);

    procedure WRITE(L : inout LINE; VALUE : in real;
	      JUSTIFIED: in SIDE := right;
	      FIELD: in WIDTH := 0;
	      DIGITS: in NATURAL := 0);

    procedure WRITE(L : inout LINE; VALUE : in string;
	      JUSTIFIED: in SIDE := right;
	      FIELD: in WIDTH := 0);

    procedure WRITE(L : inout LINE; VALUE : in time;
	      JUSTIFIED: in SIDE := right;
	      FIELD: in WIDTH := 0;
	      UNIT: in TIME := ns);

end TEXTIO;
