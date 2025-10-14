always @( posedge reset, posedge clk ) begin
	if (reset) begin
		tx_fifo[0] <= 'd0;
		tx_fifo[1] <= 'd0;
		tx_fifo[2] <= 'd0;
		tx_fifo[3] <= 'd0;
		tx_fifo[4] <= 'd0;
		tx_fifo[5] <= 'd0;
		tx_fifo[6] <= 'd0;
		tx_fifo[7] <= 'd0;
		tx_fifo[8] <= 'd0;
		tx_fifo[9] <= 'd0;
		tx_fifo[10] <= 'd0;
		tx_fifo[11] <= 'd0;
		tx_fifo[12] <= 'd0;
		tx_fifo[13] <= 'd0;
		tx_fifo[14] <= 'd0;
		tx_fifo[15] <= 'd0;
		tx_fifo_wp <= 'd0;
		tx_fifo_rp <= 'd0;
		tx_fifo_count <= 'd0;
		tx_fifo_full_flag <= 'd0;
	end else begin
	    
	    if ( fifo_enable )
		  begin
		  
		  if ( tx_fifo_push_not_full )
		      begin
		      tx_fifo[tx_fifo_wp[3:0]] <= wb_wdata32[7:0];
		      tx_fifo_wp <= tx_fifo_wp + 1'd1;
		      end
		  
		      
		  
		  if ( tx_fifo_pop_not_empty )
		      tx_fifo_rp <= tx_fifo_rp + 1'd1;
		      
		  
		  if (tx_fifo_push_not_full && !tx_fifo_pop_not_empty)
		      tx_fifo_count <= tx_fifo_count + 1'd1;
		      
		  
		  else if (tx_fifo_pop_not_empty  && !tx_fifo_push_not_full)
		      tx_fifo_count <= tx_fifo_count - 1'd1;
		  end
		  
	    
	    else  
		  begin
		  
		  tx_fifo_wp    <= 'd0;
		  tx_fifo_rp    <= 'd0;
		  tx_fifo_count <= 'd0;
		  
		  
		  if ( tx_fifo_push_not_full )
		      begin
		      tx_fifo[0]          <= wb_wdata32[7:0];
		      tx_fifo_full_flag   <= 1'd1;
		      end
		  
		  else if ( tx_fifo_pop_not_empty )
		      tx_fifo_full_flag   <= 1'd0;

		  end        
	end
end