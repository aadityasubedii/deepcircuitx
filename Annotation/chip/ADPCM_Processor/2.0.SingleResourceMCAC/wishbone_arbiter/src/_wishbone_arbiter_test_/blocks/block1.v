initial begin
	$timeformat(-9,2,"ns", 16);
	`ifdef SDFSCAN
		$sdf_annotate("sdf/wishbone_arbiter_tsmc18_scan.sdf", test.top);
	`endif

	clk = 1'b0;
	reset = 1'b0;
	scan_in0 = 1'b0;
	scan_in1 = 1'b0;
	scan_in2 = 1'b0;
	scan_in3 = 1'b0;
	scan_in4 = 1'b0;
	scan_enable = 1'b0;
	test_mode = 1'b0;

	
	i_m0_wb_adr <= 32'h00000000;
	i_m0_wb_sel <= {WB_SWIDTH{1'b0}};
	i_m0_wb_dat <= {WB_DWIDTH{1'b0}};
	i_m0_wb_we  <= 1'b0;
	i_m0_wb_cyc <= 1'b0;
	i_m0_wb_stb <= 1'b0;

	i_s0_wb_ack <= 1'b0;
	i_s1_wb_ack <= 1'b0;
	i_s2_wb_ack <= 1'b0;
	i_s3_wb_ack <= 1'b0;
	i_s4_wb_ack <= 1'b0;
	i_s5_wb_ack <= 1'b0;
	i_s6_wb_ack <= 1'b0;
	i_s7_wb_ack <= 1'b0;
	i_s8_wb_ack <= 1'b0;
	i_s9_wb_ack <= 1'b0;

	i_s0_wb_err <= 1'b0;
	i_s1_wb_err <= 1'b0;
	i_s2_wb_err <= 1'b0;
	i_s3_wb_err <= 1'b0;
	i_s4_wb_err <= 1'b0;
	i_s5_wb_err <= 1'b0;
	i_s6_wb_err <= 1'b0;
	i_s7_wb_err <= 1'b0;
	i_s8_wb_err <= 1'b0;
	i_s9_wb_err <= 1'b0;

	i_s0_wb_dat <= {WB_DWIDTH{1'b0}};
	i_s1_wb_dat <= {WB_DWIDTH{1'b0}};
	i_s2_wb_dat <= {WB_DWIDTH{1'b0}};
	i_s3_wb_dat <= {WB_DWIDTH{1'b0}};
	i_s4_wb_dat <= {WB_DWIDTH{1'b0}};
	i_s5_wb_dat <= {WB_DWIDTH{1'b0}};
	i_s6_wb_dat <= {WB_DWIDTH{1'b0}};
	i_s7_wb_dat <= {WB_DWIDTH{1'b0}};
	i_s8_wb_dat <= {WB_DWIDTH{1'b0}};
	i_s9_wb_dat <= {WB_DWIDTH{1'b0}};

	@(posedge clk) begin reset <= 1'b1; end
	@(posedge clk) begin reset <= 1'b0; end

	for (i=0; i<SLAVE_NUM; i=i+1) begin

		i_m0_wb_adr[15:0] <= $random;
		i_m0_wb_sel		<= $random;		
		i_m0_wb_dat		<= $random;

		case (i)
			0:	i_m0_wb_adr 	 <= BOOT_BASE;			 
			1:	i_m0_wb_adr 	 <= MAIN_BASE + 32'h03FF_FFFF; 
			2:	i_m0_wb_adr[31:16] <= APRSC_BASE;
			3:	i_m0_wb_adr[31:16] <= AMBER_UART0_BASE;
			4:	i_m0_wb_adr[31:16] <= TDMI_BASE;
			5:	i_m0_wb_adr[31:16] <= TEST_BASE;
			6:	i_m0_wb_adr[31:16] <= AMBER_TM_BASE;
			7:	i_m0_wb_adr[31:16] <= AMBER_IC_BASE;
			8:	i_m0_wb_adr[31:16] <= TDMO_BASE;
			9:	i_m0_wb_adr[31:16] <= CONFIG_BASE;
		endcase

		@(posedge clk) begin
			i_m0_wb_cyc <= 1'b1;			
			i_m0_wb_stb <= 1'b1;			
			i_m0_wb_we  <= 1'b1;			
		end

		@(negedge clk) begin
			case (i)
				0:
					begin
					adr <= o_s0_wb_adr;
					sel <= o_s0_wb_sel;
					we  <= o_s0_wb_we;
					cyc <= o_s0_wb_cyc;
					stb <= o_s0_wb_stb;
					dat <= o_s0_wb_dat;
					i_s0_wb_dat = $random;
					slave_data <= i_s0_wb_dat;
					i_s0_wb_ack <= 1'b1;
					i_s0_wb_err <= 1'b1;
					end
				1:
					begin
					adr <= o_s1_wb_adr;
					sel <= o_s1_wb_sel;
					we  <= o_s1_wb_we;
					cyc <= o_s1_wb_cyc;
					stb <= o_s1_wb_stb;
					dat <= o_s1_wb_dat;
					i_s1_wb_dat = $random;
					slave_data <= i_s1_wb_dat;
					i_s1_wb_ack <= 1'b1;
					i_s1_wb_err <= 1'b1;
					end
				2:
					begin
					adr <= o_s2_wb_adr;
					sel <= o_s2_wb_sel;
					we  <= o_s2_wb_we;
					cyc <= o_s2_wb_cyc;
					stb <= o_s2_wb_stb;
					dat <= o_s2_wb_dat;
					i_s2_wb_dat = $random;
					slave_data <= i_s2_wb_dat;
					i_s2_wb_ack <= 1'b1;
					i_s2_wb_err <= 1'b1;
					end
				3:
					begin
					adr <= o_s3_wb_adr;
					sel <= o_s3_wb_sel;
					we  <= o_s3_wb_we;
					cyc <= o_s3_wb_cyc;
					stb <= o_s3_wb_stb;
					dat <= o_s3_wb_dat;
					i_s3_wb_dat = $random;
					slave_data <= i_s3_wb_dat;
					i_s3_wb_ack <= 1'b1;
					i_s3_wb_err <= 1'b1;
					end
				4:
					begin
					adr <= o_s4_wb_adr;
					sel <= o_s4_wb_sel;
					we  <= o_s4_wb_we;
					cyc <= o_s4_wb_cyc;
					stb <= o_s4_wb_stb;
					dat <= o_s4_wb_dat;
					i_s4_wb_dat = $random;
					slave_data <= i_s4_wb_dat;
					i_s4_wb_ack <= 1'b1;
					i_s4_wb_err <= 1'b1;
					end
				5:
					begin
					adr <= o_s5_wb_adr;
					sel <= o_s5_wb_sel;
					we  <= o_s5_wb_we;
					cyc <= o_s5_wb_cyc;
					stb <= o_s5_wb_stb;
					dat <= o_s5_wb_dat;
					i_s5_wb_dat = $random;
					slave_data <= i_s5_wb_dat;
					i_s5_wb_ack <= 1'b1;
					i_s5_wb_err <= 1'b1;
					end
				6:
					begin
					adr <= o_s6_wb_adr;
					sel <= o_s6_wb_sel;
					we  <= o_s6_wb_we;
					cyc <= o_s6_wb_cyc;
					stb <= o_s6_wb_stb;
					dat <= o_s6_wb_dat;
					i_s6_wb_dat = $random;
					slave_data <= i_s6_wb_dat;
					i_s6_wb_ack <= 1'b1;
					i_s6_wb_err <= 1'b1;
					end
				7:
					begin
					adr <= o_s7_wb_adr;
					sel <= o_s7_wb_sel;
					we  <= o_s7_wb_we;
					cyc <= o_s7_wb_cyc;
					stb <= o_s7_wb_stb;
					dat <= o_s7_wb_dat;
					i_s7_wb_dat = $random;
					slave_data <= i_s7_wb_dat;
					i_s7_wb_ack <= 1'b1;
					i_s7_wb_err <= 1'b1;
					end
				8:
					begin
					adr <= o_s8_wb_adr;
					sel <= o_s8_wb_sel;
					we  <= o_s8_wb_we;
					cyc <= o_s8_wb_cyc;
					stb <= o_s8_wb_stb;
					dat <= o_s8_wb_dat;
					i_s8_wb_dat = $random;
					slave_data <= i_s8_wb_dat;
					i_s8_wb_ack <= 1'b1;
					i_s8_wb_err <= 1'b1;
					end
				9:
					begin
					adr <= o_s9_wb_adr;
					sel <= o_s9_wb_sel;
					we  <= o_s9_wb_we;
					cyc <= o_s9_wb_cyc;
					stb <= o_s9_wb_stb;
					dat <= o_s9_wb_dat;
					i_s9_wb_dat = $random;
					slave_data <= i_s9_wb_dat;
					i_s9_wb_ack <= 1'b1;
					i_s9_wb_err <= 1'b1;
					end
			endcase
		end

		@(posedge clk) begin
			if (adr !== i_m0_wb_adr) begin
				$display("%t ERROR: adr is %h, but should be %h", $time, adr, i_m0_wb_adr);
				`ifdef ERRORSTOP
					$stop;
				`endif
			end
			if (sel !== i_m0_wb_sel) begin
				$display("%t ERROR: sel is %h, but should be %h", $time, sel, i_m0_wb_sel);
				`ifdef ERRORSTOP
					$stop;
				`endif
			end
			if (we !== i_m0_wb_we) begin
				$display("%t ERROR: we is %h, but should be %h", $time, we, i_m0_wb_we);
				`ifdef ERRORSTOP
					$stop;
				`endif
			end
			if (cyc !== i_m0_wb_cyc) begin
				$display("%t ERROR: cyc is %h, but should be %h", $time, cyc, i_m0_wb_cyc);
				`ifdef ERRORSTOP
					$stop;
				`endif
			end
			if (stb !== i_m0_wb_stb) begin
				$display("%t ERROR: stb is %h, but should be %h", $time, stb, i_m0_wb_stb);
				`ifdef ERRORSTOP
					$stop;
				`endif
			end
			if (dat !== i_m0_wb_dat) begin
				$display("%t ERROR: dat is %h, but should be %h", $time, dat, i_m0_wb_dat);
				`ifdef ERRORSTOP
					$stop;
				`endif
			end
			if (slave_data !== o_m0_wb_dat) begin
				$display("%t ERROR: master data out is %h, but should be %h", $time, o_m0_wb_dat, slave_data);
				`ifdef ERRORSTOP
					$stop;
				`endif
			end
			if (o_m0_wb_ack !== 1'b1) begin
				$display("%t ERROR: dat is %h, but should be 1", $time, o_m0_wb_ack);
				`ifdef ERRORSTOP
					$stop;
				`endif
			end
			if (o_m0_wb_err !== 1'b1) begin
				$display("%t ERROR: err is %h, but should be 1", $time, o_m0_wb_err);
				`ifdef ERRORSTOP
					$stop;
				`endif
			end
		end

		case (i)
			0:
				begin
				i_s0_wb_dat <= {WB_DWIDTH{1'b0}};
				i_s0_wb_ack <= 1'b0;
				i_s0_wb_err <= 1'b0;
				end
			1:
				begin
				i_s1_wb_dat <= {WB_DWIDTH{1'b0}};
				i_s1_wb_ack <= 1'b0;
				i_s1_wb_err <= 1'b0;
				end
			2:
				begin
				i_s2_wb_dat <= {WB_DWIDTH{1'b0}};
				i_s2_wb_ack <= 1'b0;
				i_s2_wb_err <= 1'b0;
				end
			3:
				begin
				i_s3_wb_dat <= {WB_DWIDTH{1'b0}};
				i_s3_wb_ack <= 1'b0;
				i_s3_wb_err <= 1'b0;
				end
			4:
				begin
				i_s4_wb_dat <= {WB_DWIDTH{1'b0}};
				i_s4_wb_ack <= 1'b0;
				i_s4_wb_err <= 1'b0;
				end
			5:
				begin
				i_s5_wb_dat <= {WB_DWIDTH{1'b0}};
				i_s5_wb_ack <= 1'b0;
				i_s5_wb_err <= 1'b0;
				end
			6:
				begin
				i_s6_wb_dat <= {WB_DWIDTH{1'b0}};
				i_s6_wb_ack <= 1'b0;
				i_s6_wb_err <= 1'b0;
				end
			7:
				begin
				i_s7_wb_dat <= {WB_DWIDTH{1'b0}};
				i_s7_wb_ack <= 1'b0;
				i_s7_wb_err <= 1'b0;
				end
			8:
				begin
				i_s8_wb_dat <= {WB_DWIDTH{1'b0}};
				i_s8_wb_ack <= 1'b0;
				i_s8_wb_err <= 1'b0;
				end
			9:
				begin
				i_s9_wb_dat <= {WB_DWIDTH{1'b0}};
				i_s9_wb_ack <= 1'b0;
				i_s9_wb_err <= 1'b0;
				end
		endcase

		@(posedge clk) begin
			i_m0_wb_cyc <= 1'b0;			
			i_m0_wb_stb <= 1'b0;			
			i_m0_wb_we  <= 1'b0;			
		end

	end