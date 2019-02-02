library ieee;
use work.gatespkg.all;

Entity Alu is
port (a,b: in bit_Vector (3 downto 0);
      cn, s0, s1, s2: in bit;
	  Co: out bit;
	  fi: out bit_vector (3 downto 0));
End Alu;

Architecture Alu4Bits of Alu is
	Signal nots2, nots1, nots0:bit;
	Signal notb0, notb1, notb2, notb3: bit;
	Signal Co1, Co2, Co3, Co4: bit;
   	Signal Co11, Co22, Co33, Co44: bit;
	Signal Ax1, Ax2, Ax3, Ax4, Ax5, Ax6, Ax7, Ax8: bit;
     Signal Ax9, Ax10, Ax11, Ax12, Ax13, Ax14, Ax15, Ax16: bit;
    Signal Ax17, Ax18, Ax19, Ax20, Ax21, Ax22, Ax23, Ax24: bit;
   	Signal Ax25, Ax26: bit;

	Begin
		U0 : inv  port map (s2,nots2);
		U1 : inv  port map (s1,nots1);
		U2 : inv  port map (s0,nots0);

		U3 : and2 port map (cn,nots2,Co1);
		U4 : and3 port map (s2,nots1,nots0,Ax2);
		U5 : and3 port map (s2,s1,nots0,Ax1);

		U6 : and2 port map (Ax2,b(0),Ax3);
            U7 : inv  port map (b(0),notb0);
		U8 : and2 port map (Ax1,notb0,Ax4);
       		U9 : and2 port map (b(0),s0,Ax5);
		U10: and2 port map (notb0,s1,Ax6);
		U11: or3  port map (Ax3,Ax4,a(0),Ax7);
		U12: or2  port map (Ax5,Ax6,Ax8);
		U13: Sum2 port map (Ax7,Ax8,Co1,fi(0),Co11);

  		U14: and2 port map (Co11,nots2,Co2);
		U15: and2 port map (Ax2,b(1),Ax9);
U16: inv  port map (b(1),notb1);
		U17: and2 port map (Ax1,notb1,Ax10);
            U18: and2 port map (b(1),s0,Ax11);
	  	U19: and2 port map (notb1,s1,Ax12);
		U20: or3  port map (Ax9,Ax10,a(1),Ax13);
		U21: or2  port map (Ax11,Ax12,Ax14);
		U22: Sum2 port map (Ax13,Ax14,Co2,fi(1),Co22);

		U23: and2 port map (Co22,nots2,Co3);
		U24: and2 port map (Ax2,b(2),Ax15);
            U25: inv  port map (b(2),notb2);
		U26: and2 port map (Ax1,notb2,Ax16);
		U27: and2 port map (b(2),s0,Ax17);
		U28: and2 port map (notb2,s1,Ax18);
		U29: or3  port map (Ax15,Ax16,a(2),Ax19);
		U30: or2  port map (Ax17,Ax18,Ax20);
		U31: Sum2 port map (Ax19,Ax20,Co3,fi(2),Co33);

		U32: and2 port map (Co33,nots2,Co4);
		U33: and2 port map (Ax2,b(3),Ax21);
                       U34: inv  port map (b(3),notb3);
		U35: and2 port map (Ax1,notb3,Ax22);
                        U36: and2 port map (b(3),s0,Ax23);
		U37: and2 port map (notb3,s1,Ax24);
		U38: or3  port map (Ax21,Ax22,a(3),Ax25);
		U39: or2  port map (Ax23,Ax24,Ax26);
		U40: Sum2 port map (Ax25,Ax26,Co4,fi(3),Co44);

		U41: and2 port map (Co44,nots2,Co);

End Alu4Bits;

