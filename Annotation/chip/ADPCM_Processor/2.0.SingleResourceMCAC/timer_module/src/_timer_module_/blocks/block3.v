always @( posedge reset, posedge clk ) begin
	if (reset) begin
		wb_rdata32 <= 'd0;
	end else begin
	    if ( wb_start_read )
		  case ( i_wb_adr[15:0] )
		      AMBER_TM_TIMER0_LOAD: wb_rdata32 <= {16'd0, timer0_load_reg};
		      AMBER_TM_TIMER1_LOAD: wb_rdata32 <= {16'd0, timer1_load_reg};
		      AMBER_TM_TIMER2_LOAD: wb_rdata32 <= {16'd0, timer2_load_reg};
		      AMBER_TM_TIMER0_CTRL: wb_rdata32 <= {24'd0, 
		                                         timer0_ctrl_reg[7:6], 
		                                         2'd0, 
		                                         timer0_ctrl_reg[3:2],
		                                         2'd0 
		                                        };
		      AMBER_TM_TIMER1_CTRL: wb_rdata32 <= {24'd0, 
		                                         timer1_ctrl_reg[7:6], 
		                                         2'd0, 
		                                         timer1_ctrl_reg[3:2],
		                                         2'd0 
		                                        };
		      AMBER_TM_TIMER2_CTRL: wb_rdata32 <= {24'd0, 
		                                         timer2_ctrl_reg[7:6], 
		                                         2'd0, 
		                                         timer2_ctrl_reg[3:2],
		                                         2'd0 
		                                        };
		      AMBER_TM_TIMER0_VALUE: wb_rdata32 <= {16'd0, timer0_value_reg[23:8]};
		      AMBER_TM_TIMER1_VALUE: wb_rdata32 <= {16'd0, timer1_value_reg[23:8]};
		      AMBER_TM_TIMER2_VALUE: wb_rdata32 <= {16'd0, timer2_value_reg[23:8]};
		  
		      default:               wb_rdata32 <= 32'h66778899;
		      
		  endcase
	end
end