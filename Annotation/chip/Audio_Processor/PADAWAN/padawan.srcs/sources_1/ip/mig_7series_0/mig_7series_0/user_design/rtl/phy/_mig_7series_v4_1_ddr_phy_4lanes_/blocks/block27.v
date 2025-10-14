    always @(posedge clk_div2) begin
      pi_rst_div2r1 <= rst_primitives;
      pi_rst_div2r2 <= pi_rst_div2r1;
      A_pi_rst_div2 <= pi_rst_div2r2;
      B_pi_rst_div2 <= pi_rst_div2r2;
      C_pi_rst_div2 <= pi_rst_div2r2;
      D_pi_rst_div2 <= pi_rst_div2r2;
    end