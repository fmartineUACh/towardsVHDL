=================================================================
                  VeriBest VHDL Simulation Example
                  ================================

Introduction
============
The VeriBest VHDL Simulator (VBVHDL) is a tightly integrated
VHDL based simulation solution that supports the 1993 IEEE
VHDL standard and VITAL (IEEE1076.4).

The VeriBest VHDL Simulator user interface feature include:
 * Wave Viewer           - interactive simulation waveform
                           display and analysis tool that can
			   display signal values (including
			   enumerated types and simulation
			   deltas).
 * Library Browser       - graphical interface for managing
                           VHDL libraries.
 * Hierarchy Browser     - to view the design hierarchy.
 * Network Traversor     - to view signal drivers.
 * Source Level Debugger - provides debug capability, setting
                           and stepping through breakpoints in
                           the vhdl source, Watch capability to
                           monitor/set values of vhdl objects,
                           and monitoring the call stack.


About the Circuit
=================
The circuit documented in this READ_ME file is a top-down
hierarchical design describing a simple candy machine. It
contains three hierarchical blocks (MONEY, SELECT1, and CANDY).
The design was created using the following guidelines:
 * The candy machine only takes nickels and dimes
 * Candy bars cost 15 cents
 * The possible selections are Snickers, Mars, Mounds, and
   Hersheys

The example has 2 versions: "vbvhdl" and "vbdc". The "vbvhdl"
example describes the CANDY design in VHDL and covers the VBVHDL
simulator only. The "vbdc" example describes the VBDC
schematics which must be translated into vhdl for VBVHDL
simulation. "vbdc" is provided for the support of the "VeriBest
VHDL Quick Start" manual, Appendix B.
For this READ_ME use only the "vbvhdl" version.

The MONEY block is a state machine described in behavioral VHDL.
It monitors the NICKEL_IN and DIME_IN inputs, and then generates
a DISPENSE pulse when 15 cents has been accumulated. It
generates a NICKEL_OUT signal if you insert more than 15 cents.
After a candy bar selection has been made, a SEL_MADE signal
resets the state machine back to its initial state (CLEAR) and
asynchronous reset signal (RST), resets the state machine. The
state machine is synchronized with the rising edge of the CLK
signal.

The SELECT1 block is also a behavioral VHDL block.
This block is only enabled when the MONEY block generates a
DISPENSE pulse. Other inputs to this block include the signals
for selecting a candy bar, outputs including a signal
representing the selected candy bar, and a signal
(SEL_MADE) which indicates a selection has been made.
The SEL_MADE signal resets the state machine in the MONEY block
to its CLEAR state.

The CANDY block is a structural VHDL block that contains the
instances MONEY and SELECT1, and describes the interconnections
between them.

The TESTBENCH block is the top level of the design, and it
contains the block CANDY and the stimulus used to exercise the
functionality of the design.
 

Setup for VBVHDL environment:
=============================
Use "My Computer" or "Windows NT Explorer" to copy the example
to the location where you wish to run it. For example:

     Copy <vbvhdl-install>\examples\vbvhdl to \users\default

 <vbvhdl-install> is the location where VBVHDL was installed,
 The default is C:\VERIBEST\VBVHDL.


Running the example:
====================

 I. To launch VBVHDL, Select Start:Programs:VeriBest VB99.0:
    VeriBest VHDL Simulator:VeriBest VHDL.
    ==>> VeriBest VHDL GUI opens.

II. Opening the excandy Workspace:
    ----------------------------
    The first step in using VBVHDL is to create a workspace if one
    does not exist. The workspace file (*.vpd) specifies the VHDL
    source files used in the design and their compile order.  It
    also contains information on the default compile and simulation
    settings like the design root. "excandy.vpd" is the Workspace
    file supplied for this example with the settings required.
    To open the delivered workspace, Click on the Workspace Menu
    and select "Open". Use the windows browse features to select
    the workspace file - excandy.vpd

