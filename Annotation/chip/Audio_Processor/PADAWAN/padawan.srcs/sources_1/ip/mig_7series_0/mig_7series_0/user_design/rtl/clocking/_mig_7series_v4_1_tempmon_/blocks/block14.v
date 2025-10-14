      always @(posedge xadc_clk) begin
        rst_r1 <= rst;
        rst_r2 <= rst_r1;
      end