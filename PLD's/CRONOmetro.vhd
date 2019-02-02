
--  CYPRESS NOVA XVL Structural Architecture

--  JED2VHD Reverse Assembler - 6.0.1 IR 18


--    VHDL File: CRONO.vhd

--    Date: Sat Aug 24 12:15:09 2002

--  Disassembly from Jedec file for: c373i

--  Device Ordercode is: CY7C373I-125JC
library ieee;
use ieee.std_logic_1164.all;

library primitive;
use primitive.c37xp.all;


-- Beginning Test Bench Header

ENTITY crono IS
    PORT (
	                 clk :    in std_logic ;
	               reset :    in std_logic ;
	                paro :    in std_logic ;
	           centesima : inout std_logic_vector (3 downto 0) ;
	             decimas : inout std_logic_vector (3 downto 0) ;
	            segundos : inout std_logic_vector (3 downto 0) ;
	                 s10 : inout std_logic_vector (2 downto 0) ;
	              minuto : inout std_logic_vector (3 downto 0)
    );
END crono;

-- End of Test Bench Header

ARCHITECTURE DSMB of crono is

	signal jed_node1	: std_logic:='0' ;
	signal jed_node2	: std_logic:='0' ;
	signal jed_node3	: std_logic:='0' ;
	signal jed_node4	: std_logic:='0' ;
	signal jed_node5	: std_logic:='0' ;
	signal jed_node6	: std_logic:='0' ;
	signal jed_node7	: std_logic:='0' ;
	signal jed_node8	: std_logic:='0' ;
	signal jed_node9	: std_logic:='0' ;
	signal jed_node10	: std_logic:='0' ;
	signal jed_node11	: std_logic:='0' ;
	signal jed_node12	: std_logic:='0' ;
	signal jed_node13	: std_logic:='0' ;
	signal jed_node14	: std_logic:='0' ;
	signal jed_node15	: std_logic:='0' ;
	signal jed_node16	: std_logic:='0' ;
	signal jed_node17	: std_logic:='0' ;
	signal jed_node18	: std_logic:='0' ;
	signal jed_node19	: std_logic:='0' ;
	signal jed_node20	: std_logic:='0' ;
	signal jed_node21	: std_logic:='0' ;
	signal jed_node22	: std_logic:='0' ;
	signal jed_node23	: std_logic:='0' ;
	signal jed_node24	: std_logic:='0' ;
	signal jed_node25	: std_logic:='0' ;
	signal jed_node26	: std_logic:='0' ;
	signal jed_node27	: std_logic:='0' ;
	signal jed_node28	: std_logic:='0' ;
	signal jed_node29	: std_logic:='0' ;
	signal jed_node30	: std_logic:='0' ;
	signal jed_node31	: std_logic:='0' ;
	signal jed_node32	: std_logic:='0' ;
	signal jed_node34	: std_logic:='0' ;
	signal jed_node35	: std_logic:='0' ;
	signal jed_node36	: std_logic:='0' ;
	signal jed_node37	: std_logic:='0' ;
	signal jed_node38	: std_logic:='0' ;
	signal jed_node39	: std_logic:='0' ;
	signal jed_node40	: std_logic:='0' ;
	signal jed_node42	: std_logic:='0' ;
	signal jed_node43	: std_logic:='0' ;
	signal jed_node44	: std_logic:='0' ;
	signal jed_node45	: std_logic:='0' ;
	signal jed_node46	: std_logic:='0' ;
	signal jed_node47	: std_logic:='0' ;
	signal jed_node65	: std_logic:='0' ; -- clk
	signal jed_node66	: std_logic:='0' ; -- reset
	signal jed_node67	: std_logic:='0' ;
	signal jed_node68	: std_logic:='0' ;
	signal jed_node69	: std_logic:='0' ;
	signal jed_node70	: std_logic:='0' ;
	signal jed_node71	: std_logic:='0' ;
	signal jed_node72	: std_logic:='0' ;
	signal jed_node73	: std_logic:='0' ;
	signal jed_node74	: std_logic:='0' ;
	signal jed_node75	: std_logic:='0' ;
	signal jed_node76	: std_logic:='0' ;
	signal jed_node77	: std_logic:='0' ;
	signal jed_node78	: std_logic:='0' ;
	signal jed_node79	: std_logic:='0' ;
	signal jed_node80	: std_logic:='0' ;
	signal jed_node81	: std_logic:='0' ;
	signal jed_node82	: std_logic:='0' ;
	signal jed_node83	: std_logic:='0' ;
	signal jed_node84	: std_logic:='0' ;

	for all: c37xclk use entity primitive.c37xclk (sim);
	for all: c37xinp use entity primitive.c37xinp (sim);
	for all: c37xm use entity primitive.c37xm (sim);
	for all: c37xmux use entity primitive.c37xmux (sim);
	for all: c37xoreg use entity primitive.c37xoreg (sim);
	for all: c37xprod use entity primitive.c37xprod (sim);

SIGNAL  one:std_logic:='1';
SIGNAL  zero:std_logic:='0';
SIGNAL  jed_oept_33:std_logic:='0';
SIGNAL  jed_sum_33,jed_fb_33:std_logic:='0';
--Attribute PIN_NUMBERS of s10(0):SIGNAL is "  45";

SIGNAL  jed_oept_41:std_logic:='0';
SIGNAL  jed_sum_41,jed_fb_41:std_logic:='0';
--Attribute PIN_NUMBERS of s10(1):SIGNAL is "  54";

SIGNAL  jed_oept_48:std_logic:='0';
SIGNAL  jed_sum_48,jed_fb_48:std_logic:='0';
--Attribute PIN_NUMBERS of s10(2):SIGNAL is "  61";

SIGNAL  jed_oept_49:std_logic:='0';
SIGNAL  jed_sum_49,jed_fb_49:std_logic:='0';
--Attribute PIN_NUMBERS of centesima(1):SIGNAL is "  66";

SIGNAL  jed_oept_50:std_logic:='0';
SIGNAL  jed_sum_50,jed_fb_50:std_logic:='0';
--Attribute PIN_NUMBERS of minuto(2):SIGNAL is "  67";

