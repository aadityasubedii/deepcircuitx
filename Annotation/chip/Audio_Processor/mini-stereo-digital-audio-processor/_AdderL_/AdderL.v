`timescale 1ns / 1ps

module AdderL(add_statusL,addip1L,addip2L,addopL,addorsubL);

input add_statusL,addorsubL;
input [39:0] addip1L,addip2L;

output reg [39:0]addopL;

always @(addip1L or addip2L or addorsubL)
begin
	if(addorsubL == 1'b1)
		addopL=addip1L-addip2L;
	else
		addopL=addip1L+addip2L;
end

endmodule
