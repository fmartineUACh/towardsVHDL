--synopsys synthesis_off
----------------------------------------------------------------------------
--
-- Copyright (c) 1990, 1991, 1992 by Synopsys, Inc.  All rights reserved. 
--
--	This source file is proprietary information of Synopsys, Inc. It may
--	be used without restriction provided that this copyright statement
--	is not removed from the file, and that the code contained herein is
--	not distributed, in whole or in part, for profit.
--
--	Package name: DISTRIBUTIONS
--
--	Purpose: A set of subprograms for generating random numbers with
--		 different distributions.
--
--	Author: JAT,  3/90
--
----------------------------------------------------------------------------

package DISTRIBUTIONS is
  --
  -- These procedures generate random numbers from various distributions.
  --
  -- The random number is left in the out parameter named X.
  --
  -- The variables associated with Seed parameters must be initialized
  -- to an odd positive integer value, but these variables should not
  -- be updated except by calls into this package.
  --

  -- UNIFORM generates a random number with uniform distribution in the
  --         given interval [A,B]
  --
  procedure UNIFORM(variable Seed: inout real; constant A, B: in real;
		    variable X: out real);

  -- GAUSSIAN generates a random number with gaussian distribution with
  -- mean Xmean and standard deviation Xsigma.
  --
  procedure GAUSSIAN(variable Seed1, Seed2: inout real;
		     constant Xmean, Xsigma: in real;
		     variable X: out real);

  -- POISSON generates a random number from poisson process using
  -- the following parameter:
  --       Xlambda is the expected value in a time unit
  --
  procedure POISSON(variable Seed: inout real; constant Xlambda: in real;
		    variable X: out integer);

  -- EXPONENTIAL generates a random number with exponential distribution
  -- with mean Xmean.
  --
  procedure EXPONENTIAL(variable Seed: inout real; constant Xmean: in real;
			variable X: out real);
end DISTRIBUTIONS;

