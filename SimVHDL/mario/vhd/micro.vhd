--
-- Cypress Structural Netlist
-- DISASM Jedec Disassembly Program Version 6.2 IR 27
--
-- Package: cy37256p160-83ac
-- Design: micro
-- Entity: micro
-- Architecture: cy37256p160

library ieee ;
use ieee.std_logic_1164.all ; 

library primitive ;
use primitive.c37kp.all ;

-- Beginning of Test Bench Header

ENTITY micro IS
    PORT (
	clk : in std_logic  ; 
	reset : in std_logic  ; 
	ro : inout std_logic_vector (3 downto 0) ; 
	rt : inout std_logic_vector (3 downto 0) ; 
	acc : inout std_logic_vector (3 downto 0)
    ) ;
END micro ;

-- End of Test Bench Header
ARCHITECTURE DSMB of micro is

  signal jed_node6480 : std_logic := '0' ; --ro(0)
  signal jed_node6482 : std_logic := '0' ; --ro(1)
  signal jed_node6484 : std_logic := '0' ; --ro(2)
  signal jed_node6485 : std_logic := '0' ; --ro(3)
  signal jed_node6486 : std_logic := '0' ;
  signal jed_node6487 : std_logic := '0' ;
  signal jed_node6488 : std_logic := '0' ;
  signal jed_node6490 : std_logic := '0' ;
  signal jed_node6492 : std_logic := '0' ; --rt(2)
  signal jed_node6494 : std_logic := '0' ; --rt(3)
  signal jed_node6496 : std_logic := '0' ; --rt(0)
  signal jed_node6497 : std_logic := '0' ; --rt(1)
  signal jed_node6498 : std_logic := '0' ;
  signal jed_node6499 : std_logic := '0' ;
  signal jed_node6500 : std_logic := '0' ;
  signal jed_node6502 : std_logic := '0' ;
  signal jed_node6504 : std_logic := '0' ;
  signal jed_node6506 : std_logic := '0' ;
  signal jed_node6508 : std_logic := '0' ;
  signal jed_node6509 : std_logic := '0' ;
  signal jed_node6510 : std_logic := '0' ;
  signal jed_node6511 : std_logic := '0' ;
  signal jed_node6512 : std_logic := '0' ;
  signal jed_node6514 : std_logic := '0' ;
  signal jed_node6516 : std_logic := '0' ;
  signal jed_node6518 : std_logic := '0' ;
  signal jed_node6520 : std_logic := '0' ;
  signal jed_node6521 : std_logic := '0' ;
  signal jed_node6522 : std_logic := '0' ;
  signal jed_node6523 : std_logic := '0' ;
  signal jed_node6524 : std_logic := '0' ;
  signal jed_node6526 : std_logic := '0' ;
  signal jed_node6528 : std_logic := '0' ;
  signal jed_node6530 : std_logic := '0' ;
  signal jed_node6532 : std_logic := '0' ;
  signal jed_node6533 : std_logic := '0' ;
  signal jed_node6534 : std_logic := '0' ;
  signal jed_node6535 : std_logic := '0' ;
  signal jed_node6536 : std_logic := '0' ;
  signal jed_node6538 : std_logic := '0' ;
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
  signal jed_node6638 : std_logic := '0' ;
  signal jed_node6640 : std_logic := '0' ;
  signal jed_node6644 : std_logic := '0' ;
  signal jed_node6646 : std_logic := '0' ;
  signal jed_node6456 : std_logic := '0' ;
  signal jed_node6458 : std_logic := '0' ;
  signal jed_node6460 : std_logic := '0' ;
  signal jed_node6461 : std_logic := '0' ;
  signal jed_node6462 : std_logic := '0' ;
  signal jed_node6463 : std_logic := '0' ;
  signal jed_node6464 : std_logic := '0' ;
  signal jed_node6466 : std_logic := '0' ;
  signal jed_node6468 : std_logic := '0' ;
  signal jed_node6470 : std_logic := '0' ;
  signal jed_node6472 : std_logic := '0' ;
  signal jed_node6473 : std_logic := '0' ;
  signal jed_node6474 : std_logic := '0' ;
  signal jed_node6475 : std_logic := '0' ;
  signal jed_node6476 : std_logic := '0' ;
  signal jed_node6478 : std_logic := '0' ;

      for all: c37kinp use entity primitive.c37kinp (sim);
      for all: c37km use entity primitive.c37km (sim);
      for all: c37kmux use entity primitive.c37kmux (sim);
      for all: c37koreg use entity primitive.c37koreg (sim);

--Attribute PIN_NUMBERS of ro(0):SIGNAL is "2"
--Attribute PIN_NUMBERS of ro(1):SIGNAL is "3"
--Attribute PIN_NUMBERS of ro(2):SIGNAL is "4"
--Attribute PIN_NUMBERS of ro(3):SIGNAL is "5"
--Attribute PIN_NUMBERS of rt(2):SIGNAL is "11"
--Attribute PIN_NUMBERS of rt(3):SIGNAL is "12"
--Attribute PIN_NUMBERS of rt(0):SIGNAL is "13"
--Attribute PIN_NUMBERS of rt(1):SIGNAL is "14"
--Attribute PIN_NUMBERS of clk:SIGNAL is "19"
--Attribute PIN_NUMBERS of reset:SIGNAL is "22"
--Attribute PIN_NUMBERS of acc(3):SIGNAL is "131"
--Attribute PIN_NUMBERS of acc(0):SIGNAL is "134"
--Attribute PIN_NUMBERS of acc(2):SIGNAL is "135"
--Attribute PIN_NUMBERS of acc(1):SIGNAL is "136"

