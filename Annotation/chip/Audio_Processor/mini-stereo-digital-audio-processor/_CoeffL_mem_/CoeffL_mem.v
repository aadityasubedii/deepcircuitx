`timescale 1ns / 1ps

module CoeffL_mem(Sclk,coeff_status,row,Input,index_coeffL,coeffdataL,clear);

input Sclk,coeff_status,clear;
input [8:0]row;
input [15:0]Input;
input [8:0]index_coeffL;

output [15:0]coeffdataL;

reg[15:0] coeffl[0:511];
reg [9:0]r;

always @(posedge coeff_status)
begin
	if(clear==1)
	begin
		for(r=0;r<512;r=r+1)
		begin
			coeffl[row]=0;
		end
	end
	
	if(row<512)
		coeffl[row]=Input;
end

assign coeffdataL = coeffl[index_coeffL];

endmodule
