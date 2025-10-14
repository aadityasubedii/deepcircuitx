module stimulus;    //test bench
	
// Declare variables to be connected
// to inputs and outputs
wire [15:0] outaddr;
reg [15:0] inaddr;
reg CLK;
	
initial
CLK = 1'b0;
always
	#5 CLK = ~CLK;
initial
#1000 $finish;

	//instantiate programme counter
	programmecounter myprogrammecounter(outaddr,inaddr,CLK);
	
	// Stimulate the inputs
	// Define the stimulus module
	initial
	begin
		#5 inaddr=16'b0000000000000001;
		#1 $display("Test1: out address=%b",outaddr);
		
		#9 inaddr=16'b000000000001000;
		#1 $display("Test2: out address=%b",outaddr);
	end
endmodule




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