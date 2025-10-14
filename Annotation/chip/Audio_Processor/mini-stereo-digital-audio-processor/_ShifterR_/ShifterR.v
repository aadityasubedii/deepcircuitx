`timescale 1ns / 1ps

module ShifterR(shift_statusR,shiftipR,shiftopR);

input shift_statusR;
input [39:0]shiftipR;

output reg [39:0]shiftopR;

always @(shift_statusR or shiftipR)
begin
	if(shift_statusR == 1)
		shiftopR = $signed(shiftipR)>>>1;
	else
		shiftopR = 0;	
end

endmodule
