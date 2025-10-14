module stimulus;    //test bench

// Declare variables to be connected
// to inputs and outputs


wire [15:0] instruction;
reg [15:0] instructionAdd;
reg CLK;


initial
	CLK = 1'b0;
always
	#5 CLK = ~CLK;
initial
#1000 $finish;

	// Instantiate the Data_Memory
	Instruction_Memory myInstruction_Memory(instruction, instructionAdd, CLK);
	
	// Stimulate the inputs
	// Define the stimulus module
	initial
	begin
		//test regRead and regWrite
		#5 instructionAdd = 16'd170;
		#1 $display("Test1: instruction=%b",instruction);
		
		#9 instructionAdd = 16'd231;
		#1 $display("Test2: instruction=%b",instruction);
	end

endmodule




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