SIGNAL  jed_oept_51:std_logic:='0';
SIGNAL  jed_sum_51,jed_fb_51:std_logic:='0';
--Attribute PIN_NUMBERS of minuto(1):SIGNAL is "  68";

SIGNAL  jed_oept_52:std_logic:='0';
SIGNAL  jed_sum_52,jed_fb_52:std_logic:='0';
--Attribute PIN_NUMBERS of minuto(3):SIGNAL is "  69";

SIGNAL  jed_oept_53:std_logic:='0';
SIGNAL  jed_sum_53,jed_fb_53:std_logic:='0';
--Attribute PIN_NUMBERS of centesima(0):SIGNAL is "  70";

SIGNAL  jed_oept_54:std_logic:='0';
SIGNAL  jed_sum_54,jed_fb_54:std_logic:='0';
--Attribute PIN_NUMBERS of segundos(0):SIGNAL is "  71";

SIGNAL  jed_oept_55:std_logic:='0';
SIGNAL  jed_sum_55,jed_fb_55:std_logic:='0';
--Attribute PIN_NUMBERS of decimas(3):SIGNAL is "  72";

SIGNAL  jed_oept_56:std_logic:='0';
SIGNAL  jed_sum_56,jed_fb_56:std_logic:='0';
--Attribute PIN_NUMBERS of segundos(2):SIGNAL is "  73";

SIGNAL  jed_oept_57:std_logic:='0';
SIGNAL  jed_sum_57,jed_fb_57:std_logic:='0';
--Attribute PIN_NUMBERS of segundos(1):SIGNAL is "  75";

SIGNAL  jed_oept_58:std_logic:='0';
SIGNAL  jed_sum_58,jed_fb_58:std_logic:='0';
--Attribute PIN_NUMBERS of centesima(3):SIGNAL is "  76";

SIGNAL  jed_oept_59:std_logic:='0';
SIGNAL  jed_sum_59,jed_fb_59:std_logic:='0';
--Attribute PIN_NUMBERS of decimas(0):SIGNAL is "  77";

SIGNAL  jed_oept_60:std_logic:='0';
SIGNAL  jed_sum_60,jed_fb_60:std_logic:='0';
--Attribute PIN_NUMBERS of segundos(3):SIGNAL is "  78";

SIGNAL  jed_oept_61:std_logic:='0';
SIGNAL  jed_sum_61,jed_fb_61:std_logic:='0';
--Attribute PIN_NUMBERS of centesima(2):SIGNAL is "  79";

SIGNAL  jed_oept_62:std_logic:='0';
SIGNAL  jed_sum_62,jed_fb_62:std_logic:='0';
--Attribute PIN_NUMBERS of minuto(0):SIGNAL is "  80";

SIGNAL  jed_oept_63:std_logic:='0';
SIGNAL  jed_sum_63,jed_fb_63:std_logic:='0';
--Attribute PIN_NUMBERS of decimas(2):SIGNAL is "  81";

SIGNAL  jed_oept_64:std_logic:='0';
SIGNAL  jed_sum_64,jed_fb_64:std_logic:='0';
--Attribute PIN_NUMBERS of decimas(1):SIGNAL is "  82";

SIGNAL  jed_oept_65:std_logic:='0';
SIGNAL  jed_fb_65:std_logic:='0';
--Attribute PIN_NUMBERS of clk:SIGNAL is "  20";

SIGNAL  jed_oept_66:std_logic:='0';
SIGNAL  jed_fb_66:std_logic:='0';
--Attribute PIN_NUMBERS of reset:SIGNAL is "  23";

SIGNAL  jed_oept_69:std_logic:='0';
SIGNAL  jed_fb_69:std_logic:='0';
--Attribute PIN_NUMBERS of jed_node69:SIGNAL is "0069";

