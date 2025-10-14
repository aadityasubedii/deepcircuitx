    always @ (posedge clk_i) begin
      if(prbs_seed_init) begin 
        lfsr_q <= #TCQ {prbs_seed_i};
      end else if(clk_en) begin
        lfsr_q[32:9] <= #TCQ lfsr_q[31:8];
        lfsr_q[8]    <= #TCQ lfsr_q[32] ^ lfsr_q[7];
        lfsr_q[7]    <= #TCQ lfsr_q[32] ^ lfsr_q[6];
        lfsr_q[6:4]  <= #TCQ lfsr_q[5:3];

        lfsr_q[3]    <= #TCQ lfsr_q[32] ^ lfsr_q[2];
        lfsr_q[2]    <= #TCQ lfsr_q[1] ;
        lfsr_q[1]    <= #TCQ lfsr_q[32];
      end
    end