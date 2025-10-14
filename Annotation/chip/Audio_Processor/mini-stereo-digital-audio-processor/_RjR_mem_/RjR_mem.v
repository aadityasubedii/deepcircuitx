`timescale 1ns / 1ps

module RjR_mem(Sclk,rj_status,row,Input,index_rjR,rjdataR,clear);

input Sclk,rj_status,clear;
input [3:0]row;
input [15:0]Input;
input [3:0]index_rjR;

output [15:0]rjdataR;

reg[15:0] rjr[0:15];
reg [9:0]r;

always @(posedge rj_status)
begin
	if(clear==1)
	begin
		for(r=0;r<512;r=r+1)
		begin
			rjr[row]=0;
		end
	end
	
	if(row<16)
		rjr[row]=Input;
end

assign rjdataR = rjr[index_rjR];
endmodule
