  always @ (posedge clk) begin
     byte_sel_data_map <= #TCQ FULL_DATA_MAP[12*DQ_PER_DQS*byte_sel_cnt_w1+:96];
  end
