`timescale 1ns / 1ps

module CoeffR_mem(Sclk,coeff_status,row,Input,index_coeffR,coeffdataR,clear);

input Sclk,coeff_status,clear;
input [8:0]row;
input [15:0]Input;
input [8:0]index_coeffR;

output [15:0]coeffdataR;

reg[15:0] coeffr[0:511];
reg [9:0]r;

always @(posedge coeff_status)
begin
	if(clear==1)
	begin
		for(r=0;r<512;r=r+1)
		begin
			coeffr[row]=0;
		end
	end
	
	if(row<512)
		coeffr[row]=Input;
end

assign coeffdataR = coeffr[index_coeffR];

endmodule
