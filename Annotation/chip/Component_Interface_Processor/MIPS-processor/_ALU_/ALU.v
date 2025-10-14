module stimulus;    //test bench
	
// Declare variables to be connected
// to inputs and outputs
wire [15:0] dataOut;
wire zero, cOut, lt, gt, overflow, cIn;
reg [15:0] dataIn1, dataIn2;
reg aluActiveIn, aluOpB1, aluOpB2, aluOpB3;
reg CLK;

initial
	CLK = 1'b0;
initial
#1000 $finish;

//instantiate ALU
ALU myALU(dataOut, zero, cIn, lt, gt, overflow, cOut, aluActiveIn, aluOpB1, aluOpB2, aluOpB3, dataIn1, dataIn2);

// Stimulate the inputs
	// Define the stimulus module
	initial
	begin
		//2s Compliment ADD 
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=0; aluOpB3= 0;dataIn1=16'b0100010010010001; dataIn2=16'b0100010010110001;
		#1 $display("Test1 ADD: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		//2s Compliment ADD with equal
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=0; aluOpB3= 0;dataIn1=16'b0100010010010001; dataIn2=16'b0100010010010001;
		#1 $display("Test2 ADD: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		//2s Compliment ADD with overflow
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=0; aluOpB3= 0;dataIn1=16'b1100010010010001; dataIn2=16'b1110010010010001;
		#1 $display("Test3 ADD: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		//2s Compliment SUB
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=0; aluOpB3= 1;dataIn1=16'b0000010000010111; dataIn2=16'b0000010010110001;
		#1 $display("Test4 SUB: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		//2s Compliment SUB with overflow
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=0; aluOpB3= 1;dataIn1=16'b0100010000010111; dataIn2=16'b1000010010110001;
		#1 $display("Test5 SUB: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		//2s Compliment SUB with overflow
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=0; aluOpB3= 1;dataIn1=16'b1100010000010111; dataIn2=16'b1001010010110001;
		#1 $display("Test6 SUB: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		//AND
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=1; aluOpB3= 0;dataIn1=16'b0000010010010001; dataIn2=16'b0000010010110001;
		#1 $display("Test7 AND: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		//OR
		#1 aluActiveIn=1; aluOpB1=0; aluOpB2=1; aluOpB3= 1;dataIn1=16'b0000010010010001; dataIn2=16'b0000010010110001;
		#1 $display("Test8 OR: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		//SLT
		#1 aluActiveIn=1; aluOpB1=1; aluOpB2=0; aluOpB3= 0;dataIn1=16'b0000010010010001; dataIn2=16'b0000010010110001;
		#1 $display("Test9 SLT: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		//Unsigned ADD
		#1 aluActiveIn=1; aluOpB1=1; aluOpB2=0; aluOpB3= 1;dataIn1=16'b0000010010010001; dataIn2=16'b0000010010110001;
		#1 $display("Test10 Unsigned ADD: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
		
		//Unsigned ADD
		#1 aluActiveIn=1; aluOpB1=1; aluOpB2=0; aluOpB3= 1;dataIn1=16'b1110010010010001; dataIn2=16'b1110010010110001;
		#1 $display("Test11 Unsigned ADD: dataOut=%b, zero=%b, cOut=%b, lt=%b, gt=%b, overflow=%b, cIn=%b\n",dataOut,zero, cOut, lt, gt, overflow, cIn);
	end

endmodule




module ALU(dataOut, zero, lt, gt, cIn, overflow, cOut, aluActiveIn, aluOpB1, aluOpB2, aluOpB3, dataIn1, dataIn2);       //module ALU

//000 for ADD..
//001 for SUB..
//010 for AND..
//011 for OR..
//100 for SLT..
input[15:0] dataIn1, dataIn2;//two data inputs for ALU operation..
input aluActiveIn, aluOpB1, aluOpB2, aluOpB3;//ALU control bits.. 
output[15:0] dataOut;//main output of the ALU..
output zero, cOut, lt, gt, overflow, cIn;//zero=equals flag, cOut=carrOut flag, lt=largerThan flag, gt =greaterThan flag, cIn=carryIn flag.... 


