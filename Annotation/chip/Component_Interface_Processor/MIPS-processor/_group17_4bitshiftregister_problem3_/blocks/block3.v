	initial
	begin
		
		#1 ENB=1; IN[3]=1; IN[2]=0; IN[1]=1; IN[0]=0; SLI=1; SRI=1;
		#1 $display("Enable=%b, IN[3]=%b, IN[2]=%b, IN[1]=%b, IN[0]=%b, SLI=%b, SRI=%b\n",ENB,IN[3],IN[2],IN[1],IN[0],SLI,SRI);
		
		
		#3 C1 =0; C0 =1;ENB=1; IN[3]=1; IN[2]=0; IN[1]=1; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[3],OUT[2],OUT[1],OUT[0]);
		
		
		#9 C1 =1; C0 =0;ENB=1; IN[3]=1; IN[2]=0; IN[1]=1; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[3],OUT[2],OUT[1],OUT[0]);
		
		
		#9 C1 =0; C0 =0;ENB=1; IN[3]=1; IN[2]=0; IN[1]=1; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[3],OUT[2],OUT[1],OUT[0]);
		
		
		#9 C1 =1; C0 =1;ENB=1; IN[3]=1; IN[2]=0; IN[1]=1; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[3],OUT[2],OUT[1],OUT[0]);
		
		
		#9 ENB=0; IN[3]=1; IN[2]=0; IN[1]=1; IN[0]=0; SLI=1; SRI=1;C1 =0; C0 =1;
		#1 $display("Enable=%b, S1=%b, S0=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n",ENB, C1, C0,OUT[3],OUT[2],OUT[1],OUT[0]);
		
	end