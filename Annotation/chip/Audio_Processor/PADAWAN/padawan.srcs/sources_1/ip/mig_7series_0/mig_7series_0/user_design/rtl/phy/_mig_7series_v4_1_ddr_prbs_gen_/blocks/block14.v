  always @ (posedge clk_i)
  begin

    if ((reseed_prbs_r && clk_en_i) || rst_i || ~clk_en_i) begin
      lfsr_q[4:1]          <= #TCQ prbs_seed_i[3:0] | 4'h5;
      lfsr_q[PRBS_WIDTH:5] <= #TCQ prbs_seed_i[PRBS_WIDTH-1:4];
    end
    else if (clk_en_i && (~phy_if_empty_r || ~prbs_rdlvl_start)) begin
      lfsr_q[PRBS_WIDTH:31] <= #TCQ lfsr_q[PRBS_WIDTH-1:30];
      lfsr_q[30]            <= #TCQ lfsr_q[16] ^ lfsr_q[13] ^ lfsr_q[5]  ^ lfsr_q[1];
      lfsr_q[29:9]          <= #TCQ lfsr_q[28:8];
      lfsr_q[8]             <= #TCQ lfsr_q[32] ^ lfsr_q[7];
      lfsr_q[7]             <= #TCQ lfsr_q[32] ^ lfsr_q[6];
      lfsr_q[6:4]           <= #TCQ lfsr_q[5:3];
      lfsr_q[3]             <= #TCQ lfsr_q[32] ^ lfsr_q[2];
      lfsr_q[2]             <= #TCQ lfsr_q[1] ;
      lfsr_q[1]             <= #TCQ lfsr_q[32];
    end
  end