always @(posedge clk100mhz)
begin
	if(vu_dn && (volume_control < 4))
		volume_control <= volume_control + 1;
	
	else if(vd_dn && (volume_control > 0))
		volume_control <= volume_control - 1;
end