    always @(posedge clk_i) begin
      if(prbs_seed_init) begin
        lfsr_q <= #TCQ {5'b0,prbs_seed_i[14:0]};
      end else if(clk_en) begin
        lfsr_q[20]   <= #TCQ lfsr_q[19];
        lfsr_q[19]   <= #TCQ lfsr_q[18];

        lfsr_q[18]   <= #TCQ lfsr_q[20] ^lfsr_q[17];

        lfsr_q[17:2] <= #TCQ lfsr_q[16:1];
        lfsr_q[1]    <= #TCQ lfsr_q[20];
      end
    end