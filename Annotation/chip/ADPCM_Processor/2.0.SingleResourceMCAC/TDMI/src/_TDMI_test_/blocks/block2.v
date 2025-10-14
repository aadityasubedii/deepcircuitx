initial begin
  $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
  $sdf_annotate("sdf/TDMI_saed32nm_scan.sdf", test.top);
`endif

  frame_sync  = 1'b0;
  ser_clk     = 1'b0;
  clk	  	  = 1'b0;
  reset       = 1'b0;
  scan_in0    = 1'b0;
  scan_in1    = 1'b0;
  scan_in2    = 1'b0;
  scan_in3    = 1'b0;
  scan_in4    = 1'b0;
  scan_enable = 1'b0;
  test_mode   = 1'b0;
  
  i_wb_cyc = 1'b0;
  i_wb_stb = 1'b0;

	@(posedge ser_clk);
	@(posedge ser_clk) begin reset <= 1'b1; end
	@(negedge ser_clk) begin reset <= 1'b0; end

	repeat (20)	@(posedge ser_clk);

	@(posedge clk) begin
		i_wb_adr <= TDMI_START;		
		i_wb_dat <= {31'h00000000, 1'b1};
		i_wb_cyc <= 1'b1;			
		i_wb_stb <= 1'b1;			
		i_wb_we  <= 1'b1;			
	end

	@(posedge clk) begin
		i_wb_cyc <= 1'b0;
		i_wb_stb <= 1'b0;
		i_wb_we  <= 1'b0;
	end

	@(posedge ser_clk);
	
	for (adrs=0; adrs<`NUM_ADDRESSES; adrs=adrs+1) begin
		for (i=0; i<`NUM_TESTS; i=i+1) begin
			for (channel=0; channel<32; channel=channel+1) begin
				data_in_vec <= $random;
				for (bits=7; bits>=0; bits=bits-1) begin
					@(posedge ser_clk) begin
						if ((channel == 0)&&(i==0)) begin
							frame_sync <= 1'b1;
						end else begin
							frame_sync <= 1'b0;
						end					
						data_in <= data_in_vec[bits];
					end
				end
				@(negedge ser_clk);
				case (4*adrs)
					TDMI_ALL:		wb_read_strobe({16'h0000, 4*adrs[15:0]}, {19'h00000, channel[4:0], data_in_vec});
					TDMI_DATA:		wb_read_strobe({16'h0000, 4*adrs[15:0]}, {24'h000000, data_in_vec});
					TDMI_CHANNEL:	wb_read_strobe({16'h0000, 4*adrs[15:0]}, {27'h000000, channel[4:0]});
				endcase
			end
		end
	end

	
	for (i=0; i<`NUM_TESTS; i=i+1) begin
		rand_ch  <= $random;
		rand_bit <= $random;
		trigger <= 1'b0;
		for (channel=0; channel<32; channel=channel+1) begin
			data_in_vec <= $random;
			for (bits=7; bits>=0; bits=bits-1) begin
				@(posedge ser_clk) begin
					if ((channel == rand_ch) && (bits == rand_bit) && (trigger == 1'b0)) begin
						bits = 7;
						channel = 0;
						trigger <= 1'b1;
						frame_sync <= 1'b1;
					end else if ((channel == 1) && (trigger == 1'b1)) begin
						frame_sync <= 1'b0;
					end
					data_in <= data_in_vec[bits];
				end
			end
			@(negedge ser_clk);
			wb_read_strobe(32'h00000000, {24'h000000, data_in_vec});
		end
	end

  #10 $display("%t TEST COMPLETE", $time);
  $finish;
end 