III. Setting up the Working Library:
     -------------------------------
     Creating a new workspace automatically creates the "work"
     library and compiles in the IEEE and STD libraries.

     If you open a delivered workspace file and the default
     libraries do not exist, use "vbinit" provided by VBVHDL to
     create the libraries. Type,

	vbinit <execute>

     In the "Command" field in the VBVHDL window, above the
     message panel.

IV. Compiling the Design:
    ---------------------
    To compile the design, select Compile All from the Workspace
    menu.
    (Notice the compiler messages under the "Build" tab of the
     output window indicating the status of the compile.)

V. Setting the Design Root:
   ------------------------
   Normally, before running the simulation, you need to set the
   Design Root for the design. For this example, the design root
   (Entity=TESTBENCH and Arch=STIMULUS)has been set in the
   delivered workspace file, excandy.vpd.

The design is now compiled and ready for simulation, please go to
"Running Simulation" section to continue with the exercise.

VI. Running Simulation:
    -------------------
    To launch the simulator, select "Execute Simulator" from the
    Workspace menu. The Simulator Toolbar is enabled and the
    Debug Toolbar is added to the window.
    (Notice the messages in the Simulate area at the bottom of the
     window, indicating the status of the command.)

    The simulator completes the initialization and
    elaboration process and is ready when the message panel
    states:
       Ready to simulate...

    Enter 1000 in the simulation runtime field and click on the
    run icon to simulate.

VII. Analysis of the simulation:
     ---------------------------
        1. To view the design hierarchy showing signals, 
           variables, constants and generics:
           Select "New Hierarchy Browser" in the Tools
           menu. You can browse the design by expanding
           the VHDL objects in the left hierarchy structure.

        2. To launch the Waveform Viewer:
	   Click on the Tools menu and select "New Waveform
           Window". You may close or iconify the Hierarchy
           Browser.

	3. To View the Waveforms:
           Click on "Add Signals" in the WaveForm window.
           In the dialog box that opens, click on the object
           DUT:CANDY(CANDY), and click on the Add All button,
           and then click the Close button.
 	   All the signals in DUT:CANDY(CANDY) appear in the
           Viewer.

        4. To view signal data starting from time zero perform a
           Zoom-to-Fit.

	5. To Set the Time Scale for the Waveforms:
           Enter 10 in the Scale field and hit Enter.
 
        6. Viewing/Analyzing Results in the Run-Time Viewer:
	   To view the time of a signal transition, select and
           hold down the left mouse button on a signal
           transition. The signal name, transition time,
           transition delta, and value are displayed in a
           yellow popup box.

           You can also place the arrow on the triangular head
           of the time cursor and drag it by holding the left
           mouse button down to a transition or a time unit.
           The time will be displayed as Pos: in the bottom of
           the window.
 
           a. Looking at the results.
              At time 35ns, the machine resets. A 20ns pulse of
              the NICKEL_IN or DIME_IN signals indicates a
              nickel or dime was inserted.

              At time 55ns, a 65ns pulse on NICKEL_IN indicates
 	      that three nickels have been put into the machine.
              This is exact change of 15 cents, so there is no
 	      pulse generated for NICKEL_OUT.

              At time 130ns, a pulse on DISPENSE indicates that
              the machine accumulated the 15 cents necessary
              for a candy.

              At time 155ns(Delta 1), a pulse of the signal
              SNICKERS indicates a Snickers bar was selected.

              At time 155ns(Delta 3), the machine dispenses the
              Snickers bar as indicated by the SNICKERS_OUT pulse.

              At time 155ns(Delta 3), a SEL_MADE pulse indicates
              that the transaction is complete and the machine
	      resets to accept more money.

              Similarly,
              At time 215ns, a 40ns pulse of NICKEL_IN
              indicates that two nickels were inserted.

              At time 255ns, a 25ns pulse of DIME_IN indicates
	      that one dime was inserted. The total is 20cents.
              At time 270ns: a pulse of NICKEL_OUT returns a
	      nickel in change.

              At time 310ns(Delta 1).  A selection for a Mounds
              bar was made

              At time 310ns(Delta 5), it was dispensed; pulse on
              MOUNDS_OUT.

              At time 310ns(Delta 5), SEL_MADE has a pulse.


