module stimulus;    //test bench
	
	// Declare variables to be connected
	// to inputs and outputs
	wire Out0, Out1, Out2, Out3, Out4, Out5A, Out5B, Out5C, Out5Active, Out6, Out7, Out8;
	reg s0, s1, s2, s3, CLK;
	
	
initial
	CLK = 1'b0;
always
	#5 CLK = ~CLK;
initial
#1000 $finish;

	
	// Instantiate the KURM_controller
	KURM_controller mycontroller(Out0, Out1, Out2, Out3, Out4, Out5A, Out5B, Out5C, Out5Active, Out6, Out7, Out8, s0, s1, s2, s3, CLK);

	// Stimulate the inputs
	// Define the stimulus module
	initial
	begin
		// test ADD  2s Compliment.
		#5 s0=0; s1=0; s2=0; s3=0;
		#1 $display("Test ADD S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		// test SUB  2s Compliment.
		#9 s0=0; s1=0; s2=0; s3=1;
		#1 $display("Test SUB S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		// test AND
		#9 s0=0; s1=0; s2=1; s3=0;
		#1 $display("Test AND S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		//test OR
		#9 s0=0; s1=0; s2=1; s3=1;
		#1 $display("Test OR S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		//test SLT
		#9 s0=0; s1=1; s2=0; s3=0;
		#1 $display("Test SLT S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		//test LW
		#9 s0=0; s1=1; s2=0; s3=1;
		#1 $display("Test LW S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		//test SW
		#9 s0=0; s1=1; s2=1; s3=0;
		#1 $display("Test SW S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		//test BNE
		#9 s0=0; s1=1; s2=1; s3=1;
		#1 $display("Test BNE S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		//test JMP
		#9 s0=1; s1=0; s2=0; s3=0;
		#1 $display("Test JMP S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
	
		//test ADD unsigned
		#9 s0=1; s1=0; s2=0; s3=1;
		#1 $display("Test JMP S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
	end
	

endmodule


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