  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (i_read & ~i_waitrequest)
          if (^(i_readdata) === 1'bx)
            begin
              $write("%0d ns: ERROR: DE1_SoC_QSYS_nios2_qsys_test_bench/i_readdata is 'x'\n", $time);
              $stop;
            end
    end