SIGNAL  jed_oept_163:std_logic:='0';
SIGNAL  jed_node163,jed_fb_163:std_logic:='0';
SIGNAL  jed_oept_166:std_logic:='0';
SIGNAL  jed_node166,jed_fb_166:std_logic:='0';
SIGNAL  jed_oept_167:std_logic:='0';
SIGNAL  jed_node167,jed_fb_167:std_logic:='0';
SIGNAL  jed_oept_168:std_logic:='0';
SIGNAL  jed_node168,jed_fb_168:std_logic:='0';
SIGNAL  jed_oept_169:std_logic:='0';
SIGNAL  jed_node169,jed_fb_169:std_logic:='0';
SIGNAL  jed_oept_170:std_logic:='0';
SIGNAL  jed_node170,jed_fb_170:std_logic:='0';
SIGNAL  jed_oept_171:std_logic:='0';
SIGNAL  jed_node171,jed_fb_171:std_logic:='0';
SIGNAL  jed_oept_172:std_logic:='0';
SIGNAL  jed_node172,jed_fb_172:std_logic:='0';
SIGNAL  jed_oept_174:std_logic:='0';
SIGNAL  jed_node174,jed_fb_174:std_logic:='0';
SIGNAL  jed_oept_175:std_logic:='0';
SIGNAL  jed_node175,jed_fb_175:std_logic:='0';
SIGNAL  jed_oept_178:std_logic:='0';
SIGNAL  jed_node178,jed_fb_178:std_logic:='0';
SIGNAL  jed_oept_179:std_logic:='0';
SIGNAL  jed_node179,jed_fb_179:std_logic:='0';
SIGNAL  jed_oept_182:std_logic:='0';
SIGNAL  jed_node182,jed_fb_182:std_logic:='0';
SIGNAL  jed_oept_183:std_logic:='0';
SIGNAL  jed_node183,jed_fb_183:std_logic:='0';
SIGNAL  jed_oept_188:std_logic:='0';
SIGNAL  jed_node188,jed_fb_188:std_logic:='0';
SIGNAL  jed_oept_202:std_logic:='0';
SIGNAL  jed_node202,jed_fb_202:std_logic:='0';
SIGNAL  jed_oept_203:std_logic:='0';
SIGNAL  jed_node203,jed_fb_203:std_logic:='0';
SIGNAL  jed_oept_204:std_logic:='0';
SIGNAL  jed_node204,jed_fb_204:std_logic:='0';
SIGNAL  jed_oept_205:std_logic:='0';
SIGNAL  jed_node205,jed_fb_205:std_logic:='0';
SIGNAL  jed_oept_206:std_logic:='0';
SIGNAL  jed_node206,jed_fb_206:std_logic:='0';
SIGNAL  jed_oept_207:std_logic:='0';
SIGNAL  jed_node207,jed_fb_207:std_logic:='0';
SIGNAL  jed_oept_208:std_logic:='0';
SIGNAL  jed_node208,jed_fb_208:std_logic:='0';
SIGNAL  jed_oept_209:std_logic:='0';
SIGNAL  jed_node209,jed_fb_209:std_logic:='0';
SIGNAL  jed_oept_210:std_logic:='0';
SIGNAL  jed_node210,jed_fb_210:std_logic:='0';
SIGNAL  jed_oept_211:std_logic:='0';
SIGNAL  jed_node211,jed_fb_211:std_logic:='0';
SIGNAL  jed_oept_212:std_logic:='0';
SIGNAL  jed_node212,jed_fb_212:std_logic:='0';
SIGNAL  jed_oept_213:std_logic:='0';
SIGNAL  jed_node213,jed_fb_213:std_logic:='0';
SIGNAL  jed_oept_216:std_logic:='0';
SIGNAL  jed_node216,jed_fb_216:std_logic:='0';
SIGNAL  jed_oept_218:std_logic:='0';
SIGNAL  jed_node218,jed_fb_218:std_logic:='0';
SIGNAL  jed_oept_221:std_logic:='0';
SIGNAL  jed_node221,jed_fb_221:std_logic:='0';
SIGNAL  jed_oept_224:std_logic:='0';
SIGNAL  jed_node224,jed_fb_224:std_logic:='0';
SIGNAL  jed_oept_225:std_logic:='0';
SIGNAL  jed_node225,jed_fb_225:std_logic:='0';
SIGNAL  jed_oept_227:std_logic:='0';
SIGNAL  jed_node227,jed_fb_227:std_logic:='0';
SIGNAL  jed_oept_228:std_logic:='0';
SIGNAL  jed_node228,jed_fb_228:std_logic:='0';
SIGNAL  jed_oept_273:std_logic:='0';
SIGNAL  jed_node273,jed_sum_273,jed_fbq_273,jed_fb_273:std_logic:='0';
SIGNAL  jed_oept_281:std_logic:='0';
SIGNAL  jed_node281,jed_sum_281,jed_fbq_281,jed_fb_281:std_logic:='0';
SIGNAL  jed_oept_288:std_logic:='0';
SIGNAL  jed_node288,jed_sum_288,jed_fbq_288,jed_fb_288:std_logic:='0';
SIGNAL  jed_oept_289:std_logic:='0';
SIGNAL  jed_node289,jed_sum_289,jed_fbq_289,jed_fb_289:std_logic:='0';
SIGNAL  jed_oept_290:std_logic:='0';
SIGNAL  jed_node290,jed_sum_290,jed_fbq_290,jed_fb_290:std_logic:='0';
SIGNAL  jed_oept_291:std_logic:='0';
SIGNAL  jed_node291,jed_sum_291,jed_fbq_291,jed_fb_291:std_logic:='0';
SIGNAL  jed_oept_292:std_logic:='0';
SIGNAL  jed_node292,jed_sum_292,jed_fbq_292,jed_fb_292:std_logic:='0';
SIGNAL  jed_oept_293:std_logic:='0';
SIGNAL  jed_node293,jed_sum_293,jed_fbq_293,jed_fb_293:std_logic:='0';
SIGNAL  jed_oept_294:std_logic:='0';
SIGNAL  jed_node294,jed_sum_294,jed_fbq_294,jed_fb_294:std_logic:='0';
SIGNAL  jed_oept_295:std_logic:='0';
SIGNAL  jed_node295,jed_sum_295,jed_fbq_295,jed_fb_295:std_logic:='0';
SIGNAL  jed_oept_296:std_logic:='0';
SIGNAL  jed_node296,jed_sum_296,jed_fbq_296,jed_fb_296:std_logic:='0';
SIGNAL  jed_oept_297:std_logic:='0';
SIGNAL  jed_node297,jed_sum_297,jed_fbq_297,jed_fb_297:std_logic:='0';
SIGNAL  jed_oept_298:std_logic:='0';
SIGNAL  jed_node298,jed_sum_298,jed_fbq_298,jed_fb_298:std_logic:='0';
SIGNAL  jed_oept_299:std_logic:='0';
SIGNAL  jed_node299,jed_sum_299,jed_fbq_299,jed_fb_299:std_logic:='0';
SIGNAL  jed_oept_300:std_logic:='0';
SIGNAL  jed_node300,jed_sum_300,jed_fbq_300,jed_fb_300:std_logic:='0';
SIGNAL  jed_oept_301:std_logic:='0';
SIGNAL  jed_node301,jed_sum_301,jed_fbq_301,jed_fb_301:std_logic:='0';
SIGNAL  jed_oept_302:std_logic:='0';
SIGNAL  jed_node302,jed_sum_302,jed_fbq_302,jed_fb_302:std_logic:='0';
SIGNAL  jed_oept_303:std_logic:='0';
SIGNAL  jed_node303,jed_sum_303,jed_fbq_303,jed_fb_303:std_logic:='0';
SIGNAL  jed_oept_304:std_logic:='0';
SIGNAL  jed_node304,jed_sum_304,jed_fbq_304,jed_fb_304:std_logic:='0';
SIGNAL  jed_oept_465:std_logic:='0';
SIGNAL  jed_node465,jed_sum_465,jed_fb_465:std_logic:='0';
SIGNAL  jed_oept_466:std_logic:='0';
SIGNAL  jed_node466,jed_sum_466,jed_fb_466:std_logic:='0';
SIGNAL  jed_oept_467:std_logic:='0';
SIGNAL  jed_node467,jed_sum_467,jed_fb_467:std_logic:='0';
SIGNAL  jed_oept_499:std_logic:='0';
SIGNAL  jed_node499,jed_sum_499,jed_fb_499:std_logic:='0';
SIGNAL  jed_oept_500:std_logic:='0';
SIGNAL  jed_node500,jed_sum_500,jed_fb_500:std_logic:='0';
SIGNAL  jed_oept_529:std_logic:='0';
SIGNAL  jed_node529,jed_sum_529,jed_fb_529:std_logic:='0';
SIGNAL  jed_oept_530:std_logic:='0';
SIGNAL  jed_node530,jed_sum_530,jed_fb_530:std_logic:='0';
SIGNAL  jed_oept_545:std_logic:='0';
SIGNAL  jed_node545,jed_sum_545,jed_fb_545:std_logic:='0';
SIGNAL  jed_oept_546:std_logic:='0';
SIGNAL  jed_node546,jed_sum_546,jed_fb_546:std_logic:='0';
SIGNAL  jed_oept_547:std_logic:='0';
SIGNAL  jed_node547,jed_sum_547,jed_fb_547:std_logic:='0';
SIGNAL  jed_oept_551:std_logic:='0';
SIGNAL  jed_node551,jed_sum_551,jed_fb_551:std_logic:='0';
SIGNAL  jed_oept_555:std_logic:='0';
SIGNAL  jed_node555,jed_sum_555,jed_fb_555:std_logic:='0';
SIGNAL  jed_oept_559:std_logic:='0';
SIGNAL  jed_node559,jed_sum_559,jed_fb_559:std_logic:='0';
SIGNAL  jed_oept_563:std_logic:='0';
SIGNAL  jed_node563,jed_sum_563,jed_fb_563:std_logic:='0';
SIGNAL  jed_oept_571:std_logic:='0';
SIGNAL  jed_node571,jed_sum_571,jed_fb_571:std_logic:='0';
SIGNAL  jed_oept_572:std_logic:='0';
SIGNAL  jed_node572,jed_sum_572,jed_fb_572:std_logic:='0';
SIGNAL  jed_oept_579:std_logic:='0';
SIGNAL  jed_node579,jed_sum_579,jed_fb_579:std_logic:='0';
SIGNAL  jed_oept_581:std_logic:='0';
SIGNAL  jed_node581,jed_sum_581,jed_fb_581:std_logic:='0';
SIGNAL  jed_oept_582:std_logic:='0';
SIGNAL  jed_node582,jed_sum_582,jed_fb_582:std_logic:='0';
SIGNAL  jed_oept_583:std_logic:='0';
SIGNAL  jed_node583,jed_sum_583,jed_fb_583:std_logic:='0';
SIGNAL  jed_oept_587:std_logic:='0';
SIGNAL  jed_node587,jed_sum_587,jed_fb_587:std_logic:='0';
SIGNAL  jed_oept_591:std_logic:='0';
SIGNAL  jed_node591,jed_sum_591,jed_fb_591:std_logic:='0';
SIGNAL  jed_oept_592:std_logic:='0';
SIGNAL  jed_node592,jed_sum_592,jed_fb_592:std_logic:='0';
SIGNAL  jed_oept_595:std_logic:='0';
SIGNAL  jed_node595,jed_sum_595,jed_fb_595:std_logic:='0';
SIGNAL  jed_oept_599:std_logic:='0';
SIGNAL  jed_node599,jed_sum_599,jed_fb_599:std_logic:='0';
SIGNAL  jed_oept_609:std_logic:='0';
SIGNAL  jed_node609,jed_sum_609,jed_fb_609:std_logic:='0';
SIGNAL  jed_oept_610:std_logic:='0';
SIGNAL  jed_node610,jed_sum_610,jed_fb_610:std_logic:='0';
SIGNAL  jed_oept_611:std_logic:='0';
SIGNAL  jed_node611,jed_sum_611,jed_fb_611:std_logic:='0';
SIGNAL  jed_oept_645:std_logic:='0';
SIGNAL  jed_node645,jed_fb_645:std_logic:='0';
SIGNAL  jed_oept_651:std_logic:='0';
SIGNAL  jed_node651,jed_sum_651,jed_fbq_651,jed_fb_651:std_logic:='0';
SIGNAL  jed_oept_652:std_logic:='0';
SIGNAL  jed_node652,jed_sum_652,jed_fbq_652,jed_fb_652:std_logic:='0';
SIGNAL  jed_oept_655:std_logic:='0';
SIGNAL  jed_node655,jed_fb_655:std_logic:='0';
SIGNAL  jed_oept_661:std_logic:='0';
SIGNAL  jed_node661,jed_sum_661,jed_fbq_661,jed_fb_661:std_logic:='0';
SIGNAL  jed_oept_662:std_logic:='0';
SIGNAL  jed_node662,jed_sum_662,jed_fbq_662,jed_fb_662:std_logic:='0';
SIGNAL  jed_oept_668:std_logic:='0';
SIGNAL  jed_node668,jed_fb_668:std_logic:='0';
SIGNAL  jed_oept_672:std_logic:='0';
SIGNAL  jed_node672,jed_fb_672:std_logic:='0';

