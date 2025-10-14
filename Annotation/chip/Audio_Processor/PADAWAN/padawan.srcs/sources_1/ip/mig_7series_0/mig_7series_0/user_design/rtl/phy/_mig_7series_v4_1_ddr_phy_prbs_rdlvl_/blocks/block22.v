  always @ (posedge clk) begin
    if(rst | (prbs_state_r == PRBS_NEW_DQS_WAIT)) begin
      bit_cnt <= #TCQ 'd0;
      ref_right_edge <= #TCQ 6'h3f;
      ref_bit <= #TCQ 'd0;
    end else if ((prbs_state_r == FINE_CALC_TAPS_WAIT) && (stage_cnt == 'b0) && (bit_cnt < DRAM_WIDTH)) begin
      bit_cnt <= #TCQ bit_cnt +'b1;
      if ((ref_bit_per_bit[bit_cnt]==1'b1) && (right_edge_pb[bit_cnt*6+:6]<= ref_right_edge)) begin
        ref_bit <= #TCQ bit_cnt;
        ref_right_edge <= #TCQ right_edge_pb[bit_cnt*6+:6];
      end
    end
  end