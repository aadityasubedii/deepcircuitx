always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		rx_int_timer <= 'd0;
		rx_fifo[0] <= 'd0;
		rx_fifo[1] <= 'd0;
		rx_fifo[2] <= 'd0;
		rx_fifo[3] <= 'd0;
		rx_fifo[4] <= 'd0;
		rx_fifo[5] <= 'd0;
		rx_fifo[6] <= 'd0;
		rx_fifo[7] <= 'd0;
		rx_fifo[8] <= 'd0;
		rx_fifo[9] <= 'd0;
		rx_fifo[10] <= 'd0;
		rx_fifo[11] <= 'd0;
		rx_fifo[12] <= 'd0;
		rx_fifo[13] <= 'd0;
		rx_fifo[14] <= 'd0;
		rx_fifo[15] <= 'd0;
		rx_fifo_empty <= 1'd1;
		rx_fifo_full <= 1'd0;
		rx_fifo_count <= 'd0;	
		rx_fifo_wp <= 'd0;
		rx_fifo_rp <= 'd0;
	end else begin
	    if ( fifo_enable )
		  begin
		  
		  if ( rx_fifo_push_not_full )
		      begin
		      rx_fifo[rx_fifo_wp[3:0]]    <= rx_byte;                
		      rx_fifo_wp                  <= rx_fifo_wp + 1'd1;
		      end

		  if ( rx_fifo_pop_not_empty )
		      begin
		      rx_fifo_rp                  <= rx_fifo_rp + 1'd1;
		      end
		      
		  if ( rx_fifo_push_not_full && !rx_fifo_pop_not_empty )
		      rx_fifo_count <= rx_fifo_count + 1'd1;
		  else if ( rx_fifo_pop_not_empty  && !rx_fifo_push_not_full )
		      rx_fifo_count <= rx_fifo_count - 1'd1;
		  
		  rx_fifo_full  <= rx_fifo_wp == {~rx_fifo_rp[4], rx_fifo_rp[3:0]};
		  rx_fifo_empty <= rx_fifo_wp == rx_fifo_rp;
		  
		  if ( rx_fifo_empty || rx_fifo_pop )
		      rx_int_timer     <= 'd0;
		  else if ( rx_int_timer != RX_INTERRUPT_COUNT )
		      rx_int_timer     <= rx_int_timer + 1'd1;
		  
		      
		  end
	    else    
		  begin
		  rx_int_timer     <= 'd0;
		  
		  if ( rx_fifo_push )
		      begin
		      rx_fifo[0]         <= rx_byte;
		      rx_fifo_empty      <= 1'd0;
		      rx_fifo_full       <= 1'd1;
		      end
		  else if ( rx_fifo_pop )
		      begin
		      rx_fifo_empty      <= 1'd1;
		      rx_fifo_full       <= 1'd0;
		      end
		  end
	end
end