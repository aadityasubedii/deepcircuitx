module Datapath();

wire [15:0] prOut,insOut;
wire clock;

programmecounter pc(prOut,output4PCOut,CLK);
Instruction_Memory im(insOut, prOut, CLK);

wire b4RFOut,b4ALUOut,branchSelectOut,output4PCOut,afterDMOut; 

mux2_to_1_4bit b4RF(b4RFOut, rt, rd, forRegMux);
mux2_to_1_16bit b4ALU(b4ALUOut, regOut2, sEOut, aluSrc4Mux);
mux2_to_1_16bit branchSelect(branchSelectOut, prPreOut2, prPreOut, andResult);
mux2_to_1_16bit output4PC(output4PCOut, branchSelectOut, toJumpShifted, jump);
mux2_to_1_16bit afterDM(afterDMOut, dmOut, aluOut, memoryToRegfileMux);

wire [3:0] aluOpCode, rs, rt, rd;
wire [7:0] toExtend;
wire [11:0] toJump; 

aluOpCode[3]=insOut[15];
aluOpCode[2]=insOut[14];
aluOpCode[1]=insOut[13];
aluOpCode[0]=insOut[12];

//assigning rs...
rs[3]=insOut[11];
rs[2]=insOut[10];
rs[1]=insOut[9];
rs[0]=insOut[8];
//assigning rt...
rt[3]=insOut[7];
rt[2]=insOut[6];
rt[2]=insOut[5];
rt[1]=insOut[4];
//assigning rd...
rd[3]=insOut[3];
rd[2]=insOut[2];
rd[1]=insOut[1];
rd[0]=insOut[0];

//finding what to extend
toExtend[7]=insOut[7];
toExtend[6]=insOut[6];
toExtend[5]=insOut[5];
toExtend[4]=insOut[4];
toExtend[3]=insOut[3];
toExtend[2]=insOut[2];
toExtend[1]=insOut[1];
toExtend[0]=insOut[0];

//finding jump address
toJump[11]=insOut[11];
toJump[10]=insOut[10];
toJump[9]=insOut[9];
toJump[8]=insOut[8];
toJump[7]=insOut[7];
toJump[6]=insOut[6];
toJump[5]=insOut[5];
toJump[4]=insOut[4];
toJump[3]=insOut[3];
toJump[2]=insOut[2];
toJump[1]=insOut[1];
toJump[0]=insOut[0];



//out0 is the control input for Register Destination.
//out1 is the control input for Register Jump.
//out2 is the control input for Register Branch.
//out3 is the control input for Register Memory Read.
//out4 is the control input for Register Memory write to Register.
//out5Active is activation input for ALU.
//out5A is a control input for Register ALUOp.
//out5B is a control input for Register ALUOp.
//out5C is a control input for Register ALUOp.
//out6 is the control input for Register Memory Write.
//out7 is the control input for Register ALU source.
//out8 is the control input for Register Register Write.


//declaring output wires for controller...
wire forRegMux, jump, branchForAnd, memR, memoryToRegfileMux, aluActiveIn, aluOpB1, aluOpB2, aluOpB3, memW, aluSrc4Mux, regWAc;
KURM_controller mycontroller(forRegMux, jump, branchForAnd, memR, memoryToRegfileMux, aluActiveIn, aluOpB1, aluOpB2, aluOpB3, memW, aluSrc4Mux, regWAc, aluOpCode[3], aluOpCode[2], aluOpCode[1], aluOpCode[0], CLK);

wire [15:0] regOut1, regOut2;
wire clear=1'b1;
//registerFile....
register_file rf(regOut1,regOut2,afterDMOut,rs,rt,b4RFOut,regWAc,clear,clock);

//sign extender...
wire sEOut;
Sign_Extend sE(sEOut,toExtend);

//main alu of the processor..
wire aluOut, zero, cIn, lt, gt, overflow, cOut;
ALU mainALU(aluOut, zero, cIn, lt, gt, overflow, cOut, aluActiveIn, aluOpB1, aluOpB2, aluOpB3, regOut1, b4ALUOut);

//Data memory...
wire dmOut,
Data_Memory dm(dmOut, regOut2, aluOut, memW, memR, clock);

//updating the program counter.. finding jump adress.. and inputs for branchSelect and output4PC
integer add=4;
wire prPreOut,prPreOut2;
adder forAddingPc(prPreOut,prOut,4);
adder a2(prPreOut2,prPreOut,sEOut<<2);
wire andResult;
andResult=branchForAnd & prPreOut2;
wire toJumpShifted;
toJumpShifted= toJump<<2;