VIII. Viewing Signal Drivers with the Network Traverser:
      --------------------------------------------------
      Select "New Network Traverser" from the Tools menu.
      Click the Add Signals button in the Network Traverser
      window.
      Select signal NICKEL_IN and click Add Signal button in
      the Add Signal window. Then click the Close button. The
      network traverser displays the signal
      and the driver TESTBENCH:STIMULUS:NICKEL_IN(Driver At line
      39). Double-clicking on the driver opens the source code
      file "testbnch.vhd".

      - Close the Waveform Viewer window.
      - Close the window opened to "testbnch.vhd" .
      - Close the "Hierarchy Browser" window.
      - Close the "Network Traverser" window.

IX. Using Source Level Debugger:
    ----------------------------
    The Debugger is used for debugging your VHDL source code.
    It provides the capabilities of setting breakpoints at
    lines in your source code, stepping through code, watching
    values of vhdl objects, and a call stack to display nested
    subprograms you are in and the source code line number
    where each subprogram was called.

    To Restart the Simulator:
    Select "Quit" from the Simulate menu to quit the simulator.
    Select "Execute Simulator" from the Workspace menu to restart
    it.

    To Open the Source Code:
    Double-click on money.vhd in the workspace window. This opens
    the source code in an editor window.

    To Debug with breakpoints:
    Scroll down to line 29< DISPENSE <= '0'; > in money.vhd and
    click on it. Select "Insert/Remove a Breakpoint" in the
    Debug menu. It puts a breakpoint at the line. Notice the
    message in the Simulate Message panel indicating the
    breakpoint is set.

    Scroll down to line 96< IF (CLK'event AND CLK='1') THEN >
    in money.vhd and set a breakpoint there. Select "Show
    Breakpoints" from the Debug menu to see a list of
    breakpoints set.  Cancel from the Breakpoints window.

    Open the Call Stack window by selecting Call Stack from
    the Debug menu. To view any suprogram calling sequence.

    Run the simulator for 100ns.

    The simulator stops at the breakpoint at line 29 at time 0.
    Notice the green arrow on line29.
    Click on the Step Icon in the toobar or select "Step" from
    the Debug menu. Do this several times to step through the
    code. See the green arrow move to indicate the line you
    are at.
    If you keep stepping, you will notice that eventually you 
    step into SELECT1.VHD. Its source code opens automatically.
    If you were to continue, you would step back to line29
    of MONEY.VHD. This is because the value of the signal
    SEL_MADE is changed in SELECT1. SEL_MADE is in the
    sensitivity list of the process SM1 in MONEY. When the
    value of SEL_MADE is changed in SELECT1, the process SM1
    in MONEY starts executing.

   Note: The Call Stack window lists the program/subprograms
    you are in. For this example we are not in any subprogram
    so you will see it change between MONEY and SELECT1 as you
    step through.

    Using the Watch Window:
    The watch window is used to examine the values of multiple
    signals, variables, constants and generics over the run of
    the simulation.
    Select "New Watch Window" from the Debug Menu.
    Click on "Add Watch" button.
    Select the TESTBENCH(STIMULUS) block and click the Watch
    Block button.
    Close the Add Watch window. All the objects in the
    testbench are displayed with their values.
    Keep the watch window open, step through MONEY.VHD.
    Watch how the values in the Watch window change as you
    step through the code.

When you are finished, select "Stop Debugging" from the Debug menu.

      - Close the Watch window.
      - Close the Call Stack window.
      - Close the window opened to "testbnch.vhd" .
      - Close the window opened to "Select1.vhd" .
      - Close the window opened to "MONEY.vhd" .

To Exit:
========
Select "Quit" from the Simulator menu. Then, select "Exit"
from the File menu.

================================================================