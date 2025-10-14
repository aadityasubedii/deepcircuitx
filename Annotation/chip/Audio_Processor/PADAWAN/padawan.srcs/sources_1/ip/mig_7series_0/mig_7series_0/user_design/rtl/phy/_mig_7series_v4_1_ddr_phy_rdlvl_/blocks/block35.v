  always @(posedge clk) begin
    rdlvl_stg1_start_r <= #TCQ rdlvl_stg1_start;
    mpr_rdlvl_done_r1  <= #TCQ mpr_rdlvl_done_r;
    mpr_rdlvl_done_r2  <= #TCQ mpr_rdlvl_done_r1;
    mpr_rdlvl_start_r  <= #TCQ mpr_rdlvl_start;
  end