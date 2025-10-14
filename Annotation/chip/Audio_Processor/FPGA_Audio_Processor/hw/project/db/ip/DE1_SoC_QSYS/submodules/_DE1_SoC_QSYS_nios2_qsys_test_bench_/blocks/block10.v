  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (W_valid & R_wr_dst_reg)
          if (^(R_dst_regnum) === 1'bx)
            begin
              $write("%0d ns: ERROR: DE1_SoC_QSYS_nios2_qsys_test_bench/R_dst_regnum is 'x'\n", $time);
              $stop;
            end
    end