�  !  A   F   \   K   Q   i      �  �  �                  R       W   �                    �         p   �         �   �          �             �     5       �               
                      @            O            c           �            �            �  �  �   �   �   �   �  �   �   �   �       (  0  4              +  2  8                          �  :               
  �  �  �      �                       %  K   p           9                   p   e   �                       '  �   �           9                   �   w   �               �. �   �                       � V   �          �                       :  �           e   �                       ,  �   �       �          �      
  �  �     	      p             \   �                       =  T   �       �   �       �         �   �       �     	            �   h                      k � �                  �   /     �   � K               A  � �                       B           �   �                               
  �       b       �        �   �   �       M                  �  �        T                         	�   M                  �  �                          H   	#  7      � M                  w    
 /               ,    M                   �        �                 F                �   M                  �   �         �               m  Z  _           
   p                  	�   y  _           ��� z           u  G� M                  �   �         0                 ~                        �   M                  �  �        �               �  �  _              p                  	�   �  _           @KL z           �  G� 1                         �               ����S  �       �     X  �       �     ]  �                   c  �       �            �       �     Q  �                   e  �       �           �       �         �       �     
                   !   �         9         �         �      5   �   !   !   �   %   %   /   )   )   �   -   -   �   1   1   �   9   9   1   =   =                   �   ��;$   $1  $2  WORK    STD STANDARD    STD EJEM    REG130  REG130 IWORK 4  STD_LOGIC_1164  IEEE    EJEM/REG130 DAUX TD_STD_LOGIC   _P1 CLK CLK = G1'1' Q G1DAUX 41210 6NS  DAUX 0/RD 135   NS 1EJEM 129EJEM$0_5129126e3    REG130/EJEM/EJEM 
USREG130/EJEM/v5129126e3 LDAUX$4 I_P1$5_5129126e3 
ARCHITECTURE ejem OF REG130 IS
	SIGNAL daux: STD_LOGIC;
BEGIN
	PROCESS (clk)
	BEGIN
		IF clk='1' THEN
			q<=daux AFTER 10 ns;
		END IF;
	END PROCESS;
daux<=d AFTER 5 ns;	
END ejem;
	
          T   �   �         T   �   �       