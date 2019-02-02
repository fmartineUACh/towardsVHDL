-- VHDL Generator 1.6.0.0
-- Copyright (c) 1988-1991 by CAD Language Systems, Inc.  All rights reserved.

PACKAGE STANDARD IS
    TYPE BOOLEAN IS (FALSE, TRUE);
    TYPE BIT IS ('0', '1');
    TYPE CHARACTER IS (NUL, SOH, STX, ETX, EOT, ENQ, ACK, BEL, BS, HT, LF, VT, 
                       FF, CR, SO, SI, DLE, DC1, DC2, DC3, DC4, NAK, SYN, ETB, 
                       CAN, EM, SUB, ESC, FSP, GSP, RSP, USP, ' ', '!', '"', 
                       '#', '$', '%', '&', ''', '(', ')', '*', '+', ',', '-', 
                       '.', '/', '0', '1', '2', '3', '4', '5', '6', '7', '8', 
                       '9', ':', ';', '<', '=', '>', '?', '@', 'A', 'B', 'C', 
                       'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 
                       'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 
                       'Z', '[', '\', ']', '^', '_', '`', 'a', 'b', 'c', 'd', 
                       'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 
                       'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 
                       '{', '|', '}', '~', DEL);
    TYPE SEVERITY_LEVEL IS (NOTE, WARNING, ERROR, FAILURE);
    TYPE INTEGER IS RANGE -2147483648 TO 2147483647;
    TYPE REAL IS RANGE -1.7014110e+038 TO 1.7014110e+038;
    TYPE TIME IS RANGE -9223372036854775808 TO 9223372036854775807
        UNITS fs;
            ps = 1000 fs;
            ns = 1000 ps;
            us = 1000 ns;
            ms = 1000 us;
            sec = 1000 ms;
            min = 60 sec;
            hr = 60 min;
        END UNITS;
    FUNCTION NOW RETURN TIME;
    SUBTYPE NATURAL IS INTEGER RANGE 0 TO INTEGER'HIGH;
    SUBTYPE POSITIVE IS INTEGER RANGE 1 TO INTEGER'HIGH;
    TYPE STRING IS ARRAY (POSITIVE RANGE <>) OF CHARACTER;
    TYPE BIT_VECTOR IS ARRAY (NATURAL RANGE <>) OF BIT;
END STANDARD;