//temporary registers for calculate the outputs.....
reg[15:0] dataOut, temp1;
reg[16:0] temp2;
reg[14:0] temp3, temp4;
reg zero=0,cOut, lt=0, gt=0, overflow, cIn;

always @(aluActiveIn,aluOpB1, aluOpB2, aluOpB3,dataIn1, dataIn2)
begin
	zero=0;cOut=0; lt=0; gt=0;overflow=0; cIn=0;//@ every ALU operation we have reset all flags...
	
	if (aluActiveIn == 1 && aluOpB1 == 0 && aluOpB2 == 0 && aluOpB3 == 0)//2s Compliment ADD
	begin
		dataOut=$signed(dataIn1) + $signed(dataIn2);//Main output...
		
		//calculating cIn,cOut and overflow....
		temp2=$signed(dataIn1) + $signed(dataIn2);
		temp3=dataIn1;
		temp4=dataIn2;
		temp1=(temp3)+(temp4);
		cIn=temp1[15];
		cOut=temp2[16];
		overflow=cIn^cOut;
		
		if(($signed(dataIn1) - $signed(dataIn2))<0)//checking whether dataIn1 less than dataIn2...
		begin
			lt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))>0)//checking whether dataIn1 greater than dataIn2...
		begin
			gt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))==0)//checking whether dataIn1 equals dataIn2...
		begin
			zero=1;
		end
		
	end
	
	if (aluActiveIn == 1 && aluOpB1 == 0 && aluOpB2 == 0 && aluOpB3 == 1)//2s Compliment SUB
	begin
	
		dataOut=$signed(dataIn1) - $signed(dataIn2);
		
		temp2=$signed(dataIn1) + $signed(dataIn2);
		temp3=dataIn1;
		temp4=dataIn2;
		temp1=temp3+temp4;
		cIn=temp1[15];
		cOut=temp2[16];
		overflow=cIn^cOut;
		
		if(($signed(dataIn1) - $signed(dataIn2))<0)
		begin
			lt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))>0)
		begin
			gt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))==0)
		begin
			zero=1;
		end
		
	end
	
	if (aluActiveIn == 1 && aluOpB1 == 0 && aluOpB2 == 1 && aluOpB3 == 0)//AND
	begin
	
		dataOut=dataIn1 & dataIn2;
		
		if(($signed(dataIn1) - $signed(dataIn2))<0)
		begin
			lt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))>0)
		begin
			gt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))==0)
		begin
			zero=1;
		end
		
	end
	
	if (aluActiveIn == 1 && aluOpB1 == 0 && aluOpB2 == 1 && aluOpB3 == 1)//OR
	begin
	
		dataOut=dataIn1 | dataIn2;
		
		if(($signed(dataIn1) - $signed(dataIn2))<0)
		begin
			lt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))>0)
		begin
			gt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))==0)
		begin
			zero=1;
		end
		
	end
	
	if (aluActiveIn == 1 && aluOpB1 == 1 && aluOpB2 == 0 && aluOpB3 == 0)//SLT
	begin
		
		if(($signed(dataIn1) - $signed(dataIn2))<0)
		begin
			lt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))>0)
		begin
			gt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))==0)
		begin
			zero=1;
		end

		dataOut=lt;//Main output...
		
	end
	
	if (aluActiveIn == 1 && aluOpB1 == 1 && aluOpB2 == 0 && aluOpB3 == 1)//Unsigned ADD
	begin
	
		dataOut=dataIn1 + dataIn2;
		
		temp2=$signed(dataIn1) + $signed(dataIn2);
		temp3=dataIn1;
		temp4=dataIn2;
		temp1=temp3+temp4;
		cIn=temp1[15];
		cOut=temp2[16];
		overflow=cIn^cOut;
		
		if(($signed(dataIn1) - $signed(dataIn2))<0)
		begin
			lt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))>0)
		begin
			gt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))==0)
		begin
			zero=1;
		end
		
	end
	

end

endmodule