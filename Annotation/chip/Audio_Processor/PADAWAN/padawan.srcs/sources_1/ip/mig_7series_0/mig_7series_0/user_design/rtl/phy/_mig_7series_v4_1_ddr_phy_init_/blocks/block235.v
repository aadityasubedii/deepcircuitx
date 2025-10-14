  always @(posedge clk) begin
    rdlvl_stg1_done_r1      <= #TCQ rdlvl_stg1_done;
    prbs_rdlvl_done_r1      <= #TCQ prbs_rdlvl_done;
	prbs_rdlvl_done_r2      <= #TCQ prbs_rdlvl_done_r1;
	prbs_rdlvl_done_r3      <= #TCQ prbs_rdlvl_done_r2;
    wrcal_resume_r          <= #TCQ wrcal_resume;
    wrcal_sanity_chk        <= #TCQ wrcal_final_chk;
  end