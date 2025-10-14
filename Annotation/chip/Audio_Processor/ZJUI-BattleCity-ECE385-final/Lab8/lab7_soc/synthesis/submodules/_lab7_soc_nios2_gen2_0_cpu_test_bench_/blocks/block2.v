  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
        end
      else if (W_valid & R_ctrl_ld)
          if (^(av_ld_data_aligned_unfiltered) === 1'bx)
            begin
              $write("%0d ns: WARNING: lab7_soc_nios2_gen2_0_cpu_test_bench/av_ld_data_aligned_unfiltered is 'x'\n", $time);
            end
    end