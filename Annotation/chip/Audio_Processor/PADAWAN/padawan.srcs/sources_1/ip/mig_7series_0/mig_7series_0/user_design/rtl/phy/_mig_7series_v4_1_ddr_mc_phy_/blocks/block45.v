always @(*) begin
      rst_out =  rst_out_w[L_RESET_SELECT_BANK] & ddr_rst_in_n;
end