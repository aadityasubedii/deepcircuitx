  always @ (posedge clk) begin
    dec_cnt <= #TCQ mem_out_dec;
  end