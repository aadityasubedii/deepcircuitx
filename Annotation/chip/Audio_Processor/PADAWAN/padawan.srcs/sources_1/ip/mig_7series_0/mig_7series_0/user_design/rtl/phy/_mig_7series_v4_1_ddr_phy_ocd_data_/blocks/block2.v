  always @(*) begin
    comp0 = 8'hff;
    comp180 = 8'hff;
    prbs0 = 8'hff;
    prbs180 = 8'hff;
    data_bytes_ns = 64'b0;
    prbs_bytes_ns = 64'b0;
    for (ii=0; ii<2*nCK_PER_CLK; ii=ii+1) 
      begin
        word = phy_rddata[ii*DQ_WIDTH+:DQ_WIDTH];
	word_shifted = word >> oclkdelay_calib_cnt*8;
	data_bytes_ns[ii*8+:8] = word_shifted[7:0];
	
        word = prbs_o[ii*DQ_WIDTH+:DQ_WIDTH];
	word_shifted = word >> oclkdelay_calib_cnt*8;
	prbs_bytes_ns[ii*8+:8] = word_shifted[7:0];
	
	comp0[ii] = data_bytes[ii*8+:8] == (ii%2 ? 8'hff : 8'h00);
	comp180[ii] = data_bytes[ii*8+:8] == (ii%2 ? 8'h00 : 8'hff);
	
        prbs0[ii] = data_bytes[ii*8+:8] == prbs_bytes_r[ii*8+:8];
      end 
    prbs180[0] = last_byte_r == prbs_bytes_r[7:0];
    for (ii=1; ii<2*nCK_PER_CLK; ii=ii+1)
       	prbs180[ii] = data_bytes[(ii-1)*8+:8] == prbs_bytes_r[ii*8+:8];
    if (nCK_PER_CLK == 4) begin
      if (prbs_ignore_last_bytes_r) begin
        prbs0[7:6] = 2'b11;
	prbs180[7] = 1'b1;
      end
      if (prbs_ignore_first_byte_r) prbs180[0] = 1'b1;
    end else begin
      if (second_half_r) begin
        if (prbs_ignore_last_bytes_r) begin
	    prbs0[3:2] = 2'b11;
	    prbs180[3] = 1'b1;
	end
      end else if (prbs_ignore_first_byte_r) prbs180[0] = 1'b1;
    end 
  end 