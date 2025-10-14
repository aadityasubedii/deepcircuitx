always @(shift_statusR or shiftipR)
begin
	if(shift_statusR == 1)
		shiftopR = $signed(shiftipR)>>>1;
	else
		shiftopR = 0;	
end