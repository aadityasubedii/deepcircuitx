`timescale 1ns / 1ps

module AdderR(add_statusR,addip1R,addip2R,addopR,addorsubR);

input add_statusR,addorsubR;
input [39:0] addip1R,addip2R;

output reg [39:0]addopR;

always @(addip1R or addip2R or addorsubR)
begin
	if(addorsubR == 1'b1)
		addopR=addip1R-addip2R;
	else
		addopR=addip1R+addip2R;
end

endmodule
