  generate
    if (nCK_PER_CLK == 4) begin: gen_ck_per_clk4
      assign prbs_o = prbs_out;
      









    end else begin :gen_ck_per_clk2
      assign prbs_o = prbs_out[4*DQ_WIDTH-1:0];
      




    end
  endgenerate