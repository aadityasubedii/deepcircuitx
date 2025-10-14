always @(shift_statusL or shiftipL)
begin
	if(shift_statusL == 1)
		shiftopL = $signed(shiftipL)>>>1;
	else
		shiftopL = 0;	
end