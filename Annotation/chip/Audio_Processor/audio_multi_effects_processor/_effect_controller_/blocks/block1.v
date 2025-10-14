always@(posedge clk)
begin
	if(switch_DIS)
		effect_out <= in_DIS;
	else if(switch_DELAY)
		effect_out <= in_DELAY;
	else if(switch_DELAY && switch_DIS)
		effect_out <= in_DIS + in_DELAY;
	else if(switch_ECHO)
		effect_out <= in_ECHO;
	else if(switch_REVERB)
		effect_out <= in_REVERB;
	else
		effect_out <= in_CLEAN;
end