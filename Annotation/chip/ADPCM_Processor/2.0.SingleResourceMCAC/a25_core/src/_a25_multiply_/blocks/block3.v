always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		count <= 'd0;
		product <= 'd0;
		o_done <= 'd0;
	end else begin
		if ( !i_core_stall ) begin
			count           <= i_execute ? count_nxt          : count;           
			product         <= i_execute ? product_nxt        : product;        
			o_done          <= i_execute ? count == 6'd31     : o_done;      
		end    
	end
end