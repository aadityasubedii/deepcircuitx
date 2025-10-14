//4bit positive level shift register_milestone1_problem3


// Define the stimulus module
module stimulus;
	
	// Declare variables to be connected
	// to inputs
	wire [3:0] OUT;
	reg [3:0] IN;
	reg C0,C1,CLK,ENB,SLI,SRI;
	
	reg clock;


initial
	CLK = 1'b0;
always
	#5 CLK = ~CLK;
initial
#1000 $finish;

	
	// Instantiate the shift register
	four_bit_UniversalShiftRegister myshift(OUT,IN,C0,C1,CLK,ENB,SLI,SRI);

	// Stimulate the inputs
	// Define the stimulus module
	initial
	begin
		// set input lines
		#1 ENB=1; IN[3]=1; IN[2]=0; IN[1]=1; IN[0]=0; SLI=1; SRI=1;
		#1 $display("Enable=%b, IN[3]=%b, IN[2]=%b, IN[1]=%b, IN[0]=%b, SLI=%b, SRI=%b\n",ENB,IN[3],IN[2],IN[1],IN[0],SLI,SRI);
		
		// choose shift right
		#3 C1 =0; C0 =1;ENB=1; IN[3]=1; IN[2]=0; IN[1]=1; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[3],OUT[2],OUT[1],OUT[0]);
		
		// choose shift left
		#9 C1 =1; C0 =0;ENB=1; IN[3]=1; IN[2]=0; IN[1]=1; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[3],OUT[2],OUT[1],OUT[0]);
		
		// choose HOLD
		#9 C1 =0; C0 =0;ENB=1; IN[3]=1; IN[2]=0; IN[1]=1; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[3],OUT[2],OUT[1],OUT[0]);
		
		// choose load
		#9 C1 =1; C0 =1;ENB=1; IN[3]=1; IN[2]=0; IN[1]=1; IN[0]=0; SLI=1; SRI=1;
		#1 $display("S1=%b, S0=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n", C1, C0,OUT[3],OUT[2],OUT[1],OUT[0]);
		
		//system not work because enable is zero
		#9 ENB=0; IN[3]=1; IN[2]=0; IN[1]=1; IN[0]=0; SLI=1; SRI=1;C1 =0; C0 =1;
		#1 $display("Enable=%b, S1=%b, S0=%b, OUT[3]=%b, OUT[2]=%b, OUT[1]=%b, OUT[0]=%b\n",ENB, C1, C0,OUT[3],OUT[2],OUT[1],OUT[0]);
		
	end
	

endmodule




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
	
	
	

	