  always @(posedge clk) begin
    if (rst)
      pi_rst_stg1_cal <= #TCQ {HIGHEST_BANK{1'b0}};
    else if (rst_dqs_find)
      pi_rst_stg1_cal <= #TCQ {HIGHEST_BANK{1'b1}};
    else
      pi_rst_stg1_cal <= #TCQ pi_rst_stg1_cal_r;
  end