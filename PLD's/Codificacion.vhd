Entity Cod is
port (Res: in bit_Vector (3 downto 0);
     BCD1,BCD2: out bit_Vector(3 downto 0));
End Cod;

Architecture Codificacion of Cod is
Begin
	Process(Res)
	Begin
		if Res="0000" then BCD1<="0000"; BCD2<="0000"; -- #00
		elsif Res="0001" then  BCD1<="0001"; BCD2<="0000";	-- #01
		elsif Res="0010" then  BCD1<="0010"; BCD2<="0000"; -- #02
		elsif Res="0011" then  BCD1<="0011"; BCD2<="0000"; -- #03
		elsif Res="0100" then  BCD1<="0100"; BCD2<="0000"; -- #04
		elsif Res="0101" then  BCD1<="0101"; BCD2<="0000"; -- #05
		elsif Res="0110" then  BCD1<="0110"; BCD2<="0000"; -- #06
		elsif Res="0111" then  BCD1<="0111"; BCD2<="0000"; -- #07
		elsif Res="1000" then  BCD1<="1000"; BCD2<="0000"; -- #08
  		elsif Res="1001" then  BCD1<="1001"; BCD2<="0000"; -- #09
	 	elsif Res="1010" then  BCD1<="0000"; BCD2<="0001"; -- #10
		elsif Res="1011" then  BCD1<="0001"; BCD2<="0001"; -- #11
		elsif Res="1100" then  BCD1<="0010"; BCD2<="0001"; -- #12
		elsif Res="1101" then  BCD1<="0011"; BCD2<="0001"; -- #13
		elsif Res="1110" then  BCD1<="0100"; BCD2<="0001"; -- #14
		elsif Res="1111" then  BCD1<="0101"; BCD2<="0001"; -- #15
		else
		BCD1<="0000"; BCD2<="0000"; -- #00

		End if;
	End Process;
End Codificacion;


