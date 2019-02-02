library IEEE;
use IEEE.std_logic_1164.all;
library cypress;
use cypress.rtlpkg.all;
use cypress.std_arith.all;

entity psi is
	port (
			--To LOGIC, Optional, as needed by design
			txpera			 	 :out std_logic;	
			txperb			 	 :out std_logic;
			txperc			 	 :out std_logic;	
			txperd			 	 :out std_logic;	 

			--Top level, Required
			txclka			 	 :in std_logic;	 
			txclko_p		 	 	 :out std_logic;	
			txrate			 	 :in std_logic; 

			--Top level, Required, 3 level input
			txmode			 	 :in std_logic_vector(1 downto 0); 
			txcksel			 	 :in std_logic;

			--Top level, Required
			txrstb			 	 :in std_logic; 		

			--To LOGIC, Optional, as needed by design
			ch_a_txdata_out	 		:out std_logic_vector(9 downto 0);
			ch_b_txdata_out	 :out std_logic_vector(9 downto 0);	
			ch_c_txdata_out	 :out std_logic_vector(9 downto 0); 	
			ch_d_txdata_out	 :out std_logic_vector(9 downto 0);	 
			ch_a_rxdata_out 	:out std_logic_vector(10 downto 0); 
			ch_b_rxdata_out 	:out std_logic_vector(10 downto 0); 
			ch_c_rxdata_out 	:out std_logic_vector(10 downto 0);
			ch_d_rxdata_out 	:out std_logic_vector(10 downto 0); 

			--Top level, Required
			rxrate				:in std_logic;
			rfen				:in std_logic;
			
			--Top level, Required, 3 level input
			rxmode		 	 	 :in std_logic_vector(1 downto 0);
			rxcksel			 	 :in std_logic; 
			framchar		 	 	 :in std_logic;
			rfmode			 	 :in std_logic;
			decmode			 	 :in std_logic;

			--Top level, Required
			spdsel			 	 :in std_logic; 
			rxclka_p		 	 	 :out std_logic; 
			rxclkb_p		 	 	 :inout std_logic;
			rxclkc_p		 	 	 :out std_logic; 
			rxclkd_p		 	 	 :inout std_logic;
			refclk_p		 	 	 :in std_logic;	 
			refclk_n		 	 	 :in std_logic;	 
		 	serial_outa1_p 				 :out std_logic; 
			serial_outb1_p 				 :out std_logic;
		 	serial_outc1_p 				 :out std_logic;
		 	serial_outd1_p 				 :out std_logic;
			serial_outa2_p 				 :out std_logic;
			serial_outb2_p 				 :out std_logic;
			serial_outc2_p 				 :out std_logic;
			serial_outd2_p 				 :out std_logic;
			serial_ina1_p 				 :in std_logic;
			serial_inb1_p 				 :in std_logic;
			serial_inc1_p 				 :in std_logic;
			serial_ind1_p 				 :in std_logic;
			serial_ina2_p 				 :in std_logic;
			serial_inb2_p 				 :in std_logic;
			serial_inc2_p 				 :in std_logic;
			serial_ind2_p 				 :in std_logic;
			serial_outa1_n	 	 		 :out std_logic;
			serial_outb1_n	 			 :out std_logic;
			serial_outc1_n	 			 :out std_logic;
			serial_outd1_n	 			 :out std_logic;
			serial_outa2_n	 			 :out std_logic;
			serial_outb2_n 				 :out std_logic;
			serial_outc2_n	 			 :out std_logic;
			serial_outd2_n	 			 :out std_logic;
			serial_ina1_n	 			 :in std_logic;
			serial_inb1_n	 		 	 :in std_logic;
			serial_inc1_n	 			 :in std_logic;
			serial_ind1_n	 			 :in std_logic;
			serial_ina2_n				 :in std_logic;
			serial_inb2_n				 :in std_logic;
			serial_inc2_n			 	 :in std_logic;
			serial_ind2_n				 :in std_logic;
			insela		 		 :in std_logic; 	
			inselb				 :in std_logic; 
			inselc				 :in std_logic;	
			inseld				 :in std_logic;

			--Top level, Required, 3 level input
			sdasel				 :in std_logic;

			--Top level, Required
			lpen				 :in std_logic;
			oele				 :in std_logic; 
			bistle				 :in std_logic;
			rxle				 :in std_logic; 
			boe				 :in std_logic_vector(7 downto 0); 
			bondst			 	 :inout std_logic_vector(1 downto 0); 
			masterb				 :in std_logic;
			bond_all		 		 :inout std_logic;
			bond_inhb				 :in std_logic;	
			lfiab				 :out std_logic; 
			lfibb				 :out std_logic;
			lficb				 :out std_logic;	
			lfidb				 :out std_logic;	 
			trstzb				 :in std_logic;	 
			main_clock				 :in std_logic;	 
			reset_counter 				 :in std_logic		
	);