BEGIN
jed_node65 <= clk ;
jed_node66 <= reset ;
IO_CELL_33:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_33,
     y=>s10(0),
     fb=>jed_fb_33,
     oe=>one
   );

IO_CELL_41:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_41,
     y=>s10(1),
     fb=>jed_fb_41,
     oe=>one
   );

IO_CELL_48:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_48,
     y=>s10(2),
     fb=>jed_fb_48,
     oe=>one
   );

IO_CELL_49:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_49,
     y=>centesima(1),
     fb=>jed_fb_49,
     oe=>one
   );

IO_CELL_50:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_50,
     y=>minuto(2),
     fb=>jed_fb_50,
     oe=>one
   );

IO_CELL_51:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_51,
     y=>minuto(1),
     fb=>jed_fb_51,
     oe=>one
   );

IO_CELL_52:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_52,
     y=>minuto(3),
     fb=>jed_fb_52,
     oe=>one
   );

IO_CELL_53:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_53,
     y=>centesima(0),
     fb=>jed_fb_53,
     oe=>one
   );

IO_CELL_54:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_54,
     y=>segundos(0),
     fb=>jed_fb_54,
     oe=>one
   );

IO_CELL_55:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_55,
     y=>decimas(3),
     fb=>jed_fb_55,
     oe=>one
   );

