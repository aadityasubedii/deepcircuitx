	initial
	begin
		
		#5 load=0; clear=1;Aadd[3]=0; Aadd[2]=1; Aadd[1]=1; Aadd[0]=0;Badd[3]=1; Badd[2]=0; Badd[1]=1; Badd[0]=0;
		#1 $display("load=%b, clear=%b, Aaddr[3]=%b, Aaddr[2]=%b, Aaddr[1]=%b, Aaddr[0]=%b, Baddr[3]=%b, Baddr[2]=%b, Baddr[1]=%b, Baddr[0]=%b\n",load,clear,Aadd[3],Aadd[2],Aadd[1],Aadd[0],Badd[3],Badd[2],Badd[1],Badd[0]);
		#1 $display("Aout[15]=%b, Aout[14]=%b, Aout[13]=%b, Aout[12]=%b, Aout[11]=%b, Aout[10]=%b, Aout[9]=%b, Aout[8]=%b, Aout[7]=%b, Aout[6]=%b, Aout[5]=%b, Aout[4]=%b, Aout[3]=%b, Aout[2]=%b, Aout[1]=%b, Aout[0]=%b\n",Aout[15],Aout[14],Aout[13],Aout[12],Aout[11],Aout[10],Aout[9],Aout[8],Aout[7],Aout[6],Aout[5],Aout[4],Aout[3],Aout[2],Aout[1],Aout[0]);
		#1 $display("Bout[15]=%b, Bout[14]=%b, Bout[13]=%b, Bout[12]=%b, Bout[11]=%b, Bout[10]=%b, Bout[9]=%b, Bout[8]=%b, Bout[7]=%b, Bout[6]=%b, Bout[5]=%b, Bout[4]=%b, Bout[3]=%b, Bout[2]=%b, Bout[1]=%b, Bout[0]=%b\n\n",Bout[15],Bout[14],Bout[13],Bout[12],Bout[11],Bout[10],Bout[9],Bout[8],Bout[7],Bout[6],Bout[5],Bout[4],Bout[3],Bout[2],Bout[1],Bout[0]);
		
		
		#7  load=0; clear=1;Aadd[3]=1; Aadd[2]=1; Aadd[1]=1; Aadd[0]=0;Badd[3]=1; Badd[2]=0; Badd[1]=0; Badd[0]=1;
		#1 $display("load=%b, clear=%b, Aaddr[3]=%b, Aaddr[2]=%b, Aaddr[1]=%b, Aaddr[0]=%b, Baddr[3]=%b, Baddr[2]=%b, Baddr[1]=%b, Baddr[0]=%b\n",load,clear,Aadd[3],Aadd[2],Aadd[1],Aadd[0],Badd[3],Badd[2],Badd[1],Badd[0]);
		#1 $display("Aout[15]=%b, Aout[14]=%b, Aout[13]=%b, Aout[12]=%b, Aout[11]=%b, Aout[10]=%b, Aout[9]=%b, Aout[8]=%b, Aout[7]=%b, Aout[6]=%b, Aout[5]=%b, Aout[4]=%b, Aout[3]=%b, Aout[2]=%b, Aout[1]=%b, Aout[0]=%b\n",Aout[15],Aout[14],Aout[13],Aout[12],Aout[11],Aout[10],Aout[9],Aout[8],Aout[7],Aout[6],Aout[5],Aout[4],Aout[3],Aout[2],Aout[1],Aout[0]);
		#1 $display("Bout[15]=%b, Bout[14]=%b, Bout[13]=%b, Bout[12]=%b, Bout[11]=%b, Bout[10]=%b, Bout[9]=%b, Bout[8]=%b, Bout[7]=%b, Bout[6]=%b, Bout[5]=%b, Bout[4]=%b, Bout[3]=%b, Bout[2]=%b, Bout[1]=%b, Bout[0]=%b\n\n",Bout[15],Bout[14],Bout[13],Bout[12],Bout[11],Bout[10],Bout[9],Bout[8],Bout[7],Bout[6],Bout[5],Bout[4],Bout[3],Bout[2],Bout[1],Bout[0]);
	
		
		#7  load=1; clear=1;Cadd[3]=1; Cadd[2]=0; Cadd[1]=1; Cadd[0]=1;Cin[15]=0;Cin[14]=1;Cin[13]=1;Cin[12]=1;Cin[11]=0;Cin[10]=1;Cin[9]=0;Cin[8]=1;Cin[7]=1;Cin[6]=0;Cin[5]=1;Cin[4]=0;Cin[3]=0;Cin[2]=1;Cin[1]=0;Cin[0]=0;
		#1 $display("Write 1: load=%b, clear=%b, Caddr[3]=%b, Caddr[2]=%b, Caddr[1]=%b, Caddr[0]=%b, Cin[15]=%b, Cin[14]=%b, Cin[13]=%b, Cin[12]=%b, Cin[11]=%b, Cin[10]=%b, Cin[9]=%b, Cin[8]=%b, Cin[7]=%b, Cin[6]=%b, Cin[5]=%b, Cin[4]=%b, Cin[3]=%b, Cin[2]=%b, Cin[1]=%b, Cin[0]=%b,\n",load,clear,Cadd[3],Cadd[2],Cadd[1],Cadd[0],Cin[15],Cin[14],Cin[13],Cin[12],Cin[11],Cin[10],Cin[9],Cin[8],Cin[7],Cin[6],Cin[5],Cin[4],Cin[3],Cin[2],Cin[1],Cin[0]);
		#9	load=1; clear=1;Cadd[3]=1; Cadd[2]=1; Cadd[1]=0; Cadd[0]=1;Cin[15]=0;Cin[14]=1;Cin[13]=1;Cin[12]=1;Cin[11]=0;Cin[10]=1;Cin[9]=0;Cin[8]=1;Cin[7]=1;Cin[6]=0;Cin[5]=1;Cin[4]=0;Cin[3]=0;Cin[2]=1;Cin[1]=0;Cin[0]=0;
		#1 $display("Write 1: load=%b, clear=%b, Caddr[3]=%b, Caddr[2]=%b, Caddr[1]=%b, Caddr[0]=%b, Cin[15]=%b, Cin[14]=%b, Cin[13]=%b, Cin[12]=%b, Cin[11]=%b, Cin[10]=%b, Cin[9]=%b, Cin[8]=%b, Cin[7]=%b, Cin[6]=%b, Cin[5]=%b, Cin[4]=%b, Cin[3]=%b, Cin[2]=%b, Cin[1]=%b, Cin[0]=%b,\n",load,clear,Cadd[3],Cadd[2],Cadd[1],Cadd[0],Cin[15],Cin[14],Cin[13],Cin[12],Cin[11],Cin[10],Cin[9],Cin[8],Cin[7],Cin[6],Cin[5],Cin[4],Cin[3],Cin[2],Cin[1],Cin[0]);
		#9 load=0; clear=1;Aadd[3]=1; Aadd[2]=0; Aadd[1]=1; Aadd[0]=1;Badd[3]=1; Badd[2]=1; Badd[1]=0; Badd[0]=1;
		#1 $display("Check write 1&2: load=%b, clear=%b, Aaddr[3]=%b, Aaddr[2]=%b, Aaddr[1]=%b, Aaddr[0]=%b, Baddr[3]=%b, Baddr[2]=%b, Baddr[1]=%b, Baddr[0]=%b\n",load,clear,Aadd[3],Aadd[2],Aadd[1],Aadd[0],Badd[3],Badd[2],Badd[1],Badd[0]);
		#1 $display("Check write 1: Aout[15]=%b, Aout[14]=%b, Aout[13]=%b, Aout[12]=%b, Aout[11]=%b, Aout[10]=%b, Aout[9]=%b, Aout[8]=%b, Aout[7]=%b, Aout[6]=%b, Aout[5]=%b, Aout[4]=%b, Aout[3]=%b, Aout[2]=%b, Aout[1]=%b, Aout[0]=%b\n",Aout[15],Aout[14],Aout[13],Aout[12],Aout[11],Aout[10],Aout[9],Aout[8],Aout[7],Aout[6],Aout[5],Aout[4],Aout[3],Aout[2],Aout[1],Aout[0]);
		#1 $display("Check write 2: Bout[15]=%b, Bout[14]=%b, Bout[13]=%b, Bout[12]=%b, Bout[11]=%b, Bout[10]=%b, Bout[9]=%b, Bout[8]=%b, Bout[7]=%b, Bout[6]=%b, Bout[5]=%b, Bout[4]=%b, Bout[3]=%b, Bout[2]=%b, Bout[1]=%b, Bout[0]=%b\n\n",Bout[15],Bout[14],Bout[13],Bout[12],Bout[11],Bout[10],Bout[9],Bout[8],Bout[7],Bout[6],Bout[5],Bout[4],Bout[3],Bout[2],Bout[1],Bout[0]);
	
		
		#7	clear=0;
	end