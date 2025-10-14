  always @(posedge clk)
    begin
      if (reset_n)
          if (^(W_valid) === 1'bx)
            begin
              $write("%0d ns: ERROR: lab7_soc_nios2_gen2_0_cpu_test_bench/W_valid is 'x'\n", $time);
              $stop;
            end
    end