ENTITY fcadd4 IS
    PORT (CI : IN BIT;
    A3,A2,A1,A0: IN BIT;
    B3,B2,B1,B0: IN BIT;
    SUM3,SUM2,SUM1,SUM0 : OUT BIT;
CO: OUT BIT);
END fcadd4;

ARCHITECTURE archfcadd4 OF fcadd4 IS
    signal no1_o,no2_o,no3_o,no4_o: bit;
    signal na1_o,na2_o,na3_o,na4_o: bit;
BEGIN
    no1_o <= not(a0 or b0);
    na1_o <= not(a0 and b0);
    no2_o <= not(a1 or b1);
    na2_o <= not(a1 and b1);
    no3_o <= not(a2 or b2);
    na3_o <= not(a2 and b2);
    no4_o <= not(a3 or b3);
    na4_o <= not(a3 and b3);
    co <= not( (no4_o) or 
        (na4_o and no3_o) or
        (no2_o and na4_o and na3_o) or
        (no1_o and na4_o and na3_o and na2_o) or
        ((not ci) and na4_o and na3_o and na2_o and na1_o)
        ) ;
    sum3 <= (na4_o and (not no4_o)) xor
        not((no3_o) or
            (no2_o and na3_o) or
            (no1_o and na3_o and na2_o) or
            (na3_o and na2_o and na1_o and (not ci))
        );
    sum2 <= (na3_o and (not no3_o)) xor
        not ((no2_o) or
            (no1_o and na2_o) or
            (na2_o and na1_o and (not ci))
        );
    sum1 <= (na2_o and (not no2_o)) xor
        not ((no1_o) or
            (na1_o and (not ci))
            );
    sum0 <= (na1_o and (not no1_o)) xor ci;
END archfcadd4;