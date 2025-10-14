function [4:0] wrap;
input integer pos;
input integer level;
integer out;
begin
	out = pos - (1 << level);
	wrap = out[4:0];
end
endfunction