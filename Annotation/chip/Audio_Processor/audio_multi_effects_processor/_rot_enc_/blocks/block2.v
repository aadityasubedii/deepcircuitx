always@(posedge clk)
begin
	delay_rot_q1 <= rot_q1;
	if((rot_q1 == 1) && (delay_rot_q1 == 0))
	begin
		rot_event <= 1; rot_left <= rot_q2;
	end
	else begin
		rot_event <= 0; rot_left <= rot_left;
	end
end