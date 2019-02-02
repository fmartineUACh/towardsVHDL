define mult_h(a,b)  = ((a == 1 # b == 1 # 
						  (a == 2 & b == 2)) ? 0 : CEIL(LOG2(b)))+1;

