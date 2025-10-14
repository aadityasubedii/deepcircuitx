  always @(posedge clk) begin
    for (cc = 0; cc < RANKS; cc = cc + 1) begin: dlyval_dq_assgn
      for (dd = 0; dd < DQ_WIDTH; dd = dd + 1)
        dlyval_dq[((5*dd)+(cc*DQ_WIDTH*5))+:5] <= #TCQ dlyval_dq_reg_r[cc][dd];
      end
  end