IO_CELL_56:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_56,
     y=>segundos(2),
     fb=>jed_fb_56,
     oe=>one
   );

IO_CELL_57:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_57,
     y=>segundos(1),
     fb=>jed_fb_57,
     oe=>one
   );

IO_CELL_58:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_58,
     y=>centesima(3),
     fb=>jed_fb_58,
     oe=>one
   );

IO_CELL_59:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_59,
     y=>decimas(0),
     fb=>jed_fb_59,
     oe=>one
   );

IO_CELL_60:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_60,
     y=>segundos(3),
     fb=>jed_fb_60,
     oe=>one
   );

IO_CELL_61:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_61,
     y=>centesima(2),
     fb=>jed_fb_61,
     oe=>one
   );

IO_CELL_62:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_62,
     y=>minuto(0),
     fb=>jed_fb_62,
     oe=>one
   );

IO_CELL_63:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_63,
     y=>decimas(2),
     fb=>jed_fb_63,
     oe=>one
   );

IO_CELL_64:c37xm
generic map(
    ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_64,
     y=>decimas(1),
     fb=>jed_fb_64,
     oe=>one
   );

-- need a model
-- with no delay
INPUT_65:c37xprod
generic map(
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_node65,
     fb=>jed_fb_65
   );

-- need a model
-- with no delay
INPUT_66:c37xprod
generic map(
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_node66,
     fb=>jed_fb_66
   );

-- need a model
-- with no delay
INPUT_69:c37xprod
generic map(
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_node69,
     fb=>jed_fb_69
   );

PIMMUX_163:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_298,
     fb=>jed_fb_163
   );

PIMMUX_166:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_293,
     fb=>jed_fb_166
   );

PIMMUX_167:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_299,
     fb=>jed_fb_167
   );

PIMMUX_168:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_294,
     fb=>jed_fb_168
   );

PIMMUX_169:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_300,
     fb=>jed_fb_169
   );

PIMMUX_170:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_295,
     fb=>jed_fb_170
   );

PIMMUX_171:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_301,
     fb=>jed_fb_171
   );

PIMMUX_172:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_296,
     fb=>jed_fb_172
   );

PIMMUX_174:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_289,
     fb=>jed_fb_174
   );

PIMMUX_175:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_303,
     fb=>jed_fb_175
   );

PIMMUX_178:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_288,
     fb=>jed_fb_178
   );

PIMMUX_179:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_297,
     fb=>jed_fb_179
   );

PIMMUX_182:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_304,
     fb=>jed_fb_182
   );

PIMMUX_183:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_273,
     fb=>jed_fb_183
   );

PIMMUX_188:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_281,
     fb=>jed_fb_188
   );

PIMMUX_202:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_299,
     fb=>jed_fb_202
   );

PIMMUX_203:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_668,
     fb=>jed_fb_203
   );

PIMMUX_204:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_300,
     fb=>jed_fb_204
   );

PIMMUX_205:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_294,
     fb=>jed_fb_205
   );

PIMMUX_206:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_301,
     fb=>jed_fb_206
   );

PIMMUX_207:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_295,
     fb=>jed_fb_207
   );

PIMMUX_208:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_289,
     fb=>jed_fb_208
   );

PIMMUX_209:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_296,
     fb=>jed_fb_209
   );

PIMMUX_210:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_303,
     fb=>jed_fb_210
   );

PIMMUX_211:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_297,
     fb=>jed_fb_211
   );

PIMMUX_212:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_304,
     fb=>jed_fb_212
   );

PIMMUX_213:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_298,
     fb=>jed_fb_213
   );

PIMMUX_216:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_290,
     fb=>jed_fb_216
   );

PIMMUX_218:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_291,
     fb=>jed_fb_218
   );

PIMMUX_221:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_293,
     fb=>jed_fb_221
   );

PIMMUX_224:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_273,
     fb=>jed_fb_224
   );

PIMMUX_225:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_288,
     fb=>jed_fb_225
   );

PIMMUX_227:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_302,
     fb=>jed_fb_227
   );

PIMMUX_228:c37xmux
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_281,
     fb=>jed_fb_228
   );

REG_273:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_273,
     clk=>jed_fb_645,
     as=>jed_fb_652,
     ar=>jed_fb_651,
     fb=>jed_fb_273,
     q=>jed_fbq_273
   );

REG_281:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_281,
     clk=>jed_fb_645,
     as=>jed_fb_652,
     ar=>jed_fb_651,
     fb=>jed_fb_281,
     q=>jed_fbq_281
   );

REG_288:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_288,
     clk=>jed_fb_645,
     as=>jed_fb_652,
     ar=>jed_fb_651,
     fb=>jed_fb_288,
     q=>jed_fbq_288
   );

REG_289:c37xoreg
generic map(
   dreg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_289,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_289,
     q=>jed_fbq_289
   );

REG_290:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_290,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_290,
     q=>jed_fbq_290
   );

REG_291:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_291,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_291,
     q=>jed_fbq_291
   );

REG_292:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_292,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_292,
     q=>jed_fbq_292
   );

REG_293:c37xoreg
generic map(
   dreg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_293,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_293,
     q=>jed_fbq_293
   );

REG_294:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_294,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_294,
     q=>jed_fbq_294
   );

REG_295:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_295,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_295,
     q=>jed_fbq_295
   );

REG_296:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_296,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_296,
     q=>jed_fbq_296
   );

REG_297:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_297,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_297,
     q=>jed_fbq_297
   );

REG_298:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_298,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_298,
     q=>jed_fbq_298
   );

REG_299:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_299,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_299,
     q=>jed_fbq_299
   );

