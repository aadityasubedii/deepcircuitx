  always @(posedge clk)
    begin
      if (reset_n)
          if (^(d_write) === 1'bx)
            begin
              $write("%0d ns: ERROR: DE1_SoC_QSYS_nios2_qsys_test_bench/d_write is 'x'\n", $time);
              $stop;
            end
    end