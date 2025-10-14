`timescale 1ns / 1ps

module S2P(Dclk,Frame,InputL,InputR,S2P_status,S2P_L,S2P_R,Reset_n);

input Dclk,Frame,InputL,InputR,Reset_n;
output reg S2P_status;
output reg [15:0] S2P_L;
output reg [15:0] S2P_R;

reg [15:0] S2Pdata_L;
reg [15:0] S2Pdata_R;
reg [4:0]col;

always @(negedge Dclk or Reset_n)
begin
	if(Frame==1'b1)
		col=15;
		
	if(col>=0)
	begin
		S2P_status=0;
		S2Pdata_L[col]=InputL;
		S2Pdata_R[col]=InputR;
		col=col-1;
	end
	
	if(col==31)
	begin
		S2P_status=1;
		S2P_L=S2Pdata_L;
		S2P_R=S2Pdata_R;
	end
	
end

endmodule
