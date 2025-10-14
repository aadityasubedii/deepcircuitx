  always @(posedge auxout_clk or posedge rst)  begin
    if ( rst) begin
       rst_auxout     <= #(1) 1'b1;
    end
    else begin
       rst_auxout     <= #(1) rst_auxout_rr;
    end
  end