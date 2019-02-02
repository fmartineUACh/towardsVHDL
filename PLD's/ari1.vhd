entity myadd is port (
         a, b : in integer range 0 to 3;
         sum: out integer range 0 to 6);
end myadd;   

architecture archmyadd of myadd is
begin
        sum <= a + b;
end archmyadd;