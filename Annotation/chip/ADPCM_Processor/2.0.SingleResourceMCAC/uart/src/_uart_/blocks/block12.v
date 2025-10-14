always @( posedge reset, posedge clk ) begin
	if (reset) begin
		wb_rdata32 <= 'd0;
	end else begin
	    if ( wb_start_read )
		  case ( i_wb_adr[15:0] )
		  
		      AMBER_UART_CID0:    wb_rdata32 <= 32'h0d;
		      AMBER_UART_CID1:    wb_rdata32 <= 32'hf0;
		      AMBER_UART_CID2:    wb_rdata32 <= 32'h05;
		      AMBER_UART_CID3:    wb_rdata32 <= 32'hb1;
		      AMBER_UART_PID0:    wb_rdata32 <= 32'h10;
		      AMBER_UART_PID1:    wb_rdata32 <= 32'h10;
		      AMBER_UART_PID2:    wb_rdata32 <= 32'h04;
		      AMBER_UART_PID3:    wb_rdata32 <= 32'h00;
		      
		      AMBER_UART_DR:      
		              if ( fifo_enable )
		                  wb_rdata32 <= {24'd0, rx_fifo[rx_fifo_rp[3:0]]};
		              else    
		                  wb_rdata32 <= {24'd0, rx_fifo[0]};
		                                
		      AMBER_UART_RSR:     wb_rdata32 <= uart_rsr_reg;          
		      AMBER_UART_LCRH:    wb_rdata32 <= uart_lcrh_reg;         
		      AMBER_UART_LCRM:    wb_rdata32 <= uart_lcrm_reg;         
		      AMBER_UART_LCRL:    wb_rdata32 <= uart_lcrl_reg;         
		      AMBER_UART_CR:      wb_rdata32 <= uart_cr_reg;           
		      
		      
		      AMBER_UART_FR:      wb_rdata32 <= {tx_fifo_empty,       
		                                       rx_fifo_full,        
		                                       tx_fifo_full,        
		                                       rx_fifo_empty,       
		                                       !tx_fifo_empty,      
		                                       1'd1,                 
		                                       1'd1,                 
		                                       !uart0_cts_n_d[3]     
		                                       };                    
		      
		      
		      AMBER_UART_IIR:     wb_rdata32 <= {5'd0, 
		                                       1'd0,                 
		                                       tx_interrupt,         
		                                       rx_interrupt,         
		                                       1'd0                  
		                                      };                     
		                                      
		      default:            wb_rdata32 <= 32'h00c0ffee;
		      
		  endcase
	end
end