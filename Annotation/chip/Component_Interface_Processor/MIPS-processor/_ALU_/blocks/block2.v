module ALU(dataOut, zero, lt, gt, cIn, overflow, cOut, aluActiveIn, aluOpB1, aluOpB2, aluOpB3, dataIn1, dataIn2);       






input[15:0] dataIn1, dataIn2;
input aluActiveIn, aluOpB1, aluOpB2, aluOpB3;
output[15:0] dataOut;
output zero, cOut, lt, gt, overflow, cIn;



reg[15:0] dataOut, temp1;
reg[16:0] temp2;
reg[14:0] temp3, temp4;
reg zero=0,cOut, lt=0, gt=0, overflow, cIn;