REG_300:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_300,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_300,
     q=>jed_fbq_300
   );

REG_301:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_301,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_301,
     q=>jed_fbq_301
   );

REG_302:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_302,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_302,
     q=>jed_fbq_302
   );

REG_303:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_303,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_303,
     q=>jed_fbq_303
   );

REG_304:c37xoreg
generic map(
   treg,
    src_ptm,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_304,
     clk=>jed_fb_655,
     as=>jed_fb_662,
     ar=>jed_fb_661,
     fb=>jed_fb_304,
     q=>jed_fbq_304
   );

PRODUCT_465:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_465,
     fb=>jed_fb_465
   );

PRODUCT_466:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_466,
     fb=>jed_fb_466
   );

PRODUCT_467:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_467,
     fb=>jed_fb_467
   );

PRODUCT_499:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_499,
     fb=>jed_fb_499
   );

PRODUCT_500:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_500,
     fb=>jed_fb_500
   );

PRODUCT_529:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_529,
     fb=>jed_fb_529
   );

PRODUCT_530:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_530,
     fb=>jed_fb_530
   );

PRODUCT_545:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_545,
     fb=>jed_fb_545
   );

PRODUCT_546:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_546,
     fb=>jed_fb_546
   );

PRODUCT_547:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_547,
     fb=>jed_fb_547
   );

PRODUCT_551:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_551,
     fb=>jed_fb_551
   );

PRODUCT_555:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_555,
     fb=>jed_fb_555
   );

PRODUCT_559:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_559,
     fb=>jed_fb_559
   );

PRODUCT_563:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_563,
     fb=>jed_fb_563
   );

PRODUCT_571:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_571,
     fb=>jed_fb_571
   );

PRODUCT_572:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_572,
     fb=>jed_fb_572
   );

PRODUCT_579:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_579,
     fb=>jed_fb_579
   );

PRODUCT_581:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_581,
     fb=>jed_fb_581
   );

PRODUCT_582:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_582,
     fb=>jed_fb_582
   );

PRODUCT_583:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_583,
     fb=>jed_fb_583
   );

PRODUCT_587:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_587,
     fb=>jed_fb_587
   );

PRODUCT_591:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_591,
     fb=>jed_fb_591
   );

PRODUCT_592:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_592,
     fb=>jed_fb_592
   );

PRODUCT_595:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_595,
     fb=>jed_fb_595
   );

PRODUCT_599:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_599,
     fb=>jed_fb_599
   );

PRODUCT_609:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_609,
     fb=>jed_fb_609
   );

PRODUCT_610:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_610,
     fb=>jed_fb_610
   );

PRODUCT_611:c37xprod
generic map (	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_sum_611,
     fb=>jed_fb_611
   );

CLK_645:c37xclk
generic map(ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_65,
     fb=>jed_fb_645
   );

jed_fb_651 <= jed_sum_651;
jed_fb_652 <= jed_sum_652;
CLK_655:c37xclk
generic map(ninv,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     x=>jed_fb_65,
     fb=>jed_fb_655
   );

jed_fb_661 <= jed_sum_661;
jed_fb_662 <= jed_sum_662;
INPUT_668:c37xinp
generic map(
   comb,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     d=>jed_fb_66,
     clk=>jed_fb_672,
     fb=>jed_fb_668
   );

INPUT_672:c37xinp
generic map(
   comb,
   	4000 ps,	-- tclk
	0500 ps,	-- tird
	2000 ps,	-- ticomb
	4500 ps,	-- tilat
	6000 ps,	-- tirsu
	2000 ps,	-- tirh
	4000 ps,	-- tsop
	0500 ps,	--tord
	2000 ps,	-- tocomb
	4500 ps,	-- tolat
	3500 ps,	-- torsu
	0000 ps,	-- torh
	2000 ps,	-- tod
	8000 ps,	-- txz
	8000 ps,	-- tzx
	0000 ps,	-- tfb
	8000 ps,	-- trst
	8000 ps, 	-- tpst
	3000 ps,	-- twl
	3000 ps,	-- twh
	10000 ps,	-- trw
	12000 ps,	-- trr
	10000 ps,	-- tpw
	12000 ps	-- tpr
	,0 ps	-- VCCO adjust
)
port map(
     d=>jed_fb_69,
     clk=>jed_fb_672,
     fb=>jed_fb_672
   );