end psi;

architecture psi_arch of psi is
	signal ch_a_txdata_in 						 	: std_logic_vector(9 downto 0);
	signal ch_b_txdata_in 							: std_logic_vector(9 downto 0);
	signal ch_c_txdata_in 							: std_logic_vector(9 downto 0); 
	signal ch_d_txdata_in 							: std_logic_vector(9 downto 0);
	signal ch_a_txdata_reg 							: std_logic_vector(9 downto 0);
	signal ch_b_txdata_reg 							: std_logic_vector(9 downto 0);
	signal ch_c_txdata_reg 							: std_logic_vector(9 downto 0);
	signal ch_d_txdata_reg 							: std_logic_vector(9 downto 0);
	signal ch_a_rxdata_reg 							: std_logic_vector(9 downto 0);	
	signal ch_b_rxdata_reg  							: std_logic_vector(9 downto 0);	
	signal ch_c_rxdata_reg  							: std_logic_vector(9 downto 0);	 
	signal ch_d_rxdata_reg  							: std_logic_vector(9 downto 0);	
	signal Txcounter1  							: std_logic_vector(2 downto 0);	 
	signal Txcounter2  							: std_logic_vector(4 downto 3);	 
	signal Txcounter3  							: std_logic_vector(7 downto 5);	 
	signal Txcounter4  							: std_logic_vector(9 downto 8);	

begin

U0: cy_15g04serdes
	port map(
		txda					=> ch_a_txdata_reg(7 downto 0), 
		txdb					=> ch_b_txdata_reg(7 downto 0), 
		txdc					=> ch_c_txdata_reg(7 downto 0), 
		txdd					=> ch_d_txdata_reg(7 downto 0), 
		txpera					=> txpera,
		txperb					=> txperb,
		txperc					=> txperc,
		txperd					=> txperd,
		txcta					=> ch_a_txdata_reg(9 downto 8),
		txctb					=> ch_b_txdata_reg(9 downto 8),
		txctc					=> ch_c_txdata_reg(9 downto 8),
		txctd					=> ch_d_txdata_reg(9 downto 8),
		txclka					=> txclka,
		txclko_p 					=> txclko_p,
		txrate					=> txrate,
		txmode					=> txmode,
		txcksel					=> txcksel,
		txrstb					=> txrstb,
		rxda					=> ch_a_rxdata_out( 10 downto 3 ),	 
		rxdb					=> ch_b_rxdata_out( 10 downto 3 ),	 
		rxdc					=> ch_c_rxdata_out( 10 downto 3 ),	 
		rxdd					=> ch_d_rxdata_out( 10 downto 3 ),	 
		rxsta					=> ch_a_rxdata_out(2 downto 0),	 
		rxstb					=> ch_b_rxdata_out(2 downto 0),	 
		rxstc					=> ch_c_rxdata_out(2 downto 0), 
		rxstd					=> ch_d_rxdata_out(2 downto 0),
		rxrate					=> rxrate,
		rfen					=> rfen,
		rxmode					=> rxmode,
		rxcksel					=> rxcksel,
		framchar		 			=> framchar,
		rfmode					=> rfmode,
		decmode					=> decmode,
		spdsel					=>spdsel,
		rxclka_p 					=> rxclka_p,
		rxclkb_p					=> rxclkb_p,
		rxclkc_p 					=> rxclkc_p,
		rxclkd_p 					=> rxclkd_p,
		refclk_p 					=> refclk_p,
		refclk_n 					=> refclk_n,
		serial_outa1_p  					=> serial_outa1_p,
		serial_outb1_p  					=> serial_outb1_p,
		serial_outc1_p  					=> serial_outc1_p,
		serial_outd1_p  					=> serial_outd1_p,
		serial_outa2_p  					=> serial_outa2_p,
		serial_outb2_p  					=> serial_outb2_p,
		serial_outc2_p  					=> serial_outc2_p,
		serial_outd2_p  					=> serial_outd2_p,
		serial_ina1_p   					=> serial_ina1_p,
		serial_inb1_p   					=> serial_inb1_p,
		serial_inc1_p   					=> serial_inc1_p,
		serial_ind1_p   					=> serial_ind1_p,
		serial_ina2_p   					=> serial_ina2_p,
		serial_inb2_p   					=> serial_inb2_p,
		serial_inc2_p   					=> serial_inc2_p,
		serial_ind2_p   					=> serial_ind2_p,
		serial_outa1_n		 	 		=> serial_outa1_n,
		serial_outb1_n	 	 			=> serial_outb1_n,
		serial_outc1_n	 	 			=> serial_outc1_n,
		serial_outd1_n 	 				=> serial_outd1_n,
		serial_outa2_n 	 				=> serial_outa2_n,
		serial_outb2_n  					=> serial_outb2_n,
		serial_outc2_n 	 				=> serial_outc2_n,
		serial_outd2_n 	 				=> serial_outd2_n,
		serial_ina1_n 	 	 			=> serial_ina1_n,
		serial_inb1_n 	 	 			=> serial_inb1_n,
		serial_inc1_n 	 	 			=> serial_inc1_n,
		serial_ind1_n 	 	 			=> serial_ind1_n,
		serial_ina2_n 	 	 			=> serial_ina2_n,
		serial_inb2_n 	 	 			=> serial_inb2_n,
		serial_inc2_n 	 	 			=> serial_inc2_n,
		serial_ind2_n 	 	 			=> serial_ind2_n,
		insela					=> insela,
		inselb					=> inselb,
		inselc					=> inselc,
		inseld					=> inseld,
		sdasel					=> sdasel,
		lpen					=> lpen,
		oele					=> oele,
		bistle					=> bistle,
		rxle					=> rxle,
		boe					=> boe	,
		bondst					=> bondst,
		masterb					=> masterb	,
		bond_all 					=> bond_all,
		bond_inhb					=> bond_inhb,
		lfiab					=> lfiab,
		lfibb					=> lfibb,
		lficb					=> lficb,
		lfidb					=> lfidb,
		trstzb					=> trstzb
	);
																			
