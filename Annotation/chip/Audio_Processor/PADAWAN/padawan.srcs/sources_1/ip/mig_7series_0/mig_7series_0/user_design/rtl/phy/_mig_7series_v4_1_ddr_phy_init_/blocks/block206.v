  always @(posedge clk) begin    
    prech_done    <= #TCQ prech_done_dly_r[15];
	prech_done_r1 <= #TCQ prech_done_dly_r[15];
    prech_done_r2 <= #TCQ prech_done_r1;
	prech_done_r3 <= #TCQ prech_done_r2;
  end