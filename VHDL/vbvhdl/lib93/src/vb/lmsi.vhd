-------------------------------------------------------------------------------
-- Copyright 1997, VeriBest, Inc.
--
-- Package: LMSI
-- Logic Modeling Hardware modeler interface FUNCTIONs and attributes
-------------------------------------------------------------------------------

library IEEE;
use     IEEE.std_logic_1164.all;

PACKAGE LMSI IS

	FUNCTION lmsiInitialise (
			 deviceName : in string;
			 pathName : in string;
			 delayMode : in string;
			 vectorLogging : in string;
			 vectorLoggingFileName : in string;
			 vhdl93Flag : in integer
			 ) return integer;
	attribute FOREIGN of lmsiInitialise : FUNCTION
			 is "internal:lmsiInitialise";

	FUNCTION lmsiInitialiseWithLogging (
			 deviceName : in string;
			 pathName : in string;
			 delayMode : in string;
			 vectorLogging : in string;
			 vectorLoggingFileName : in string;
			 vhdl93Flag : in integer
			 ) return integer;
	attribute FOREIGN of lmsiInitialiseWithLogging : FUNCTION
			 is "internal:lmsiInitialiseWithLogging";

	FUNCTION lmsiGetPortHandle (
			 instanceId : in integer;
			 portName : in string
			 ) return integer;
	attribute FOREIGN of lmsiGetPortHandle : FUNCTION
			 is "internal:lmsiGetPortHandle";

	FUNCTION lmsiSetValue (
			 instanceId : in integer;
			 portId : in integer;
			 value : in std_logic
			 ) return integer;
	attribute FOREIGN of lmsiSetValue : FUNCTION
			 is "internal:lmsiSetValue";

	FUNCTION lmsiEvaluate (
			 instanceId : in integer
			 ) return integer;
	attribute FOREIGN of lmsiEvaluate : FUNCTION
			 is "internal:lmsiEvaluate";

	FUNCTION lmsiIsEvent (
			 instanceId : in integer;
			 portId : in integer
			 ) return boolean;
	attribute FOREIGN of lmsiIsEvent : FUNCTION
			 is "internal:lmsiIsEvent";

	FUNCTION lmsiGetValue (
			 instanceId : in integer;
			 portId : in integer
			 ) return std_logic;
	attribute FOREIGN of lmsiGetValue : FUNCTION
			 is "internal:lmsiGetValue";

	FUNCTION lmsiGetDelayType (
			 instanceId : in integer;
			 portId : in integer
			 ) return integer;
	attribute FOREIGN of lmsiGetDelayType : FUNCTION
			 is "internal:lmsiGetDelayType";

	FUNCTION lmsiGetTypicalDelay (
			 instanceId : in integer;
			 portId : in integer
			 ) return TIME;
	attribute FOREIGN of lmsiGetTypicalDelay : FUNCTION
			 is "internal:lmsiGetTypicalDelay";

END LMSI;

PACKAGE BODY LMSI IS

    -- These are dummy bodies for the FOREIGN subprograms.
    -- Ignore the compiler warning "missing return statement"
    -- when compiling this package body.

	FUNCTION lmsiInitialise (
			 deviceName : in string;
			 pathName : in string;
			 delayMode : in string;
			 vectorLogging : in string;
			 vectorLoggingFileName : in string;
			 vhdl93Flag : in integer
			 ) return integer is
	begin
	end lmsiInitialise;

	FUNCTION lmsiInitialiseWithLogging (
			 deviceName : in string;
			 pathName : in string;
			 delayMode : in string;
			 vectorLogging : in string;
			 vectorLoggingFileName : in string;
			 vhdl93Flag : in integer
			 ) return integer is
	begin
	end lmsiInitialiseWithLogging;

	FUNCTION lmsiGetPortHandle (
			 instanceId : in integer;
			 portName : in string
			 ) return integer is
	begin
	end lmsiGetPortHandle;

	FUNCTION lmsiSetValue (
			 instanceId : in integer;
			 portId : in integer;
			 value : in std_logic
			 ) return integer is
	begin
	end lmsiSetValue;

	FUNCTION lmsiEvaluate (
			 instanceId : in integer
			 ) return integer is
	begin
	end lmsiEvaluate;

	FUNCTION lmsiIsEvent (
			 instanceId : in integer;
			 portId : in integer
			 ) return boolean is
	begin
	end lmsiIsEvent;

	FUNCTION lmsiGetValue (
			 instanceId : in integer;
			 portId : in integer
			 ) return std_logic is
	begin
	end lmsiGetValue;

	FUNCTION lmsiGetDelayType (
			 instanceId : in integer;
			 portId : in integer
			 ) return integer is
	begin
	end lmsiGetDelayType;

	FUNCTION lmsiGetTypicalDelay (
			 instanceId : in integer;
			 portId : in integer
			 ) return TIME is
	begin
	end lmsiGetTypicalDelay;

END LMSI;
