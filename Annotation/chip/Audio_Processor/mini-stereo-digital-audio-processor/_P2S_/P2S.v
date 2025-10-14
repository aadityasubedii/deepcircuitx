`timescale 1ns / 1ps

module P2S(OutputdataL, OutputL,OutputdataR, OutputR, Sclk,Frame,P2S_status, OutReady,col_out);

input [39:0] OutputdataL,OutputdataR;
input P2S_status;
input Sclk, Frame;

integer col=39;

output reg [31:0]col_out;
output reg OutReady;
output reg OutputL,OutputR;

/*initial begin
	col=39;
end*/

always @(posedge Frame)
begin
	if(col==39 && P2S_status==1)
	begin
		OutReady=1;
		OutputL=OutputdataL[col];
		OutputR=OutputdataR[col];
		col=col-1;
		col_out=col;
	end
end
always @(posedge Sclk)
begin
	
	if (col==-1)
	begin
		col_out = col;
		OutReady=0;
		col=39;
	end
	if(col<=38 && col>-1)
	begin
		col_out=col;
		OutputL=OutputdataL[col];
		OutputR=OutputdataR[col];
		col=col-1;
		col_out=col;
		if(col==-1)
			col_out=-1;
	end
end
endmodule
