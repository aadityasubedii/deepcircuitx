	initial
	begin
		
		#1 ENB=1; IN[7]=0; IN[6]=1; IN[5]=0; IN[4]=1; IN[3]=0; IN[2]=1; IN[1]=0; IN[0]=0; SLI=1; SRI=1;
		#1 $display("Enable=%b, IN[7]=%b, IN[6]=%b, IN[5]=%b, IN[4]=%b, IN[3]=%b, IN[2]=%b, IN[1]=%b, IN[0]=%b, SLI=%b, SRI=%b\n",ENB,IN[7],IN[6],IN[5],IN[4],IN[3],IN[2],IN[1],IN[0],SLI,SRI);
				
		
		#4 C1 =0; C0 =1;ENB=1; IN[7]=0; IN[6]=1; IN[5]=0; IN[4]=1; IN[3]=0; IN[2]=1; IN[1]=0; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[7]=%b, OUT[6]=%b, OUT[5]=%b, OUT[4]=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[7],OUT[6],OUT[5],OUT[4],OUT[3],OUT[2],OUT[1],OUT[0]);
		
		
		#1 C1 =1; C0 =0;ENB=1; IN[7]=0; IN[6]=1; IN[5]=0; IN[4]=1; IN[3]=0; IN[2]=1; IN[1]=0; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[7]=%b, OUT[6]=%b, OUT[5]=%b, OUT[4]=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[7],OUT[6],OUT[5],OUT[4],OUT[3],OUT[2],OUT[1],OUT[0]);
		
		
		#7 C1 =0; C0 =0;ENB=1; IN[7]=0; IN[6]=1; IN[5]=0; IN[4]=1; IN[3]=0; IN[2]=1; IN[1]=0; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[7]=%b, OUT[6]=%b, OUT[5]=%b, OUT[4]=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[7],OUT[6],OUT[5],OUT[4],OUT[3],OUT[2],OUT[1],OUT[0]);
		
		
		#1 C1 =1; C0 =1;ENB=1; IN[7]=0; IN[6]=1; IN[5]=0; IN[4]=1; IN[3]=0; IN[2]=1; IN[1]=0; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[7]=%b, OUT[6]=%b, OUT[5]=%b, OUT[4]=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[7],OUT[6],OUT[5],OUT[4],OUT[3],OUT[2],OUT[1],OUT[0]);
		
		
		#7 ENB=0; IN[7]=0; IN[6]=1; IN[5]=0; IN[4]=1; IN[3]=0; IN[2]=1; IN[1]=0; IN[0]=0; SLI=1; SRI=1;
		#1 $display("Enable=%b, S1=%b, S0=%b, OUT[7]=%b, OUT[6]=%b, OUT[5]=%b, OUT[4]=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n",ENB, C1, C0,OUT[7],OUT[6],OUT[5],OUT[4],OUT[3],OUT[2],OUT[1],OUT[0]);
		
	end