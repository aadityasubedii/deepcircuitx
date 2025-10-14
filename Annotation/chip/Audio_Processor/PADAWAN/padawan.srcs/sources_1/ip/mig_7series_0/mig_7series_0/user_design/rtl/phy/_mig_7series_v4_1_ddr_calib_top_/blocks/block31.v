  always @(posedge clk) begin
    if (rst || reset_if_r9)
      reset_if <= #TCQ 1'b0;
    else if ((rdlvl_stg1_done && ~rdlvl_stg1_done_r1) ||
             (prbs_rdlvl_done && ~prbs_rdlvl_done_r1))
      reset_if <= #TCQ 1'b1;
  end