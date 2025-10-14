    always @(posedge clk) begin
    if (rst || prbs_rdlvl_done_r3)
      complex_mask_lim_done <= #TCQ 1'b0;
    else if (~prbs_rdlvl_done && complex_oclkdelay_calib_start_int)
      complex_mask_lim_done <= #TCQ 1'b1;
  end