endmodule
//****************************************************************************************************************************************************

//----------------------------------------------------------------------module  for ALU....-----------------------------------------------------------
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

//***************************************************************end of module ALU***************************************************************************

//----------------------------------------------------------------------module  for DataMemory....----------------------------------------------------------
module Data_Memory(dataOut,dataIn,dataInAdd,regWrite,regRead,clock);  //module data_Memory

input[15:0] dataInAdd;    //declare inputs and outputs
input[15:0] dataIn;
input regWrite, regRead, clock;
output[15:0] dataOut;

reg [15:0] registers [1023:0];   //declare register files

reg [15:0] Out;

	
always @(posedge clock)     //whole the processes happen in positive edge clock
begin

	if(regRead==1'b1)     //if regRead is enable reg Out takes the value in address in dataInAdd
	begin
	Out=registers[dataInAdd];
	end
	
	if(regWrite==1'b1)    //if regWrite is enable register address takes dataIn value
	begin
	registers[dataInAdd]=dataIn;
	end	
end
	
	assign dataOut=Out;   //assigning output dataOut to out register
endmodule

//***************************************************************end of module DataMemory*******************************************************************

//----------------------------------------------------------------------module  for 4bitShifter....---------------------------------------------------------
module four_bit_UniversalShiftRegister(out,in,c0,c1,clk,enb,sli,sri);        //module four_bit_UniversalShiftRegister

input [3:0] in;    //declare inputs and outputs
input clk,enb,sli,sri,c0,c1;
output [3:0] out;

	reg tempo1;   //declare register files
	reg tempo2;
	reg tempo3;
	reg tempo4;
	
always @(posedge clk)     //whole the processes happen in positive edge clock
	begin
		if(enb==1'b1)
			begin
				if(c1==1'b0 && c0==1'b0)//hold
				begin
					
				end
				
				else if(c1==1'b0 && c0==1'b1)//shift right
				begin
					tempo1=sri;
					tempo2=in[3];
					tempo3=in[2];
					tempo4=in[1];
				end
				
				else if(c1==1'b1 && c0==1'b0) //shift left
				begin
					tempo1=in[2];
					tempo2=in[1];
					tempo3=in[0];
					tempo4=sli;
				end
				
				else //load
				begin
					tempo1=in[3];
					tempo2=in[2];
					tempo3=in[1];
					tempo4=in[0];
				end
				
			end
	
	end
	
	assign out[3]=tempo1;		//assigning output to tempo registers
	assign out[2]=tempo2;
	assign out[1]=tempo3;
	assign out[0]=tempo4;
	
endmodule

//***************************************************************end of module 4bitShifter*******************************************************************

//----------------------------------------------------------------------module  for 8bitShifter....---------------------------------------------------------
module eight_bit_UniversalShiftRegister(out,in,c0,c1,clk,enb,sli,sri);        //module eight_bit_UniversalShiftRegister

input [7:0] in;    //declare inputs and outputs
input clk,enb,sli,sri,c0,c1;
output [7:0] out;

wire [3:0] in1,in2,out1,out2;


assign in1[0]=in[0];   //deviding inputs to two arrays
assign in1[1]=in[1];
assign in1[2]=in[2];
assign in1[3]=in[3];


assign in2[0]=in[4];
assign in2[1]=in[5];
assign in2[2]=in[6];
assign in2[3]=in[7];


four_bit_UniversalShiftRegister shift1(out1,in1,c0,c1,clk,enb,sli,in[4]);    //first 4bit shift register(0-3)
four_bit_UniversalShiftRegister shift2(out2,in2,c0,c1,clk,enb,in[3],sri);    //second 4bit shift register(4-7)

assign out[0]=out1[0];  //assigning outputs to two output array
assign out[1]=out1[1];
assign out[2]=out1[2];
assign out[3]=out1[3];

assign out[4]=out2[0];
assign out[5]=out2[1];
assign out[6]=out2[2];
assign out[7]=out2[3];

endmodule

//***************************************************************end of module 8bitShifter*******************************************************************

//----------------------------------------------------------------------module  for rgisterFile....----------------------------------------------------------
module register_file (Aout,Bout,Cin,Aadd,Badd,Cadd,load,clear,clock);        //module data_Memory

input[3:0] Aadd,Badd,Cadd;    //declare inputs and outputs
input[15:0] Cin;
input load,clear,clock;
output[15:0] Aout,Bout;

reg [15:0] registers [15:0];

	integer i;    //write bits default

	initial
	begin
		//write to each register
		for(i=0;i<16;i=i+1)
		begin
			registers [i] = i[15:0];
		end
	end


reg[15:0] tempA,tempB;

integer count;

always @(posedge clock,clear)     //whole the processes happen in positive edge clock
begin

	if(clear==1'b0)    //if clear bit is zero all register values get 0
	begin

		for(count=0;count<16;count=count+1)
		begin
			registers[count] = 0;
		end

	end
	
	tempA=registers[Aadd];
	tempB=registers[Badd];
	
	if(load==1'b1)   //if load bit is one Cin value write to address Cadd
	begin
	registers[Cadd]=Cin;
	end	
end
	assign Aout=tempA;
	assign Bout=tempB;
endmodule

//***************************************************************end of module rgisterFile*******************************************************************

//----------------------------------------------------------------------module  for KURMController....------------------------------------------------------
module KURM_controller(Out0, Out1, Out2, Out3, Out4, Out5A, Out5B, Out5C, Out5Active, Out6, Out7, Out8, s0, s1, s2, s3, clock);   //module KURM_controller

input s0, s1, s2, s3;
input clock;
output Out0,  Out1,  Out2,  Out3, Out4,  Out5A, Out5B, Out5C, Out5Active, Out6, Out7, Out8;

//out0 is the control input for Register Destination.
//out1 is the control input for Register Jump.
//out2 is the control input for Register Branch.
//out3 is the control input for Register Memory Read.
//out4 is the control input for Register Memory write to Register.
//out5Active is activation input for ALU.
//out5A is a control input for Register ALUOp.
//out5B is a control input for Register ALUOp.
//out5C is a control input for Register ALUOp.
//out6 is the control input for Register Memory Write.
//out7 is the control input for Register ALU source.
//out8 is the control input for Register Register Write.

//below registers are temporary registers for saving the output.. 
reg  out0,  out1,  out2,  out3, out4, out5A, out5B, out5C, out5Active, out6,  out7, out8;


always @(posedge clock)
begin

	case ({s0,s1,s2,s3})
	
			//0000 is the opcode for ADD 2s Compliment.
			4 'b0000 :  begin  out0 = 1;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = s1; out5B = s2; out5C = s3; out6 = 0;  out7 = 0; out8 = 1; end 
			//0001 is the opcode for SUB 2s Compliment.
			4 'b0001 :  begin  out0 = 1;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = s1; out5B = s2; out5C = s3; out6 = 0;  out7 = 0; out8 = 1; end
			//0010 is the opcode for AND.
			4 'b0010 :  begin  out0 = 1;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = s1; out5B = s2; out5C = s3; out6 = 0;  out7 = 0; out8 = 1; end
			//0011 is the opcode for OR.
			4 'b0011 :  begin  out0 = 1;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = s1; out5B = s2; out5C = s3; out6 = 0;  out7 = 0; out8 = 1; end
			//0100 is the opcode for SLT.
			4 'b0100 :  begin  out0 = 1;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = s1; out5B = s2; out5C = s3; out6 = 0;  out7 = 0; out8 = 1; end
			//In above 5 last input three bits are used for finding which operation has to be done in ALU... So those bits are taken as the inputs of the ALU..
			//000 for ADD 2s Compliment..
			//001 for SUB 2s Compliment..
			//010 for AND..
			//011 for OR..
			//100 for SLT..
			//Inputs for ALU are out5A, out5B and out5C..
			//And out5Active using for activating the ALU...
			
			//0101 is the opcode for LW.
			4 'b0101 :  begin  out0 = 0;  out1 = 0;  out2 = 0;  out3 = 1; out4 = 1; out5Active = 1; out5A = 1; out5B = 0; out5C = 1;  out6 = 0;  out7 = 1; out8 = 1; end
			//0110 is the opcode for SW.
			4 'b0110 :  begin  out0 = 0;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = 1; out5B = 0; out5C = 1;  out6 = 1;  out7 = 1; out8 = 0; end
			//0111 is the opcode for BNE.
			4 'b0111 :  begin  out0 = 1;  out1 = 0;  out2 = 1;  out3 = 0; out4 = 0; out5Active = 1; out5A = 0; out5B = 0; out5C = 1;  out6 = 0;  out7 = 0; out8 = 0; end
			//1000 is the opcode for JMP.
			4 'b1000 :  begin  out0 = 0;  out1 = 1;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 0; out5A = 0; out5B = 0; out5C = 0;  out6 = 0;  out7 = 0; out8 = 0; end
			//1001 is the opcode for ADD unsigned..
			4 'b1001 :  begin  out0 = 1;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = 1; out5B = 0; out5C = 1; out6 = 0;  out7 = 0; out8 = 1; end 
			
		endcase
end

	assign Out0= out0;		//assigning output values from out registers
	assign Out1= out1;
	assign Out2= out2;
	assign Out3= out3;
	assign Out4= out4;
	assign Out5Active= out5Active;
	assign Out5A= out5A;
	assign Out5B= out5B;
	assign Out5C= out5C;
	assign Out6= out6;
	assign Out7= out7;
	assign Out8= out8;
	
endmodule
//***************************************************************end of module KURMController*****************************************************************

//----------------------------------------------------------------------module  for instuctionMemory....------------------------------------------------------
module Instruction_Memory(instruction, instructionAdd, clock);    //module instruction_Memory

input[15:0] instructionAdd;
input clock;
output[15:0] instruction;    //output instruction

reg [15:0] registers [255:0];  //memory

reg[15:0] tempA;


	integer i;    //write bits default

	initial
	begin
		//write to each register
		for(i=0;i<256;i=i+1)
		begin
		   registers [i] = i;
		end
	end
	
	
always @(posedge clock)    
begin
	
	tempA=registers[instructionAdd];
	
end
	assign instruction=tempA;
	
endmodule

//***************************************************************end of module instuctionMemory*********************************************************

//----------------------------------------------------------------------module  for mux2_to_1....-------------------------------------------------------
module mux2_to_1 (out, i0, i1, s0);
	
	// Port declarations from the I/O diagram
	output out;
	input i0, i1;
	input s0;

	reg tempout;
	
	always @(s0,i0,i1)
	begin	
	
	if (s0==1'b0)
		tempout = i0;
	else
		tempout = i1;	
	end	
	
	assign out=tempout;
	
endmodule
//***************************************************************end of module mux2_to_1******************************************************************

//----------------------------------------------------------------------module  for programmecounter....--------------------------------------------------
module programmecounter(outaddr,inaddr,clock);     //module programme counter

input [15:0] inaddr;
output [15:0] outaddr;
input clock;

reg [15:0] temp=16'b0000000000000000;   //instantiate the first address

always @(posedge clock)
begin
	temp=$signed(temp)+$signed(inaddr);   //take the signed address values
end

assign outaddr=temp;

endmodule
//***************************************************************end of module programmecounter*************************************************************

//----------------------------------------------------------------------module  for Sign_Extend....--------------------------------------------------------
module Sign_Extend(dataOut,dataIn);         //model sign_extend

input[7:0] dataIn;
output[15:0] dataOut;

reg[15:0] tempA;

integer count;

always @(dataIn)
begin

	if(dataIn[7]==1'b1)   //if 8th bit equal 1 rest fill with 1
	begin
	
		for(count=0;count<16;count=count+1)
		begin
			if(count<8)
			begin
				tempA[count] = dataIn[count];
			end
			
			else
			tempA[count] = 1;
		end
	
	
	end
	
	else if(dataIn[7]==1'b0)     //if 8th bit equal 0 rest fill with 0
	begin
	
	for(count=0;count<16;count=count+1)
		begin
			if(count<8)
			begin
			tempA[count] = dataIn[count];
			end
			
			else
			tempA[count] = 0;
		end
		
	end	
end

assign dataOut=tempA;    //assign the output data from register tempA
	
endmodule

module mux2_to_1_4bit (out, i0, i1, s0);
	
	// Port declarations from the I/O diagram
	output [3:0] out;
	input [3:0] i0, i1;
	input s0;

	reg [3:0] tempout;
	
	always @(s0,i0,i1)
	begin	
	
	if (s0==1'b0)
		tempout = i0;
	else
		tempout = i1;	
	end	
	
	assign out=tempout;
	
endmodule


module mux2_to_1_16bit (out, i0, i1, s0);
	
	// Port declarations from the I/O diagram
	output [15:0] out;
	input [15:0] i0, i1;
	input s0;

	reg [15:0] tempout;
	
	always @(s0,i0,i1)
	begin	
	
	if (s0==1'b0)
		tempout = i0;
	else
		tempout = i1;	
	end	
	
	assign out=tempout;
	
endmodule

module adder(out,In1,In2);

output [15:0] out;
input [15:0] In1,In2;

reg [15:0] temp;
always @(In1,In2)
begin
	temp=$signed(In1)+$signed(In2);
end

assign out=temp;

endmodule

//***************************************************************end of module sign_Extend*************************************************************
//*****************************************************************************************************************************************************
//*****************************************************************************************************************************************************