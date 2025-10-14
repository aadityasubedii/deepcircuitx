module eight_bit_UniversalShiftRegister(out,in,c0,c1,clk,enb,sli,sri);        

input [7:0] in;    
input clk,enb,sli,sri,c0,c1;
output [7:0] out;

wire [3:0] in1,in2,out1,out2;


assign in1[0]=in[0];   
assign in1[1]=in[1];
assign in1[2]=in[2];
assign in1[3]=in[3];


assign in2[0]=in[4];
assign in2[1]=in[5];
assign in2[2]=in[6];
assign in2[3]=in[7];


four_bit_UniversalShiftRegister shift1(out1,in1,c0,c1,clk,enb,sli,in[4]);    
four_bit_UniversalShiftRegister shift2(out2,in2,c0,c1,clk,enb,in[3],sri);    

assign out[0]=out1[0];  
assign out[1]=out1[1];
assign out[2]=out1[2];
assign out[3]=out1[3];

assign out[4]=out2[0];
assign out[5]=out2[1];
assign out[6]=out2[2];
assign out[7]=out2[3];

endmodule