jed_node163<=jed_fb_163;
jed_node166<=jed_fb_166;
jed_node167<=jed_fb_167;
jed_node168<=jed_fb_168;
jed_node169<=jed_fb_169;
jed_node170<=jed_fb_170;
jed_node171<=jed_fb_171;
jed_node172<=jed_fb_172;
jed_node174<=jed_fb_174;
jed_node175<=jed_fb_175;
jed_node178<=jed_fb_178;
jed_node179<=jed_fb_179;
jed_node182<=jed_fb_182;
jed_node183<=jed_fb_183;
jed_node188<=jed_fb_188;
jed_node202<=jed_fb_202;
jed_node203<=jed_fb_203;
jed_node204<=jed_fb_204;
jed_node205<=jed_fb_205;
jed_node206<=jed_fb_206;
jed_node207<=jed_fb_207;
jed_node208<=jed_fb_208;
jed_node209<=jed_fb_209;
jed_node210<=jed_fb_210;
jed_node211<=jed_fb_211;
jed_node212<=jed_fb_212;
jed_node213<=jed_fb_213;
jed_node216<=jed_fb_216;
jed_node218<=jed_fb_218;
jed_node221<=jed_fb_221;
jed_node224<=jed_fb_224;
jed_node225<=jed_fb_225;
jed_node227<=jed_fb_227;
jed_node228<=jed_fb_228;
jed_node273<=jed_fb_273;
jed_node281<=jed_fb_281;
jed_node288<=jed_fb_288;
jed_node289<=jed_fb_289;
jed_node290<=jed_fb_290;
jed_node291<=jed_fb_291;
jed_node292<=jed_fb_292;
jed_node293<=jed_fb_293;
jed_node294<=jed_fb_294;
jed_node295<=jed_fb_295;
jed_node296<=jed_fb_296;
jed_node297<=jed_fb_297;
jed_node298<=jed_fb_298;
jed_node299<=jed_fb_299;
jed_node300<=jed_fb_300;
jed_node301<=jed_fb_301;
jed_node302<=jed_fb_302;
jed_node303<=jed_fb_303;
jed_node304<=jed_fb_304;
jed_node465<=jed_fb_465;
jed_node466<=jed_fb_466;
jed_node467<=jed_fb_467;
jed_node499<=jed_fb_499;
jed_node500<=jed_fb_500;
jed_node529<=jed_fb_529;
jed_node530<=jed_fb_530;
jed_node545<=jed_fb_545;
jed_node546<=jed_fb_546;
jed_node547<=jed_fb_547;
jed_node551<=jed_fb_551;
jed_node555<=jed_fb_555;
jed_node559<=jed_fb_559;
jed_node563<=jed_fb_563;
jed_node571<=jed_fb_571;
jed_node572<=jed_fb_572;
jed_node579<=jed_fb_579;
jed_node581<=jed_fb_581;
jed_node582<=jed_fb_582;
jed_node583<=jed_fb_583;
jed_node587<=jed_fb_587;
jed_node591<=jed_fb_591;
jed_node592<=jed_fb_592;
jed_node595<=jed_fb_595;
jed_node599<=jed_fb_599;
jed_node609<=jed_fb_609;
jed_node610<=jed_fb_610;
jed_node611<=jed_fb_611;
jed_node645 <= jed_fb_645;
jed_node651<=jed_fb_651;
jed_node652<=jed_fb_652;
jed_node655 <= jed_fb_655;
jed_node661<=jed_fb_661;
jed_node662<=jed_fb_662;
jed_node668<=jed_fb_668;
jed_node672<=jed_fb_672;
jed_sum_33 <= jed_fbq_273;

jed_sum_41 <= jed_fbq_281;

jed_sum_48 <= jed_fbq_288;

jed_sum_49 <= jed_fbq_289;

jed_sum_50 <= jed_fbq_290;

jed_sum_51 <= jed_fbq_291;

jed_sum_52 <= jed_fbq_292;

jed_sum_53 <= jed_fbq_293;

jed_sum_54 <= jed_fbq_294;

jed_sum_55 <= jed_fbq_295;

jed_sum_56 <= jed_fbq_296;

jed_sum_57 <= jed_fbq_297;

jed_sum_58 <= jed_fbq_298;

jed_sum_59 <= jed_fbq_299;

jed_sum_60 <= jed_fbq_300;

jed_sum_61 <= jed_fbq_301;

jed_sum_62 <= jed_fbq_302;

jed_sum_63 <= jed_fbq_303;

jed_sum_64 <= jed_fbq_304;

jed_sum_273<= not (not(jed_fb_465) and not(jed_fb_466) and not(jed_fb_467)
);

jed_sum_281<= not (not(jed_fb_499) and not(jed_fb_500));

jed_sum_288<= not (not(jed_fb_529) and not(jed_fb_530));

jed_sum_289<= not (not(jed_fb_545) and not(jed_fb_546) and not(jed_fb_547)
);

jed_sum_290<= not (not(jed_fb_551));

jed_sum_291<= not (not(jed_fb_555));

jed_sum_292<= not (not(jed_fb_559));

jed_sum_293<= not (not(jed_fb_563));

jed_sum_294<= not (not(jed_fb_571));

jed_sum_295<= not (not(jed_fb_571) and not(jed_fb_572));

jed_sum_296<= not (not(jed_fb_579));

jed_sum_297<= not (not(jed_fb_579) and not(jed_fb_581) and not(jed_fb_582)
);

jed_sum_298<= not (not(jed_fb_583) and not(jed_fb_587));

jed_sum_299<= not (not(jed_fb_587));

jed_sum_300<= not (not(jed_fb_591) and not(jed_fb_592));

jed_sum_301<= not (not(jed_fb_595));

jed_sum_302<= not (not(jed_fb_599));

jed_sum_303<= not (not(jed_fb_611));

jed_sum_304<= not (not(jed_fb_609) and not(jed_fb_610) and not(jed_fb_611)
);

jed_sum_465<= (((jed_fb_163) and (jed_fb_166) and (jed_fb_167) and 
(jed_fb_168)
and (jed_fb_169) and (jed_fb_170) and not(jed_fb_171)
and not(jed_fb_172) and not(jed_fb_174) and not(jed_fb_175)
and not(jed_fb_178) and not(jed_fb_179) and not(jed_fb_182)
));

jed_sum_466<= (((jed_fb_163) and (jed_fb_166) and (jed_fb_167) and 
(jed_fb_168)
and (jed_fb_169) and (jed_fb_170) and not(jed_fb_171)
and not(jed_fb_172) and not(jed_fb_174) and not(jed_fb_175)
and not(jed_fb_179) and not(jed_fb_182) and not(jed_fb_188)
));

jed_sum_467<= (((jed_fb_163) and (jed_fb_166) and (jed_fb_167) and 
(jed_fb_168)
and (jed_fb_169) and (jed_fb_170) and not(jed_fb_171)
and not(jed_fb_172) and not(jed_fb_174) and not(jed_fb_175)
and not(jed_fb_179) and not(jed_fb_182) and (jed_fb_183)
));

jed_sum_499<= (((jed_fb_163) and (jed_fb_166) and (jed_fb_167) and 
(jed_fb_168)
and (jed_fb_169) and (jed_fb_170) and not(jed_fb_171)
and not(jed_fb_172) and not(jed_fb_174) and not(jed_fb_175)
and not(jed_fb_179) and not(jed_fb_182) and (jed_fb_183)
));

jed_sum_500<= (((jed_fb_163) and (jed_fb_166) and (jed_fb_167) and 
(jed_fb_168)
and (jed_fb_169) and (jed_fb_170) and not(jed_fb_171)
and not(jed_fb_172) and not(jed_fb_174) and not(jed_fb_175)
and (jed_fb_178) and not(jed_fb_179) and not(jed_fb_182)
and (jed_fb_188)));

