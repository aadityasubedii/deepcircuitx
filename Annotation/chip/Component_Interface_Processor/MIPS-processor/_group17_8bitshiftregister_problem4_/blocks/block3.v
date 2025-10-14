module four_bit_UniversalShiftRegister(out,in,c0,c1,clk,enb,sli,sri);        

input [3:0] in;    
input clk,enb,sli,sri,c0,c1;
output [3:0] out;

	reg tempo1;   
	reg tempo2;
	reg tempo3;
	reg tempo4;
	