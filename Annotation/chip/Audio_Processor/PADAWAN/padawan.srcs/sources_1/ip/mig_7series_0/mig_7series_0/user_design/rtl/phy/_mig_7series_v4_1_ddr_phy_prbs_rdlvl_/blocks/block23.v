  always @ (posedge clk) begin
    if (rst | (prbs_state_r == PRBS_NEW_DQS_WAIT)) begin
      ref_bit_per_bit <= #TCQ 'd0;
    end else if ((prbs_state_r == FINE_PI_INC) && (stage_cnt=='b0)) begin
      if(|left_edge_updated) ref_bit_per_bit <= #TCQ left_edge_updated;
    end
  end