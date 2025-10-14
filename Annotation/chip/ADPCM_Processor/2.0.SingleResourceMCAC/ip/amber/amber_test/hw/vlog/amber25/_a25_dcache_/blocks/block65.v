always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		init_count	<= 'd0;
		source_sel	<= 1'd1 << C_CORE;
		c_state	<= CS_IDLE;
		select_way	<= 'd0;
		random_num	<= 4'hf;
	end else begin
		if ( i_cache_flush ) begin
			c_state     <= CS_INIT;
			source_sel  <= 1'd1 << C_INIT;
			init_count  <= 'd0;
			`ifdef A25_CACHE_DEBUG  
			`TB_DEBUG_MESSAGE  
			$display("Cache Flush");
			`endif            
		end else begin
			case ( c_state )
				CS_INIT : begin
					if ( init_count < CACHE_LINES [CACHE_ADDR_WIDTH:0] ) begin
		      			init_count  <= init_count + 1'd1;
						source_sel  <= 1'd1 << C_INIT;
				      end else begin
						source_sel  <= 1'd1 << C_CORE;
						c_state     <= CS_TURN_AROUND;
		              	end 
				end
				CS_IDLE : begin
					source_sel  <= 1'd1 << C_CORE;
					if ( ex_read_hit || ex_read_hit_r ) begin
						select_way  <= data_hit_way | ex_read_hit_way;
						c_state     <= CS_EX_DELETE;        
						source_sel  <= 1'd1 << C_INVA;
		          		end else if ( read_miss ) begin
		              		c_state <= CS_FILL; 
		          		end else if ( write_hit ) begin
		              		if ( i_wb_cached_ready ) begin
		                  		c_state <= CS_WRITE_HIT;        
		              		end else begin
		                  		c_state <= CS_WRITE_HIT_WAIT_WB;        
		              		end
					end else if ( write_miss && !i_wb_cached_ready ) begin
		                  	c_state <= CS_WRITE_MISS_WAIT_WB;        
		          		end
				end
				CS_FILL : begin
					
					
		          		if ( i_wb_cached_ready ) begin
						c_state     <= CS_FILL_COMPLETE;
						source_sel  <= 1'd1 << C_FILL;
						
						
						
						select_way  <= next_way; 
						random_num  <= {random_num[2], random_num[1], random_num[0], random_num[3]^random_num[2]};
					end
				end
				
				CS_FILL_COMPLETE : begin
					
					
					
					
					source_sel  <= 1'd1 << C_CORE;              
					c_state     <= CS_TURN_AROUND;    
				end
				
				
				CS_TURN_AROUND : begin
					c_state     <= CS_IDLE;
				end
				
				CS_EX_DELETE: begin
					`ifdef A25_CACHE_DEBUG    
						`TB_DEBUG_MESSAGE
						$display("Cache deleted Locked entry");
					`endif    
					c_state    <= CS_TURN_AROUND;
					source_sel <= 1'd1 << C_CORE;
				end   
				CS_WRITE_HIT: begin
					if ( !consecutive_write ) begin       
						c_state     <= CS_IDLE;
					end
				end
				CS_WRITE_HIT_WAIT_WB: begin
					
					if ( i_wb_cached_ready ) begin
						c_state     <= CS_IDLE;
					end
				end
				CS_WRITE_MISS_WAIT_WB: begin
					
					if ( i_wb_cached_ready ) begin
						c_state     <= CS_IDLE;
					end
				end
			endcase                       
		end
	end
end