package body DISTRIBUTIONS is

  constant eps: real := 0.00001;	-- for series convergence tests

  -- LN computes the natural logarithm of the argument.
  --
  -- This function computes the logarithm using the following Taylor series:
  --    ln(x) = (x-1) -(x-1)**2/2 + (x-1)**3/3 -(x-1)**4/4+ ...; abs(x-1) < 1
  --
  function LN (x: real) return real is
    -- compute the first two elements of the series
    variable xlocal: real := x - 1.0;
    variable oldval: real := xlocal;
    variable num: real := xlocal*xlocal;
    variable count: integer := 2;
    variable newval: real := oldval - (num/real(count));
    variable sign: integer := 1;
  begin
    -- check validity of argument
    if ( x <= 0.0 or x > 2.0 ) then
       assert false report "X <= 0 or X > 2.0 in LN(X)" severity WARNING;
       return(-999999999.0);
    end if;
    -- compute the rest of the series
    while ( abs(newval - oldval) > eps ) loop
	oldval := newval;
	num := num*xlocal;
        count := count +1;
	newval := oldval + real(sign)*num/real(count);
	sign := -1 * sign;
    end loop;
    return newval;
  end LN;

  -- EXP computes the exponential of the argument.
  --
  -- This function computes the exponential using the following series:
  --    exp(x) = 1 + x + x**2/2! + x**3/3! + ... ; x > 0
  --
  function EXP (x: real) return real is
    variable reciprocal: boolean := x < 0.0;	-- check sign of argument
    variable xlocal : real := abs(x);
    -- compute the first two elements of the series
    variable oldval: real := 1.0;
    variable num: real := xlocal;
    variable count: integer := 1;
    variable denom: real := 1.0;
    variable newval: real := oldval + num/denom;
  begin
    -- compute the rest of the series
    while ( abs(newval - oldval) > eps ) loop
	oldval := newval;
	num := num*xlocal;
        count := count +1;
	denom := denom*(real(count));
        newval := oldval + num/denom;
    end loop;
    if reciprocal then
        newval := 1.0/newval;
    end if;
    return newval;
  end EXP;

  -- SQRT computes the square root of the argument.
  --
  -- This function computes the square root using the following newton-raphson
  -- approximation:
  --    F(n+1) = 0.5*[F(n) + x/F(n)]
  --
  function SQRT (x: real) return real is
    constant inival: real := 1.5;
    -- compute the first two elements of the series
    variable oldval: real := inival;
    variable newval: real := (x/oldval + oldval)/2.0;
  begin
    -- check validity of argument
    if ( x < 0.0 ) then
       assert false report "X < 0 in SQRT(X)" severity ERROR;
       return(0.0);
    end if;
    -- compute the rest of the series
    while ( abs(newval - oldval) > eps ) loop
	oldval := newval;
        newval := (x/oldval + oldval)/2.0;
    end loop;
    return newval;
  end SQRT;

  -- RANDOM generates a random number with uniform distribution between 0 and 1.
  -- This function uses the multiplicative congruential method, using
  -- the following algorithm:
  --       X(n+1) = A[X(n) + C] mod M
  --       R(n) = X(n)/M
  -- where 
  --       M = 2**d, such that M(M-1) is close to 2**32 -1
  --       C = 0
  --       A = 8t +- 3, such that t is a positive integer and A 
  --                                            is close to 2**(d/2)
  --       Seed(n) is a random number between 0 and M-1, with period M/4
  --       Seed(0) is the seed for the sequence; must be the real representation
  --            of an odd positive integer.
  --       X(n) is a random number between 0 and 1
  -- 
  procedure RANDOM(variable Seed: inout real; variable X: out real) is
    variable M: integer := 32768;
    variable A: integer := 12869;
    variable iSeed: integer := integer(Seed);
    variable iTemp: integer;
  begin
    if Seed <= 0.0 then
      assert false report "Seed <= 0 in RANDOM(Seed, X)" severity WARNING;
      Seed := 1.0;
      X := 0.0;
    else
      iTemp := iSeed*A;
      iSeed := iTemp/M;
      iSeed := iTemp - iSeed*M;
      Seed := real(iSeed);
      X := Seed/real(M);
    end if;
  end RANDOM;

  -- UNIFORM generates a random number with uniform distribution in the
  --         given interval [A,B]
  -- This function uses a random number between 0 and 1 to generate the
  -- the desired number as follows:
  --       X(n) = A + (B - A)*R(n)
  -- where 
  --       A and B are the limits of the interval
  --       X(n) is a random number between A and B
  --       R(n) is a random number between 0 and 1; generated with fSeed
  -- 
  procedure UNIFORM(variable Seed: inout real; constant A, B: in real;
		    variable X: out real) is
    variable R: real;
  begin
    RANDOM(Seed, R);
    X := A + (B-A)*R;
  end UNIFORM;

  -- GAUSSIAN generates a random number with gaussian distribution with
  -- mean Xmean and standard deviation Xsigma.
  --
  -- This function uses an acceptance/rejection method to generate the
  -- desired number.  Although there is some (small) probability that
  -- the acceptance would never be satisfied, in practice this algorithm
  -- performs better than algorithms which require trigonometric functions.
  --
  -- Seed1 and Seed2 are required to generate independent random numbers.
  --
  procedure GAUSSIAN(variable Seed1, Seed2: inout real;
		     constant Xmean, Xsigma: in real;
		     variable X: out real) is
    variable R1, R2: real;
    variable Sum, Temp1, Temp2: real;
  begin
    loop
      RANDOM(Seed1, R1);
      RANDOM(Seed2, R2);
      Temp1 := 2.0*R1 - 1.0;
      Temp2 := 2.0*R2 - 1.0;
      Sum := Temp1*Temp1 + Temp2*Temp2;
      exit when Sum <= 1.0;
    end loop;
    Temp2 := Temp1*SQRT((-2.0*LN(Sum))/Sum);
    X := Xmean + Xsigma*Temp2;
  end GAUSSIAN;

  -- POISSON generates a random number from a poisson process using
  -- the following parameters:
  --       Seed is the seed for the random numbers
  --       Xlambda is the expected value in a time unit
  --       X(n) is a poisson random number with mean Xlambda*t
  --
  procedure POISSON(variable Seed: inout real; constant Xlambda: in real;
		    variable X: out integer) is
    variable R: real;
    variable Prod: real := 1.0;
    constant Const: real := EXP(-Xlambda);
    variable iSum: integer := -1;
  begin
    while Prod > Const loop
	RANDOM(Seed, R);
	Prod := Prod*R;
	iSum := iSum + 1;
    end loop;
    X := iSum;
  end POISSON;

  -- EXPONENTIAL generates a random number with exponential distribution
  -- with mean Xmean.
  --
  -- This function uses a random number between 0 and 1 to generate the
  -- the desired number using the following algorithm:
  -- 	   X(n) = -Xmean*ln[R(n)]
  -- where
  --       R(n) is a random number between 0 and 1
  --       Seed is the seed
  --       X(n) is an exponential random number with mean Xmean
  --
  procedure EXPONENTIAL(variable Seed: inout real; constant Xmean: in real;
			variable X: out real) is
    variable R: real;
  begin
    RANDOM(Seed, R);
    X := -Xmean*LN(R);
  end EXPONENTIAL;
end DISTRIBUTIONS;
--synopsys synthesis_on
