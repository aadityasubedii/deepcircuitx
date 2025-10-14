module Instruction_Memory(instruction, instructionAdd, clock);    

input[15:0] instructionAdd;
input clock;
output[15:0] instruction;    

reg [15:0] registers [255:0];  

reg[15:0] tempA;


	integer i;    
