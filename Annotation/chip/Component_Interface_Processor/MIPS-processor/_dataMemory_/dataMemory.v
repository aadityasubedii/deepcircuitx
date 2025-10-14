module stimulus;    //test bench

// Declare variables to be connected
// to inputs and outputs


wire [15:0] dataOut;
reg [15:0] dataIn,dataInAdd;
reg regWrite, regRead, CLK;


initial
	CLK = 1'b0;
always
	#5 CLK = ~CLK;
initial
#1000 $finish;

	// Instantiate the Data_Memory
	Data_Memory myData_Memory(dataOut,dataIn,dataInAdd,regWrite, regRead, CLK);
	
	// Stimulate the inputs
	// Define the stimulus module
	initial
	begin
		//test regRead and regWrite
		#5 regWrite=1; regRead=0; dataInAdd = 16'd370; dataIn = 16'd170;
		#10 regRead=1; regWrite=0;  dataInAdd = 16'd370;
		#1 $display("Test1: dataOut=%b",dataOut);
		
		
		#9 regWrite=1; regRead=0; dataInAdd = 16'd590; dataIn = 16'd54896;
		#10 regRead=1; regWrite=0;  dataInAdd = 16'd590;
		#1 $display("Test2: dataOut=%b",dataOut); 
		
	end

endmodule




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