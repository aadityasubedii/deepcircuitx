`timescale 1ns / 100ps

module counter_8(
	clock,
	enable,
	count
);

parameter BIT_SZ = 8;
input clock;
input enable;
output [BIT_SZ-1:0] count;

reg [BIT_SZ-1:0] count;

initial count = 0;

always @ (posedge clock)
	if (enable == 1'b1)
		count <= count + 1'b1;

endmodule 



