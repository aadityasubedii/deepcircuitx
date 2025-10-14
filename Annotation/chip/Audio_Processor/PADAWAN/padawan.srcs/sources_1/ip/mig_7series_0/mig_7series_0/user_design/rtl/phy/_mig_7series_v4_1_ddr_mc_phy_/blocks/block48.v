always @(posedge auxout_clk or posedge rst) begin
  if ( rst) begin
     rst_auxout_r   <= #(1) 1'b1;
     rst_auxout_rr  <= #(1) 1'b1;
  end
  else begin
     rst_auxout_r   <= #(1) rst;
     rst_auxout_rr  <= #(1) rst_auxout_r;
  end
end