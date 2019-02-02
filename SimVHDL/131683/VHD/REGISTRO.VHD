--
-- Cypress Structural Netlist
-- DISASM Jedec Disassembly Program Version 6.0.1 IR 18
--
-- Package: cy37256p160-125ac
-- Design: registro
-- Entity: proyecto
-- Architecture: cy37256p160

library ieee ;
use ieee.std_logic_1164.all ; 

library primitive ;
use primitive.c37kp.all ;

-- Beginning of Test Bench Header

ENTITY proyecto IS
    PORT (
	clk : in std_logic  ; 
	rst : in std_logic  ; 
	aux : in std_logic  ; 
	signo : in std_logic  ; 
	comple : in std_logic  ; 
	sel : in std_logic_vector (2 downto 0) ; 
	ent : in std_logic_vector (3 downto 0) ; 
	sal : inout std_logic_vector (4 downto 0)
    ) ;
END proyecto ;

-- End of Test Bench Header
ARCHITECTURE DSMB of proyecto is

  signal jed_node6480 : std_logic := '0' ;
  signal jed_node6482 : std_logic := '0' ;
  signal jed_node6484 : std_logic := '0' ;
  signal jed_node6485 : std_logic := '0' ;
  signal jed_node6486 : std_logic := '0' ;
  signal jed_node6487 : std_logic := '0' ;
  signal jed_node6488 : std_logic := '0' ;
  signal jed_node6490 : std_logic := '0' ; --ent(2)
  signal jed_node6492 : std_logic := '0' ;
  signal jed_node6494 : std_logic := '0' ;
  signal jed_node6496 : std_logic := '0' ;
  signal jed_node6497 : std_logic := '0' ;
  signal jed_node6498 : std_logic := '0' ;
  signal jed_node6499 : std_logic := '0' ;
  signal jed_node6500 : std_logic := '0' ;
  signal jed_node6502 : std_logic := '0' ; --ent(1)
  signal jed_node6504 : std_logic := '0' ;
  signal jed_node6506 : std_logic := '0' ;
  signal jed_node6508 : std_logic := '0' ;
  signal jed_node6509 : std_logic := '0' ;
  signal jed_node6510 : std_logic := '0' ;
  signal jed_node6511 : std_logic := '0' ;
  signal jed_node6512 : std_logic := '0' ;
  signal jed_node6514 : std_logic := '0' ; --ent(0)
  signal jed_node6516 : std_logic := '0' ;
  signal jed_node6518 : std_logic := '0' ;
  signal jed_node6520 : std_logic := '0' ;
  signal jed_node6521 : std_logic := '0' ;
  signal jed_node6522 : std_logic := '0' ;
  signal jed_node6523 : std_logic := '0' ;
  signal jed_node6524 : std_logic := '0' ;
  signal jed_node6526 : std_logic := '0' ; --comple
  signal jed_node6528 : std_logic := '0' ;
  signal jed_node6530 : std_logic := '0' ;
  signal jed_node6532 : std_logic := '0' ;
  signal jed_node6533 : std_logic := '0' ;
  signal jed_node6534 : std_logic := '0' ;
  signal jed_node6535 : std_logic := '0' ;
  signal jed_node6536 : std_logic := '0' ;
  signal jed_node6538 : std_logic := '0' ; --aux
  signal jed_node6540 : std_logic := '0' ;
  signal jed_node6542 : std_logic := '0' ;
  signal jed_node6544 : std_logic := '0' ;
  signal jed_node6545 : std_logic := '0' ;
  signal jed_node6546 : std_logic := '0' ;
  signal jed_node6547 : std_logic := '0' ;
  signal jed_node6548 : std_logic := '0' ;
  signal jed_node6550 : std_logic := '0' ;
  signal jed_node6552 : std_logic := '0' ;
  signal jed_node6554 : std_logic := '0' ;
  signal jed_node6556 : std_logic := '0' ;
  signal jed_node6557 : std_logic := '0' ;
  signal jed_node6558 : std_logic := '0' ;
  signal jed_node6559 : std_logic := '0' ;
  signal jed_node6560 : std_logic := '0' ;
  signal jed_node6562 : std_logic := '0' ;
  signal jed_node6564 : std_logic := '0' ;
  signal jed_node6566 : std_logic := '0' ;
  signal jed_node6568 : std_logic := '0' ;
  signal jed_node6569 : std_logic := '0' ;
  signal jed_node6570 : std_logic := '0' ;
  signal jed_node6571 : std_logic := '0' ;
  signal jed_node6572 : std_logic := '0' ;
  signal jed_node6574 : std_logic := '0' ;
  signal jed_node6576 : std_logic := '0' ;
  signal jed_node6578 : std_logic := '0' ;
  signal jed_node6580 : std_logic := '0' ;
  signal jed_node6581 : std_logic := '0' ;
  signal jed_node6582 : std_logic := '0' ;
  signal jed_node6583 : std_logic := '0' ;
  signal jed_node6584 : std_logic := '0' ;
  signal jed_node6586 : std_logic := '0' ;
  signal jed_node6588 : std_logic := '0' ;
  signal jed_node6590 : std_logic := '0' ;
  signal jed_node6592 : std_logic := '0' ;
  signal jed_node6593 : std_logic := '0' ;
  signal jed_node6594 : std_logic := '0' ;
  signal jed_node6595 : std_logic := '0' ;
  signal jed_node6596 : std_logic := '0' ;
  signal jed_node6598 : std_logic := '0' ;
  signal jed_node6600 : std_logic := '0' ;
  signal jed_node6602 : std_logic := '0' ;
  signal jed_node6604 : std_logic := '0' ;
  signal jed_node6605 : std_logic := '0' ;
  signal jed_node6606 : std_logic := '0' ;
  signal jed_node6607 : std_logic := '0' ;
  signal jed_node6608 : std_logic := '0' ;
  signal jed_node6610 : std_logic := '0' ;
  signal jed_node6612 : std_logic := '0' ;
  signal jed_node6614 : std_logic := '0' ;
  signal jed_node6616 : std_logic := '0' ;
  signal jed_node6617 : std_logic := '0' ;
  signal jed_node6618 : std_logic := '0' ;
  signal jed_node6619 : std_logic := '0' ;
  signal jed_node6620 : std_logic := '0' ;
  signal jed_node6622 : std_logic := '0' ;
  signal jed_node6624 : std_logic := '0' ;
  signal jed_node6626 : std_logic := '0' ;
  signal jed_node6628 : std_logic := '0' ;
  signal jed_node6629 : std_logic := '0' ;
  signal jed_node6630 : std_logic := '0' ;
  signal jed_node6631 : std_logic := '0' ;
  signal jed_node6632 : std_logic := '0' ;
  signal jed_node6634 : std_logic := '0' ;
  signal jed_node6636 : std_logic := '0' ;
  signal jed_node6638 : std_logic := '0' ;
  signal jed_node6640 : std_logic := '0' ;
  signal jed_node6641 : std_logic := '0' ;
  signal jed_node6642 : std_logic := '0' ;
  signal jed_node6643 : std_logic := '0' ;
  signal jed_node6644 : std_logic := '0' ;
  signal jed_node6646 : std_logic := '0' ; --sel(0)
  signal jed_node6456 : std_logic := '0' ;
  signal jed_node6458 : std_logic := '0' ;
  signal jed_node6460 : std_logic := '0' ;
  signal jed_node6461 : std_logic := '0' ;
  signal jed_node6462 : std_logic := '0' ;
  signal jed_node6463 : std_logic := '0' ;
  signal jed_node6464 : std_logic := '0' ;
  signal jed_node6466 : std_logic := '0' ; --rst
  signal jed_node6470 : std_logic := '0' ;
  signal jed_node6476 : std_logic := '0' ;
  signal jed_node6478 : std_logic := '0' ;

      for all: c37kinp use entity primitive.c37kinp (sim);
      for all: c37km use entity primitive.c37km (sim);
      for all: c37kmux use entity primitive.c37kmux (sim);
      for all: c37koreg use entity primitive.c37koreg (sim);

