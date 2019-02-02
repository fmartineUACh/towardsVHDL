@echo off
echo Compiling Synplify VHDL Simulation Library

REM * Batch file to compile the Synplify
REM * VHDL libraries with the VeriBest
REM * VBVHDL Simulator
REM
call %VBVHDL_RELEASE%\bin\vbinit
%VBVHDL_RELEASE%\bin\vc newlib SYNPLIFY
%VBVHDL_RELEASE%\bin\vc addlib SYNPLIFY SYNPLIFY
%VBVHDL_RELEASE%\bin\vc setlib SYNPLIFY
%VBVHDL_RELEASE%\bin\vc remlib WORKLIB
%VBVHDL_RELEASE%\bin\vc remlib -r WORKLIB
%VBVHDL_RELEASE%\bin\vc comp -uopt:2 synplify.vhd


