  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (W_valid & R_wr_dst_reg)
          if (^(W_wr_data) === 1'bx)
            begin
              $write("%0d ns: WARNING: lab7_soc_nios2_gen2_0_cpu_test_bench/W_wr_data is 'x'\n", $time);
            end
    end