--Attribute PIN_NUMBERS of ent(2):SIGNAL is "9"
--Attribute PIN_NUMBERS of ent(1):SIGNAL is "18"
--Attribute PIN_NUMBERS of clk:SIGNAL is "19"
--Attribute PIN_NUMBERS of ent(3):SIGNAL is "22"
--Attribute PIN_NUMBERS of ent(0):SIGNAL is "30"
--Attribute PIN_NUMBERS of comple:SIGNAL is "39"
--Attribute PIN_NUMBERS of aux:SIGNAL is "49"
--Attribute PIN_NUMBERS of signo:SIGNAL is "59"
--Attribute PIN_NUMBERS of sel(2):SIGNAL is "99"
--Attribute PIN_NUMBERS of sel(1):SIGNAL is "102"
--Attribute PIN_NUMBERS of sel(0):SIGNAL is "138"
--Attribute PIN_NUMBERS of rst:SIGNAL is "150"
--Attribute PIN_NUMBERS of sal(0):SIGNAL is "152"
--Attribute PIN_NUMBERS of sal(4):SIGNAL is "154"
--Attribute PIN_NUMBERS of sal(2):SIGNAL is "155"
--Attribute PIN_NUMBERS of sal(3):SIGNAL is "156"
--Attribute PIN_NUMBERS of sal(1):SIGNAL is "157"

