always @( posedge reset, posedge clk ) begin
	if (reset) begin
		timer0_load_reg <= 'd0;   
		timer1_load_reg <= 'd0;   
		timer2_load_reg <= 'd0;   
		timer0_value_reg <= 24'hffffff;  
		timer1_value_reg <= 24'hffffff;  
		timer2_value_reg <= 24'hffffff;  
		timer0_ctrl_reg <= 'd0;   
		timer1_ctrl_reg <= 'd0;   
		timer2_ctrl_reg <= 'd0;   
		timer0_int_reg <= 'd0;    
		timer1_int_reg <= 'd0;    
		timer2_int_reg <= 'd0;    
	end else begin
	    if ( wb_start_write )
		  case ( i_wb_adr[15:0] )
		      
		      AMBER_TM_TIMER0_CTRL: timer0_ctrl_reg <= i_wb_dat[7:0];
		      AMBER_TM_TIMER1_CTRL: timer1_ctrl_reg <= i_wb_dat[7:0];
		      AMBER_TM_TIMER2_CTRL: timer2_ctrl_reg <= i_wb_dat[7:0];
		  endcase

	    
	    
	    
	    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TM_TIMER0_LOAD )
		  begin
		  timer0_value_reg <= {i_wb_dat[15:0], 8'd0};
		  timer0_load_reg  <= i_wb_dat[15:0];
		  end
	    else if ( timer0_ctrl_reg[7] ) 
		  begin
		  if ( timer0_value_reg == 24'd0 )
		      begin
		      if ( timer0_ctrl_reg[6] )  
		          timer0_value_reg <= {timer0_load_reg, 8'd0};
		      else    
		          timer0_value_reg <= 24'hffffff;
		      end
		  else 
		      case ( timer0_ctrl_reg[3:2] )
		          2'b00:  timer0_value_reg <= (timer0_value_reg & 24'hffff00) - 9'd256;
		          2'b01:  timer0_value_reg <= (timer0_value_reg & 24'hfffff0) - 9'd16;
		          2'b10:  timer0_value_reg <=  timer0_value_reg               - 1'd1;
		          default: 
		              begin
		              
		              
		              $write("unknown Timer Module Prescale Value %d for Timer 0", 
		                     timer0_ctrl_reg[3:2]);
		              
		              end
		      endcase
		  end

	    
	    
	    
	    
	    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TM_TIMER1_LOAD )
		  begin
		  timer1_value_reg <= {i_wb_dat[15:0], 8'd0};
		  timer1_load_reg  <= i_wb_dat[15:0];
		  end
	    else if ( timer1_ctrl_reg[7] ) 
		  begin
		  if ( timer1_value_reg == 24'd0 )
		      begin
		      if ( timer1_ctrl_reg[6] )  
		          timer1_value_reg <= {timer1_load_reg, 8'd0};
		      else    
		          timer1_value_reg <= 24'hffffff;
		      end
		  else
		      case ( timer1_ctrl_reg[3:2] )
		          2'b00:  timer1_value_reg <= (timer1_value_reg & 24'hffff00) - 9'd256;
		          2'b01:  timer1_value_reg <= (timer1_value_reg & 24'hfffff0) - 9'd16;
		          2'b10:  timer1_value_reg <=  timer1_value_reg - 1'd1;
		          default: 
		              begin
		              
		              
		              $write("unknown Timer Module Prescale Value %d for Timer 1", 
		                     timer1_ctrl_reg[3:2]);
		              
		              end
		      endcase
		  end
		      


	    
	    
	    
	    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TM_TIMER2_LOAD )
		  begin
		  timer2_value_reg <= {i_wb_dat[15:0], 8'd0};
		  timer2_load_reg  <= i_wb_dat[15:0];
		  end
	    else if ( timer2_ctrl_reg[7] ) 
		  begin
		  if ( timer2_value_reg == 24'd0 )
		      begin
		      if ( timer2_ctrl_reg[6] )  
		          timer2_value_reg <= {timer2_load_reg, 8'd0};
		      else    
		          timer2_value_reg <= 24'hffffff;
		      end
		  else
		      case ( timer2_ctrl_reg[3:2] )
		          2'b00:  timer2_value_reg <= (timer2_value_reg & 24'hffff00) - 9'd256;
		          2'b01:  timer2_value_reg <= (timer2_value_reg & 24'hfffff0) - 9'd16;
		          2'b10:  timer2_value_reg <=  timer2_value_reg - 1'd1;
		          default: 
		              begin
		              
		              
		              $write("unknown Timer Module Prescale Value %d for Timer 2", 
		                     timer2_ctrl_reg[3:2]);
		              
		              end
		      endcase
		  end
		  
		  
	    
	    
	    
	    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TM_TIMER0_CLR )
		  timer0_int_reg <= 1'd0;
	    else if ( timer0_value_reg == 24'd0 )
		  
		  timer0_int_reg <= 1'd1;

	    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TM_TIMER1_CLR)
		  timer1_int_reg <= 1'd0;
	    else if ( timer1_value_reg == 24'd0 )
		  
		  timer1_int_reg <= 1'd1;

	    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TM_TIMER2_CLR)
		  timer2_int_reg <= 1'd0;
	    else if ( timer2_value_reg == 24'd0 )
		  
		  timer2_int_reg <= 1'd1;
        
	end
end