--Counters to generate input transmit data and data fed to 
--SERDES channels A, B, C and D
	process(main_clock,reset_counter)
	begin 
		if (reset_counter = '1' )  then 
			Txcounter1 <= "111";
			Txcounter2 <= "00";	
			Txcounter3 <= "111"; 
			Txcounter4 <= "00";	 
		elsif (main_clock'event and main_clock='1') then
		 	Txcounter1 <= Txcounter1 - 1;
			Txcounter2 <= Txcounter2 + 1;
			Txcounter3 <= Txcounter3 - 1;
			Txcounter4 <= Txcounter4 + 1;
		end if;
	end process;
	-- Assignment for data that is shifted in to SERDES
	 -- channel A
	 		ch_a_txdata_in( 2 downto 0 ) <= Txcounter1; 
 	 		ch_a_txdata_in( 4 downto 3 ) <= Txcounter2;
	 		ch_a_txdata_in( 7 downto 5)  <= Txcounter3;
	 		ch_a_txdata_in( 9 downto 8)  <= Txcounter4; 
	
	  -- channel  B
	 		ch_b_txdata_in( 2 downto 0 ) <= Txcounter1; 
 	 		ch_b_txdata_in( 4 downto 3 ) <= Txcounter2;
	 		ch_b_txdata_in( 7 downto 5)  <= Txcounter3;
	 		ch_b_txdata_in( 9 downto 8)  <= Txcounter4; 
	 
	  -- channel  C
	 		ch_c_txdata_in( 2 downto 0 ) <= Txcounter1; 
 	 		ch_c_txdata_in( 4 downto 3 ) <= Txcounter2;
	 		ch_c_txdata_in( 7 downto 5)  <= Txcounter3;
	 		ch_c_txdata_in( 9 downto 8)  <= Txcounter4; 
	 
	  -- channel  D
	 		ch_d_txdata_in( 2 downto 0 ) <= Txcounter1; 
 			ch_d_txdata_in( 4 downto 3 ) <= Txcounter2;
	 		ch_d_txdata_in( 7 downto 5)  <= Txcounter3;
	 		ch_d_txdata_in( 9 downto 8)  <= Txcounter4; 
	 
	 process(main_clock)
	 begin 
		 if (main_clock'event and main_clock = '1')	then
		   		ch_a_txdata_reg <= ch_a_txdata_in; 								
			 	ch_b_txdata_reg <= ch_b_txdata_in;								
			 	ch_c_txdata_reg <= ch_c_txdata_in;								
			 	ch_d_txdata_reg <= ch_d_txdata_in;								
				ch_a_txdata_out <= ch_a_txdata_reg; 							
			 	ch_b_txdata_out <= ch_b_txdata_reg;								
			 	ch_c_txdata_out <= ch_c_txdata_reg;							
			 	ch_d_txdata_out <= ch_d_txdata_reg; 											     			end if;
	 end process;

end psi_arch; 