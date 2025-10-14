    always @ (posedge clk_i) begin
      if(prbs_seed_init) begin
        lfsr_q <= #TCQ {31'b0,prbs_seed_i};
      end else if(clk_en) begin
        lfsr_q[64] <= #TCQ lfsr_q[64] ^ lfsr_q[63];
        lfsr_q[63] <= #TCQ lfsr_q[62];
        lfsr_q[62] <= #TCQ lfsr_q[64] ^ lfsr_q[61];
        lfsr_q[61] <= #TCQ lfsr_q[64] ^ lfsr_q[60];
        lfsr_q[60:2] <= #TCQ lfsr_q[59:1];
        lfsr_q[1] <= #TCQ lfsr_q[64];
      end
    end