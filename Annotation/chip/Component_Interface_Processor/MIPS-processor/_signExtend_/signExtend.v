module stimulus;    //test bench

// Declare variables to be connected
// to inputs and outputs

wire [15:0] dataOut;
reg [7:0] dataIn;
reg CLK;

initial
	CLK = 1'b0;
initial
#1000 $finish;

	// Instantiate the Data_Memory
	Sign_Extend mySign_Extend(dataOut,dataIn);
	
	// Stimulate the inputs
	// Define the stimulus module
	initial
	begin
		//test sign_extend
		
		//starts with zero for dataIn[7]
		#1 dataIn = 8'b00111101;
		#1 $display("Test1: dataOut=%b",dataOut);
	
		//starts with one for dataIn[7]
		#1 dataIn = 8'b10111101;
		#1 $display("Test2: dataOut=%b",dataOut);
	end

endmodule 



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