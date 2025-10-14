  assign wrcal_resume_w = (WRLVL == "ON") ? wrcal_pat_resume : 1'b0;
  assign wrlvl_done_w   = (WRLVL == "ON") ? wrlvl_done : 1'b1;