//8bit positive level shift register_milestone1_problem4


// Define the stimulus module
module stimulus;
	
	// Declare variables to be connected
	// to inputs
	reg [7:0] IN;
	wire [7:0] OUT;
	reg C0,C1,CLK,ENB,SLI,SRI;
	
	reg clock;


initial
	CLK = 1'b0;
always
	#5 CLK = ~CLK;
initial
	#1000 $finish;
	
	// Instantiate the shift register
	eight_bit_UniversalShiftRegister myshift(OUT,IN,C0,C1,CLK,ENB,SLI,SRI);

	// Stimulate the inputs
	// Define the stimulus module
	initial
	begin
		// set input lines
		#1 ENB=1; IN[7]=0; IN[6]=1; IN[5]=0; IN[4]=1; IN[3]=0; IN[2]=1; IN[1]=0; IN[0]=0; SLI=1; SRI=1;
		#1 $display("Enable=%b, IN[7]=%b, IN[6]=%b, IN[5]=%b, IN[4]=%b, IN[3]=%b, IN[2]=%b, IN[1]=%b, IN[0]=%b, SLI=%b, SRI=%b\n",ENB,IN[7],IN[6],IN[5],IN[4],IN[3],IN[2],IN[1],IN[0],SLI,SRI);
				
		// choose shift right
		#4 C1 =0; C0 =1;ENB=1; IN[7]=0; IN[6]=1; IN[5]=0; IN[4]=1; IN[3]=0; IN[2]=1; IN[1]=0; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[7]=%b, OUT[6]=%b, OUT[5]=%b, OUT[4]=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[7],OUT[6],OUT[5],OUT[4],OUT[3],OUT[2],OUT[1],OUT[0]);
		
		// choose shift left
		#1 C1 =1; C0 =0;ENB=1; IN[7]=0; IN[6]=1; IN[5]=0; IN[4]=1; IN[3]=0; IN[2]=1; IN[1]=0; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[7]=%b, OUT[6]=%b, OUT[5]=%b, OUT[4]=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[7],OUT[6],OUT[5],OUT[4],OUT[3],OUT[2],OUT[1],OUT[0]);
		
		// choose HOLD
		#7 C1 =0; C0 =0;ENB=1; IN[7]=0; IN[6]=1; IN[5]=0; IN[4]=1; IN[3]=0; IN[2]=1; IN[1]=0; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[7]=%b, OUT[6]=%b, OUT[5]=%b, OUT[4]=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[7],OUT[6],OUT[5],OUT[4],OUT[3],OUT[2],OUT[1],OUT[0]);
		
		// choose load
		#1 C1 =1; C0 =1;ENB=1; IN[7]=0; IN[6]=1; IN[5]=0; IN[4]=1; IN[3]=0; IN[2]=1; IN[1]=0; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[7]=%b, OUT[6]=%b, OUT[5]=%b, OUT[4]=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[7],OUT[6],OUT[5],OUT[4],OUT[3],OUT[2],OUT[1],OUT[0]);
		
		//system not work because enable is zero
		#7 ENB=0; IN[7]=0; IN[6]=1; IN[5]=0; IN[4]=1; IN[3]=0; IN[2]=1; IN[1]=0; IN[0]=0; SLI=1; SRI=1;
		#1 $display("Enable=%b, S1=%b, S0=%b, OUT[7]=%b, OUT[6]=%b, OUT[5]=%b, OUT[4]=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n",ENB, C1, C0,OUT[7],OUT[6],OUT[5],OUT[4],OUT[3],OUT[2],OUT[1],OUT[0]);
		
	end

endmodule



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




module four_bit_UniversalShiftRegister(out,in,c0,c1,clk,enb,sli,sri);        //module four_bit_UniversalShiftRegister

input [3:0] in;    //declare inputs and outputs
input clk,enb,sli,sri,c0,c1;
output [3:0] out;

	reg tempo1;   //declare register files
	reg tempo2;
	reg tempo3;
	reg tempo4;
	
always @(clk)     //whole the processes happen in positive edge clock
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