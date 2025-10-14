module Data_Memory(dataOut,dataIn,dataInAdd,regWrite,regRead,clock);  

input[15:0] dataInAdd;    
input[15:0] dataIn;
input regWrite, regRead, clock;
output[15:0] dataOut;

reg [15:0] registers [1023:0];   

reg [15:0] Out;

	