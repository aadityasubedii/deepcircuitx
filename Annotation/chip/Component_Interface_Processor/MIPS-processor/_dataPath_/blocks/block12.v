module Sign_Extend(dataOut,dataIn);         

input[7:0] dataIn;
output[15:0] dataOut;

reg[15:0] tempA;

integer count;
