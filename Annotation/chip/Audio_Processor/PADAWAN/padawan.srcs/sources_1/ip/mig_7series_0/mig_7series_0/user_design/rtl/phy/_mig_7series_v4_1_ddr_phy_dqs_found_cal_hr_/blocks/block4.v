	always @(posedge clk) 
	    if (rst) begin
	       final_do_index[i] <= #TCQ 0;
	    end
	    else begin
	       final_do_index[i] <= #TCQ final_do_index[i] + 1;
	    end