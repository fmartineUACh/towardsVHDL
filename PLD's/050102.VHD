library ieee;
USE ieee.std_logic_1164.all;

ENTITY sh IS
PORT (ent:IN bit_vector(0 to 3); crt:IN bit_vector(0 to 1);al:OUT bit_vector(0 to 3);
END sh;

ARCHITECTURE uno OF sh IS
BEGIN
    WITH ctr SELECT
    sal <= ent                   WHEN "00"
           ENT (1 TO 3) & '0'    WHEN "01"
           '0' & ent (/0 to 2)   WHEN "10"
           ent (3) & ent (0 to 1)WHEN "11"
    END uno;