SIGNAL one:std_logic := '1' ; 
SIGNAL zero:std_logic := '0' ; 
SIGNAL jed_node2454:std_logic := '0' ;
SIGNAL jed_node5272:std_logic := '0' ;
SIGNAL jed_node5528:std_logic := '0' ;
SIGNAL jed_node5784:std_logic := '0' ;
SIGNAL jed_node918:std_logic := '0' ;
SIGNAL jed_node6040:std_logic := '0' ;
SIGNAL jed_node5128:std_logic := '0' ;
SIGNAL jed_node5273:std_logic := '0' ;
SIGNAL jed_node5529:std_logic := '0' ;
SIGNAL jed_node5785:std_logic := '0' ;
SIGNAL ri_0:std_logic := '0' ;
SIGNAL jed_node6041:std_logic := '0' ;
SIGNAL jed_node2456:std_logic := '0' ;
SIGNAL jed_node5274:std_logic := '0' ;
SIGNAL jed_node5530:std_logic := '0' ;
SIGNAL jed_node5786:std_logic := '0' ;
SIGNAL jed_node920:std_logic := '0' ;
SIGNAL jed_node6042:std_logic := '0' ;
SIGNAL jed_node5129:std_logic := '0' ;
SIGNAL jed_node5275:std_logic := '0' ;
SIGNAL jed_node5531:std_logic := '0' ;
SIGNAL jed_node5787:std_logic := '0' ;
SIGNAL ri_1:std_logic := '0' ;
SIGNAL jed_node6043:std_logic := '0' ;
SIGNAL jed_node2458:std_logic := '0' ;
SIGNAL jed_node5276:std_logic := '0' ;
SIGNAL jed_node5532:std_logic := '0' ;
SIGNAL jed_node5788:std_logic := '0' ;
SIGNAL jed_node922:std_logic := '0' ;
SIGNAL jed_node6044:std_logic := '0' ;
SIGNAL jed_node5130:std_logic := '0' ;
SIGNAL jed_node5277:std_logic := '0' ;
SIGNAL jed_node5533:std_logic := '0' ;
SIGNAL jed_node5789:std_logic := '0' ;
SIGNAL ri_2:std_logic := '0' ;
SIGNAL jed_node6045:std_logic := '0' ;
SIGNAL jed_node2460:std_logic := '0' ;
SIGNAL jed_node5278:std_logic := '0' ;
SIGNAL jed_node5534:std_logic := '0' ;
SIGNAL jed_node5790:std_logic := '0' ;
SIGNAL jed_node924:std_logic := '0' ;
SIGNAL jed_node6046:std_logic := '0' ;
SIGNAL jed_node5131:std_logic := '0' ;
SIGNAL jed_node5279:std_logic := '0' ;
SIGNAL jed_node5535:std_logic := '0' ;
SIGNAL jed_node5791:std_logic := '0' ;
SIGNAL ri_3:std_logic := '0' ;
SIGNAL jed_node6047:std_logic := '0' ;
SIGNAL jed_node2470:std_logic := '0' ;
SIGNAL jed_node5288:std_logic := '0' ;
SIGNAL jed_node5544:std_logic := '0' ;
SIGNAL jed_node5800:std_logic := '0' ;
SIGNAL jed_node934:std_logic := '0' ;
SIGNAL jed_node6056:std_logic := '0' ;
SIGNAL jed_node5136:std_logic := '0' ;
SIGNAL jed_node5289:std_logic := '0' ;
SIGNAL jed_node5545:std_logic := '0' ;
SIGNAL jed_node5801:std_logic := '0' ;
SIGNAL rd_2:std_logic := '0' ;
SIGNAL jed_node6057:std_logic := '0' ;
SIGNAL jed_node2472:std_logic := '0' ;
SIGNAL jed_node5290:std_logic := '0' ;
SIGNAL jed_node5546:std_logic := '0' ;
SIGNAL jed_node5802:std_logic := '0' ;
SIGNAL jed_node936:std_logic := '0' ;
SIGNAL jed_node6058:std_logic := '0' ;
SIGNAL jed_node5137:std_logic := '0' ;
SIGNAL jed_node5291:std_logic := '0' ;
SIGNAL jed_node5547:std_logic := '0' ;
SIGNAL jed_node5803:std_logic := '0' ;
SIGNAL rd_3:std_logic := '0' ;
SIGNAL jed_node6059:std_logic := '0' ;
SIGNAL jed_node2474:std_logic := '0' ;
SIGNAL jed_node5292:std_logic := '0' ;
SIGNAL jed_node5548:std_logic := '0' ;
SIGNAL jed_node5804:std_logic := '0' ;
SIGNAL jed_node938:std_logic := '0' ;
SIGNAL jed_node6060:std_logic := '0' ;
SIGNAL jed_node5138:std_logic := '0' ;
SIGNAL jed_node5293:std_logic := '0' ;
SIGNAL jed_node5549:std_logic := '0' ;
SIGNAL jed_node5805:std_logic := '0' ;
SIGNAL rd_0:std_logic := '0' ;
SIGNAL jed_node6061:std_logic := '0' ;
SIGNAL jed_node2476:std_logic := '0' ;
SIGNAL jed_node5294:std_logic := '0' ;
SIGNAL jed_node5550:std_logic := '0' ;
SIGNAL jed_node5806:std_logic := '0' ;
SIGNAL jed_node940:std_logic := '0' ;
SIGNAL jed_node6062:std_logic := '0' ;
SIGNAL jed_node5139:std_logic := '0' ;
SIGNAL jed_node5295:std_logic := '0' ;
SIGNAL jed_node5551:std_logic := '0' ;
SIGNAL jed_node5807:std_logic := '0' ;
SIGNAL rd_1:std_logic := '0' ;
SIGNAL jed_node6063:std_logic := '0' ;
SIGNAL jed_node2598:std_logic := '0' ;
SIGNAL jed_node5416:std_logic := '0' ;
SIGNAL jed_node5672:std_logic := '0' ;
SIGNAL jed_node5928:std_logic := '0' ;
SIGNAL S_1:std_logic := '0' ;
SIGNAL jed_node6184:std_logic := '0' ;
SIGNAL jed_node2600:std_logic := '0' ;
SIGNAL jed_node5418:std_logic := '0' ;
SIGNAL jed_node5674:std_logic := '0' ;
SIGNAL jed_node5930:std_logic := '0' ;
SIGNAL act_0:std_logic := '0' ;
SIGNAL jed_node6186:std_logic := '0' ;
SIGNAL jed_node5201:std_logic := '0' ;
SIGNAL jed_node5419:std_logic := '0' ;
SIGNAL jed_node5675:std_logic := '0' ;
SIGNAL jed_node5931:std_logic := '0' ;
SIGNAL q_0:std_logic := '0' ;
SIGNAL jed_node6187:std_logic := '0' ;
SIGNAL jed_node2602:std_logic := '0' ;
SIGNAL jed_node5420:std_logic := '0' ;
SIGNAL jed_node5676:std_logic := '0' ;
SIGNAL jed_node5932:std_logic := '0' ;
SIGNAL q_3:std_logic := '0' ;
SIGNAL jed_node6188:std_logic := '0' ;
SIGNAL jed_node5202:std_logic := '0' ;
SIGNAL jed_node5421:std_logic := '0' ;
SIGNAL jed_node5677:std_logic := '0' ;
SIGNAL jed_node5933:std_logic := '0' ;
SIGNAL \acc(3)_C\:std_logic := '0' ;
SIGNAL jed_node6189:std_logic := '0' ;
SIGNAL jed_node5203:std_logic := '0' ;
SIGNAL jed_node5423:std_logic := '0' ;
SIGNAL jed_node5679:std_logic := '0' ;
SIGNAL jed_node5935:std_logic := '0' ;
SIGNAL act_2:std_logic := '0' ;
SIGNAL jed_node6191:std_logic := '0' ;
SIGNAL jed_node2606:std_logic := '0' ;
SIGNAL jed_node5424:std_logic := '0' ;
SIGNAL jed_node5680:std_logic := '0' ;
SIGNAL jed_node5936:std_logic := '0' ;
SIGNAL S_2:std_logic := '0' ;
SIGNAL jed_node6192:std_logic := '0' ;
SIGNAL jed_node5204:std_logic := '0' ;
SIGNAL jed_node5425:std_logic := '0' ;
SIGNAL jed_node5681:std_logic := '0' ;
SIGNAL jed_node5937:std_logic := '0' ;
SIGNAL \u6:MODULE_9:g1:a0:g0:u0:ga:g1:ua0\:std_logic := '0' ;
SIGNAL jed_node6193:std_logic := '0' ;
SIGNAL jed_node2608:std_logic := '0' ;
SIGNAL jed_node5426:std_logic := '0' ;
SIGNAL jed_node5682:std_logic := '0' ;
SIGNAL jed_node5938:std_logic := '0' ;
SIGNAL q_1:std_logic := '0' ;
SIGNAL jed_node6194:std_logic := '0' ;
SIGNAL jed_node5205:std_logic := '0' ;
SIGNAL jed_node5427:std_logic := '0' ;
SIGNAL jed_node5683:std_logic := '0' ;
SIGNAL jed_node5939:std_logic := '0' ;
SIGNAL q_2:std_logic := '0' ;
SIGNAL jed_node6195:std_logic := '0' ;
SIGNAL jed_node2610:std_logic := '0' ;
SIGNAL jed_node5428:std_logic := '0' ;
SIGNAL jed_node5684:std_logic := '0' ;
SIGNAL jed_node5940:std_logic := '0' ;
SIGNAL act_3:std_logic := '0' ;
SIGNAL jed_node6196:std_logic := '0' ;
SIGNAL jed_node5207:std_logic := '0' ;
SIGNAL jed_node5431:std_logic := '0' ;
SIGNAL jed_node5687:std_logic := '0' ;
SIGNAL jed_node5943:std_logic := '0' ;
SIGNAL act_1:std_logic := '0' ;
SIGNAL jed_node6199:std_logic := '0' ;
SIGNAL jed_node2662:std_logic := '0' ;
SIGNAL jed_node5480:std_logic := '0' ;
SIGNAL jed_node5736:std_logic := '0' ;
SIGNAL jed_node5992:std_logic := '0' ;
SIGNAL jed_node1126:std_logic := '0' ;
SIGNAL jed_node6248:std_logic := '0' ;
SIGNAL jed_node2668:std_logic := '0' ;
SIGNAL jed_node5486:std_logic := '0' ;
SIGNAL jed_node5742:std_logic := '0' ;
SIGNAL jed_node5998:std_logic := '0' ;
SIGNAL jed_node1132:std_logic := '0' ;
SIGNAL jed_node6254:std_logic := '0' ;
SIGNAL jed_node2670:std_logic := '0' ;
SIGNAL jed_node5488:std_logic := '0' ;
SIGNAL jed_node5744:std_logic := '0' ;
SIGNAL jed_node6000:std_logic := '0' ;
SIGNAL jed_node1134:std_logic := '0' ;
SIGNAL jed_node6256:std_logic := '0' ;
SIGNAL jed_node2672:std_logic := '0' ;
SIGNAL jed_node5490:std_logic := '0' ;
SIGNAL jed_node5746:std_logic := '0' ;
SIGNAL jed_node6002:std_logic := '0' ;
SIGNAL jed_node1136:std_logic := '0' ;
SIGNAL jed_node6258:std_logic := '0' ;
SIGNAL jed_node6288:std_logic := '0' ;
SIGNAL jed_node25:std_logic := '0' ;
SIGNAL jed_node6290:std_logic := '0' ;
SIGNAL jed_node27:std_logic := '0' ;
SIGNAL jed_node6292:std_logic := '0' ;
SIGNAL jed_node29:std_logic := '0' ;
SIGNAL jed_node6293:std_logic := '0' ;
SIGNAL jed_node30:std_logic := '0' ;
SIGNAL jed_node6300:std_logic := '0' ;
SIGNAL jed_node37:std_logic := '0' ;
SIGNAL jed_node6302:std_logic := '0' ;
SIGNAL jed_node39:std_logic := '0' ;
SIGNAL jed_node6304:std_logic := '0' ;
SIGNAL jed_node41:std_logic := '0' ;
SIGNAL jed_node6305:std_logic := '0' ;
SIGNAL jed_node42:std_logic := '0' ;
SIGNAL jed_node6444:std_logic := '0' ;
SIGNAL jed_node181:std_logic := '0' ;
SIGNAL jed_node6449:std_logic := '0' ;
SIGNAL jed_node186:std_logic := '0' ;
SIGNAL jed_node6450:std_logic := '0' ;
SIGNAL jed_node187:std_logic := '0' ;
SIGNAL jed_node6451:std_logic := '0' ;
SIGNAL jed_node188:std_logic := '0' ;
SIGNAL jed_node344:std_logic := '0' ;
SIGNAL jed_node346:std_logic := '0' ;
SIGNAL jed_node348:std_logic := '0' ;
SIGNAL jed_node360:std_logic := '0' ;
SIGNAL jed_node383:std_logic := '0' ;
SIGNAL jed_node385:std_logic := '0' ;
SIGNAL jed_node387:std_logic := '0' ;
SIGNAL jed_node399:std_logic := '0' ;
SIGNAL jed_node691:std_logic := '0' ;
SIGNAL jed_node258:std_logic := '0' ;
SIGNAL jed_node692:std_logic := '0' ;
SIGNAL jed_node693:std_logic := '0' ;
SIGNAL jed_node694:std_logic := '0' ;
SIGNAL jed_node695:std_logic := '0' ;
SIGNAL jed_node696:std_logic := '0' ;
SIGNAL jed_node697:std_logic := '0' ;
SIGNAL jed_node699:std_logic := '0' ;
SIGNAL jed_node700:std_logic := '0' ;
SIGNAL jed_node701:std_logic := '0' ;
SIGNAL jed_node702:std_logic := '0' ;
SIGNAL jed_node703:std_logic := '0' ;
SIGNAL jed_node706:std_logic := '0' ;
SIGNAL jed_node707:std_logic := '0' ;
SIGNAL jed_node708:std_logic := '0' ;
SIGNAL jed_node711:std_logic := '0' ;
SIGNAL jed_node713:std_logic := '0' ;
SIGNAL jed_node714:std_logic := '0' ;
SIGNAL jed_node720:std_logic := '0' ;
SIGNAL jed_node721:std_logic := '0' ;
SIGNAL jed_node847:std_logic := '0' ;
SIGNAL jed_node851:std_logic := '0' ;
SIGNAL jed_node854:std_logic := '0' ;
SIGNAL jed_node857:std_logic := '0' ;
SIGNAL jed_node860:std_logic := '0' ;
SIGNAL jed_node6649:std_logic := '0' ;
SIGNAL jed_node2601:std_logic := '0' ;
SIGNAL jed_node2603:std_logic := '0' ;
SIGNAL jed_node2605:std_logic := '0' ;
SIGNAL jed_node2607:std_logic := '0' ;
SIGNAL jed_node2609:std_logic := '0' ;
SIGNAL jed_node2613:std_logic := '0' ;
SIGNAL jed_node5002:std_logic := '0' ;
SIGNAL jed_node5003:std_logic := '0' ;
SIGNAL jed_node5011:std_logic := '0' ;
SIGNAL jed_node5015:std_logic := '0' ;
SIGNAL jed_node2853:std_logic := '0' ;
SIGNAL jed_node2710:std_logic := '0' ;
SIGNAL jed_node2721:std_logic := '0' ;
SIGNAL jed_node2809:std_logic := '0' ;
SIGNAL jed_node2799:std_logic := '0' ;
BEGIN
    jed_node6480 <= ro(0) ;
    jed_node6482 <= ro(1) ;
    jed_node6484 <= ro(2) ;
    jed_node6485 <= ro(3) ;
    jed_node6492 <= rt(2) ;
    jed_node6494 <= rt(3) ;
    jed_node6496 <= rt(0) ;
    jed_node6497 <= rt(1) ;

