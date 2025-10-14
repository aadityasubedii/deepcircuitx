  always @(posedge clk) begin
    wrcal_pat_resume_r1 <= #TCQ wrcal_pat_resume_r;
    wrcal_pat_resume_r2 <= #TCQ wrcal_pat_resume_r1;
    wrcal_pat_resume    <= #TCQ wrcal_pat_resume_r2;
  end