SIGNAL one:std_logic := '1' ; 
SIGNAL zero:std_logic := '0' ; 
SIGNAL jed_node2436:std_logic := '0' ;
SIGNAL jed_node5254:std_logic := '0' ;
SIGNAL jed_node5510:std_logic := '0' ;
SIGNAL jed_node5766:std_logic := '0' ;
SIGNAL jed_node900:std_logic := '0' ;
SIGNAL jed_node6022:std_logic := '0' ;
SIGNAL jed_node2438:std_logic := '0' ;
SIGNAL jed_node5256:std_logic := '0' ;
SIGNAL jed_node5512:std_logic := '0' ;
SIGNAL jed_node5768:std_logic := '0' ;
SIGNAL jed_node902:std_logic := '0' ;
SIGNAL jed_node6024:std_logic := '0' ;
SIGNAL jed_node2442:std_logic := '0' ;
SIGNAL jed_node5260:std_logic := '0' ;
SIGNAL jed_node5516:std_logic := '0' ;
SIGNAL jed_node5772:std_logic := '0' ;
SIGNAL jed_node906:std_logic := '0' ;
SIGNAL jed_node6028:std_logic := '0' ;
SIGNAL jed_node2444:std_logic := '0' ;
SIGNAL jed_node5262:std_logic := '0' ;
SIGNAL jed_node5518:std_logic := '0' ;
SIGNAL jed_node5774:std_logic := '0' ;
SIGNAL jed_node908:std_logic := '0' ;
SIGNAL jed_node6030:std_logic := '0' ;
SIGNAL jed_node2446:std_logic := '0' ;
SIGNAL jed_node5264:std_logic := '0' ;
SIGNAL jed_node5520:std_logic := '0' ;
SIGNAL jed_node5776:std_logic := '0' ;
SIGNAL jed_node910:std_logic := '0' ;
SIGNAL jed_node6032:std_logic := '0' ;
SIGNAL jed_node2448:std_logic := '0' ;
SIGNAL jed_node5266:std_logic := '0' ;
SIGNAL jed_node5522:std_logic := '0' ;
SIGNAL jed_node5778:std_logic := '0' ;
SIGNAL jed_node912:std_logic := '0' ;
SIGNAL jed_node6034:std_logic := '0' ;
SIGNAL jed_node2468:std_logic := '0' ;
SIGNAL jed_node5286:std_logic := '0' ;
SIGNAL jed_node5542:std_logic := '0' ;
SIGNAL jed_node5798:std_logic := '0' ;
SIGNAL jed_node932:std_logic := '0' ;
SIGNAL jed_node6054:std_logic := '0' ;
SIGNAL jed_node2484:std_logic := '0' ;
SIGNAL jed_node5302:std_logic := '0' ;
SIGNAL jed_node5558:std_logic := '0' ;
SIGNAL jed_node5814:std_logic := '0' ;
SIGNAL jed_node948:std_logic := '0' ;
SIGNAL jed_node6070:std_logic := '0' ;
SIGNAL jed_node2500:std_logic := '0' ;
SIGNAL jed_node5318:std_logic := '0' ;
SIGNAL jed_node5574:std_logic := '0' ;
SIGNAL jed_node5830:std_logic := '0' ;
SIGNAL jed_node964:std_logic := '0' ;
SIGNAL jed_node6086:std_logic := '0' ;
SIGNAL jed_node2516:std_logic := '0' ;
SIGNAL jed_node5334:std_logic := '0' ;
SIGNAL jed_node5590:std_logic := '0' ;
SIGNAL jed_node5846:std_logic := '0' ;
SIGNAL jed_node980:std_logic := '0' ;
SIGNAL jed_node6102:std_logic := '0' ;
SIGNAL jed_node2532:std_logic := '0' ;
SIGNAL jed_node5350:std_logic := '0' ;
SIGNAL jed_node5606:std_logic := '0' ;
SIGNAL jed_node5862:std_logic := '0' ;
SIGNAL jed_node996:std_logic := '0' ;
SIGNAL jed_node6118:std_logic := '0' ;
SIGNAL jed_node2676:std_logic := '0' ;
SIGNAL jed_node5494:std_logic := '0' ;
SIGNAL jed_node5750:std_logic := '0' ;
SIGNAL jed_node6006:std_logic := '0' ;
SIGNAL jed_node1140:std_logic := '0' ;
SIGNAL jed_node6262:std_logic := '0' ;
SIGNAL jed_node6274:std_logic := '0' ;
SIGNAL jed_node11:std_logic := '0' ;
SIGNAL jed_node6276:std_logic := '0' ;
SIGNAL jed_node13:std_logic := '0' ;
SIGNAL jed_node6280:std_logic := '0' ;
SIGNAL jed_node17:std_logic := '0' ;
SIGNAL jed_node6281:std_logic := '0' ;
SIGNAL jed_node18:std_logic := '0' ;
SIGNAL jed_node6282:std_logic := '0' ;
SIGNAL jed_node19:std_logic := '0' ;
SIGNAL jed_node6283:std_logic := '0' ;
SIGNAL jed_node20:std_logic := '0' ;
SIGNAL jed_node6298:std_logic := '0' ;
SIGNAL jed_node35:std_logic := '0' ;
SIGNAL jed_node6310:std_logic := '0' ;
SIGNAL jed_node47:std_logic := '0' ;
SIGNAL jed_node6322:std_logic := '0' ;
SIGNAL jed_node59:std_logic := '0' ;
SIGNAL jed_node6334:std_logic := '0' ;
SIGNAL jed_node71:std_logic := '0' ;
SIGNAL jed_node6346:std_logic := '0' ;
SIGNAL jed_node83:std_logic := '0' ;
SIGNAL jed_node6454:std_logic := '0' ;
SIGNAL jed_node191:std_logic := '0' ;
SIGNAL jed_node301:std_logic := '0' ;
SIGNAL jed_node258:std_logic := '0' ;
SIGNAL jed_node302:std_logic := '0' ;
SIGNAL jed_node259:std_logic := '0' ;
SIGNAL jed_node303:std_logic := '0' ;
SIGNAL jed_node304:std_logic := '0' ;
SIGNAL jed_node305:std_logic := '0' ;
SIGNAL jed_node307:std_logic := '0' ;
SIGNAL jed_node308:std_logic := '0' ;
SIGNAL jed_node260:std_logic := '0' ;
SIGNAL jed_node309:std_logic := '0' ;
SIGNAL jed_node261:std_logic := '0' ;
SIGNAL jed_node310:std_logic := '0' ;
SIGNAL jed_node311:std_logic := '0' ;
SIGNAL jed_node312:std_logic := '0' ;
SIGNAL jed_node314:std_logic := '0' ;
SIGNAL jed_node315:std_logic := '0' ;
SIGNAL jed_node316:std_logic := '0' ;
SIGNAL jed_node325:std_logic := '0' ;
SIGNAL jed_node334:std_logic := '0' ;
SIGNAL jed_node6649:std_logic := '0' ;
SIGNAL jed_node6651:std_logic := '0' ;
SIGNAL jed_node6652:std_logic := '0' ;
SIGNAL jed_node6650:std_logic := '0' ;
SIGNAL jed_node5017:std_logic := '0' ;
SIGNAL jed_node2681:std_logic := '0' ;
SIGNAL jed_node2689:std_logic := '0' ;
SIGNAL jed_node2698:std_logic := '0' ;
SIGNAL jed_node2697:std_logic := '0' ;
SIGNAL jed_node2703:std_logic := '0' ;
SIGNAL jed_node2714:std_logic := '0' ;
SIGNAL jed_node2725:std_logic := '0' ;
SIGNAL jed_node2736:std_logic := '0' ;
SIGNAL jed_node2747:std_logic := '0' ;
SIGNAL jed_node2846:std_logic := '0' ;
SIGNAL jed_node5033:std_logic := '0' ;
SIGNAL jed_node2857:std_logic := '0' ;
BEGIN
    jed_node6490 <= ent(2) ;
    jed_node6502 <= ent(1) ;
    jed_node6514 <= ent(0) ;
    jed_node6526 <= comple ;
    jed_node6538 <= aux ;
    jed_node6646 <= sel(0) ;
    jed_node6466 <= rst ;