INST_0 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node2454 ,
    clk => jed_node5272 ,
    as => jed_node5528 ,
    ar => jed_node5784 ,
    fb => jed_node918 ,
    q => jed_node6040
)
;
INST_1 : c37koreg
generic map (
    dreg  , 
    src_adj  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node5128 ,
    clk => jed_node5273 ,
    as => jed_node5529 ,
    ar => jed_node5785 ,
    fb => ri_0 ,
    q => jed_node6041
)
;
INST_2 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node2456 ,
    clk => jed_node5274 ,
    as => jed_node5530 ,
    ar => jed_node5786 ,
    fb => jed_node920 ,
    q => jed_node6042
)
;
INST_3 : c37koreg
generic map (
    dreg  , 
    src_adj  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node5129 ,
    clk => jed_node5275 ,
    as => jed_node5531 ,
    ar => jed_node5787 ,
    fb => ri_1 ,
    q => jed_node6043
)
;
INST_4 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node2458 ,
    clk => jed_node5276 ,
    as => jed_node5532 ,
    ar => jed_node5788 ,
    fb => jed_node922 ,
    q => jed_node6044
)
;
INST_5 : c37koreg
generic map (
    dreg  , 
    src_adj  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node5130 ,
    clk => jed_node5277 ,
    as => jed_node5533 ,
    ar => jed_node5789 ,
    fb => ri_2 ,
    q => jed_node6045
)
;
INST_6 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node2460 ,
    clk => jed_node5278 ,
    as => jed_node5534 ,
    ar => jed_node5790 ,
    fb => jed_node924 ,
    q => jed_node6046
)
;
INST_7 : c37koreg
generic map (
    dreg  , 
    src_adj  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node5131 ,
    clk => jed_node5279 ,
    as => jed_node5535 ,
    ar => jed_node5791 ,
    fb => ri_3 ,
    q => jed_node6047
)
;
INST_8 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node2470 ,
    clk => jed_node5288 ,
    as => jed_node5544 ,
    ar => jed_node5800 ,
    fb => jed_node934 ,
    q => jed_node6056
)
;
INST_9 : c37koreg
generic map (
    dreg  , 
    src_adj  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node5136 ,
    clk => jed_node5289 ,
    as => jed_node5545 ,
    ar => jed_node5801 ,
    fb => rd_2 ,
    q => jed_node6057
)
;
INST_10 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node2472 ,
    clk => jed_node5290 ,
    as => jed_node5546 ,
    ar => jed_node5802 ,
    fb => jed_node936 ,
    q => jed_node6058
)
;
INST_11 : c37koreg
generic map (
    dreg  , 
    src_adj  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node5137 ,
    clk => jed_node5291 ,
    as => jed_node5547 ,
    ar => jed_node5803 ,
    fb => rd_3 ,
    q => jed_node6059
)
;
INST_12 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node2474 ,
    clk => jed_node5292 ,
    as => jed_node5548 ,
    ar => jed_node5804 ,
    fb => jed_node938 ,
    q => jed_node6060
)
;
INST_13 : c37koreg
generic map (
    dreg  , 
    src_adj  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node5138 ,
    clk => jed_node5293 ,
    as => jed_node5549 ,
    ar => jed_node5805 ,
    fb => rd_0 ,
    q => jed_node6061
)
;
INST_14 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node2476 ,
    clk => jed_node5294 ,
    as => jed_node5550 ,
    ar => jed_node5806 ,
    fb => jed_node940 ,
    q => jed_node6062
)
;
INST_15 : c37koreg
generic map (
    dreg  , 
    src_adj  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node5139 ,
    clk => jed_node5295 ,
    as => jed_node5551 ,
    ar => jed_node5807 ,
    fb => rd_1 ,
    q => jed_node6063
)
;
INST_16 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node2598 ,
    clk => jed_node5416 ,
    as => jed_node5672 ,
    ar => jed_node5928 ,
    fb => S_1 ,
    q => jed_node6184
)
;
INST_17 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node2600 ,
    clk => jed_node5418 ,
    as => jed_node5674 ,
    ar => jed_node5930 ,
    fb => act_0 ,
    q => jed_node6186
)
;
INST_18 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node5201 ,
    clk => jed_node5419 ,
    as => jed_node5675 ,
    ar => jed_node5931 ,
    fb => q_0 ,
    q => jed_node6187
)
;
INST_19 : c37koreg
generic map (
    treg  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node2602 ,
    clk => jed_node5420 ,
    as => jed_node5676 ,
    ar => jed_node5932 ,
    fb => q_3 ,
    q => jed_node6188
)
;
INST_20 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node5202 ,
    clk => jed_node5421 ,
    as => jed_node5677 ,
    ar => jed_node5933 ,
    fb => \acc(3)_C\ ,
    q => jed_node6189
)
;
INST_21 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node5203 ,
    clk => jed_node5423 ,
    as => jed_node5679 ,
    ar => jed_node5935 ,
    fb => act_2 ,
    q => jed_node6191
)
;
INST_22 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node2606 ,
    clk => jed_node5424 ,
    as => jed_node5680 ,
    ar => jed_node5936 ,
    fb => S_2 ,
    q => jed_node6192
)
;
INST_23 : c37koreg
generic map (
    cmb  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node5204 ,
    clk => jed_node5425 ,
    as => jed_node5681 ,
    ar => jed_node5937 ,
    fb => \u6:MODULE_9:g1:a0:g0:u0:ga:g1:ua0\ ,
    q => jed_node6193
)
;
INST_24 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node2608 ,
    clk => jed_node5426 ,
    as => jed_node5682 ,
    ar => jed_node5938 ,
    fb => q_1 ,
    q => jed_node6194
)
;
INST_25 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    nopt 
) 
port map (
    x => jed_node5205 ,
    clk => jed_node5427 ,
    as => jed_node5683 ,
    ar => jed_node5939 ,
    fb => q_2 ,
    q => jed_node6195
)
;
INST_26 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node2610 ,
    clk => jed_node5428 ,
    as => jed_node5684 ,
    ar => jed_node5940 ,
    fb => act_3 ,
    q => jed_node6196
)
;
INST_27 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node5207 ,
    clk => jed_node5431 ,
    as => jed_node5687 ,
    ar => jed_node5943 ,
    fb => act_1 ,
    q => jed_node6199
)
;
INST_28 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node2662 ,
    clk => jed_node5480 ,
    as => jed_node5736 ,
    ar => jed_node5992 ,
    fb => jed_node1126 ,
    q => jed_node6248
)
;
INST_29 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node2668 ,
    clk => jed_node5486 ,
    as => jed_node5742 ,
    ar => jed_node5998 ,
    fb => jed_node1132 ,
    q => jed_node6254
)
;
INST_30 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node2670 ,
    clk => jed_node5488 ,
    as => jed_node5744 ,
    ar => jed_node6000 ,
    fb => jed_node1134 ,
    q => jed_node6256
)
;
INST_31 : c37koreg
generic map (
    dreg  , 
    src_ptm  , 
    3000 ps  , 
    4000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    3500 ps  , 
    2500 ps  , 
    4500 ps  , 
    0 ps  , 
    8000 ps  , 
    500 ps  , 
    9000 ps  , 
    9000 ps  , 
    4000 ps  , 
    4000 ps  , 
    15000 ps  , 
    12000 ps  , 
    15000 ps  , 
    12000 ps  , 
    11000 ps  , 
    3000 ps  , 
    7000 ps  , 
    7000 ps  , 
    ckpt 
) 
port map (
    x => jed_node2672 ,
    clk => jed_node5490 ,
    as => jed_node5746 ,
    ar => jed_node6002 ,
    fb => jed_node1136 ,
    q => jed_node6258
)
;
INST_32 : c37km
generic map (
    invt  , 
    3000 ps  , 
    1500 ps  , 
    8000 ps  , 
    8000 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6040 ,
    oe => jed_node6288 ,
    fb => jed_node25 ,
    y => jed_node6480
)
;
INST_33 : c37km
generic map (
    invt  , 
    3000 ps  , 
    1500 ps  , 
    8000 ps  , 
    8000 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6042 ,
    oe => jed_node6290 ,
    fb => jed_node27 ,
    y => jed_node6482
)
;
INST_34 : c37km
generic map (
    invt  , 
    3000 ps  , 
    1500 ps  , 
    8000 ps  , 
    8000 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6044 ,
    oe => jed_node6292 ,
    fb => jed_node29 ,
    y => jed_node6484
)
;
INST_35 : c37km
generic map (
    invt  , 
    3000 ps  , 
    1500 ps  , 
    8000 ps  , 
    8000 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6046 ,
    oe => jed_node6293 ,
    fb => jed_node30 ,
    y => jed_node6485
)
;
INST_36 : c37km
generic map (
    invt  , 
    3000 ps  , 
    1500 ps  , 
    8000 ps  , 
    8000 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6056 ,
    oe => jed_node6300 ,
    fb => jed_node37 ,
    y => jed_node6492
)
;
INST_37 : c37km
generic map (
    invt  , 
    3000 ps  , 
    1500 ps  , 
    8000 ps  , 
    8000 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6058 ,
    oe => jed_node6302 ,
    fb => jed_node39 ,
    y => jed_node6494
)
;
INST_38 : c37km
generic map (
    invt  , 
    3000 ps  , 
    1500 ps  , 
    8000 ps  , 
    8000 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6060 ,
    oe => jed_node6304 ,
    fb => jed_node41 ,
    y => jed_node6496
)
;
INST_39 : c37km
generic map (
    invt  , 
    3000 ps  , 
    1500 ps  , 
    8000 ps  , 
    8000 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6062 ,
    oe => jed_node6305 ,
    fb => jed_node42 ,
    y => jed_node6497
)
;
INST_40 : c37km
generic map (
    ninv  , 
    3000 ps  , 
    1500 ps  , 
    8000 ps  , 
    8000 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6248 ,
    oe => jed_node6444 ,
    fb => jed_node181 ,
    y => acc(3)
)
;
INST_41 : c37km
generic map (
    ninv  , 
    3000 ps  , 
    1500 ps  , 
    8000 ps  , 
    8000 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6254 ,
    oe => jed_node6449 ,
    fb => jed_node186 ,
    y => acc(0)
)
;
INST_42 : c37km
generic map (
    ninv  , 
    3000 ps  , 
    1500 ps  , 
    8000 ps  , 
    8000 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6256 ,
    oe => jed_node6450 ,
    fb => jed_node187 ,
    y => acc(2)
)
;
INST_43 : c37km
generic map (
    ninv  , 
    3000 ps  , 
    1500 ps  , 
    8000 ps  , 
    8000 ps  , 
    3000 ps  , 
    fast 
) 
port map (
    x => jed_node6258 ,
    oe => jed_node6451 ,
    fb => jed_node188 ,
    y => acc(1)
)
;
INST_44 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => q_1 ,
    fb => jed_node344
)
;
INST_45 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => q_0 ,
    fb => jed_node346
)
;
INST_46 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => q_3 ,
    fb => jed_node348
)
;
INST_47 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => q_2 ,
    fb => jed_node360
)
;
INST_48 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => q_1 ,
    fb => jed_node383
)
;
INST_49 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => q_0 ,
    fb => jed_node385
)
;
INST_50 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => q_3 ,
    fb => jed_node387
)
;
INST_51 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => q_2 ,
    fb => jed_node399
)
;
INST_52 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => rd_2 ,
    fb => jed_node691
)
;
INST_53 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => jed_node258 ,
    fb => jed_node692
)
;
INST_54 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => jed_node1136 ,
    fb => jed_node693
)
;
INST_55 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => \u6:MODULE_9:g1:a0:g0:u0:ga:g1:ua0\ ,
    fb => jed_node694
)
;
INST_56 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => q_1 ,
    fb => jed_node695
)
;
INST_57 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => ri_2 ,
    fb => jed_node696
)
;
INST_58 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => q_0 ,
    fb => jed_node697
)
;
INST_59 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => rd_0 ,
    fb => jed_node699
)
;
INST_60 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => jed_node1132 ,
    fb => jed_node700
)
;
INST_61 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => ri_0 ,
    fb => jed_node701
)
;
INST_62 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => rd_1 ,
    fb => jed_node702
)
;
INST_63 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => jed_node1134 ,
    fb => jed_node703
)
;
INST_64 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => S_2 ,
    fb => jed_node706
)
;
INST_65 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => ri_3 ,
    fb => jed_node707
)
;
INST_66 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => jed_node1126 ,
    fb => jed_node708
)
;
INST_67 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => q_2 ,
    fb => jed_node711
)
;
INST_68 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => ri_1 ,
    fb => jed_node713
)
;
INST_69 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => q_3 ,
    fb => jed_node714
)
;
INST_70 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => rd_3 ,
    fb => jed_node720
)
;
INST_71 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => S_1 ,
    fb => jed_node721
)
;
INST_72 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => act_2 ,
    fb => jed_node847
)
;
INST_73 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => act_0 ,
    fb => jed_node851
)
;
INST_74 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => act_3 ,
    fb => jed_node854
)
;
INST_75 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => \acc(3)_C\ ,
    fb => jed_node857
)
;
INST_76 : c37kmux
generic map (
    8000 ps 
) 
port map (
    x => act_1 ,
    fb => jed_node860
)
;
INST_77 : c37kinp
generic map (
    comb  , 
    3000 ps  , 
    4000 ps  , 
    3000 ps  , 
    6000 ps  , 
    0 ps  , 
    0 ps  , 
    4000 ps  , 
    4000 ps 
) 
port map (
    d => reset ,
    clk => jed_node6649 ,
    fb => jed_node258
)
;
     jed_node2598 <= ( ( not jed_node696 )  and jed_node708 and ( not jed_node713 )  and jed_node720 )  or ( jed_node696 and ( not jed_node701 )  and jed_node713 and jed_node720 )  or ( jed_node691 and jed_node694 and ( not jed_node696 )  and jed_node701 and jed_node708 and jed_node720 )  or ( jed_node691 and ( not jed_node696 )  and jed_node701 and jed_node703 and jed_node708 and jed_node720 )  or ( jed_node696 and ( not jed_node701 )  and ( not jed_node707 )  and ( not jed_node708 )  and ( not jed_node713 )  )  or ( ( not jed_node696 )  and ( not jed_node701 )  and ( not jed_node707 )  and jed_node708 and jed_node713 and ( not jed_node720 )  )  or ( ( not jed_node691 )  and ( not jed_node696 )  and ( not jed_node703 )  and ( not jed_node707 )  and jed_node708 and jed_node713 and ( not jed_node720 )  )  or ( ( not jed_node691 )  and ( not jed_node694 )  and ( not jed_node696 )  and ( not jed_node707 )  and jed_node708 and jed_node713 and ( not jed_node720 )  )  or ( ( not jed_node691 )  and ( not jed_node696 )  and ( not jed_node703 )  and ( not jed_node708 )  and jed_node713 and jed_node720 )  or ( ( not jed_node691 )  and ( not jed_node694 )  and ( not jed_node696 )  and ( not jed_node708 )  and jed_node713 and jed_node720 )  or ( ( not jed_node694 )  and ( not jed_node696 )  and ( not jed_node703 )  and ( not jed_node707 )  and jed_node708 and jed_node713 and ( not jed_node720 )  )  or ( jed_node694 and ( not jed_node696 )  and jed_node701 and jed_node703 and ( not jed_node707 )  and ( not jed_node708 )  and jed_node713 and ( not jed_node720 )  )  or ( ( not jed_node694 )  and ( not jed_node696 )  and ( not jed_node703 )  and ( not jed_node708 )  and jed_node713 and jed_node720 )  or ( jed_node694 and ( not jed_node696 )  and jed_node701 and jed_node703 and jed_node708 and jed_node720 )  or ( jed_node691 and jed_node694 and ( not jed_node696 )  and jed_node701 and ( not jed_node707 )  and ( not jed_node708 )  and jed_node713 and ( not jed_node720 )  )  or ( jed_node691 and ( not jed_node696 )  and jed_node701 and jed_node703 and ( not jed_node707 )  and ( not jed_node708 )  and jed_node713 and ( not jed_node720 )  )  ; 

     jed_node2600 <= ( jed_node699 and jed_node707 )  or ( jed_node700 and jed_node701 and ( not jed_node707 )  and ( not jed_node713 )  )  or ( ( not jed_node696 )  and ( not jed_node699 )  and jed_node700 and ( not jed_node707 )  and jed_node713 )  or ( jed_node696 and ( not jed_node700 )  and ( not jed_node701 )  and ( not jed_node707 )  and ( not jed_node713 )  )  or ( ( not jed_node696 )  and jed_node699 and jed_node700 and ( not jed_node713 )  )  or ( ( not jed_node696 )  and jed_node699 and jed_node701 and ( not jed_node713 )  )  or ( ( not jed_node696 )  and jed_node699 and ( not jed_node700 )  and jed_node713 )  or ( jed_node696 and jed_node699 and ( not jed_node701 )  and jed_node713 )  ; 

     jed_node2601 <= ( ( not jed_node692 )  and ( not jed_node697 )  )  ; 

     jed_node2602 <= ( jed_node692 and jed_node714 )  or ( ( not jed_node692 )  and jed_node695 and jed_node697 and jed_node711 )  ; 

     jed_node2603 <= ( ( not jed_node711 )  and ( not jed_node714 )  )  or ( ( not jed_node695 )  and ( not jed_node697 )  and ( not jed_node714 )  )  ; 

     jed_node2605 <= ( jed_node691 and jed_node694 and ( not jed_node696 )  and jed_node701 and jed_node703 )  or ( ( not jed_node691 )  and ( not jed_node696 )  and ( not jed_node701 )  and jed_node703 and ( not jed_node707 )  and jed_node713 )  or ( jed_node691 and jed_node707 )  or ( jed_node701 and jed_node703 and ( not jed_node707 )  and ( not jed_node713 )  )  or ( ( not jed_node691 )  and ( not jed_node694 )  and ( not jed_node696 )  and jed_node703 and ( not jed_node707 )  and jed_node713 )  or ( ( not jed_node691 )  and jed_node694 and ( not jed_node696 )  and jed_node701 and ( not jed_node703 )  and ( not jed_node707 )  and jed_node713 )  or ( jed_node691 and ( not jed_node696 )  and jed_node703 and ( not jed_node713 )  )  or ( jed_node691 and ( not jed_node696 )  and jed_node701 and ( not jed_node713 )  )  or ( jed_node696 and ( not jed_node701 )  and ( not jed_node703 )  and ( not jed_node707 )  and ( not jed_node713 )  )  or ( jed_node691 and ( not jed_node694 )  and ( not jed_node696 )  and ( not jed_node703 )  and jed_node713 )  or ( jed_node691 and ( not jed_node701 )  and ( not jed_node703 )  and jed_node713 )  or ( jed_node691 and jed_node696 and ( not jed_node701 )  and jed_node713 )  ; 

     jed_node2606 <= ( jed_node707 and jed_node720 )  or ( jed_node701 and ( not jed_node707 )  and jed_node708 and ( not jed_node713 )  )  or ( ( not jed_node696 )  and jed_node701 and ( not jed_node713 )  and jed_node720 )  or ( ( not jed_node701 )  and ( not jed_node708 )  and jed_node713 and jed_node720 )  ; 

     jed_node2607 <= ( jed_node693 and jed_node702 )  or ( jed_node693 and jed_node699 and jed_node700 )  or ( jed_node699 and jed_node700 and jed_node702 )  ; 

     jed_node2608 <= ( ( not jed_node692 )  and ( not jed_node695 )  and jed_node697 and jed_node714 )  or ( ( not jed_node692 )  and jed_node695 and ( not jed_node697 )  )  or ( ( not jed_node692 )  and ( not jed_node695 )  and jed_node697 and ( not jed_node711 )  )  ; 

     jed_node2609 <= ( ( not jed_node692 )  and ( not jed_node695 )  and jed_node711 and jed_node714 )  or ( ( not jed_node692 )  and jed_node695 and jed_node697 and ( not jed_node711 )  )  or ( ( not jed_node692 )  and ( not jed_node697 )  and jed_node711 )  ; 

     jed_node2610 <= ( jed_node721 )  or ( jed_node706 )  ; 

     jed_node2613 <= ( jed_node702 and jed_node707 )  or ( jed_node693 and jed_node701 and ( not jed_node707 )  and ( not jed_node713 )  )  or ( ( not jed_node693 )  and ( not jed_node696 )  and ( not jed_node700 )  and jed_node702 and jed_node713 )  or ( jed_node693 and ( not jed_node696 )  and ( not jed_node699 )  and ( not jed_node702 )  and ( not jed_node707 )  and jed_node713 )  or ( jed_node693 and ( not jed_node696 )  and jed_node702 and ( not jed_node713 )  )  or ( ( not jed_node696 )  and jed_node701 and jed_node702 and ( not jed_node713 )  )  or ( jed_node693 and ( not jed_node696 )  and ( not jed_node701 )  and ( not jed_node702 )  and ( not jed_node707 )  and jed_node713 )  or ( jed_node693 and ( not jed_node696 )  and ( not jed_node700 )  and ( not jed_node702 )  and ( not jed_node707 )  and jed_node713 )  or ( ( not jed_node693 )  and ( not jed_node701 )  and jed_node702 and jed_node713 )  or ( jed_node696 and ( not jed_node701 )  and jed_node702 and jed_node713 )  or ( jed_node693 and ( not jed_node696 )  and jed_node699 and jed_node700 and jed_node701 and jed_node702 )  or ( ( not jed_node693 )  and ( not jed_node696 )  and jed_node699 and jed_node700 and jed_node701 and ( not jed_node702 )  and ( not jed_node707 )  and jed_node713 )  or ( ( not jed_node693 )  and ( not jed_node696 )  and ( not jed_node699 )  and jed_node702 and jed_node713 )  or ( ( not jed_node693 )  and jed_node696 and ( not jed_node701 )  and ( not jed_node707 )  and ( not jed_node713 )  )  ; 

     jed_node2662 <= ( jed_node854 )  ; 

     jed_node2668 <= ( jed_node851 )  ; 

     jed_node2670 <= ( jed_node847 )  ; 

     jed_node2672 <= ( jed_node860 )  ; 

     jed_node5002 <= ( not jed_node344 )  and ( not jed_node346 )  and ( not jed_node348 )  and ( not jed_node360 ) ;

     jed_node5003 <= jed_node383 and ( not jed_node385 )  and ( not jed_node387 )  and ( not jed_node399 ) ;

     jed_node5011 <= ( not jed_node695 )  and ( not jed_node697 )  and jed_node711 and ( not jed_node714 ) ;

     jed_node5015 <= jed_node857;

     jed_node2853 <= not jed_node5015 ;

     jed_node5273 <= jed_node2710 ;

     jed_node5275 <= jed_node2710 ;

     jed_node5277 <= jed_node2710 ;

     jed_node5279 <= jed_node2710 ;

     jed_node5128 <= jed_node25 ;

     jed_node5129 <= jed_node27 ;

     jed_node5130 <= jed_node29 ;

     jed_node5131 <= jed_node30 ;

     jed_node5528 <= zero ;

     jed_node5529 <= zero ;

     jed_node5530 <= zero ;

     jed_node5531 <= zero ;

     jed_node5532 <= zero ;

     jed_node5533 <= zero ;

     jed_node5534 <= zero ;

     jed_node5535 <= zero ;

     jed_node5784 <= zero ;

     jed_node5785 <= zero ;

     jed_node5786 <= zero ;

     jed_node5787 <= zero ;

     jed_node5788 <= zero ;

     jed_node5789 <= zero ;

     jed_node5790 <= zero ;

     jed_node5791 <= zero ;

     jed_node5289 <= jed_node2721 ;

     jed_node5291 <= jed_node2721 ;

     jed_node5293 <= jed_node2721 ;

     jed_node5295 <= jed_node2721 ;

     jed_node5136 <= jed_node37 ;

     jed_node5137 <= jed_node39 ;

     jed_node5138 <= jed_node41 ;

     jed_node5139 <= jed_node42 ;

     jed_node5544 <= zero ;

     jed_node5545 <= zero ;

     jed_node5546 <= zero ;

     jed_node5547 <= zero ;

     jed_node5548 <= zero ;

     jed_node5549 <= zero ;

     jed_node5550 <= zero ;

     jed_node5551 <= zero ;

     jed_node5800 <= zero ;

     jed_node5801 <= zero ;

     jed_node5802 <= zero ;

     jed_node5803 <= zero ;

     jed_node5804 <= zero ;

     jed_node5805 <= zero ;

     jed_node5806 <= zero ;

     jed_node5807 <= zero ;

     jed_node5418 <= jed_node2809 ;

     jed_node5419 <= jed_node2799 ;

     jed_node5420 <= jed_node2799 ;

     jed_node5423 <= jed_node2809 ;

     jed_node5426 <= jed_node2799 ;

     jed_node5427 <= jed_node2799 ;

     jed_node5428 <= jed_node2809 ;

     jed_node5431 <= jed_node2809 ;

     jed_node5201 <= jed_node2601 ;

     jed_node5202 <= jed_node2603 ;

     jed_node5203 <= jed_node2605 ;

     jed_node5204 <= jed_node2607 ;

     jed_node5205 <= jed_node2609 ;

     jed_node5207 <= jed_node2613 ;

     jed_node5672 <= zero ;

     jed_node5674 <= zero ;

     jed_node5675 <= zero ;

     jed_node5676 <= zero ;

     jed_node5677 <= zero ;

     jed_node5679 <= zero ;

     jed_node5680 <= zero ;

     jed_node5681 <= zero ;

     jed_node5682 <= zero ;

     jed_node5683 <= zero ;

     jed_node5684 <= zero ;

     jed_node5687 <= zero ;

     jed_node5928 <= zero ;

     jed_node5930 <= zero ;

     jed_node5931 <= zero ;

     jed_node5932 <= zero ;

     jed_node5933 <= zero ;

     jed_node5935 <= zero ;

     jed_node5936 <= zero ;

     jed_node5937 <= zero ;

     jed_node5938 <= zero ;

     jed_node5939 <= zero ;

     jed_node5940 <= zero ;

     jed_node5943 <= zero ;

     jed_node5480 <= jed_node2853 ;

     jed_node5486 <= jed_node2853 ;

     jed_node5488 <= jed_node2853 ;

     jed_node5490 <= jed_node2853 ;

     jed_node5736 <= zero ;

     jed_node5742 <= zero ;

     jed_node5744 <= zero ;

     jed_node5746 <= zero ;

     jed_node5992 <= zero ;

     jed_node5998 <= zero ;

     jed_node6000 <= zero ;

     jed_node6002 <= zero ;

     jed_node6288 <= zero ;

     jed_node6290 <= zero ;

     jed_node6292 <= zero ;

     jed_node6293 <= zero ;

     jed_node6300 <= zero ;

     jed_node6302 <= zero ;

     jed_node6304 <= zero ;

     jed_node6305 <= zero ;

     jed_node6444 <= one ;

     jed_node6449 <= one ;

     jed_node6450 <= one ;

     jed_node6451 <= one ;

     jed_node2799 <= clk ;

     jed_node2710 <= jed_node5002 ;

     jed_node2721 <= jed_node5003 ;

     jed_node2809 <= jed_node5011 ;

END DSMB ; 
