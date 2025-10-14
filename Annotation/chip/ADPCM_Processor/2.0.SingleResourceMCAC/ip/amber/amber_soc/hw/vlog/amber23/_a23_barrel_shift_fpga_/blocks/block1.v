function [15:0] bit_swap;
input [15:0] value;
integer i;
begin
	for (i = 0; i < 16; i = i + 1)
		bit_swap[i] = value[15 - i];
end
endfunction