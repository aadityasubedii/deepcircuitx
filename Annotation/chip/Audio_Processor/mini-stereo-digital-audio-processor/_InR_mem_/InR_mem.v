`timescale 1ns / 1ps

module InR_mem(Sclk,in_status,row,Input,index_inR,inputdataR,Reset_n,clear);

input Sclk,in_status,Reset_n,clear;
input [9:0]row;
input [15:0]Input;
input [8:0]index_inR;

output [15:0]inputdataR;

reg[15:0] inr[0:511];
reg [9:0]r;

always @(posedge in_status)
begin

	if(Reset_n==0 || clear==1)
	begin
		for(r=0;r<512;r=r+1)
		begin
			inr[row]=0;
		end
	end
	
	if(row<512)
		inr[row]=Input;
end

assign inputdataR = inr[index_inR];

endmodule
