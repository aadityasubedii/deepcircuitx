always @( posedge reset, posedge clk ) begin
	if (reset) begin
		wb_rdata32 <= 'd0;
	end else begin
	    if ( wb_start_read )
		  case ( i_wb_adr[15:0] )
		      AMBER_TEST_STATUS:           wb_rdata32 <= test_status_reg;
		      AMBER_TEST_FIRQ_TIMER:       wb_rdata32 <= {24'd0, firq_timer};
		      AMBER_TEST_IRQ_TIMER:        wb_rdata32 <= {24'd0, irq_timer};
		      AMBER_TEST_RANDOM_NUM:       wb_rdata32 <= {24'd0, random_num};
		      
		      


		      AMBER_TEST_RANDOM_NUM00: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM01: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM02: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM03: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM04: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM05: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM06: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM07: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM08: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM09: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM10: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM11: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM12: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM13: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM14: wb_rdata32 <= {24'd0, random_num};
		      AMBER_TEST_RANDOM_NUM15: wb_rdata32 <= {24'd0, random_num};
		      
		      
		      AMBER_TEST_UART_CONTROL:     wb_rdata32 <= {30'd0, tb_uart_control_reg};
		      AMBER_TEST_UART_STATUS:      wb_rdata32 <= {30'd0, tb_uart_status_reg};
		      AMBER_TEST_UART_TXD:         wb_rdata32 <= {24'd0, tb_uart_txd_reg};
		      
		      
		      AMBER_TEST_SIM_CTRL:         wb_rdata32 <= {29'd0, sim_ctrl_reg};
		      AMBER_TEST_MEM_CTRL:         wb_rdata32 <= {31'd0, mem_ctrl_reg};
		      
		      AMBER_TEST_CYCLES:           wb_rdata32 <=  cycles_reg;
		      AMBER_TEST_LED:              wb_rdata32 <= {27'd0, led_reg};
		      AMBER_TEST_PHY_RST:          wb_rdata32 <= {31'd0, phy_rst_reg};
		      default:                     wb_rdata32 <= 32'haabbccdd;
		      
		  endcase
	end
end