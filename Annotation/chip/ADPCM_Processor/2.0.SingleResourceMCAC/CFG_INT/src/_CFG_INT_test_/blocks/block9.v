initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/CFG_INT_saed32nm_scan.sdf", test.top);
`endif
    clk = 1'b0;
    scan_in0 = 1'b0;
    scan_in1 = 1'b0;
    scan_in2 = 1'b0;
    scan_in3 = 1'b0;
    scan_in4 = 1'b0;
    scan_enable = 1'b0;
    test_mode = 1'b0;

    cs = 1'b1;
    rs = 1'b0;
    ws = 1'b0;

    w_data = 8'b00000000;
    addrs = 7'b0000000;
    i_wb_cyc_e = 1'b0;
    i_wb_stb_e = 1'b0;
    i_wb_cyc_d = 1'b0;
    i_wb_stb_d = 1'b0;
    i_wb_sel_e = 1'b0;
    i_wb_sel_d = 1'b0;
    wb_address = 32'h00000000;
    data_check = 3'b000;

   
   reset = 1'b0;
   @(posedge clk);
   reset = 1'b1;
   repeat(2)
       @(posedge clk);
   reset = 1'b0;
   for (i = 0; i<32; i=i+1) begin
  	enc_ch[i] <= 3'b000;
   	dec_ch[i] <= 3'b000;
   end




	rs = 1'b0;
	for (i=0; i<1000; i = i+1) begin
		ws <= 1'b1;
		repeat(2)
		@(posedge clk);
		w_data[2:0] = $random;
		rand_ch[4:0] = $random;
		addrs = {2'b00, rand_ch[4:0]};
		
		@(posedge clk);
		
		ws <= 1'b0;
		repeat (3)
			@(posedge clk);
		dec_ch[addrs[4:0]] = w_data[2:0];

		@(posedge clk);
		if(i==15) begin 
			wb_read_strobe_d (CONFIG_DONE_REG,{29'h00000000, 3'b000});
		end	
	end

	
	@(posedge clk);
	wb_read_strobe_d (CONFIG_DONE_REG,{29'h00000000, 3'b001});

	

	@(posedge clk);
	for (j=0; j<1000; j=j+1) begin
		ws <= 1'b1;
		repeat (2)
		@(posedge clk);
		rand_ch[4:0] = $random;
		addrs <= {2'b01, rand_ch[4:0]};
		w_data[2:0] <= $random;
		@(posedge clk);
		ws = 1'b0;
		repeat (3)
			@(posedge clk);
		enc_ch[addrs[4:0]] <= w_data[2:0];

		@(posedge clk);
		if(i==15) begin 
			wb_read_strobe_e (CONFIG_DONE_REG,{29'h00000000, 3'b000});
		end	
	end

	
	@(posedge clk);
	wb_read_strobe_e (CONFIG_DONE_REG,{29'h00000000, 3'b001});
	@(posedge clk);


	ws = 1'b0;
	addrs[5] = 1'b0;
	$display("THIS HAPPENED: dec_ch0 is %h", dec_ch[0]);
	for(k=0; k<1000; k = k+1) begin
		rand_ch[4:0] <= $random;
		data_check <= dec_ch[rand_ch[4:0]];
		addrs[4:0] <= {2'b00, rand_ch[4:0]};
		@(posedge clk);
		rs = 1'b1;
		@(posedge clk);
		wb_address = 4*addrs[4:0];
		wb_read_strobe_d (wb_address,{29'h00000000, data_check[2:0]});
		rs = 1'b0;
		if (r_data[2:0] !== data_check) begin
			$display("%t DECODER ERROR: failure found. r_data should be %h , but is %h. Address is %h", $time, data_check, r_data, addrs); 
			`ifdef ERRORSTOP
				$stop;
			`endif
		end		
		
	end


	addrs[5] = 1'b1;
	for(l=0; l<1000; l = l+1) begin
		rand_ch[4:0] <= $random;
		data_check <= enc_ch[rand_ch[4:0]];
		addrs[4:0] <= rand_ch[4:0];
		@(posedge clk);
		rs = 1'b1;
		@(posedge clk);
		wb_address = 4*addrs[4:0];
		wb_read_strobe_e (wb_address,{29'h00000000, data_check[2:0]});
		rs = 1'b0;
		if (r_data[2:0] !== data_check) begin
			$display("%t ENCODER ERROR: failure found. r_data should be %h , but is %h", $time, data_check, r_data); 
			`ifdef ERRORSTOP
				$stop;
			`endif
		end
	end



	@(posedge clk);
	wb_write_strobe_e(CONFIG_CORE_READY,32'h00000001); 
	@(posedge clk);
	addrs = 7'b1100000;
	@(posedge clk);
	rs = 1'b1;
	@(posedge clk);
	rs = 1'b0;
	if (r_data !== 1) begin
		$display("%t ENCODER ERROR: Encoder core ready register not correct",$time);
	end
	else begin
		$display("%t Encoder core and config module handshake correct",$time);
	end

	@(posedge clk);
	wb_write_strobe_d(CONFIG_CORE_READY,32'h00000001); 
	@(posedge clk);
	addrs = 7'b1000000;
	@(posedge clk);
	rs = 1'b1;
	@(posedge clk);
	rs = 1'b0;
	if (r_data !== 1) begin
		$display("%t DECODER ERROR: Decoder core ready register not correct",$time);
	end
	else begin
		$display("%t Decoder core and config module handshake correct",$time);
	end

	@(posedge clk);
	@(posedge clk);
	$display("TEST COMPLETE!"); 
   	$finish;   
end 