
-------------------------------------------------------------------------------
-- Copyright 1997, VeriBest, Inc.
--
-- Package: VB.SWIFT
-- LMC Swift Interface
-------------------------------------------------------------------------------

library IEEE;
use     IEEE.std_logic_1164.all;

PACKAGE SWIFT IS

    FUNCTION swf_initiate (
            template_name   : in string; 
            timing_version  : in string;
            instance_name   : in string;
            smartRange      : in string;
            pldfile         : in string;
            memfile         : in string;
            pcdfile         : in string
    ) RETURN integer;
    attribute FOREIGN of swf_initiate: FUNCTION
            is "internal:swf_initiate";

    FUNCTION swf_create_port_handle (
            instance_id     : in integer;
            port_name       : in string
    ) RETURN integer;
    attribute FOREIGN of swf_create_port_handle: FUNCTION
            is "internal:swf_create_port_handle";

    PROCEDURE swf_evaluate (
            instance_id     : in integer
    );
    attribute FOREIGN of swf_evaluate: PROCEDURE
            is "internal:swf_evaluate";

    PROCEDURE swf_set_port_value (
            instance_id     : in integer;
            phandle         : in integer;
            value           : in std_logic
    );
    attribute FOREIGN of swf_set_port_value: PROCEDURE
            is "internal:swf_set_port_value";

    FUNCTION swf_get_port_value (
            instance_id     : in integer;
            phandle         : in integer
    ) RETURN std_logic;
    attribute FOREIGN of swf_get_port_value: FUNCTION
            is "internal:swf_get_port_value";
   
    FUNCTION swf_get_port_delay (
            instance_id     : in integer;
            phandle         : in integer
    ) RETURN time;
    attribute FOREIGN of swf_get_port_delay: FUNCTION
            is "internal:swf_get_port_delay";

    FUNCTION swf_output_changed (
            instance_id     : in integer;
            phandle         : in integer
    ) RETURN boolean;
    attribute FOREIGN of swf_output_changed: FUNCTION
            is "internal:swf_output_changed";

    PROCEDURE swf_dump_mem (
            instance_name   : in string;
            dump_file_name  : in string
    );
    attribute FOREIGN of swf_dump_mem: PROCEDURE
            is "internal:swf_dump_mem";
END SWIFT;

PACKAGE BODY SWIFT IS

    -- These are dummy bodies for the FOREIGN subprograms.
    -- Ignore the compiler warning "missing return statement"
    -- when compiling this package body.

    FUNCTION swf_initiate (
            template_name   : in string;
            timing_version  : in string;
            instance_name   : in string;
            smartRange      : in string;
            pldfile         : in string;
            memfile         : in string;
            pcdfile         : in string
    ) RETURN integer is
    begin
    end swf_initiate;

    FUNCTION swf_create_port_handle (
            instance_id     : in integer;
            port_name       : in string
    ) RETURN integer is
    begin
    end swf_create_port_handle;

    PROCEDURE swf_evaluate (
            instance_id     : in integer
    ) is
    begin
    end swf_evaluate;

    PROCEDURE swf_set_port_value (
            instance_id     : in integer;
            phandle         : in integer;
            value           : in std_logic
    ) is
    begin
    end swf_set_port_value;

    FUNCTION swf_get_port_value (
            instance_id     : in integer;
            phandle         : in integer 
    ) RETURN std_logic is
    begin
    end swf_get_port_value;

    FUNCTION swf_get_port_delay (
            instance_id     : in integer;
            phandle         : in integer
    ) RETURN time is
    begin
    end swf_get_port_delay;

    FUNCTION swf_output_changed (
            instance_id     : in integer;
            phandle         : in integer
    ) RETURN boolean is
    begin
    end swf_output_changed;

    PROCEDURE swf_dump_mem (
            instance_name   : in string;
            dump_file_name  : in string
    ) is
    begin
    end swf_dump_mem;
END SWIFT;
