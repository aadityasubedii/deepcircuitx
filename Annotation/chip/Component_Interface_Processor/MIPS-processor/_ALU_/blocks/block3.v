	initial
	begin
		
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=0; aluOpB3= 0;dataIn1=16'b0100010010010001; dataIn2=16'b0100010010110001;
		#1 $display("Test1 ADD: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=0; aluOpB3= 0;dataIn1=16'b0100010010010001; dataIn2=16'b0100010010010001;
		#1 $display("Test2 ADD: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=0; aluOpB3= 0;dataIn1=16'b1100010010010001; dataIn2=16'b1110010010010001;
		#1 $display("Test3 ADD: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=0; aluOpB3= 1;dataIn1=16'b0000010000010111; dataIn2=16'b0000010010110001;
		#1 $display("Test4 SUB: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=0; aluOpB3= 1;dataIn1=16'b0100010000010111; dataIn2=16'b1000010010110001;
		#1 $display("Test5 SUB: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=0; aluOpB3= 1;dataIn1=16'b1100010000010111; dataIn2=16'b1001010010110001;
		#1 $display("Test6 SUB: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=1; aluOpB3= 0;dataIn1=16'b0000010010010001; dataIn2=16'b0000010010110001;
		#1 $display("Test7 AND: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=1; aluOpB3= 1;dataIn1=16'b0000010010010001; dataIn2=16'b0000010010110001;
		#1 $display("Test8 OR: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		
		#1 aluActiveIn=1; aluOpB1=1; aluOpB2=0; aluOpB3= 0;dataIn1=16'b0000010010010001; dataIn2=16'b0000010010110001;
		#1 $display("Test9 SLT: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		
		#1 aluActiveIn=1; aluOpB1=1; aluOpB2=0; aluOpB3= 1;dataIn1=16'b0000010010010001; dataIn2=16'b0000010010110001;
		#1 $display("Test10 Unsigned ADD: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		
		#1 aluActiveIn=1; aluOpB1=1; aluOpB2=0; aluOpB3= 1;dataIn1=16'b1110010010010001; dataIn2=16'b1110010010110001;
		#1 $display("Test11 Unsigned ADD: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
	end