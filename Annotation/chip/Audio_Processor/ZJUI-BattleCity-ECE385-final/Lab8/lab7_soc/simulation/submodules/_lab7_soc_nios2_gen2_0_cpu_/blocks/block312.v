  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          oci_single_step_mode <= 1'b0;
      else if (take_action_ocireg)
          oci_single_step_mode <= ocireg_sstep;
    end