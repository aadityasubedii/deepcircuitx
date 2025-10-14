
/*
	对vld_in =1进行计数，统计到8个后，重新计数
*/
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		cnt	<=0;
	end
	else if(vld_in && cnt ==7)begin
		cnt	<=	0;
	end 
	else if(vld_in) begin
		cnt	<= cnt+1	;
	end
end








