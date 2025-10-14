  always @(posedge clk)
    begin
      if (reset_n)
          if (^(E_valid) === 1'bx)
            begin
              $write("%0d ns: ERROR: DE1_SoC_QSYS_nios2_qsys_test_bench/E_valid is 'x'\n", $time);
              $stop;
            end
    end