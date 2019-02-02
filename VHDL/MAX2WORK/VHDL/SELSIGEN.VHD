-- MAX+plus II VHDL Example
-- Selected Signal Assignment with Enumeration Type
-- Copyright (c) 1994 Altera Corporation

PACKAGE meals_pkg IS
	TYPE MEAL IS (BREAKFAST, LUNCH, DINNER, MIDNIGHT_SNACK);
END meals_pkg;

USE work.meals_pkg.all;

ENTITY selsigen IS
	PORT
	(
		previous_meal	: IN MEAL;
		next_meal		: OUT MEAL
	);
END selsigen;

ARCHITECTURE maxpld OF selsigen IS
BEGIN

WITH previous_meal	SELECT
	next_meal <=	BREAKFAST 	WHEN DINNER | MIDNIGHT_SNACK,
					LUNCH	 	WHEN BREAKFAST,
					DINNER 		WHEN LUNCH;	
		
END maxpld;

