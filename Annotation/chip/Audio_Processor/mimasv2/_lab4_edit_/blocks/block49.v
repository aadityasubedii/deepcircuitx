   always @ (posedge CLK_100MHz) begin
     if (reset) volume <= 5'd20;
     else begin
	if (vup & ~old_vup & volume != 5'd31) volume <= volume+5'd1;       
	if (vdown & ~old_vdown & volume != 5'd0) volume <= volume-5'd1;       
     end
     old_vup <= vup;
     old_vdown <= vdown;
   end