INST_0 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    2000 ps  , 
    2000 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    2000 ps  , 
    1000 ps  , 
    4000 ps  , 
    1000 ps  , 
    4500 ps  , 
    0 ps  , 
    6000 ps  , 
    6000 ps  , 
    3000 ps  , 
    3000 ps  , 
    10000 ps  , 
    7000 ps  , 
    10000 ps  , 
    7000 ps  , 
    6500 ps  , 
    2500 ps  , 
    5000 ps  , 
    5000 ps  , 
    nopt 
) 
port map (
    x => jed_node2436 ,
    clk => jed_node5254 ,
    as => jed_node5510 ,
    ar => jed_node5766 ,
    fb => jed_node900 ,
    q => jed_node6022
)
;
INST_1 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    2000 ps  , 
    2000 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    2000 ps  , 
    1000 ps  , 
    4000 ps  , 
    1000 ps  , 
    4500 ps  , 
    0 ps  , 
    6000 ps  , 
    6000 ps  , 
    3000 ps  , 
    3000 ps  , 
    10000 ps  , 
    7000 ps  , 
    10000 ps  , 
    7000 ps  , 
    6500 ps  , 
    2500 ps  , 
    5000 ps  , 
    5000 ps  , 
    nopt 
) 
port map (
    x => jed_node2438 ,
    clk => jed_node5256 ,
    as => jed_node5512 ,
    ar => jed_node5768 ,
    fb => jed_node902 ,
    q => jed_node6024
)
;
INST_2 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    2000 ps  , 
    2000 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    2000 ps  , 
    1000 ps  , 
    4000 ps  , 
    1000 ps  , 
    4500 ps  , 
    0 ps  , 
    6000 ps  , 
    6000 ps  , 
    3000 ps  , 
    3000 ps  , 
    10000 ps  , 
    7000 ps  , 
    10000 ps  , 
    7000 ps  , 
    6500 ps  , 
    2500 ps  , 
    5000 ps  , 
    5000 ps  , 
    nopt 
) 
port map (
    x => jed_node2442 ,
    clk => jed_node5260 ,
    as => jed_node5516 ,
    ar => jed_node5772 ,
    fb => jed_node906 ,
    q => jed_node6028
)
;
INST_3 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    2000 ps  , 
    2000 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    2000 ps  , 
    1000 ps  , 
    4000 ps  , 
    1000 ps  , 
    4500 ps  , 
    0 ps  , 
    6000 ps  , 
    6000 ps  , 
    3000 ps  , 
    3000 ps  , 
    10000 ps  , 
    7000 ps  , 
    10000 ps  , 
    7000 ps  , 
    6500 ps  , 
    2500 ps  , 
    5000 ps  , 
    5000 ps  , 
    nopt 
) 
port map (
    x => jed_node2444 ,
    clk => jed_node5262 ,
    as => jed_node5518 ,
    ar => jed_node5774 ,
    fb => jed_node908 ,
    q => jed_node6030
)
;
INST_4 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    2000 ps  , 
    2000 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    2000 ps  , 
    1000 ps  , 
    4000 ps  , 
    1000 ps  , 
    4500 ps  , 
    0 ps  , 
    6000 ps  , 
    6000 ps  , 
    3000 ps  , 
    3000 ps  , 
    10000 ps  , 
    7000 ps  , 
    10000 ps  , 
    7000 ps  , 
    6500 ps  , 
    2500 ps  , 
    5000 ps  , 
    5000 ps  , 
    nopt 
) 
port map (
    x => jed_node2446 ,
    clk => jed_node5264 ,
    as => jed_node5520 ,
    ar => jed_node5776 ,
    fb => jed_node910 ,
    q => jed_node6032
)
;
INST_5 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    2000 ps  , 
    2000 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    2000 ps  , 
    1000 ps  , 
    4000 ps  , 
    1000 ps  , 
    4500 ps  , 
    0 ps  , 
    6000 ps  , 
    6000 ps  , 
    3000 ps  , 
    3000 ps  , 
    10000 ps  , 
    7000 ps  , 
    10000 ps  , 
    7000 ps  , 
    6500 ps  , 
    2500 ps  , 
    5000 ps  , 
    5000 ps  , 
    nopt 
) 
port map (
    x => jed_node2448 ,
    clk => jed_node5266 ,
    as => jed_node5522 ,
    ar => jed_node5778 ,
    fb => jed_node912 ,
    q => jed_node6034
)
;
INST_6 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    2000 ps  , 
    2000 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    2000 ps  , 
    1000 ps  , 
    4000 ps  , 
    1000 ps  , 
    4500 ps  , 
    0 ps  , 
    6000 ps  , 
    6000 ps  , 
    3000 ps  , 
    3000 ps  , 
    10000 ps  , 
    7000 ps  , 
    10000 ps  , 
    7000 ps  , 
    6500 ps  , 
    2500 ps  , 
    5000 ps  , 
    5000 ps  , 
    nopt 
) 
port map (
    x => jed_node2468 ,
    clk => jed_node5286 ,
    as => jed_node5542 ,
    ar => jed_node5798 ,
    fb => jed_node932 ,
    q => jed_node6054
)
;
INST_7 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    2000 ps  , 
    2000 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    2000 ps  , 
    1000 ps  , 
    4000 ps  , 
    1000 ps  , 
    4500 ps  , 
    0 ps  , 
    6000 ps  , 
    6000 ps  , 
    3000 ps  , 
    3000 ps  , 
    10000 ps  , 
    7000 ps  , 
    10000 ps  , 
    7000 ps  , 
    6500 ps  , 
    2500 ps  , 
    5000 ps  , 
    5000 ps  , 
    nopt 
) 
port map (
    x => jed_node2484 ,
    clk => jed_node5302 ,
    as => jed_node5558 ,
    ar => jed_node5814 ,
    fb => jed_node948 ,
    q => jed_node6070
)
;
INST_8 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    2000 ps  , 
    2000 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    2000 ps  , 
    1000 ps  , 
    4000 ps  , 
    1000 ps  , 
    4500 ps  , 
    0 ps  , 
    6000 ps  , 
    6000 ps  , 
    3000 ps  , 
    3000 ps  , 
    10000 ps  , 
    7000 ps  , 
    10000 ps  , 
    7000 ps  , 
    6500 ps  , 
    2500 ps  , 
    5000 ps  , 
    5000 ps  , 
    nopt 
) 
port map (
    x => jed_node2500 ,
    clk => jed_node5318 ,
    as => jed_node5574 ,
    ar => jed_node5830 ,
    fb => jed_node964 ,
    q => jed_node6086
)
;
INST_9 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    2000 ps  , 
    2000 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    2000 ps  , 
    1000 ps  , 
    4000 ps  , 
    1000 ps  , 
    4500 ps  , 
    0 ps  , 
    6000 ps  , 
    6000 ps  , 
    3000 ps  , 
    3000 ps  , 
    10000 ps  , 
    7000 ps  , 
    10000 ps  , 
    7000 ps  , 
    6500 ps  , 
    2500 ps  , 
    5000 ps  , 
    5000 ps  , 
    nopt 
) 
port map (
    x => jed_node2516 ,
    clk => jed_node5334 ,
    as => jed_node5590 ,
    ar => jed_node5846 ,
    fb => jed_node980 ,
    q => jed_node6102
)
;
INST_10 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    2000 ps  , 
    2000 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    2000 ps  , 
    1000 ps  , 
    4000 ps  , 
    1000 ps  , 
    4500 ps  , 
    0 ps  , 
    6000 ps  , 
    6000 ps  , 
    3000 ps  , 
    3000 ps  , 
    10000 ps  , 
    7000 ps  , 
    10000 ps  , 
    7000 ps  , 
    6500 ps  , 
    2500 ps  , 
    5000 ps  , 
    5000 ps  , 
    nopt 
) 
port map (
    x => jed_node2532 ,
    clk => jed_node5350 ,
    as => jed_node5606 ,
    ar => jed_node5862 ,
    fb => jed_node996 ,
    q => jed_node6118
)
;
INST_11 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    2000 ps  , 
    2000 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    2000 ps  , 
    1000 ps  , 
    4000 ps  , 
    1000 ps  , 
    4500 ps  , 
    0 ps  , 
    6000 ps  , 
    6000 ps  , 
    3000 ps  , 
    3000 ps  , 
    10000 ps  , 
    7000 ps  , 
    10000 ps  , 
    7000 ps  , 
    6500 ps  , 
    2500 ps  , 
    5000 ps  , 
    5000 ps  , 
    nopt 
) 
port map (
    x => jed_node2676 ,
    clk => jed_node5494 ,
    as => jed_node5750 ,
    ar => jed_node6006 ,
    fb => jed_node1140 ,
    q => jed_node6262
)
;
INST_12 : c37km
generic map (
    invt  , 
    1500 ps  , 
    2500 ps  , 
    7500 ps  , 
    7500 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6022 ,
    oe => jed_node6274 ,
    fb => jed_node11 ,
    y => jed_node6466
)
;
INST_13 : c37km
generic map (
    ninv  , 
    1500 ps  , 
    2500 ps  , 
    7500 ps  , 
    7500 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6024 ,
    oe => jed_node6276 ,
    fb => jed_node13 ,
    y => sal(0)
)
;
INST_14 : c37km
generic map (
    ninv  , 
    1500 ps  , 
    2500 ps  , 
    7500 ps  , 
    7500 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6028 ,
    oe => jed_node6280 ,
    fb => jed_node17 ,
    y => sal(4)
)
;
INST_15 : c37km
generic map (
    ninv  , 
    1500 ps  , 
    2500 ps  , 
    7500 ps  , 
    7500 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6030 ,
    oe => jed_node6281 ,
    fb => jed_node18 ,
    y => sal(2)
)
;
INST_16 : c37km
generic map (
    ninv  , 
    1500 ps  , 
    2500 ps  , 
    7500 ps  , 
    7500 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6032 ,
    oe => jed_node6282 ,
    fb => jed_node19 ,
    y => sal(3)
)
;
INST_17 : c37km
generic map (
    ninv  , 
    1500 ps  , 
    2500 ps  , 
    7500 ps  , 
    7500 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6034 ,
    oe => jed_node6283 ,
    fb => jed_node20 ,
    y => sal(1)
)
;
INST_18 : c37km
generic map (
    invt  , 
    1500 ps  , 
    2500 ps  , 
    7500 ps  , 
    7500 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6054 ,
    oe => jed_node6298 ,
    fb => jed_node35 ,
    y => jed_node6490
)
;
INST_19 : c37km
generic map (
    invt  , 
    1500 ps  , 
    2500 ps  , 
    7500 ps  , 
    7500 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6070 ,
    oe => jed_node6310 ,
    fb => jed_node47 ,
    y => jed_node6502
)
;
INST_20 : c37km
generic map (
    invt  , 
    1500 ps  , 
    2500 ps  , 
    7500 ps  , 
    7500 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6086 ,
    oe => jed_node6322 ,
    fb => jed_node59 ,
    y => jed_node6514
)
;
INST_21 : c37km
generic map (
    invt  , 
    1500 ps  , 
    2500 ps  , 
    7500 ps  , 
    7500 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6102 ,
    oe => jed_node6334 ,
    fb => jed_node71 ,
    y => jed_node6526
)
;
INST_22 : c37km
generic map (
    invt  , 
    1500 ps  , 
    2500 ps  , 
    7500 ps  , 
    7500 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6118 ,
    oe => jed_node6346 ,
    fb => jed_node83 ,
    y => jed_node6538
)
;
INST_23 : c37km
generic map (
    invt  , 
    1500 ps  , 
    2500 ps  , 
    7500 ps  , 
    7500 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6262 ,
    oe => jed_node6454 ,
    fb => jed_node191 ,
    y => jed_node6646
)
;
INST_24 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node71 ,
    fb => jed_node301
)
;
INST_25 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node258 ,
    fb => jed_node302
)
;
INST_26 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node259 ,
    fb => jed_node303
)
;
INST_27 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node11 ,
    fb => jed_node304
)
;
INST_28 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node908 ,
    fb => jed_node305
)
;
INST_29 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node902 ,
    fb => jed_node307
)
;
INST_30 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node910 ,
    fb => jed_node308
)
;
INST_31 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node260 ,
    fb => jed_node309
)
;
INST_32 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node261 ,
    fb => jed_node310
)
;
INST_33 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node912 ,
    fb => jed_node311
)
;
INST_34 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node59 ,
    fb => jed_node312
)
;
INST_35 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node83 ,
    fb => jed_node314
)
;
INST_36 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node35 ,
    fb => jed_node315
)
;
INST_37 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node47 ,
    fb => jed_node316
)
;
INST_38 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node906 ,
    fb => jed_node325
)
;
INST_39 : c37kmux
generic map (
    5000 ps 
) 
port map (
    x => jed_node191 ,
    fb => jed_node334
)
;
INST_40 : c37kinp
generic map (
    comb  , 
    2000 ps  , 
    2000 ps  , 
    1500 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    3000 ps  , 
    3000 ps 
) 
port map (
    d => ent(3) ,
    clk => jed_node6649 ,
    fb => jed_node258
)
;
INST_41 : c37kinp
generic map (
    comb  , 
    2000 ps  , 
    2000 ps  , 
    1500 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    3000 ps  , 
    3000 ps 
) 
port map (
    d => sel(2) ,
    clk => jed_node6651 ,
    fb => jed_node260
)
;
INST_42 : c37kinp
generic map (
    comb  , 
    2000 ps  , 
    2000 ps  , 
    1500 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    3000 ps  , 
    3000 ps 
) 
port map (
    d => sel(1) ,
    clk => jed_node6652 ,
    fb => jed_node261
)
;
INST_43 : c37kinp
generic map (
    comb  , 
    2000 ps  , 
    2000 ps  , 
    1500 ps  , 
    6500 ps  , 
    0 ps  , 
    0 ps  , 
    3000 ps  , 
    3000 ps 
) 
port map (
    d => signo ,
    clk => jed_node6650 ,
    fb => jed_node259
)
;
     jed_node2438 <= ( jed_node307 and jed_node309 and jed_node310 )  or ( ( not jed_node309 )  and ( not jed_node310 )  and jed_node312 and ( not jed_node334 )  )  or ( ( not jed_node301 )  and ( not jed_node309 )  and jed_node310 and jed_node314 and jed_node334 )  or ( jed_node301 and jed_node303 and ( not jed_node309 )  and jed_node310 and jed_node334 )  or ( ( not jed_node309 )  and ( not jed_node310 )  and jed_node316 and jed_node334 )  or ( ( not jed_node309 )  and jed_node310 and jed_node315 and ( not jed_node334 )  )  or ( jed_node309 and ( not jed_node310 )  and jed_node314 and ( not jed_node334 )  )  or ( jed_node309 and ( not jed_node310 )  and ( not jed_node312 )  and jed_node334 )  ; 

     jed_node2442 <= ( jed_node309 and jed_node310 and jed_node325 )  or ( ( not jed_node303 )  and jed_node309 and ( not jed_node310 )  and jed_node334 )  or ( jed_node303 and ( not jed_node309 )  )  or ( jed_node303 and ( not jed_node310 )  and ( not jed_node334 )  )  ; 

     jed_node2444 <= ( jed_node309 and ( not jed_node310 )  and jed_node312 and ( not jed_node334 )  )  or ( jed_node309 and ( not jed_node310 )  and ( not jed_node315 )  and jed_node334 )  or ( jed_node305 and jed_node309 and jed_node310 )  or ( ( not jed_node309 )  and ( not jed_node310 )  and jed_node315 and ( not jed_node334 )  )  or ( jed_node302 and ( not jed_node309 )  and ( not jed_node310 )  and jed_node334 )  or ( ( not jed_node309 )  and jed_node310 and jed_node316 and jed_node334 )  or ( ( not jed_node309 )  and jed_node310 and jed_node314 and ( not jed_node334 )  )  ; 

     jed_node2446 <= ( ( not jed_node309 )  and jed_node310 and jed_node314 and ( not jed_node334 )  )  or ( ( not jed_node309 )  and jed_node310 and jed_node315 and jed_node334 )  or ( jed_node302 and ( not jed_node309 )  and ( not jed_node310 )  and ( not jed_node334 )  )  or ( jed_node308 and jed_node309 and jed_node310 )  or ( jed_node309 and ( not jed_node310 )  and jed_node316 and ( not jed_node334 )  )  or ( ( not jed_node302 )  and jed_node309 and ( not jed_node310 )  and jed_node334 )  or ( ( not jed_node301 )  and ( not jed_node309 )  and ( not jed_node310 )  and jed_node314 and jed_node334 )  or ( jed_node301 and jed_node303 and ( not jed_node309 )  and ( not jed_node310 )  and jed_node334 )  ; 

     jed_node2448 <= ( jed_node309 and ( not jed_node310 )  and ( not jed_node316 )  and jed_node334 )  or ( jed_node309 and jed_node310 and jed_node311 )  or ( ( not jed_node309 )  and ( not jed_node310 )  and jed_node316 and ( not jed_node334 )  )  or ( ( not jed_node309 )  and jed_node310 and jed_node312 and jed_node334 )  or ( ( not jed_node309 )  and ( not jed_node310 )  and jed_node315 and jed_node334 )  or ( jed_node302 and ( not jed_node309 )  and jed_node310 and ( not jed_node334 )  )  or ( jed_node309 and ( not jed_node310 )  and jed_node314 and ( not jed_node334 )  )  ; 

     jed_node5017 <= jed_node304;

     jed_node5254 <= jed_node2681 ;

     jed_node5510 <= zero ;

     jed_node5766 <= zero ;

     jed_node5256 <= jed_node2689 ;

     jed_node5260 <= jed_node2689 ;

     jed_node5262 <= jed_node2689 ;

     jed_node5264 <= jed_node2689 ;

     jed_node5266 <= jed_node2689 ;

     jed_node5512 <= jed_node2698 ;

     jed_node5516 <= jed_node2698 ;

     jed_node5518 <= jed_node2698 ;

     jed_node5520 <= jed_node2698 ;

     jed_node5522 <= jed_node2698 ;

     jed_node5768 <= jed_node2697 ;

     jed_node5772 <= jed_node2697 ;

     jed_node5774 <= jed_node2697 ;

     jed_node5776 <= jed_node2697 ;

     jed_node5778 <= jed_node2697 ;

     jed_node5286 <= jed_node2703 ;

     jed_node5542 <= zero ;

     jed_node5798 <= zero ;

     jed_node5302 <= jed_node2714 ;

     jed_node5558 <= zero ;

     jed_node5814 <= zero ;

     jed_node5318 <= jed_node2725 ;

     jed_node5574 <= zero ;

     jed_node5830 <= zero ;

     jed_node5334 <= jed_node2736 ;

     jed_node5590 <= zero ;

     jed_node5846 <= zero ;

     jed_node5350 <= jed_node2747 ;

     jed_node5606 <= zero ;

     jed_node5862 <= zero ;

     jed_node5494 <= jed_node2846 ;

     jed_node5750 <= zero ;

     jed_node6006 <= zero ;

     jed_node6274 <= zero ;

     jed_node6276 <= one ;

     jed_node6280 <= one ;

     jed_node6281 <= one ;

     jed_node6282 <= one ;

     jed_node6283 <= one ;

     jed_node6298 <= zero ;

     jed_node6310 <= zero ;

     jed_node6322 <= zero ;

     jed_node6334 <= zero ;

     jed_node6346 <= zero ;

     jed_node6454 <= zero ;

     jed_node5033 <= zero ;

     jed_node6649 <= jed_node2857 ;

     jed_node6651 <= jed_node2857 ;

     jed_node6652 <= jed_node2857 ;

     jed_node6650 <= jed_node2857 ;

     jed_node2857 <= sel(1) ;

     jed_node2681 <= sel(1) ;

     jed_node2689 <= clk ;

     jed_node2703 <= sel(1) ;

     jed_node2714 <= sel(1) ;

     jed_node2725 <= sel(1) ;

     jed_node2736 <= sel(1) ;

     jed_node2747 <= sel(1) ;

     jed_node2846 <= sel(1) ;

     jed_node2697 <= jed_node5017 ;

     jed_node2698 <= jed_node5033 ;

END DSMB ; 
