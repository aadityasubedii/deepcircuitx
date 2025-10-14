always @ (posedge clock) begin
	if (enable==1'b1 && reset==1'b0)
		count <= count + 1'b1;
	else if (enable==1'b1 && reset==1'b1)
		count = 1'b0;
	end