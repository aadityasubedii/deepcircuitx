`timescale 1ns / 1ps

module ShifterL(shift_statusL,shiftipL,shiftopL);

input shift_statusL;
input [39:0]shiftipL;

output reg [39:0]shiftopL;

always @(shift_statusL or shiftipL)
begin
	if(shift_statusL == 1)
		shiftopL = $signed(shiftipL)>>>1;
	else
		shiftopL = 0;	
end

endmodule