jed_sum_529<= (((jed_fb_163) and (jed_fb_166) and (jed_fb_167) and 
(jed_fb_168)
and (jed_fb_169) and (jed_fb_170) and not(jed_fb_171)
and not(jed_fb_172) and not(jed_fb_174) and not(jed_fb_175)
and not(jed_fb_179) and not(jed_fb_182) and (jed_fb_183)
and (jed_fb_188)));

jed_sum_530<= (((jed_fb_163) and (jed_fb_166) and (jed_fb_167) and 
(jed_fb_168)
and (jed_fb_169) and (jed_fb_170) and not(jed_fb_171)
and not(jed_fb_172) and not(jed_fb_174) and not(jed_fb_175)
and (jed_fb_178) and not(jed_fb_179) and not(jed_fb_182)
and (jed_fb_188)));

jed_sum_545<= (((jed_fb_208) and not(jed_fb_221)));

jed_sum_546<= ((not(jed_fb_208) and not(jed_fb_213) and (jed_fb_221)
));

jed_sum_547<= (((jed_fb_206) and not(jed_fb_208) and (jed_fb_221)));

jed_sum_551<= (((jed_fb_202) and (jed_fb_204) and (jed_fb_205) and 
not(jed_fb_206)
and (jed_fb_207) and not(jed_fb_208) and not(jed_fb_209)
and not(jed_fb_210) and not(jed_fb_211) and not(jed_fb_212)
and (jed_fb_213) and (jed_fb_218) and (jed_fb_221)
and not(jed_fb_224) and (jed_fb_225) and (jed_fb_227)
and (jed_fb_228)));

jed_sum_555<= (((jed_fb_202) and (jed_fb_204) and (jed_fb_205) and 
not(jed_fb_206)
and (jed_fb_207) and not(jed_fb_208) and not(jed_fb_209)
and not(jed_fb_210) and not(jed_fb_211) and not(jed_fb_212)
and (jed_fb_213) and (jed_fb_221) and not(jed_fb_224)
and (jed_fb_225) and (jed_fb_227) and (jed_fb_228)
));

jed_sum_559<= (((jed_fb_202) and (jed_fb_204) and (jed_fb_205) and 
not(jed_fb_206)
and (jed_fb_207) and not(jed_fb_208) and not(jed_fb_209)
and not(jed_fb_210) and not(jed_fb_211) and not(jed_fb_212)
and (jed_fb_213) and (jed_fb_216) and (jed_fb_218)
and (jed_fb_221) and not(jed_fb_224) and (jed_fb_225)
and (jed_fb_227) and (jed_fb_228)));

jed_sum_563<= ((not(jed_fb_221)));

jed_sum_571<= (((jed_fb_202) and not(jed_fb_206) and (jed_fb_207) and 
not(jed_fb_208)
and not(jed_fb_210) and not(jed_fb_212) and (jed_fb_213)
and (jed_fb_221)));

jed_sum_572<= (((jed_fb_202) and not(jed_fb_206) and not(jed_fb_208)
and (jed_fb_210) and (jed_fb_212) and (jed_fb_213)
and (jed_fb_221)));

jed_sum_579<= (((jed_fb_202) and (jed_fb_205) and not(jed_fb_206) and 
(jed_fb_207)
and not(jed_fb_208) and not(jed_fb_210) and (jed_fb_211)
and not(jed_fb_212) and (jed_fb_213) and (jed_fb_221)
));

jed_sum_581<= (((jed_fb_202) and not(jed_fb_204) and (jed_fb_205) and 
not(jed_fb_206)
and (jed_fb_207) and not(jed_fb_208) and not(jed_fb_210)
and not(jed_fb_212) and (jed_fb_213) and (jed_fb_221)
));

jed_sum_582<= (((jed_fb_202) and (jed_fb_205) and not(jed_fb_206) and 
(jed_fb_207)
and not(jed_fb_208) and (jed_fb_209) and not(jed_fb_210)
and not(jed_fb_212) and (jed_fb_213) and (jed_fb_221)
));

jed_sum_583<= (((jed_fb_206) and (jed_fb_208) and (jed_fb_221)));

jed_sum_587<= ((not(jed_fb_206) and not(jed_fb_208) and (jed_fb_213)
and (jed_fb_221)));

jed_sum_591<= (((jed_fb_202) and (jed_fb_205) and not(jed_fb_206) and 
(jed_fb_207)
and not(jed_fb_208) and (jed_fb_209) and not(jed_fb_210)
and (jed_fb_211) and not(jed_fb_212) and (jed_fb_213)
and (jed_fb_221)));

jed_sum_592<= (((jed_fb_202) and (jed_fb_204) and (jed_fb_205) and 
not(jed_fb_206)
and (jed_fb_207) and not(jed_fb_208) and not(jed_fb_209)
and not(jed_fb_210) and not(jed_fb_211) and not(jed_fb_212)
and (jed_fb_213) and (jed_fb_221)));

jed_sum_595<= (((jed_fb_208) and (jed_fb_221)));

jed_sum_599<= (((jed_fb_202) and (jed_fb_204) and (jed_fb_205) and 
not(jed_fb_206)
and (jed_fb_207) and not(jed_fb_208) and not(jed_fb_209)
and not(jed_fb_210) and not(jed_fb_211) and not(jed_fb_212)
and (jed_fb_213) and (jed_fb_221) and not(jed_fb_224)
and (jed_fb_225) and (jed_fb_228)));

jed_sum_609<= (((jed_fb_202) and not(jed_fb_206) and not(jed_fb_207)
and not(jed_fb_208) and (jed_fb_213) and (jed_fb_221)
));

jed_sum_610<= (((jed_fb_202) and not(jed_fb_206) and not(jed_fb_208)
and (jed_fb_210) and (jed_fb_213) and (jed_fb_221)
));

jed_sum_611<= (((jed_fb_202) and not(jed_fb_206) and not(jed_fb_208)
and (jed_fb_212) and (jed_fb_213) and (jed_fb_221)
));

jed_sum_661<= (((jed_fb_203)));

end DSMB;

