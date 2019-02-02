LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MONEY IS
    PORT (CLK : IN X01Z
        ; RST : IN X01Z
        ; NICKEL_IN : IN X01Z
        ; DIME_IN : IN X01Z
        ; SEL_MADE : IN X01Z
        ; NICKEL_OUT : OUT X01Z
        ; DISPENSE : OUT X01Z
);

END MONEY;

ARCHITECTURE state_diagram OF MONEY IS

    ATTRIBUTE ENUM_TYPE_ENCODING: STRING;

    TYPE TYP_sm1 IS (CLEAR, FIVE, TEN, FIFTEEN, OWE_NICKEL, READY);
    SIGNAL CS_sm1, NS_sm1 : TYP_sm1;


BEGIN 

sm1: 
  PROCESS (CS_sm1, RST, NICKEL_IN, DIME_IN, SEL_MADE) 
  BEGIN
    DISPENSE <= '0';
    NICKEL_OUT <= '0';

    CASE CS_sm1 IS
      WHEN CLEAR =>
        NS_sm1 <= CLEAR;
        DISPENSE <= ('0');
        NICKEL_OUT <= ('0');

        IF ((((NICKEL_IN = '1') AND (DIME_IN = '0')) AND (SEL_MADE = 
               '0'))) THEN
          NS_sm1 <= FIVE;
        ELSIF ((((NICKEL_IN = ( '0' )) AND (DIME_IN = ( '1' ))) AND (SEL_MADE = 
               ( '0' )))) THEN
          NS_sm1 <= TEN;
        ELSE
          NS_sm1 <= CLEAR;
        END IF;

      WHEN FIVE =>

        IF ((((NICKEL_IN = ( '0' )) AND (DIME_IN = ( '1' ))) AND (SEL_MADE = 
               ( '0' )))) THEN
          NS_sm1 <= FIFTEEN;
        ELSIF ((((NICKEL_IN = ( '1' )) AND (DIME_IN = ( '0' ))) AND (SEL_MADE = 
               ( '0' )))) THEN
          NS_sm1 <= TEN;
        ELSE
          NS_sm1 <= FIVE;
        END IF;

      WHEN TEN =>

        IF ((((NICKEL_IN = ( '1' )) AND (DIME_IN = ( '0' ))) AND (SEL_MADE = 
               ( '0' )))) THEN
          NS_sm1 <= FIFTEEN;
        ELSIF ((((NICKEL_IN = ( '0' )) AND (DIME_IN = ( '1' ))) AND (SEL_MADE = 
               ( '0' )))) THEN
          NS_sm1 <= OWE_NICKEL;
        ELSE
          NS_sm1 <= TEN;
        END IF;

      WHEN FIFTEEN =>
          NS_sm1 <= READY;

      WHEN OWE_NICKEL =>
        NICKEL_OUT <= ('1');
          NS_sm1 <= FIFTEEN;

      WHEN READY =>
        DISPENSE <= ('1');

        IF ((SEL_MADE = ( '1' ))) THEN
          NS_sm1 <= CLEAR;
        ELSE
          NS_sm1 <= READY;
        END IF;

    END CASE;

  END PROCESS sm1; 

sm1_CTL:
  PROCESS (CLK, RST)
  BEGIN

    IF (CLK'event AND CLK='1')  THEN 
        CS_sm1 <= NS_sm1;
    END IF;

    IF (RST= '1' ) THEN 
        CS_sm1 <= CLEAR;
    END IF;

  END PROCESS;


END state_diagram;
