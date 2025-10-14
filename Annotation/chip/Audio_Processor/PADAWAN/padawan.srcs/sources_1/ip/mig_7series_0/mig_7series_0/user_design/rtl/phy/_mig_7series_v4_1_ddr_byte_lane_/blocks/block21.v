else begin : dq_gen_40

  assign of_dqbus[40-1:0] = {of_q9, of_q8, of_q7, of_q6[3:0], of_q5[3:0], of_q4, of_q3, of_q2, of_q1, of_q0};
  assign ififo_rd_en_in   = !if_empty_def ? ((&byte_rd_en_oth_banks) && (&byte_rd_en_oth_lanes) && byte_rd_en) :
                                            ((|byte_rd_en_oth_banks) || (|byte_rd_en_oth_lanes) || byte_rd_en);