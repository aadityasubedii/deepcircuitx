`timescale 1ns / 1ps

module RjL_mem(Sclk,rj_status,row,Input,index_rjL,rjdataL,clear);

input Sclk,rj_status,clear;
input [3:0]row;
input [15:0]Input;
input [3:0]index_rjL;

output [15:0]rjdataL;

reg[15:0] rjl[0:15];
reg [9:0]r;

always @(posedge rj_status)
begin
	if(clear==1)
	begin
		for(r=0;r<512;r=r+1)
		begin
			rjl[row]=0;
		end
	end
	
	if(row<16)
		rjl[row]=Input;
end

assign rjdataL = rjl[index_rjL];
endmodule
