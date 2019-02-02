
begin_template Overall Structure

--  Context Clauses

	--  Library Clause

	--  Use Clause

--	Library Units

	--  Package Declaration (optional)

	--  Package Body (optional)

	--  Entity Declaration

	--  Architecture Body
end_template

begin_template Full Design: Counter
-- MAX+plus II VHDL Template
-- Clearable loadable enablable counter

ENTITY __entity_name IS

	PORT
	(
		__data_input_name		: IN	INTEGER RANGE 0 TO __count_value;
		__clk_input_name		: IN	STD_LOGIC;
		__clrn_input_name		: IN	STD_LOGIC;
		__ena_input_name		: IN	STD_LOGIC;
		__ld_input_name			: IN	STD_LOGIC;
		__count_output_name		: OUT 	INTEGER RANGE 0 TO __count_value
	);
	
END __entity_name;

ARCHITECTURE a OF __entity_name IS

	SIGNAL	__count_signal_name	: INTEGER RANGE 0 TO __count_value;
	
BEGIN

	PROCESS (__clk_input_name, __clrn_input_name)
	BEGIN
	
		IF __clrn_input_name = '0' THEN
		
			__count_signal_name <= 0;
			
		ELSIF (__clk_input_name'EVENT AND __clk_input_name = '1') THEN
			
			IF __ld_input_name = '1' THEN
					
				__count_signal_name <= __data_input_name;
					
			ELSE
			
				IF __ena_input_name = '1' THEN

					__count_signal_name <= __count_signal_name + 1;
				
				ELSE

					__count_signal_name <= __count_signal_name;
					
				END IF;
				
			END IF;
			
		END IF;
		
	END PROCESS;

	__count_output_name <= __count_signal_name;
	
END a;
end_template

begin_template Full Design: Flipflop
-- MAX+plus II VHDL Template
-- Clearable flipflop with enable

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY __entity_name IS

	PORT
	(
		__d_input_name		: IN	STD_LOGIC;
		__clk_input_name	: IN	STD_LOGIC;
		__clrn_input_name	: IN	STD_LOGIC;
		__ena_input_name	: IN	STD_LOGIC;
		__q_output_name		: OUT 	STD_LOGIC
	);
	
END __entity_name;

ARCHITECTURE a OF __entity_name IS

	SIGNAL	__q_signal_name	: STD_LOGIC;
	
BEGIN

	PROCESS (__clk_input_name, __clrn_input_name)
	BEGIN
	
		IF __clrn_input_name = '0' THEN
		
			__q_signal_name <= '0';
			
		ELSIF (__clk_input_name'EVENT AND __clk_input_name = '1') THEN
		
			IF __ena_input_name = '1' THEN
			
				__q_signal_name <= __d_input_name;
			
			ELSE
			
				__q_signal_name <= __q_signal_name;
				
			END IF;
			
		END IF;
		
	END PROCESS;
			
	__q_output_name <= __q_signal_name;
	
END a;
end_template

begin_template Full Design: Tri-State Buffer
-- MAX+plus II VHDL Template
-- Tri-State Buffer

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY __entity_name IS

	PORT
	(
		__oe_input_name			: IN	STD_LOGIC;
		__data_input_name		: IN	STD_LOGIC;
		__tri_output_name		: OUT 	STD_LOGIC
	);
	
END __entity_name;

ARCHITECTURE a OF __entity_name IS
BEGIN

	PROCESS (__oe_input_name, __data_input_name)
	BEGIN
	
		IF __oe_input_name = '0' THEN
		
			__tri_output_name <= 'Z';
			
		ELSE
			
			__tri_output_name <= __data_input_name;

		END IF;
		
	END PROCESS;
END a;
end_template

begin_template Architecture Body
ARCHITECTURE a OF __entity_name IS
	SIGNAL __signal_name : STD_LOGIC;
	SIGNAL __signal_name : STD_LOGIC;
BEGIN
	--  Process Statement

	--  Concurrent Procedure Call

	--  Concurrent Signal Assignment

	--  Conditional Signal Assignment

	--  Selected Signal Assignment

	--  Component Instantiation Statement

	--  Generate Statement
END a;
end_template

begin_template Case Statement
CASE __expression IS
	WHEN __constant_value =>
	    __statement;
	    __statement;
	WHEN __constant_value =>
	    __statement;
	    __statement;
	WHEN OTHERS =>
	    __statement;
	    __statement;
END CASE;
end_template

begin_template Component Declaration
COMPONENT __component_name
	PORT(
		__input_name, __input_name		: IN	STD_LOGIC;
		__bidir_name, __bidir_name		: INOUT	STD_LOGIC;
		__output_name, __output_name	: OUT	STD_LOGIC);
END COMPONENT;
end_template

begin_template Component Instantiation Statement
__instance_name: __component_name 
	PORT MAP (	__formal_parameter => __actual_parameter, 
				__formal_parameter => __actual_parameter);
end_template

begin_template Concurrent Procedure Call
__label: __procedure_name(__actual_parameter, __actual_parameter);
end_template

begin_template Concurrent Signal Assignment Statement
__signal <= __expression;
end_template

begin_template Conditional Signal Assignment
__label:
__signal <= __expression WHEN __boolean_expression ELSE
			__expression WHEN __boolean_expression ELSE
			__expression;
end_template

begin_template Constant Declaration
CONSTANT __constant_name : __type_name := __constant_value;
end_template

begin_template Entity Declaration
ENTITY __entity_name IS
	PORT(
		__input_name, __input_name		: IN	STD_LOGIC;
		__input_vector_name				: IN	STD_LOGIC_VECTOR(__high downto __low);
		__bidir_name, __bidir_name		: INOUT	STD_LOGIC;
		__output_name, __output_name	: OUT	STD_LOGIC);
END __entity_name;
end_template

begin_template For Statement
__loop_label:
FOR __index_variable IN __range LOOP
    __statement;
    __statement;
END LOOP __loop_label;
end_template

begin_template Generate Statement (For Generate)
__generate_label:
FOR __index_variable IN __range GENERATE
    __statement;
    __statement;
END GENERATE;
end_template

begin_template Generate Statement (If Generate)
__generate_label:
IF __expression GENERATE
    __statement;
    __statement;
END GENERATE;
end_template

begin_template If Statement
IF __expression THEN
    __statement;
    __statement;
ELSIF __expression THEN
    __statement;
    __statement;
ELSE
    __statement;
    __statement;
END IF;
end_template

begin_template Library Clause
LIBRARY __library_name;
end_template

begin_template Package Declaration
PACKAGE __package_name IS
	--  Type Declaration

	--  Subtype Declaration

	--  Constant Declaration

	--  Signal Declaration

	--  Component Declaration
END __package_name;
end_template

begin_template Procedure Call Statement
__procedure_name(__actual_parameter, __actual_parameter);
end_template

begin_template Process (Combinatorial Logic)
__process_label:
PROCESS (__signal_name, __signal_name, __signal_name)
	VARIABLE __variable_name : STD_LOGIC;
	VARIABLE __variable_name : STD_LOGIC;
BEGIN
	--  Signal Assignment Statement

	--  Variable Assignment Statement

	--  Procedure Call Statement

	--  If Statement

	--  Case Statement

	--  Loop Statement
END PROCESS __process_label;
end_template

begin_template Process (Sequential Logic)
__process_label:
PROCESS
	VARIABLE __variable_name : STD_LOGIC;
	VARIABLE __variable_name : STD_LOGIC;
BEGIN
	WAIT UNTIL __clk_signal = '1';

	--  Signal Assignment Statement

	--  Variable Assignment Statement

	--  Procedure Call Statement

	--  If Statement

	--  Case Statement

	--  Loop Statement
END PROCESS __process_label;
end_template

begin_template Selected Signal Assignment Statement
__label:
WITH __expression SELECT
	__signal <= __expression WHEN __constant_value,
				__expression WHEN __constant_value,
				__expression WHEN __constant_value,
				__expression WHEN __constant_value;
end_template

begin_template Signal Declaration
SIGNAL __signal_name : __type_name;
end_template

begin_template Signal Assignment Statement
__signal_name <= __expression;
end_template

begin_template State Machine with Asynch. Reset
ENTITY __machine_name IS
	PORT(
		clk								: IN	STD_LOGIC;
		reset							: IN	STD_LOGIC;
		__input_name, __input_name		: IN	STD_LOGIC;
		__output_name, __output_name	: OUT	STD_LOGIC);
END __machine_name;

ARCHITECTURE a OF __machine_name IS
	TYPE STATE_TYPE IS (__state_name, __state_name, __state_name);
	SIGNAL state: STATE_TYPE;
BEGIN
	PROCESS (clk)
	BEGIN
		IF reset = '1' THEN
			state <= _state_name;
		ELSIF clk'EVENT AND clk = '1' THEN
			CASE state IS
				WHEN __state_name =>
					IF __condition THEN
						state <= __state_name;
					END IF;

				WHEN __state_name =>
					IF __condition THEN
						state <= __state_name;
					END IF;

				WHEN __state_name =>
					IF __condition THEN
						state <= __state_name;
					END IF;

			END CASE;
		END IF;
	END PROCESS;

	WITH state SELECT
		__output_name 	<=	__output_value	WHEN	__state_name,
							__output_value	WHEN	__state_name,
							__output_value	WHEN	__state_name;
END a;
end_template

begin_template State Machine without Asynch. Reset
ENTITY __machine_name IS
	PORT(
		clk								: IN	STD_LOGIC;
		__input_name, __input_name		: IN	STD_LOGIC;
		__output_name, __output_name	: OUT	STD_LOGIC);
END __machine_name;

ARCHITECTURE a OF __machine_name IS
	TYPE STATE_TYPE IS (__state_name, __state_name, __state_name);
	SIGNAL state: STATE_TYPE;
BEGIN
	PROCESS (clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN
			CASE state IS
				WHEN __state_name =>
					IF __condition THEN
						state <= __state_name;
					END IF;

				WHEN __state_name =>
					IF __condition THEN
						state <= __state_name;
					END IF;

				WHEN __state_name =>
					IF __condition THEN
						state <= __state_name;
					END IF;

			END CASE;
		END IF;
	END PROCESS;

	WITH state SELECT
		__output_name 	<=	__output_value	WHEN	__state_name,
							__output_value	WHEN	__state_name,
							__output_value	WHEN	__state_name;
END a;
end_template

begin_template Subtype
SUBTYPE __subtype_name IS __type_name RANGE __low_value TO __high_value;
SUBTYPE __array_subtype_name IS __array_type_name(__high_index DOWNTO __low_index);
end_template

begin_template Type
TYPE __enumerated_type_name IS (__name, __name, __name);
TYPE __range_type_name IS RANGE __integer TO __integer;
TYPE __array_type_name IS ARRAY (INTEGER RANGE <>) OF __type_name;
TYPE __array_type_name IS ARRAY (__integer DOWNTO __integer) OF __type_name;
end_template

begin_template Use Clause
USE __library_name.__package_name.ALL;
end_template

begin_template Wait Statement
WAIT UNTIL __clk_name = '1';
end_template

begin_template Variable Declaration Statement
VARIABLE __variable_name : __type_name;
end_template

begin_template Variable Assignment Statement
__variable_name := __expression;
end_template

begin_template While Statement
__loop_label:
WHILE __boolean_expression LOOP
    __statement;
    __statement;
END LOOP __loop_label;
end_template

